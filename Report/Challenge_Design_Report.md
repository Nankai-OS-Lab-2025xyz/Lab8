# uCore扩展练习设计方案报告

## Challenge 1: 基于UNIX的PIPE机制的设计方案

### 1.1 概述

管道（Pipe）是UNIX系统中一种重要的进程间通信（IPC）机制，它允许一个进程把数据写进去，另一个进程从中读出来。管道是一个单向的、先进先出（FIFO）的字节流，具有固定大小的缓冲区。

### 1.2 数据结构设计

在ucore中，管道作为一个特殊的文件类型来实现。需要定义以下数据结构：

```c
/* 管道缓冲区大小，为4KB */
#define PIPE_BUF_SIZE 4096

/* 管道结构体 */
struct pipe {
    char buffer[PIPE_BUF_SIZE];      /* 管道数据缓冲区 */
    uint32_t read_pos;               /* 读位置指针 */
    uint32_t write_pos;              /* 写位置指针 */
    uint32_t count;                  /* 当前缓冲区中的数据量 */
    bool read_open;                  /* 读端是否打开 */
    bool write_open;                 /* 写端是否打开 */
    semaphore_t mutex;               /* 互斥锁，保护管道结构 */
    wait_queue_t read_wait_queue;    /* 读等待队列 */
    wait_queue_t write_wait_queue;   /* 写等待队列 */
    struct inode *inode;             /* 关联的inode */
    int ref_count;                   /* 引用计数 */
};

/* 扩展inode结构 */
struct pipe_inode_info {
    struct pipe *pipe;               /* 指向管道结构 */
};
```

**设计说明：**

- `buffer`: 固定大小的环形缓冲区，用于存储管道数据
- `read_pos`/`write_pos`: 使用环形缓冲区，通过模运算实现循环
- `count`: 记录当前缓冲区中的数据量，用于判断空/满状态
- `read_open`/`write_open`: 标识读写端状态，当写端关闭且缓冲区为空时，读端返回EOF
- `mutex`: 保护管道结构的互斥访问
- `read_wait_queue`/`write_wait_queue`: 当管道为空/满时，阻塞等待的进程队列

### 1.3 接口设计

#### 1.3.1 系统调用接口

```c
/* 
 * 创建管道
 * 参数: pipefd[2] - 返回两个文件描述符，pipefd[0]为读端，pipefd[1]为写端
 * 返回: 成功返回0，失败返回错误码
 */
int sys_pipe(int pipefd[2]);


/* 
 * 从管道读端读取数据
 * 参数: fd - 文件描述符（必须是管道的读端）
 *       buf - 用户缓冲区
 *       count - 要读取的字节数
 * 返回: 成功返回实际读取的字节数，失败返回错误码
 * 语义: 
 *   - 如果管道为空且写端打开，阻塞直到有数据可读
 *   - 如果管道为空且写端关闭，返回0（EOF）
 *   - 如果管道非空，读取min(count, 可用数据)字节
 */
int sys_read(int fd, void *buf, size_t count);



/* 
 * 向管道写端写入数据
 * 参数: fd - 文件描述符（必须是管道的写端）
 *       buf - 用户缓冲区
 *       count - 要写入的字节数
 * 返回: 成功返回实际写入的字节数，失败返回错误码
 * 语义:
 *   - 如果管道满且读端打开，阻塞直到有空间可写
 *   - 如果读端关闭，写入会触发SIGPIPE信号（或返回EPIPE错误）
 *   - 如果管道有空间，写入min(count, 可用空间)字节
 */
int sys_write(int fd, const void *buf, size_t count);


/* 
 * 关闭管道的一端
 * 参数: fd - 文件描述符
 * 返回: 成功返回0，失败返回错误码
 * 语义:
 *   - 关闭读端：减少引用计数，如果引用计数为0则释放管道资源
 *   - 关闭写端：设置write_open=false，唤醒所有等待的读进程
 */
int sys_close(int fd);

```

#### 1.3.2 内核内部接口

```c
/* 创建管道对象 */
struct pipe *pipe_create(void);

/* 释放管道对象 */
void pipe_destroy(struct pipe *pipe);

/* 从管道读取数据（内核实现） */
int pipe_read(struct pipe *pipe, char *buf, size_t count);

/* 向管道写入数据（内核实现） */
int pipe_write(struct pipe *pipe, const char *buf, size_t count);

/* 增加管道引用计数 */
void pipe_ref_inc(struct pipe *pipe);

/* 减少管道引用计数 */
void pipe_ref_dec(struct pipe *pipe);
```

### 1.4 同步互斥问题处理

#### 1.4.1 互斥访问

**问题：** 多个进程可能同时访问同一个管道，需要保证对管道结构的访问是原子的。

**解决方案：**
- 使用信号量`mutex`保护整个管道结构
- 所有对`read_pos`、`write_pos`、`count`等共享变量的访问都需要先获取`mutex`
- 使用现有的`semaphore_t`机制，通过`down()`和`up()`实现互斥

**实现示例：**
```c
int pipe_read(struct pipe *pipe, char *buf, size_t count) {
    down(&pipe->mutex);  // 获取互斥锁
    
    // 检查管道状态
    while (pipe->count == 0 && pipe->write_open) {
        // 管道为空且写端打开，进入等待队列
        wait_current_set(&pipe->read_wait_queue, &wait, WT_PIPE);
        up(&pipe->mutex);
        schedule();
        down(&pipe->mutex);
    }
    
    // 读取数据...
    // 更新read_pos, count等
    
    up(&pipe->mutex);  // 释放互斥锁
    return n;
}
```

#### 1.4.2 同步机制

**问题1：** 当管道为空时，读进程应该阻塞等待；当管道满时，写进程应该阻塞等待。

**解决方案：**
- 使用等待队列（`wait_queue_t`）实现阻塞/唤醒机制
- 当管道为空且写端打开时，读进程进入`read_wait_queue`并调用`schedule()`
- 当管道满且读端打开时，写进程进入`write_wait_queue`并调用`schedule()`
- 当有数据写入时，唤醒`read_wait_queue`中的进程
- 当有数据读出时，唤醒`write_wait_queue`中的进程

**问题2：** 写端关闭后，读进程应该能够读取剩余数据，然后返回EOF。

**解决方案：**
- 检查`write_open`标志
- 如果`write_open == false`且`count == 0`，返回0（EOF）
- 如果`write_open == false`但`count > 0`，继续读取剩余数据

**问题3：** 读端关闭后，写进程应该收到错误信号。

**解决方案：**
- 检查`read_open`标志
- 如果`read_open == false`，返回`-EPIPE`错误

#### 1.4.3 原子性保证

**问题：** 需要保证读写操作的原子性，避免部分读写导致数据不一致。

**解决方案：**
- 在`mutex`保护下，一次性完成整个读写操作
- 对于大于`PIPE_BUF_SIZE`的写入，需要分多次进行，每次都在锁保护下完成

### 1.5 实现要点

1. **环形缓冲区实现：**
   ```c
   // 写入
   uint32_t space = PIPE_BUF_SIZE - pipe->count;
   uint32_t to_write = min(count, space);
   uint32_t first_part = min(to_write, PIPE_BUF_SIZE - pipe->write_pos);
   memcpy(pipe->buffer + pipe->write_pos, buf, first_part);
   if (to_write > first_part) {
       memcpy(pipe->buffer, buf + first_part, to_write - first_part);
   }
   pipe->write_pos = (pipe->write_pos + to_write) % PIPE_BUF_SIZE;
   pipe->count += to_write;
   ```

2. **与VFS集成：**
   - 在`inode`结构中添加`pipe_inode_info`类型
   - 实现管道的`vop_read`、`vop_write`、`vop_close`操作
   - 在`file_pipe()`函数中创建管道并分配文件描述符

3. **进程间共享：**
   - 通过`fork()`时复制文件描述符表，父子进程共享同一个管道
   - 使用引用计数管理管道的生命周期

---

## Challenge 2: 基于UNIX的软链接和硬链接机制的设计方案

### 2.1 概述

链接机制允许一个文件有多个名称，提供了文件系统的灵活性和便利性。UNIX系统支持两种链接：
- **硬链接（Hard Link）**：多个目录项指向同一个inode，共享相同的文件数据
- **软链接（Symbolic Link/Symlink）**：一个特殊的文件，其内容是指向目标文件的路径字符串

### 2.2 数据结构设计

#### 2.2.1 硬链接

硬链接的实现相对简单，只需要在现有的inode结构中维护链接计数。在SFS文件系统中，`sfs_disk_inode`已经包含了`nlinks`字段：

```c
/* SFS磁盘inode（已存在，见sfs.h） */
struct sfs_disk_inode {
    uint32_t size;                  /* 文件大小 */
    uint16_t type;                  /* 文件类型 */
    uint16_t nlinks;                /* 硬链接计数 */
    uint32_t blocks;                /* 块数 */
    uint32_t direct[SFS_NDIRECT];   /* 直接块 */
    uint32_t indirect;              /* 间接块 */
};
```

**设计说明：**
- `nlinks`字段记录指向该inode的目录项数量
- 创建硬链接时，`nlinks++`
- 删除硬链接时，`nlinks--`
- 当`nlinks == 0`时，可以删除inode和文件数据

#### 2.2.2 软链接

软链接需要扩展inode结构，添加符号链接类型和存储目标路径：

```c
/* 软链接inode信息 */
struct symlink_inode_info {
    char *target_path;               /* 目标路径字符串 */
    size_t target_len;               /* 目标路径长度 */
    semaphore_t mutex;               /* 保护target_path的互斥锁 */
};

/* 扩展inode类型枚举（在inode.h中） */
enum {
    inode_type_device_info = 0x1234,
    inode_type_sfs_inode_info,
    inode_type_symlink_info,         /* 新增：符号链接类型 */
};

/* 扩展inode union（在inode.h中） */
struct inode {
    union {
        struct device __device_info;
        struct sfs_inode __sfs_inode_info;
        struct symlink_inode_info __symlink_info;  /* 新增 */
    } in_info;
    enum {
        inode_type_device_info = 0x1234,
        inode_type_sfs_inode_info,
        inode_type_symlink_info,     /* 新增 */
    } in_type;
    int ref_count;
    int open_count;
    struct fs *in_fs;
    const struct inode_ops *in_ops;
};
```

**设计说明：**
- `target_path`：存储目标文件的路径字符串（可以是绝对路径或相对路径）
- `target_len`：路径长度，用于边界检查
- `mutex`：保护`target_path`的并发访问
- 软链接本身是一个文件，但类型为`SFS_TYPE_LINK`（在SFS中已定义）

#### 2.2.3 目录项结构

目录项（dentry）在SFS中已经定义：

```c
/* SFS磁盘目录项（已存在，见sfs.h） */
struct sfs_disk_entry {
    uint32_t ino;                    /* inode号 */
    char name[SFS_MAX_FNAME_LEN + 1]; /* 文件名 */
};
```

**设计说明：**
- 硬链接：多个`dentry`可以指向同一个`ino`
- 软链接：`dentry`指向一个类型为`SFS_TYPE_LINK`的inode

### 2.3 接口设计

#### 2.3.1 系统调用接口

```c
/* 
 * 创建硬链接
 * 参数: oldpath - 已存在文件的路径
 *       newpath - 新链接的路径
 * 返回: 成功返回0，失败返回错误码
 * 语义:
 *   - 在newpath的父目录中创建新的目录项
 *   - 新目录项的ino指向oldpath的inode
 *   - 增加目标inode的nlinks计数
 *   - 硬链接不能跨文件系统
 *   - 不能对目录创建硬链接（避免循环）
 */
int sys_link(const char *oldpath, const char *newpath);


/* 
 * 创建软链接
 * 参数: target - 目标文件路径（可以是相对或绝对路径）
 *       linkpath - 符号链接的路径
 * 返回: 成功返回0，失败返回错误码
 * 语义:
 *   - 创建新文件linkpath，类型为符号链接
 *   - 将target路径字符串存储到linkpath的inode中
 *   - 软链接可以跨文件系统
 *   - 可以对目录创建软链接
 */
int sys_symlink(const char *target, const char *linkpath);


/* 
 * 读取软链接的目标路径
 * 参数: pathname - 符号链接的路径
 *       buf - 存储目标路径的缓冲区
 *       bufsiz - 缓冲区大小
 * 返回: 成功返回实际读取的字节数，失败返回错误码
 * 语义:
 *   - 如果pathname不是符号链接，返回EINVAL
 *   - 读取符号链接的target_path到buf中
 *   - 不跟随符号链接（与read()不同）
 */
int sys_readlink(const char *pathname, char *buf, size_t bufsiz);


/* 
 * 删除链接（硬链接或软链接）
 * 参数: pathname - 要删除的链接路径
 * 返回: 成功返回0，失败返回错误码
 * 语义:
 *   - 如果是硬链接：删除目录项，减少inode的nlinks计数
 *   - 如果是软链接：直接删除符号链接文件
 *   - 如果nlinks减为0且没有进程打开该文件，删除inode和数据
 *   - 不能删除非空目录
 */
int sys_unlink(const char *pathname);
```

#### 2.3.2 VFS层接口

```c
/* VFS层已定义的接口（见vfs.h） */
int vfs_link(char *old_path, char *new_path);
int vfs_symlink(char *old_path, char *new_path);
int vfs_readlink(char *path, struct iobuf *iob);
int vfs_unlink(char *path);
```

#### 2.3.3 文件系统层接口

```c
/* SFS文件系统层接口 */
int sfs_link(struct inode *dir, const char *name, struct inode *target);
int sfs_symlink(struct inode *dir, const char *name, const char *target_path);
int sfs_readlink(struct inode *node, struct iobuf *iob);
int sfs_unlink(struct inode *dir, const char *name);
```

#### 2.3.4 inode操作扩展

需要在`inode_ops`中添加符号链接相关的操作：

```c
struct inode_ops {
    // ... 现有操作 ...
    
    /* 读取符号链接目标路径 */
    int (*vop_readlink)(struct inode *node, struct iobuf *iob);
    
    /* 创建硬链接 */
    int (*vop_link)(struct inode *dir, const char *name, struct inode *target);
    
    /* 创建软链接 */
    int (*vop_symlink)(struct inode *dir, const char *name, const char *target);
};
```

### 2.4 同步互斥问题处理

#### 2.4.1 硬链接的同步互斥

**问题1：** 多个进程同时创建/删除硬链接，可能导致`nlinks`计数错误。

**解决方案：**
- 在SFS中已经定义了`mutex_sem`（见`sfs_fs`结构），用于保护`link/unlink`操作
- 所有修改`nlinks`的操作都需要先获取`mutex_sem`
- 使用原子操作或信号量确保`nlinks++`和`nlinks--`的原子性

**实现示例：**
```c
int sfs_link(struct inode *dir, const char *name, struct inode *target) {
    struct sfs_fs *sfs = vop_fs(dir);
    lock_sfs_mutex(sfs);  // 获取互斥锁
    
    // 创建目录项
    // ...
    
    // 原子性更新nlinks
    target_din->nlinks++;
    sfs_sync_inode(target);  // 同步到磁盘
    
    unlock_sfs_mutex(sfs);  // 释放互斥锁
    return 0;
}
```

**问题2：** 删除文件时，需要检查`nlinks`，但可能有并发删除操作。

**解决方案：**
- 在`unlink`操作中，先获取锁，检查`nlinks`
- 如果`nlinks > 1`，只删除目录项并减少计数
- 如果`nlinks == 1`，需要检查是否有进程打开该文件（通过`open_count`）
- 只有当`nlinks == 0`且`open_count == 0`时，才真正删除inode和数据块

**问题3：** 目录操作的原子性。

**解决方案：**
- 目录的创建和删除操作需要在锁保护下进行
- 使用事务性操作，确保目录项的添加/删除是原子的
- 如果操作失败，需要回滚已做的修改

#### 2.4.2 软链接的同步互斥

**问题1：** 多个进程同时读取/修改软链接的`target_path`。

**解决方案：**
- 在`symlink_inode_info`中使用`mutex`保护`target_path`
- 读取`target_path`时也需要获取锁（虽然读操作通常不需要互斥，但为了一致性）

**实现示例：**
```c
int sfs_readlink(struct inode *node, struct iobuf *iob) {
    struct symlink_inode_info *sinfo = vop_info(node, symlink);
    
    down(&sinfo->mutex);  // 获取锁
    // 读取target_path到iob
    size_t to_copy = min(sinfo->target_len, iob->io_resid);
    memcpy(iob->io_base, sinfo->target_path, to_copy);
    iob->io_resid -= to_copy;
    up(&sinfo->mutex);  // 释放锁
    
    return to_copy;
}
```

**问题2：** 软链接解析时的循环检测。

**解决方案：**
- 在路径解析时，维护一个已访问的inode集合
- 如果遇到已访问的符号链接，说明存在循环，返回`ELOOP`错误
- 限制符号链接解析的最大深度（如32层）

**实现示例：**
```c
#define MAX_SYMLINK_DEPTH 32

int resolve_symlink(struct inode *node, char *path, int depth) {
    if (depth > MAX_SYMLINK_DEPTH) {
        return -ELOOP;  // 循环链接
    }
    
    // 读取符号链接目标
    // 递归解析目标路径
    // ...
}
```

**问题3：** 软链接创建时的路径验证。

**解决方案：**
- 验证`target_path`的长度不超过`PATH_MAX`
- 验证路径字符串的有效性
- 在创建时不需要验证目标是否存在（软链接可以指向不存在的文件）

#### 2.4.3 文件系统操作的原子性

**问题：** 创建/删除链接时，需要同时修改目录和inode，需要保证原子性。

**解决方案：**
- 使用两阶段提交：
  1. 第一阶段：在内存中完成所有修改
  2. 第二阶段：同步到磁盘
- 如果同步失败，需要能够回滚
- 使用日志（journal）机制记录操作，支持恢复

### 2.5 实现要点

1. **硬链接实现流程：**
   1. 解析oldpath，获取目标inode
   2. 检查目标是否为目录（不能对目录创建硬链接）
   3. 检查是否跨文件系统（硬链接不能跨文件系统）
   4. 获取锁（mutex_sem）
   5. 在newpath的父目录中创建新目录项，指向目标inode
   6. 增加目标inode的nlinks计数
   7. 同步目录和inode到磁盘
   8. 释放锁
   
2. **软链接实现流程：**
   1. 解析linkpath的父目录
   2. 创建新inode，类型为SFS_TYPE_LINK
   3. 分配symlink_inode_info结构
   4. 将target路径字符串存储到symlink_inode_info中
   5. 在父目录中创建目录项，指向新inode
   6. 同步到磁盘
   
3. **路径解析中的符号链接处理：**
   - 在`vfs_lookup`或`sfs_lookup`中，如果遇到符号链接类型的inode
   - 读取`target_path`
   - 递归调用路径解析函数
   - 检测循环并限制深度

4. **与现有VFS的集成：**
   - 扩展`inode_ops`，添加`vop_readlink`、`vop_link`、`vop_symlink`
   - 在SFS中实现这些操作
   - 在VFS层调用文件系统特定的实现




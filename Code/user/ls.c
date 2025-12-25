#include <ulib.h>
#include <stdio.h>
#include <string.h>
#include <dir.h>
#include <file.h>
#include <stat.h>
#include <dirent.h>
#include <unistd.h>

#define printf(...)                     fprintf(1, __VA_ARGS__)

/* * 辅助函数：get_stat
 * 因为有的 uCore 版本 user 库里没有直接提供 stat 函数，
 * 这里我们通过 open -> fstat -> close 的方式手动实现。
 */
int
get_stat(const char *path, struct stat *stat) {
    int fd, ret;
    if ((fd = open(path, O_RDONLY)) < 0) {
        return fd;
    }
    ret = fstat(fd, stat);
    close(fd);
    return ret;
}

void
ls(char *path) {
    int ret;
    DIR *dirp;
    struct dirent *dire;
    struct stat __stat, *st = &__stat; // 变量名改为 st，避免和 stat 结构体或函数名冲突

    // 打开目录
    if ((dirp = opendir(path)) == NULL) {
        printf("open dir failed.\n");
        return;
    }

    // 遍历目录项
    while ((dire = readdir(dirp)) != NULL) {
        // 使用我们上面定义的 get_stat 获取文件详情
        if ((ret = get_stat(dire->name, st)) != 0) {
            printf("get stat failed for %s.\n", dire->name);
            continue;
        }

        // 打印文件名
        printf("%s", dire->name);

        // 如果是目录，加个斜杠 /，否则显示大小
        if (S_ISDIR(st->st_mode)) {
            printf("/");
        }
        else {
            printf("\t\t%d", st->st_size);
        }
        printf("\n");
    }
    closedir(dirp);
}

int
main(int argc, char **argv) {
    if (argc == 1) {
        ls("."); // 默认列出当前目录
    }
    else {
        int i;
        for (i = 1; i < argc; i ++) {
            ls(argv[i]);
        }
    }
    return 0;
}
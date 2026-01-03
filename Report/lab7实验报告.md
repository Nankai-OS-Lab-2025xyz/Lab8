# Lab7 实验报告

## 实验目的
- 理解操作系统同步与互斥的设计与实现。
- 理解底层支撑技术：禁用中断、定时器、等待队列。
- 在 ucore 中理解信号量机制与管程/条件变量机制。
- 了解经典同步问题（如哲学家就餐）并使用同步机制解决。

## 实验内容

在本章中我们来实现ucore中的同步互斥机制。

在之前的几章中我们已经实现了进程以及调度算法，可以让多个进程并发的执行。在现实的系统当中，有许多多线程的系统都需要协同的完成某一项任务。但是在协同的过程中，存在许多资源共享的问题，比如对一个文件读写的并发访问等等。这些问题需要我们提供一些同步互斥的机制来让程序可以有序的、无冲突的完成他们的工作，这也是这一章内我们要解决的问题。

我们最终实现的目标是解决“哲学家就餐问题”。“哲学家就餐问题”是一个非常有名的同步互斥问题：有五个哲学家围成一圈吃饭，每两个哲学家中间有一根筷子。每个需要就餐的哲学家需要两根筷子才可以就餐。哲学家处于两种状态之间：思考和饥饿。当哲学家处于思考的状态时，哲学家便无欲无求；而当哲学家处于饥饿状态时，他必须通过就餐来解决饥饿，重新回到思考的状态。如何让这5个哲学家可以不发生死锁的把这一顿饭吃完就是我们要解决的目标。

下面，我们先从一些同步互斥实现的机制讲起，慢慢的了解ucore中同步互斥机制的实现，最后解决哲学家就餐问题吧！

## 练习1：理解内核级信号量与基于信号量的哲学家就餐

### 内核级信号量设计与执行流程
- 关键数据结构：`semaphore_t` 包含 `value` 与 `wait_queue`。
- 等待队列：`wait_queue_t` 由双向链表组成，节点为 `wait_t`（记录等待进程、等待原因、链表指针）。
- 代码位置：`kern/sync/sem.c` 实现 `sem_init/up/down/try_down`，`kern/sync/wait.c` 实现等待队列与唤醒逻辑。
- `sem_init` 中直接调用 `wait_queue_init` 初始化等待队列，并设置初值 `value`。
- `down(sem)` 流程：
  1) 关中断进入临界区，若 `value > 0`，则自减并直接返回。
  2) 否则把当前进程加入 `wait_queue`，设置 `wait_state = WT_KSEM`，并调用 `schedule()` 睡眠。
  3) 被唤醒后从等待队列移除并检查唤醒原因，确保是合法的信号量唤醒。
- 对应实现：`__down` 里调用 `wait_current_set`（设置 `current->state=PROC_SLEEPING` 和 `current->wait_state=WT_KSEM`），然后 `schedule()`；唤醒后通过 `wait_current_del` 清理等待节点。
- `up(sem)` 流程：
  1) 关中断进入临界区，若等待队列非空则唤醒队首进程。
  2) 若队列为空，则直接递增 `value`。
- 对应实现：`__up` 通过 `wait_queue_first` 获取队首，并调用 `wakeup_wait` 使目标进程变为 RUNNABLE。
- `try_down(sem)`：非阻塞式获取，`value > 0` 时原子递减并返回成功，否则失败。
- 并发安全性：通过 `local_intr_save/restore` 在关键路径关中断，保证对 `value` 与 `wait_queue` 的原子更新。
- 队列语义：`wait_queue_add` 使用 `list_add_before(&wait_head, ...)`，属于 FIFO 入队；`wait_queue_first` 对应最早等待者，保证一定程度公平性。
- 语义细节：`down` 只接受 `WT_KSEM` 的唤醒标志，若被其他事件唤醒会触发断言，避免错误唤醒导致的资源紊乱。

### 为什么信号量版哲学家就餐不会死锁
- 关键机制：使用全局 `mutex` 保护哲学家状态数组 `state_sema[]`，每个哲学家有专属信号量 `s[i]`。
- `take_forks` 中先持有 `mutex`，把自身状态置为 HUNGRY，再调用 `phi_test_sema` 检查左右邻居是否在 EATING。
- 若左右邻居均未进餐，立刻将自己置为 EATING 并 `up(s[i])`；否则 `down(s[i])` 阻塞。
- `put_forks` 中持有 `mutex`，把自己置为 THINKING，并依次唤醒左右邻居可能满足进餐条件的哲学家。
- 代码对应：`phi_take_forks_sema/phi_put_forks_sema/phi_test_sema` 位于 `kern/sync/check_sync.c`。
- 关键避免条件：等待前释放 `mutex`，因此不形成“持有资源并等待其他资源”的环形等待。
- `phi_test_sema` 仅在持有 `mutex` 时执行，避免状态读取/写入竞态导致的“错误并发吃饭”。
- 该策略避免循环等待：
  - 只有在持有 `mutex` 时才能改变状态，因此不存在相互“同时抢占”导致的竞争。
  - 每次有哲学家吃完后都会检查并唤醒邻居，保证等待链能被逐步打破。
  - 至少有一个哲学家能从 HUNGRY 进入 EATING，不会形成所有人都阻塞的环形等待。

### 用户态信号量设计方案（与内核态对比）
- 设计方案：
  - 提供系统调用 `sys_sem_init/sem_up/sem_down/sem_destroy`，内核维护信号量对象表（引用计数 + wait_queue）。
  - 用户态使用句柄/ID 访问内核对象，库函数封装系统调用。
  - 对线程共享场景，可将句柄放在共享内存中，保证同一信号量对象被多个线程/进程访问。
  - 可选轻量实现：用户态先做 `try_down`，失败再陷入内核（类似 futex 思路），减少系统调用次数。
- 与内核态信号量的异同：
  - 相同点：都有 `value` + `wait_queue` 语义，`down` 阻塞等待，`up` 唤醒。
  - 不同点：用户态需要系统调用/权限检查、参数合法性校验；开销更大，且需要处理进程退出时的资源回收。
  - 内核态信号量可直接操作 `proc->wait_state` 并调度，用户态必须通过内核服务完成阻塞/唤醒。
  - 用户态需处理“共享对象生命周期”（映射/销毁），内核态则由内核全局生命周期控制。

## 练习2：内核级条件变量与基于条件变量的哲学家就餐

### 内核级条件变量设计与执行流程
- 基本结构：
  - 监视器 `monitor_t`：包含 `mutex`、`next`、`next_count` 以及条件变量数组 `cv[]`。
  - 条件变量 `condvar_t`：包含 `sem`、`count`、`owner`。
- 代码位置：`kern/sync/monitor.h` 定义结构，`kern/sync/monitor.c` 实现 `cond_wait/cond_signal`。
- 初始化细节：`monitor_init` 中 `mutex` 初值为 1（可进入），`next` 初值为 0，`next_count=0`，每个 `cv[i].sem` 初值为 0。
- 设计思想：Hoare 风格“signal-and-wait”监视器实现。
  - `cond_wait`：
    1) `cv.count++`，记录等待者数量；
    2) 若 `next_count>0` 则唤醒 `next`，否则释放 `mutex`；
    3) `down(cv.sem)` 进入等待；
    4) 唤醒后 `cv.count--`。
  - `cond_signal`：
    1) 若 `cv.count>0`，先 `next_count++`；
    2) 唤醒一个等待者 `up(cv.sem)`；
    3) 当前线程 `down(next)` 让出监视器；
    4) 被唤醒后 `next_count--`。
- 监视器过程入口/出口约定：
  - 入口：`down(mutex)` 保证监视器内互斥执行。
  - 出口：若 `next_count>0` 则 `up(next)`，否则 `up(mutex)`。
- 该实现保证唤醒线程在监视器内执行时，仍保持“同一时刻只允许一个线程在监视器内活动”。
- 语义说明：`cond_signal` 中 signaler 先唤醒等待者再阻塞在 `next`，体现 Hoare 风格“把监视器让给被唤醒者”。该行为与 Mesa 风格（signal 后继续执行）不同。
- 伪代码（与 `kern/sync/monitor.c` 逻辑一致）：
  ```c
  cond_wait(cv):
      cv.count++
      mt = cv.owner
      if mt.next_count > 0:
          up(mt.next)
      else:
          up(mt.mutex)
      down(cv.sem)
      cv.count--
  
  cond_signal(cv):
      if cv.count > 0:
          mt = cv.owner
          mt.next_count++
          up(cv.sem)
          down(mt.next)
          mt.next_count--
  
  monitor_leave(mt):
      if mt.next_count > 0:
          up(mt.next)
      else:
          up(mt.mutex)
  ```

### 基于条件变量的哲学家就餐说明
- 每个哲学家有独立条件变量 `cv[i]`，状态数组 `state_condvar[]` 由监视器保护。
- `phi_take_forks_condvar`：进入监视器后设置为 HUNGRY，若邻居不在 EATING 则变为 EATING，否则等待 `cv[i]`。
- `phi_put_forks_condvar`：进入监视器后设置为 THINKING，并测试/唤醒左右邻居。
- 由于状态更新与条件变量操作都在监视器中进行，避免并发竞态；条件变量保证“只有满足条件时才会继续执行”，不会死锁。
- 代码对应：`phi_test_condvar/phi_take_forks_condvar/phi_put_forks_condvar` 位于 `kern/sync/check_sync.c`。
- 具体流程：`phi_take_forks_condvar` 先 `down(mtp->mutex)` 进入监视器，再在无法进餐时 `cond_wait(&mtp->cv[i])`；退出监视器时根据 `next_count` 选择 `up(next)` 或 `up(mutex)`。
- `phi_test_condvar` 在满足条件时立即 `cond_signal(&mtp->cv[i])`，将执行权交给等待者，保持监视器互斥语义。

### 用户态条件变量设计方案（与内核态对比）
- 设计方案：
  - 引入 `cond_t` 与 `mutex_t`（用户库接口），提供系统调用 `sys_cond_wait/signal/broadcast`。
  - `cond_wait(cond, mutex)` 必须原子地释放 `mutex` 并阻塞，唤醒后再重新获取 `mutex`。
  - 依赖内核维护 `cond` 的等待队列与等待者计数，避免竞争窗口。
  - 对 Mesa 风格实现：`cond_signal` 不让出 CPU，唤醒后由等待者重新竞争 `mutex`；用户态应使用 `while (!condition) cond_wait(...)` 重检条件。
- 与内核态对比：
  - 相同点：条件变量不保存条件本身，只负责阻塞/唤醒；需要配合互斥锁使用。
  - 不同点：用户态需要系统调用完成阻塞/唤醒；可能出现虚假唤醒，需要使用 `while` 重新检查条件；内核态在监视器内部实现更直接。
  - 用户态还需处理“被信号打断”的情况（如异步信号），需要重新检查条件并决定是否继续等待。

### 不基于信号量实现条件变量是否可行
- 可以不依赖信号量。条件变量的本质是“等待队列 + 互斥保护”。
- 设计方案：
  - `condvar` 直接维护 `wait_queue_t`，`cond_wait` 将当前线程加入队列并释放监视器互斥锁，然后调用 `schedule()` 睡眠；
  - `cond_signal` 从等待队列中唤醒一个线程（或广播唤醒全部）。
  - 关键是必须保证“释放互斥锁”和“进入等待队列”是原子操作，否则会丢失唤醒。
- 本实验采用信号量实现是为了复用现有阻塞/唤醒与等待队列机制，逻辑更简洁。
- 对应到 ucore：可直接调用 `wait_current_set`/`wakeup_wait` 操作 `wait_queue_t`，并在进入等待前释放 `mutex`（或 `monitor_t` 的 `mutex`）。

## 扩展练习 Challenge 1：死锁与重入探测机制（设计说明）

### 目标
- 在运行时检测死锁产生的必要条件（特别是循环等待）。
- 检测是否出现多个进程进入同一临界区（如互斥锁被多个持有）。
- 触发后进入内核监视器并输出诊断信息。

### 设计思路
- 在 `down/up` 或互斥锁接口中增加“锁表”和“等待图”记录：
  - 锁表记录 `owner`、`waiters`、锁类型（互斥/计数信号量）。
  - 进程记录 `waiting_on`（当前正在等待的锁）。
- 死锁检测：
  - 当 `down` 需要阻塞时，向等待图加入“进程 → 锁”“锁 → 持有者”边。
  - 使用 DFS/快慢指针检测是否存在环（循环等待）。
- 重入与多重进入检测：
  - 对互斥锁（value=1）维护 `owner`，若同一进程重复获取且不支持递归，则报告“重入”。
  - 若出现不同进程同时成为 owner，说明临界区保护失效，触发报警。
- 触发策略：
  - 一旦检测到环或非法重入，打印锁/进程信息并调用 `kmonitor()` 进入监视器。
- 与现有代码结合点：可在 `kern/sync/sem.c:__down/__up` 中插入钩子，或在更高层“互斥锁封装”里维护 owner 信息，避免破坏计数信号量语义。
- 输出信息可包含：锁地址、持有者 PID、等待队列上的 PID 列表，便于在 `kmonitor` 中定位问题。

## 扩展练习 Challenge 2：简化 RCU 机制（设计说明）

### 目标
- 支持读侧无锁访问与写侧延迟回收。
- 简化实现，不追求高性能，只保证语义正确。

### 设计思路（单核简化版）
- 全局读者计数 `rcu_readers`：
  - `rcu_read_lock()`：`rcu_readers++`。
  - `rcu_read_unlock()`：`rcu_readers--`。
- 写侧更新与回收：
  - `rcu_assign_pointer(p, new)` 更新共享指针（带内存屏障）。
  - `synchronize_rcu()`：等待 `rcu_readers == 0`（可睡眠等待）。
  - `call_rcu(cb)`：把回调加入队列，在 `synchronize_rcu` 完成后统一执行释放。
- 读侧使用 `rcu_dereference()` 获取指针，避免编译器/CPU 重排。
- 可以用 `wait_queue_t` + `wake_up` 方式等待 `rcu_readers` 归零，避免忙等；实现路径与信号量等待类似。

### 扩展到多核的思路
- 使用每 CPU 计数器或 epoch；每个 CPU 在时钟中断或上下文切换时上报“静默点”。
- `synchronize_rcu` 需要等待所有 CPU 进入静默点后再释放旧数据。

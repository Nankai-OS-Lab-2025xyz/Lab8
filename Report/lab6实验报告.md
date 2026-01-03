# Lab6 实验报告

## 实验目的

- 理解操作系统的调度管理机制
- 熟悉 ucore 的系统调度器框架，实现缺省的Round-Robin 调度算法
- 基于调度器框架实现一个(Stride Scheduling)调度算法来替换缺省的调度算法

## 实验内容

在前两章中，我们已经分别实现了内核进程和用户进程，并且让他们正确运行了起来。同时我们也实现了一个简单的调度算法，FIFO调度算法，来对我们的进程进行调度,可通过阅读实验五下的 kern/schedule/sched.c 的 schedule 函数的实现来了解其FIFO调度策略。但是，单单如此就够了吗？显然，我们可以让ucore支持更加丰富的调度算法，从而满足各方面的调度需求。与实验五相比，实验六专门需要针对处理器调度框架和各种算法进行设计与实现，为此对ucore的调度部分进行了适当的修改，使得kern/schedule/sched.c 只实现调度器框架，而不再涉及具体的调度算法实现。而调度算法在单独的文件（default_sched.[ch]）中实现。

在本次实验中，我们在`init/init.c`中加入了对`sched_init`函数的调用。这个函数主要完成调度器和特定调度算法的绑定。初始化后，我们在调度函数中就可以使用相应的接口，切换你实现的不同的调度算法了。这也是在C语言环境下对于面向对象编程模式的一种模仿。这样之后，我们只需要关注于实现调度类的接口即可，操作系统也同样不关心调度类具体的实现，方便了新调度算法的开发。本次实验，主要是熟悉ucore的系统调度器框架，以及基于此框架实现Round-Robin（RR） 调度算法。然后进一步完成Stride调度算法。

## 练习1：调度器框架理解

### sched_class 结构体
- init：在 `sched_init()` 中调用，用于初始化 `run_queue` 的内部数据结构（如链表/斜堆等）。
- enqueue：进程变为 RUNNABLE 时调用，将进程加入运行队列。
- dequeue：选中要运行的进程后调用，将其从运行队列移除。
- pick_next：在 `schedule()` 中调用，用于选择下一个要运行的进程。
- proc_tick：在时钟中断的 tick 处理路径中调用，更新时间片并决定是否触发重调度。
- 使用函数指针的原因：把“调度策略”从“调度框架”中解耦，`schedule()`、`wakeup_proc()` 等核心逻辑只依赖统一接口，方便替换/扩展算法（如 RR/Stride），也能在运行时切换调度类。
- 调用时机细化：`wakeup_proc()` 和 `schedule()` 在持有“关中断”的临界区内调用 `enqueue/dequeue`，避免并发破坏队列；`proc_tick` 则由时钟中断触发的 `run_timer_list()` 调用。
- 扩展性：`sched_class` 预留了 SMP 相关接口（如 load_balance/get_proc），后续可在不改动调度框架的前提下扩展多核调度。
- 与数据结构绑定：算法可将额外状态挂在 `run_queue` 或 `proc_struct` 中（例如 stride 的 `lab6_run_pool/lab6_stride`），而框架完全不关心具体含义。

### run_queue 结构体
- lab5 仅需要一个就绪队列（链表）和计数器；lab6 需要同时支持 RR（FIFO 链表）和 Stride（最小 stride 的优先队列）。
- 因此 `run_queue` 中新增 `lab6_run_pool`（斜堆根指针），并保留 `run_list` 以复用 RR 的链表队列。不同调度类只使用自己需要的字段。
- `run_list` 是哨兵循环双链表，判空条件为 `list_empty(&run_list)`；RR 入队/出队为 O(1)。
- `lab6_run_pool` 是斜堆根指针，`pick_next` 可以 O(1) 获取最小 stride 进程，插入/删除均摊 O(log n)。
- `proc_num` 用于统计队列长度和安全断言，避免“空队列出队”等错误。

### sched_init / wakeup_proc / schedule 的变化
- `sched_init()`：从“直接初始化固定的就绪队列”改为“选择一个 `sched_class` 并调用其 `init`”，把算法与框架解耦。
- `wakeup_proc()`：从“直接插入就绪链表”改为调用 `sched_class->enqueue`，使唤醒逻辑独立于具体队列类型。
- `schedule()`：从“链表操作 + 直接选队头”改为调用 `pick_next/dequeue`，可同时支持 RR 和 Stride。
- `schedule()` 里先清 `current->need_resched`，再把当前可运行进程重新入队，保证“时间片耗尽后被放回队尾”的语义。
- 若 `pick_next()` 返回 `NULL`，则调度到 `idleproc`；这与 RR/Stride 的空队列处理逻辑解耦。
- 框架仍负责关键流程（关中断、更新 `runs`、`proc_run()` 切换），算法只负责队列策略。

### 调度类初始化流程
- `kern_init()` 中调用 `sched_init()`。
- `sched_init()` 选择默认调度类（本次切换为 stride），设置 `rq->max_time_slice`，并调用 `sched_class->init(rq)` 完成运行队列初始化。
- 之后 `proc_init()` 创建 idle/init 进程，调度框架即可开始工作。
- `proc_init()` 将 `idleproc->need_resched=1`，保证系统启动后很快触发一次调度，切换到真正的可运行进程。
- `clock_init()` 开始周期性时钟中断后，`run_timer_list()` 会持续驱动 `proc_tick`，形成“时钟驱动调度”的闭环。

### 进程调度流程（含 need_resched）
- 时钟中断触发 → `run_timer_list()` 被调用 → `sched_class_proc_tick(current)`。
- `proc_tick()` 减少时间片；当时间片耗尽时设置 `current->need_resched = 1`。
- 中断返回时，在 `trap()` 中检测 `need_resched`，若为 1 则调用 `schedule()`。
- `schedule()` 重新入队当前进程（若仍 RUNNABLE）→ `pick_next()` 选出下一个进程 → `dequeue()` 移出运行队列 → `proc_run()` 完成上下文切换。
- `need_resched` 是“是否需要主动调度”的标志，避免每个 tick 都强制切换，提高效率。
- `do_yield()` 也会设置 `need_resched=1`，这是“自愿让出 CPU”的另一条路径（与时钟中断并列）。
- 对 `idleproc` 特殊处理：`sched_class_proc_tick()` 会直接让 `idleproc->need_resched=1`，保证一旦有可运行进程就能抢占 idle。

### 调度算法切换机制
- 新增一个调度算法只需：
  1) 实现一个新的 `sched_class`（init/enqueue/dequeue/pick_next/proc_tick）。
  2) 在 `sched_init()` 中切换 `sched_class` 指针。
  3) 若需要新的数据结构，在 `run_queue/proc_struct` 中扩展字段。
- 由于调度框架统一通过函数指针访问，不需要在 `schedule()` 里写算法相关的条件分支，切换成本低。
- 工程层面还需保证新文件参与编译（如在构建脚本中加入 `.c` 文件），否则调度类不会被链接进内核。
- 若算法需要用户态参数（如 stride 的 `priority`），可通过新增系统调用或复用现有接口进行配置。

## 练习2：RR 调度实现

### 与 lab5 不同的函数比较
- `kern/schedule/sched.c:schedule()` 在 lab6 中改为调用 `sched_class_*` 接口，而不是直接对链表操作。
- 不做这个改动会导致：
  - 新的调度算法（如 stride）无法接入；
  - `pick_next/dequeue` 与真实数据结构不一致，可能破坏运行队列或导致调度失效。
- `wakeup_proc()` 同样从“直接链表入队”切换为 `sched_class->enqueue`，否则 stride 的斜堆结构会被错误绕过。
- `sched_init()` 改为“选择调度类 + 调用 init”，若仍沿用 lab5 的固定链表初始化，会导致 stride 使用未初始化的 `lab6_run_pool`。

### RR_* 函数实现思路
- `RR_init`：对 `rq->run_list` 做 `list_init`，并清零 `proc_num`。
- `RR_enqueue`：
  - `assert(list_empty(&proc->run_link))` 防止重复入队；
  - 使用 `list_add_before(&rq->run_list, &proc->run_link)` 把新进程放到队尾，保证 FIFO；
  - 若 `time_slice` 为 0 或越界，重置为 `max_time_slice`；
  - 设置 `proc->rq`，并递增 `proc_num`。
- `RR_dequeue`：断言进程确实在该队列中；`list_del_init` 删除并重置链接；`proc_num--`。
- `RR_pick_next`：取 `list_next(&rq->run_list)` 作为队首；若为空返回 `NULL`。
- `RR_proc_tick`：若时间片 >0 则递减；耗尽时置 `need_resched=1`，让时钟中断后触发调度。
- 为什么用 `list_add_before`：`run_list` 是哨兵结点，`list_add_before(&run_list, node)` 等价于“插到队尾”，而 `list_next(&run_list)` 正好取队首，保持先进先出。
- 时间片重置策略：只在入队时修正 `time_slice`，避免在 `proc_tick` 里频繁分支，减少时钟中断路径开销。

### 边界情况处理
- 队列为空时，`RR_pick_next` 返回 `NULL`，`schedule()` 会选择 `idleproc`。
- 时间片为 0 时在 `RR_enqueue` 重新赋值，保证进程不会“永远拿不到 CPU”。
- 使用 `assert` 防止重复入队或错误出队。
- `idleproc` 不进入就绪队列（`sched_class_enqueue` 会忽略），避免 idle 与普通进程竞争。
- 若进程 `time_slice` 被异常设置成超出 `max_time_slice`，入队时会被修正，避免长时间垄断 CPU。

### QEMU 观察
- RR 下各进程按时间片轮转，时间片用尽后切换到队首下一个进程。观察到的关键信息：启动打印 `sched class: RR_scheduler/stride_scheduler`，以及 `init check memory pass.` 等提示。

### RR 优缺点与时间片
- 优点：实现简单、响应公平、不会长期饥饿。
- 缺点：忽略优先级、上下文切换开销可能较大。
- 时间片越大，吞吐更高但响应变差；时间片越小，交互性更好但切换开销增大。
- 在 `RR_proc_tick` 中设置 `need_resched` 是为了在时间片耗尽时触发调度，保证轮转公平。
- ucore 默认 `MAX_TIME_SLICE=5`，属于较短时间片；适合教学与交互性演示，但对计算密集型任务可能增加切换开销。
- 对 I/O 密集型任务，时间片过大可能导致响应变慢；对 CPU 密集型任务，时间片过小可能导致频繁切换。

### 拓展思考
- 优先级 RR：
  - 增加 `priority` 字段；
  - 方案 A：多级队列（每个优先级一个队列），调度时从高到低挑选非空队列；
  - 方案 B：加权 RR（不同优先级分配不同比例时间片）。
- 多核支持：当前只有单一 `run_queue` 和全局 `current`，无 per-CPU 队列和负载均衡；
  - 需要为每个 CPU 建立独立 `run_queue`、`current`，并加锁保护；
  - 实现 `load_balance/get_proc` 等接口进行迁移与均衡。
- 优先级 RR 的实现要点：
  - 将 `run_queue` 扩展为数组队列 `run_queue[level]`；
  - `pick_next` 优先选择最高优先级非空队列；
  - 可结合 aging 定期提升低优先级进程，避免饥饿。
- 多核改进还需要：
  - 每核独立的时钟 tick 与 `proc_tick`；
  - 进程迁移时更新 `proc->rq` 与亲和性；
  - 采用自旋锁或关中断保护本地队列。

## Challenge 1：Stride Scheduling

### 实现过程
- 在 `sched_init()` 中将默认调度器切换为 `stride_sched_class`。
- `stride_init` 初始化 `run_list`、`lab6_run_pool` 和 `proc_num`。
- `stride_enqueue` 使用斜堆插入（`skew_heap_insert`），并保证 `priority` 非 0；时间片按 `max_time_slice` 重新分配。
- `stride_pick_next` 选择 stride 最小的进程，并执行 `stride += BIG_STRIDE / priority` 更新虚拟时间。
- `stride_proc_tick` 与 RR 相同：时间片耗尽后设置 `need_resched`。
- `BIG_STRIDE` 选择为较大的常量（如 `1<<30`），用于提高步长的精度，避免整数除法带来的比例误差。
- `proc_stride_comp_f` 只比较 `lab6_stride`，斜堆保证每次选出最小 stride 进程。

### 多级反馈队列调度算法（概要设计）
- 维护多个优先级队列（高优先级短时间片、低优先级长时间片）。
- 新进程进入最高优先级队列；时间片耗尽则降级；发生 I/O 阻塞/睡眠后可提升。
- 通过 aging 机制防止低优先级饥饿。
- `pick_next` 从高到低找到第一个非空队列；`proc_tick` 负责时间片与降级。
- 常见配置：时间片按 1,2,4,8... 递增；每过一段时间把所有进程“提升”到最高优先级。
- 交互型进程会频繁阻塞/唤醒，倾向于停留在高优先级队列，获得更好响应。

### Stride 算法公平性说明
- 设每个进程的 `stride = BIG_STRIDE / priority`，每执行一次时间片，`pass += stride`。
- 调度器总是选择 `pass` 最小的进程执行。长期来看，各进程的 `pass` 会趋于相近。
- 因为高优先级进程 stride 更小，需要更多次运行才能“追平” pass，因此获得的时间片数与 `priority` 成正比。
- 设进程 i 执行次数为 `N_i`，则其累计 `pass_i ≈ N_i * BIG_STRIDE / priority_i`。
  当系统稳定运行且 `pass_i` 相近时，有 `N_i / N_j ≈ priority_i / priority_j`，因此份额成比例。

### 设计实现过程说明
- 选用斜堆作为优先队列，`pick_next` 为 O(1) 取最小，插入/删除为均摊 O(log n)。
- `proc_struct` 增加 `lab6_stride/lab6_priority`，`run_queue` 增加 `lab6_run_pool` 以复用调度框架。
- 在调度入口处通过 `sched_class` 统一调用，避免在核心调度流程中写算法特化逻辑。
- 进程优先级由用户态调用 `lab6_set_priority` 设置，内核侧对 0 做保护性修正，避免除零。
- 若要切换回 RR，仅需将 `sched_init()` 里的调度类指针改回 `default_sched_class`，其他逻辑无需改动。

## Challenge 2：常见调度算法整理与对比

### 评价指标
- 吞吐量：单位时间完成的任务数。
- 周转时间：完成时间 - 到达时间，包含等待与执行。
- 等待时间：就绪队列中的等待总时长。
- 响应时间：从到达到首次获得 CPU 的时间。
- 公平性/饥饿：是否长期得不到调度。
- 切换开销：上下文切换带来的额外损耗。
- 可预测性/截止期：是否满足实时约束。
- 实时性指标：截止期违约率、抖动（jitter）、最坏响应时间。
- 资源利用率：CPU 利用率高低，以及是否能避免空转。

### 常见算法（伪代码 + 特性）

#### FIFO / FCFS
伪代码：
```c
enqueue(p): add_to_tail(ready_queue, p)
pick_next(): return pop_head(ready_queue)
proc_tick(p): return  // 非抢占
```
性质/性能：
- 实现最简单、开销低、可预测。
- 易出现“护航效应”，长作业拖慢短作业。
- 响应时间较差，交互性不佳。
适用范围：批处理、作业长度相近的场景。
- 在 ucore 上实现只需复用 `run_list`，不需要 `time_slice` 强制抢占。

#### SJF（Shortest Job First，非抢占）
伪代码：
```c
pick_next(): return argmin(predicted_burst_time)
```
性质/性能：
- 理论上最小化平均等待/周转时间（已知作业长度时）。
- 需要估计 CPU burst，长作业可能饥饿。
适用范围：批处理，作业长度可预测场景。
- 常见估计方式：`tau_{n+1} = alpha * t_n + (1 - alpha) * tau_n`，用历史 burst 指数平滑预测。

#### SRTF（Shortest Remaining Time First，抢占）
伪代码：
```c
on_arrival(p):
  if p.remain < current.remain: preempt()
pick_next(): return argmin(remaining_time)
```
性质/性能：
- 平均周转/等待更优，响应更快。
- 抢占频繁，切换开销更大；长作业可能饥饿。
适用范围：对响应时间敏感且可估计剩余时间的场景。
- 适合短作业密集场景，但对长作业极不友好，需配合 aging 或阈值限制。

#### Priority（优先级，抢占/非抢占）
伪代码：
```c
pick_next(): return max_priority_ready()
on_arrival(p): if preemptive and p.prio > current.prio -> preempt()
```
性质/性能：
- 满足重要任务优先执行。
- 低优先级可能饥饿，需配合 aging。
适用范围：系统进程优先、软实时、区分重要性任务。
- 实现要点：就绪队列按优先级分层，或使用优先队列（堆/平衡树）。

#### RR（Round Robin）
伪代码：
```c
enqueue(p): add_to_tail(queue, p)
proc_tick(p):
  if slice==0: add_to_tail(queue, p); need_resched=1
pick_next(): return pop_head(queue)
```
性质/性能：
- 公平性好、响应时间稳定。
- 时间片过小切换开销大，过大响应变差。
适用范围：交互式系统、分时系统。
- 若时间片非常大，RR 行为趋近 FIFO；若非常小，则趋近“理想响应”，但切换开销显著增大。

#### HRRN（Highest Response Ratio Next，非抢占）
伪代码：
```c
ratio(p) = (wait_time + service_time) / service_time
pick_next(): return argmax(ratio)
```
性质/性能：
- 在 SJF 基础上考虑等待时间，缓解饥饿。
- 仍需估计服务时间，非抢占。
适用范围：批处理、希望兼顾短作业与公平性的场景。
- 等待时间越长，响应比越大，长作业最终也会被调度。

#### MLFQ（多级反馈队列）
伪代码：
```c
queues[0..k-1], higher_index => lower_priority
on_tick(p):
  if slice==0: demote(p)
on_wakeup(p): promote(p) or keep
periodic_boost(): move_all_to_top()
pick_next(): first_non_empty_queue()
```
性质/性能：
- 对交互型任务友好，I/O 频繁的任务能保持高优先级。
- 参数多、实现复杂，需防止低级队列饥饿（boost/aging）。
适用范围：通用 OS 的交互负载。
- 需要合理配置队列数和时间片，否则可能出现“长作业长期被压制”的问题。

#### Stride（比例份额）
伪代码：
```c
stride = BIG / priority
pick_next():
  p = min(pass)
  p.pass += p.stride
  return p
```
性质/性能：
- 提供可控的比例公平性，确定性强。
- 需要维护优先队列，计算开销高于 RR。
适用范围：需要按权重分配 CPU 的系统/服务。
- 可直接表达“服务等级”，适合多租户或资源配额场景。

#### Lottery（彩票调度）
伪代码：
```c
total = sum(tickets)
r = random(1, total)
pick proc whose cumulative_tickets >= r
```
性质/性能：
- 期望上公平，易实现可加权份额。
- 具有随机抖动，短期公平性不稳定。
适用范围：对统计公平性足够的场景、快速实现。
- 可通过“彩票转移”实现进程间资源再分配，但结果不够可预测。

#### CFS（Completely Fair Scheduler）
伪代码：
```c
pick_next(): return min(vruntime)  // 红黑树
on_tick(p): p.vruntime += delta_exec * (NICE_0_WEIGHT / weight)
```
性质/性能：
- 长期公平性好，Linux 常用方案。
- 数据结构与实现复杂，维护成本较高。
适用范围：通用桌面/服务器负载。
- 以“虚拟运行时间”衡量公平性，目标是让所有进程的 vruntime 接近。

#### EDF（Earliest Deadline First）
伪代码：
```c
pick_next(): return min(deadline)
```
性质/性能：
- 单核抢占下最优实时性（可行时能调度成功）。
- 过载时失效明显，需要 admission control。
适用范围：硬/软实时任务，具有截止期约束。
- 适合动态任务，但需要精确管理截止期与负载，防止不可调度。

#### RMS（Rate Monotonic Scheduling）
伪代码：
```c
priority = 1 / period
pick_next(): highest_priority_ready()
```
性质/性能：
- 固定优先级实时调度，可给出可调度性界。
- 对周期任务更合适，对非周期任务不友好。
适用范围：周期性实时系统（嵌入式/控制）。
- 可调度性充分条件：`sum(C_i/T_i) <= n(2^{1/n}-1)`。

#### Multilevel Queue（多级队列，非反馈）
伪代码：
```c
queues by class (system/interactive/batch)
pick_next(): choose highest non-empty queue
```
性质/性能：
- 简单直观，但低级队列可能饥饿。
- 需要明确任务类别划分。
适用范围：系统区分不同任务类型的场景。
- 一般与“不同队列不同时间片或抢占规则”配合使用。

### 指标差异总结
- 平均周转/等待最优：SJF/SRTF（依赖作业长度估计，可能饥饿）。
- 响应时间较好：RR、MLFQ（时间片与队列策略影响明显）。
- 公平性与份额控制：Stride、Lottery、CFS。
- 实时性与可预测：EDF、RMS、优先级调度（需负载控制）。
- 实现复杂度与开销：FIFO 最低，MLFQ/CFS/EDF 较高。
- 交互体验：MLFQ/CFS 通常优于 FIFO/SJF，因为更偏向短交互任务。
- 可解释性：Stride/FIFO 最容易解释；Lottery 需要统计意义上的解释。

### 适用范围概述
- 批处理：FIFO、SJF、HRRN。
- 交互式/分时：RR、MLFQ、CFS。
- 有权重份额需求：Stride、Lottery。
- 实时系统：EDF、RMS、优先级调度（含 admission control）。
- 混合负载：通常采用 MLFQ/CFS + 适当的优先级机制，兼顾交互性与吞吐。

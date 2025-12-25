
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	4380b0ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	49e58593          	addi	a1,a1,1182 # ffffffffc020b508 <etext+0x4>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	4b650513          	addi	a0,a0,1206 # ffffffffc020b528 <etext+0x24>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	24b020ef          	jal	ra,ffffffffc0202ad0 <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	6d7030ef          	jal	ra,ffffffffc0203f68 <vmm_init>
ffffffffc0200096:	18a070ef          	jal	ra,ffffffffc0207220 <sched_init>
ffffffffc020009a:	591060ef          	jal	ra,ffffffffc0206e2a <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	108050ef          	jal	ra,ffffffffc02051aa <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	749060ef          	jal	ra,ffffffffc0206ff6 <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000b517          	auipc	a0,0xb
ffffffffc02000cc:	46850513          	addi	a0,a0,1128 # ffffffffc020b530 <etext+0x2c>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	f82b8b93          	addi	s7,s7,-126 # ffffffffc0291060 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f2650513          	addi	a0,a0,-218 # ffffffffc0291060 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	6730a0ef          	jal	ra,ffffffffc020b00c <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	6370a0ef          	jal	ra,ffffffffc020b00c <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	1f80b0ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	2d60b0ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000b517          	auipc	a0,0xb
ffffffffc0200232:	30a50513          	addi	a0,a0,778 # ffffffffc020b538 <etext+0x34>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	31450513          	addi	a0,a0,788 # ffffffffc020b558 <etext+0x54>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	2b458593          	addi	a1,a1,692 # ffffffffc020b504 <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	32050513          	addi	a0,a0,800 # ffffffffc020b578 <etext+0x74>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	32c50513          	addi	a0,a0,812 # ffffffffc020b598 <etext+0x94>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	33850513          	addi	a0,a0,824 # ffffffffc020b5b8 <etext+0xb4>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	a8358593          	addi	a1,a1,-1405 # ffffffffc0296d0f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000b517          	auipc	a0,0xb
ffffffffc02002b2:	32a50513          	addi	a0,a0,810 # ffffffffc020b5d8 <etext+0xd4>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	34c60613          	addi	a2,a2,844 # ffffffffc020b608 <etext+0x104>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	35850513          	addi	a0,a0,856 # ffffffffc020b620 <etext+0x11c>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	36060613          	addi	a2,a2,864 # ffffffffc020b638 <etext+0x134>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	37858593          	addi	a1,a1,888 # ffffffffc020b658 <etext+0x154>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	37850513          	addi	a0,a0,888 # ffffffffc020b660 <etext+0x15c>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	37a60613          	addi	a2,a2,890 # ffffffffc020b670 <etext+0x16c>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	39a58593          	addi	a1,a1,922 # ffffffffc020b698 <etext+0x194>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	35a50513          	addi	a0,a0,858 # ffffffffc020b660 <etext+0x15c>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	39660613          	addi	a2,a2,918 # ffffffffc020b6a8 <etext+0x1a4>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	3ae58593          	addi	a1,a1,942 # ffffffffc020b6c8 <etext+0x1c4>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	33e50513          	addi	a0,a0,830 # ffffffffc020b660 <etext+0x15c>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000b517          	auipc	a0,0xb
ffffffffc0200360:	37c50513          	addi	a0,a0,892 # ffffffffc020b6d8 <etext+0x1d4>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000b517          	auipc	a0,0xb
ffffffffc0200382:	38250513          	addi	a0,a0,898 # ffffffffc020b700 <etext+0x1fc>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	3dcc0c13          	addi	s8,s8,988 # ffffffffc020b770 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	38c90913          	addi	s2,s2,908 # ffffffffc020b728 <etext+0x224>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	38c48493          	addi	s1,s1,908 # ffffffffc020b730 <etext+0x22c>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	38ab0b13          	addi	s6,s6,906 # ffffffffc020b738 <etext+0x234>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	2a2a0a13          	addi	s4,s4,674 # ffffffffc020b658 <etext+0x154>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000bd17          	auipc	s10,0xb
ffffffffc02003dc:	398d0d13          	addi	s10,s10,920 # ffffffffc020b770 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	05a0b0ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	0460b0ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	04c0b0ef          	jal	ra,ffffffffc020b484 <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	00e0b0ef          	jal	ra,ffffffffc020b484 <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000b517          	auipc	a0,0xb
ffffffffc0200494:	2c850513          	addi	a0,a0,712 # ffffffffc020b758 <etext+0x254>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3ca30313          	addi	t1,t1,970 # ffffffffc0296868 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000b517          	auipc	a0,0xb
ffffffffc02004d0:	2ec50513          	addi	a0,a0,748 # ffffffffc020b7b8 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000c517          	auipc	a0,0xc
ffffffffc02004e6:	59650513          	addi	a0,a0,1430 # ffffffffc020ca78 <default_pmm_manager+0x610>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	2c250513          	addi	a0,a0,706 # ffffffffc020b7d8 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000c517          	auipc	a0,0xc
ffffffffc020053a:	54250513          	addi	a0,a0,1346 # ffffffffc020ca78 <default_pmm_manager+0x610>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000b517          	auipc	a0,0xb
ffffffffc020056c:	29050513          	addi	a0,a0,656 # ffffffffc020b7f8 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3007b023          	sd	zero,768(a5) # ffffffffc0296870 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e5e68693          	addi	a3,a3,-418 # ffffffffc0291460 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0007ab23          	sw	zero,22(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	16a50513          	addi	a0,a0,362 # ffffffffc020b818 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	14c50513          	addi	a0,a0,332 # ffffffffc020b828 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	14650513          	addi	a0,a0,326 # ffffffffc020b838 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	14e50513          	addi	a0,a0,334 # ffffffffc020b850 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	0e490913          	addi	s2,s2,228 # ffffffffc020b8a0 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	0ce48493          	addi	s1,s1,206 # ffffffffc020b898 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	0fa50513          	addi	a0,a0,250 # ffffffffc020b918 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	12650513          	addi	a0,a0,294 # ffffffffc020b950 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	00650513          	addi	a0,a0,6 # ffffffffc020b870 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	3810a0ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	3d90a0ef          	jal	ra,ffffffffc020b45e <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	3250a0ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	f7850513          	addi	a0,a0,-136 # ffffffffc020b8a8 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	eca50513          	addi	a0,a0,-310 # ffffffffc020b8c8 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	ed050513          	addi	a0,a0,-304 # ffffffffc020b8e0 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	ede50513          	addi	a0,a0,-290 # ffffffffc020b900 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	f2250513          	addi	a0,a0,-222 # ffffffffc020b950 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e487b123          	sd	s0,-446(a5) # ffffffffc0296878 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e567b123          	sd	s6,-446(a5) # ffffffffc0296880 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e3053503          	ld	a0,-464(a0) # ffffffffc0296878 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e2e53503          	ld	a0,-466(a0) # ffffffffc0296880 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c5a58593          	addi	a1,a1,-934 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	be07af23          	sw	zero,-1026(a5) # ffffffffc0291668 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c407a323          	sw	zero,-954(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	c807a723          	sw	zero,-882(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	cc07ab23          	sw	zero,-810(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	bdc40413          	addi	s0,s0,-1060 # ffffffffc0291668 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c6c58593          	addi	a1,a1,-916 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	eb068693          	addi	a3,a3,-336 # ffffffffc020b968 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	ec060613          	addi	a2,a2,-320 # ffffffffc020b980 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	ece50513          	addi	a0,a0,-306 # ffffffffc020b998 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	eda68693          	addi	a3,a3,-294 # ffffffffc020b9b0 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	ea260613          	addi	a2,a2,-350 # ffffffffc020b980 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	eb050513          	addi	a0,a0,-336 # ffffffffc020b998 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b6678793          	addi	a5,a5,-1178 # ffffffffc0291668 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b4278793          	addi	a5,a5,-1214 # ffffffffc0291668 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b0a80813          	addi	a6,a6,-1270 # ffffffffc0291668 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	e3268693          	addi	a3,a3,-462 # ffffffffc020b9c8 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	de260613          	addi	a2,a2,-542 # ffffffffc020b980 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	dee50513          	addi	a0,a0,-530 # ffffffffc020b998 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	e3a68693          	addi	a3,a3,-454 # ffffffffc020b9f0 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	dc260613          	addi	a2,a2,-574 # ffffffffc020b980 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	dce50513          	addi	a0,a0,-562 # ffffffffc020b998 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	a7480813          	addi	a6,a6,-1420 # ffffffffc0291668 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	d9c68693          	addi	a3,a3,-612 # ffffffffc020b9c8 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	d4c60613          	addi	a2,a2,-692 # ffffffffc020b980 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	d5850513          	addi	a0,a0,-680 # ffffffffc020b998 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	da468693          	addi	a3,a3,-604 # ffffffffc020b9f0 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	d2c60613          	addi	a2,a2,-724 # ffffffffc020b980 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	d3850513          	addi	a0,a0,-712 # ffffffffc020b998 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	0550a0ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	02b0a0ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	7b60a0ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	d3650513          	addi	a0,a0,-714 # ffffffffc020ba48 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	d6c58593          	addi	a1,a1,-660 # ffffffffc020baa0 <commands+0x330>
ffffffffc0200d3c:	6f20a0ef          	jal	ra,ffffffffc020b42e <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	cb450513          	addi	a0,a0,-844 # ffffffffc020ba30 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	ce660613          	addi	a2,a2,-794 # ffffffffc020ba70 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	cf250513          	addi	a0,a0,-782 # ffffffffc020ba88 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	43a78793          	addi	a5,a5,1082 # ffffffffc02011e0 <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	cec50513          	addi	a0,a0,-788 # ffffffffc020bab0 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	cf450513          	addi	a0,a0,-780 # ffffffffc020bac8 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	cfe50513          	addi	a0,a0,-770 # ffffffffc020bae0 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	d0850513          	addi	a0,a0,-760 # ffffffffc020baf8 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	d1250513          	addi	a0,a0,-750 # ffffffffc020bb10 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	d1c50513          	addi	a0,a0,-740 # ffffffffc020bb28 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	d2650513          	addi	a0,a0,-730 # ffffffffc020bb40 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	d3050513          	addi	a0,a0,-720 # ffffffffc020bb58 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	d3a50513          	addi	a0,a0,-710 # ffffffffc020bb70 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	d4450513          	addi	a0,a0,-700 # ffffffffc020bb88 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	d4e50513          	addi	a0,a0,-690 # ffffffffc020bba0 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	d5850513          	addi	a0,a0,-680 # ffffffffc020bbb8 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	d6250513          	addi	a0,a0,-670 # ffffffffc020bbd0 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	d6c50513          	addi	a0,a0,-660 # ffffffffc020bbe8 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	d7650513          	addi	a0,a0,-650 # ffffffffc020bc00 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	d8050513          	addi	a0,a0,-640 # ffffffffc020bc18 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	d8a50513          	addi	a0,a0,-630 # ffffffffc020bc30 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	d9450513          	addi	a0,a0,-620 # ffffffffc020bc48 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	d9e50513          	addi	a0,a0,-610 # ffffffffc020bc60 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	da850513          	addi	a0,a0,-600 # ffffffffc020bc78 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	db250513          	addi	a0,a0,-590 # ffffffffc020bc90 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	dbc50513          	addi	a0,a0,-580 # ffffffffc020bca8 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	dc650513          	addi	a0,a0,-570 # ffffffffc020bcc0 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	dd050513          	addi	a0,a0,-560 # ffffffffc020bcd8 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	dda50513          	addi	a0,a0,-550 # ffffffffc020bcf0 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	de450513          	addi	a0,a0,-540 # ffffffffc020bd08 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	dee50513          	addi	a0,a0,-530 # ffffffffc020bd20 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	df850513          	addi	a0,a0,-520 # ffffffffc020bd38 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	e0250513          	addi	a0,a0,-510 # ffffffffc020bd50 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	e0c50513          	addi	a0,a0,-500 # ffffffffc020bd68 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	e1650513          	addi	a0,a0,-490 # ffffffffc020bd80 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	e1c50513          	addi	a0,a0,-484 # ffffffffc020bd98 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	e1e50513          	addi	a0,a0,-482 # ffffffffc020bdb0 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	e1e50513          	addi	a0,a0,-482 # ffffffffc020bdc8 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	e2650513          	addi	a0,a0,-474 # ffffffffc020bde0 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	e2e50513          	addi	a0,a0,-466 # ffffffffc020bdf8 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	e2a50513          	addi	a0,a0,-470 # ffffffffc020be08 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	ec670713          	addi	a4,a4,-314 # ffffffffc020bec0 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	e7450513          	addi	a0,a0,-396 # ffffffffc020be80 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	e4850513          	addi	a0,a0,-440 # ffffffffc020be60 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	dfc50513          	addi	a0,a0,-516 # ffffffffc020be20 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	e1050513          	addi	a0,a0,-496 # ffffffffc020be40 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	4de060ef          	jal	ra,ffffffffc0207530 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	3a30706f          	j	ffffffffc0208c00 <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	e3e50513          	addi	a0,a0,-450 # ffffffffc020bea0 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1141                	addi	sp,sp,-16
ffffffffc0201076:	e022                	sd	s0,0(sp)
ffffffffc0201078:	e406                	sd	ra,8(sp)
ffffffffc020107a:	473d                	li	a4,15
ffffffffc020107c:	842a                	mv	s0,a0
ffffffffc020107e:	0af76b63          	bltu	a4,a5,ffffffffc0201134 <exception_handler+0xc4>
ffffffffc0201082:	0000b717          	auipc	a4,0xb
ffffffffc0201086:	ffe70713          	addi	a4,a4,-2 # ffffffffc020c080 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	f4450513          	addi	a0,a0,-188 # ffffffffc020bfd8 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	6960606f          	j	ffffffffc0207746 <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	f4450513          	addi	a0,a0,-188 # ffffffffc020bff8 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	f5250513          	addi	a0,a0,-174 # ffffffffc020c018 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	f6850513          	addi	a0,a0,-152 # ffffffffc020c038 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	f7650513          	addi	a0,a0,-138 # ffffffffc020c050 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	f8450513          	addi	a0,a0,-124 # ffffffffc020c068 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	e0250513          	addi	a0,a0,-510 # ffffffffc020bef0 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	e1850513          	addi	a0,a0,-488 # ffffffffc020bf10 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	e2e50513          	addi	a0,a0,-466 # ffffffffc020bf30 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	e3c50513          	addi	a0,a0,-452 # ffffffffc020bf48 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	e4250513          	addi	a0,a0,-446 # ffffffffc020bf58 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	e5850513          	addi	a0,a0,-424 # ffffffffc020bf78 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	e9650513          	addi	a0,a0,-362 # ffffffffc020bfc0 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	e5260613          	addi	a2,a2,-430 # ffffffffc020bf90 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	e5e50513          	addi	a0,a0,-418 # ffffffffc020bfa8 <commands+0x838>
ffffffffc0201152:	b4cff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201156 <trap>:
ffffffffc0201156:	1101                	addi	sp,sp,-32
ffffffffc0201158:	e822                	sd	s0,16(sp)
ffffffffc020115a:	00095417          	auipc	s0,0x95
ffffffffc020115e:	76640413          	addi	s0,s0,1894 # ffffffffc02968c0 <current>
ffffffffc0201162:	6018                	ld	a4,0(s0)
ffffffffc0201164:	ec06                	sd	ra,24(sp)
ffffffffc0201166:	e426                	sd	s1,8(sp)
ffffffffc0201168:	e04a                	sd	s2,0(sp)
ffffffffc020116a:	11853683          	ld	a3,280(a0)
ffffffffc020116e:	cf1d                	beqz	a4,ffffffffc02011ac <trap+0x56>
ffffffffc0201170:	10053483          	ld	s1,256(a0)
ffffffffc0201174:	0a073903          	ld	s2,160(a4)
ffffffffc0201178:	f348                	sd	a0,160(a4)
ffffffffc020117a:	1004f493          	andi	s1,s1,256
ffffffffc020117e:	0206c463          	bltz	a3,ffffffffc02011a6 <trap+0x50>
ffffffffc0201182:	eefff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201186:	601c                	ld	a5,0(s0)
ffffffffc0201188:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020118c:	e499                	bnez	s1,ffffffffc020119a <trap+0x44>
ffffffffc020118e:	0b07a703          	lw	a4,176(a5)
ffffffffc0201192:	8b05                	andi	a4,a4,1
ffffffffc0201194:	e329                	bnez	a4,ffffffffc02011d6 <trap+0x80>
ffffffffc0201196:	6f9c                	ld	a5,24(a5)
ffffffffc0201198:	eb85                	bnez	a5,ffffffffc02011c8 <trap+0x72>
ffffffffc020119a:	60e2                	ld	ra,24(sp)
ffffffffc020119c:	6442                	ld	s0,16(sp)
ffffffffc020119e:	64a2                	ld	s1,8(sp)
ffffffffc02011a0:	6902                	ld	s2,0(sp)
ffffffffc02011a2:	6105                	addi	sp,sp,32
ffffffffc02011a4:	8082                	ret
ffffffffc02011a6:	e47ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc02011aa:	bff1                	j	ffffffffc0201186 <trap+0x30>
ffffffffc02011ac:	0006c863          	bltz	a3,ffffffffc02011bc <trap+0x66>
ffffffffc02011b0:	6442                	ld	s0,16(sp)
ffffffffc02011b2:	60e2                	ld	ra,24(sp)
ffffffffc02011b4:	64a2                	ld	s1,8(sp)
ffffffffc02011b6:	6902                	ld	s2,0(sp)
ffffffffc02011b8:	6105                	addi	sp,sp,32
ffffffffc02011ba:	bd5d                	j	ffffffffc0201070 <exception_handler>
ffffffffc02011bc:	6442                	ld	s0,16(sp)
ffffffffc02011be:	60e2                	ld	ra,24(sp)
ffffffffc02011c0:	64a2                	ld	s1,8(sp)
ffffffffc02011c2:	6902                	ld	s2,0(sp)
ffffffffc02011c4:	6105                	addi	sp,sp,32
ffffffffc02011c6:	b51d                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc02011c8:	6442                	ld	s0,16(sp)
ffffffffc02011ca:	60e2                	ld	ra,24(sp)
ffffffffc02011cc:	64a2                	ld	s1,8(sp)
ffffffffc02011ce:	6902                	ld	s2,0(sp)
ffffffffc02011d0:	6105                	addi	sp,sp,32
ffffffffc02011d2:	1520606f          	j	ffffffffc0207324 <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	61f040ef          	jal	ra,ffffffffc0205ff6 <do_exit>
ffffffffc02011dc:	601c                	ld	a5,0(s0)
ffffffffc02011de:	bf65                	j	ffffffffc0201196 <trap+0x40>

ffffffffc02011e0 <__alltraps>:
ffffffffc02011e0:	14011173          	csrrw	sp,sscratch,sp
ffffffffc02011e4:	00011463          	bnez	sp,ffffffffc02011ec <__alltraps+0xc>
ffffffffc02011e8:	14002173          	csrr	sp,sscratch
ffffffffc02011ec:	712d                	addi	sp,sp,-288
ffffffffc02011ee:	e002                	sd	zero,0(sp)
ffffffffc02011f0:	e406                	sd	ra,8(sp)
ffffffffc02011f2:	ec0e                	sd	gp,24(sp)
ffffffffc02011f4:	f012                	sd	tp,32(sp)
ffffffffc02011f6:	f416                	sd	t0,40(sp)
ffffffffc02011f8:	f81a                	sd	t1,48(sp)
ffffffffc02011fa:	fc1e                	sd	t2,56(sp)
ffffffffc02011fc:	e0a2                	sd	s0,64(sp)
ffffffffc02011fe:	e4a6                	sd	s1,72(sp)
ffffffffc0201200:	e8aa                	sd	a0,80(sp)
ffffffffc0201202:	ecae                	sd	a1,88(sp)
ffffffffc0201204:	f0b2                	sd	a2,96(sp)
ffffffffc0201206:	f4b6                	sd	a3,104(sp)
ffffffffc0201208:	f8ba                	sd	a4,112(sp)
ffffffffc020120a:	fcbe                	sd	a5,120(sp)
ffffffffc020120c:	e142                	sd	a6,128(sp)
ffffffffc020120e:	e546                	sd	a7,136(sp)
ffffffffc0201210:	e94a                	sd	s2,144(sp)
ffffffffc0201212:	ed4e                	sd	s3,152(sp)
ffffffffc0201214:	f152                	sd	s4,160(sp)
ffffffffc0201216:	f556                	sd	s5,168(sp)
ffffffffc0201218:	f95a                	sd	s6,176(sp)
ffffffffc020121a:	fd5e                	sd	s7,184(sp)
ffffffffc020121c:	e1e2                	sd	s8,192(sp)
ffffffffc020121e:	e5e6                	sd	s9,200(sp)
ffffffffc0201220:	e9ea                	sd	s10,208(sp)
ffffffffc0201222:	edee                	sd	s11,216(sp)
ffffffffc0201224:	f1f2                	sd	t3,224(sp)
ffffffffc0201226:	f5f6                	sd	t4,232(sp)
ffffffffc0201228:	f9fa                	sd	t5,240(sp)
ffffffffc020122a:	fdfe                	sd	t6,248(sp)
ffffffffc020122c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0201230:	100024f3          	csrr	s1,sstatus
ffffffffc0201234:	14102973          	csrr	s2,sepc
ffffffffc0201238:	143029f3          	csrr	s3,stval
ffffffffc020123c:	14202a73          	csrr	s4,scause
ffffffffc0201240:	e822                	sd	s0,16(sp)
ffffffffc0201242:	e226                	sd	s1,256(sp)
ffffffffc0201244:	e64a                	sd	s2,264(sp)
ffffffffc0201246:	ea4e                	sd	s3,272(sp)
ffffffffc0201248:	ee52                	sd	s4,280(sp)
ffffffffc020124a:	850a                	mv	a0,sp
ffffffffc020124c:	f0bff0ef          	jal	ra,ffffffffc0201156 <trap>

ffffffffc0201250 <__trapret>:
ffffffffc0201250:	6492                	ld	s1,256(sp)
ffffffffc0201252:	6932                	ld	s2,264(sp)
ffffffffc0201254:	1004f413          	andi	s0,s1,256
ffffffffc0201258:	e401                	bnez	s0,ffffffffc0201260 <__trapret+0x10>
ffffffffc020125a:	1200                	addi	s0,sp,288
ffffffffc020125c:	14041073          	csrw	sscratch,s0
ffffffffc0201260:	10049073          	csrw	sstatus,s1
ffffffffc0201264:	14191073          	csrw	sepc,s2
ffffffffc0201268:	60a2                	ld	ra,8(sp)
ffffffffc020126a:	61e2                	ld	gp,24(sp)
ffffffffc020126c:	7202                	ld	tp,32(sp)
ffffffffc020126e:	72a2                	ld	t0,40(sp)
ffffffffc0201270:	7342                	ld	t1,48(sp)
ffffffffc0201272:	73e2                	ld	t2,56(sp)
ffffffffc0201274:	6406                	ld	s0,64(sp)
ffffffffc0201276:	64a6                	ld	s1,72(sp)
ffffffffc0201278:	6546                	ld	a0,80(sp)
ffffffffc020127a:	65e6                	ld	a1,88(sp)
ffffffffc020127c:	7606                	ld	a2,96(sp)
ffffffffc020127e:	76a6                	ld	a3,104(sp)
ffffffffc0201280:	7746                	ld	a4,112(sp)
ffffffffc0201282:	77e6                	ld	a5,120(sp)
ffffffffc0201284:	680a                	ld	a6,128(sp)
ffffffffc0201286:	68aa                	ld	a7,136(sp)
ffffffffc0201288:	694a                	ld	s2,144(sp)
ffffffffc020128a:	69ea                	ld	s3,152(sp)
ffffffffc020128c:	7a0a                	ld	s4,160(sp)
ffffffffc020128e:	7aaa                	ld	s5,168(sp)
ffffffffc0201290:	7b4a                	ld	s6,176(sp)
ffffffffc0201292:	7bea                	ld	s7,184(sp)
ffffffffc0201294:	6c0e                	ld	s8,192(sp)
ffffffffc0201296:	6cae                	ld	s9,200(sp)
ffffffffc0201298:	6d4e                	ld	s10,208(sp)
ffffffffc020129a:	6dee                	ld	s11,216(sp)
ffffffffc020129c:	7e0e                	ld	t3,224(sp)
ffffffffc020129e:	7eae                	ld	t4,232(sp)
ffffffffc02012a0:	7f4e                	ld	t5,240(sp)
ffffffffc02012a2:	7fee                	ld	t6,248(sp)
ffffffffc02012a4:	6142                	ld	sp,16(sp)
ffffffffc02012a6:	10200073          	sret

ffffffffc02012aa <forkrets>:
ffffffffc02012aa:	812a                	mv	sp,a0
ffffffffc02012ac:	b755                	j	ffffffffc0201250 <__trapret>

ffffffffc02012ae <default_init>:
ffffffffc02012ae:	00090797          	auipc	a5,0x90
ffffffffc02012b2:	4fa78793          	addi	a5,a5,1274 # ffffffffc02917a8 <free_area>
ffffffffc02012b6:	e79c                	sd	a5,8(a5)
ffffffffc02012b8:	e39c                	sd	a5,0(a5)
ffffffffc02012ba:	0007a823          	sw	zero,16(a5)
ffffffffc02012be:	8082                	ret

ffffffffc02012c0 <default_nr_free_pages>:
ffffffffc02012c0:	00090517          	auipc	a0,0x90
ffffffffc02012c4:	4f856503          	lwu	a0,1272(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02012c8:	8082                	ret

ffffffffc02012ca <default_check>:
ffffffffc02012ca:	715d                	addi	sp,sp,-80
ffffffffc02012cc:	e0a2                	sd	s0,64(sp)
ffffffffc02012ce:	00090417          	auipc	s0,0x90
ffffffffc02012d2:	4da40413          	addi	s0,s0,1242 # ffffffffc02917a8 <free_area>
ffffffffc02012d6:	641c                	ld	a5,8(s0)
ffffffffc02012d8:	e486                	sd	ra,72(sp)
ffffffffc02012da:	fc26                	sd	s1,56(sp)
ffffffffc02012dc:	f84a                	sd	s2,48(sp)
ffffffffc02012de:	f44e                	sd	s3,40(sp)
ffffffffc02012e0:	f052                	sd	s4,32(sp)
ffffffffc02012e2:	ec56                	sd	s5,24(sp)
ffffffffc02012e4:	e85a                	sd	s6,16(sp)
ffffffffc02012e6:	e45e                	sd	s7,8(sp)
ffffffffc02012e8:	e062                	sd	s8,0(sp)
ffffffffc02012ea:	2a878d63          	beq	a5,s0,ffffffffc02015a4 <default_check+0x2da>
ffffffffc02012ee:	4481                	li	s1,0
ffffffffc02012f0:	4901                	li	s2,0
ffffffffc02012f2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02012f6:	8b09                	andi	a4,a4,2
ffffffffc02012f8:	2a070a63          	beqz	a4,ffffffffc02015ac <default_check+0x2e2>
ffffffffc02012fc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201300:	679c                	ld	a5,8(a5)
ffffffffc0201302:	2905                	addiw	s2,s2,1
ffffffffc0201304:	9cb9                	addw	s1,s1,a4
ffffffffc0201306:	fe8796e3          	bne	a5,s0,ffffffffc02012f2 <default_check+0x28>
ffffffffc020130a:	89a6                	mv	s3,s1
ffffffffc020130c:	6df000ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0201310:	6f351e63          	bne	a0,s3,ffffffffc0201a0c <default_check+0x742>
ffffffffc0201314:	4505                	li	a0,1
ffffffffc0201316:	657000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020131a:	8aaa                	mv	s5,a0
ffffffffc020131c:	42050863          	beqz	a0,ffffffffc020174c <default_check+0x482>
ffffffffc0201320:	4505                	li	a0,1
ffffffffc0201322:	64b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201326:	89aa                	mv	s3,a0
ffffffffc0201328:	70050263          	beqz	a0,ffffffffc0201a2c <default_check+0x762>
ffffffffc020132c:	4505                	li	a0,1
ffffffffc020132e:	63f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201332:	8a2a                	mv	s4,a0
ffffffffc0201334:	48050c63          	beqz	a0,ffffffffc02017cc <default_check+0x502>
ffffffffc0201338:	293a8a63          	beq	s5,s3,ffffffffc02015cc <default_check+0x302>
ffffffffc020133c:	28aa8863          	beq	s5,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201340:	28a98663          	beq	s3,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201344:	000aa783          	lw	a5,0(s5)
ffffffffc0201348:	2a079263          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020134c:	0009a783          	lw	a5,0(s3)
ffffffffc0201350:	28079e63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc0201354:	411c                	lw	a5,0(a0)
ffffffffc0201356:	28079b63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020135a:	00095797          	auipc	a5,0x95
ffffffffc020135e:	54e7b783          	ld	a5,1358(a5) # ffffffffc02968a8 <pages>
ffffffffc0201362:	40fa8733          	sub	a4,s5,a5
ffffffffc0201366:	0000e617          	auipc	a2,0xe
ffffffffc020136a:	44a63603          	ld	a2,1098(a2) # ffffffffc020f7b0 <nbase>
ffffffffc020136e:	8719                	srai	a4,a4,0x6
ffffffffc0201370:	9732                	add	a4,a4,a2
ffffffffc0201372:	00095697          	auipc	a3,0x95
ffffffffc0201376:	52e6b683          	ld	a3,1326(a3) # ffffffffc02968a0 <npage>
ffffffffc020137a:	06b2                	slli	a3,a3,0xc
ffffffffc020137c:	0732                	slli	a4,a4,0xc
ffffffffc020137e:	28d77763          	bgeu	a4,a3,ffffffffc020160c <default_check+0x342>
ffffffffc0201382:	40f98733          	sub	a4,s3,a5
ffffffffc0201386:	8719                	srai	a4,a4,0x6
ffffffffc0201388:	9732                	add	a4,a4,a2
ffffffffc020138a:	0732                	slli	a4,a4,0xc
ffffffffc020138c:	4cd77063          	bgeu	a4,a3,ffffffffc020184c <default_check+0x582>
ffffffffc0201390:	40f507b3          	sub	a5,a0,a5
ffffffffc0201394:	8799                	srai	a5,a5,0x6
ffffffffc0201396:	97b2                	add	a5,a5,a2
ffffffffc0201398:	07b2                	slli	a5,a5,0xc
ffffffffc020139a:	30d7f963          	bgeu	a5,a3,ffffffffc02016ac <default_check+0x3e2>
ffffffffc020139e:	4505                	li	a0,1
ffffffffc02013a0:	00043c03          	ld	s8,0(s0)
ffffffffc02013a4:	00843b83          	ld	s7,8(s0)
ffffffffc02013a8:	01042b03          	lw	s6,16(s0)
ffffffffc02013ac:	e400                	sd	s0,8(s0)
ffffffffc02013ae:	e000                	sd	s0,0(s0)
ffffffffc02013b0:	00090797          	auipc	a5,0x90
ffffffffc02013b4:	4007a423          	sw	zero,1032(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02013b8:	5b5000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013bc:	2c051863          	bnez	a0,ffffffffc020168c <default_check+0x3c2>
ffffffffc02013c0:	4585                	li	a1,1
ffffffffc02013c2:	8556                	mv	a0,s5
ffffffffc02013c4:	5e7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013c8:	4585                	li	a1,1
ffffffffc02013ca:	854e                	mv	a0,s3
ffffffffc02013cc:	5df000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d0:	4585                	li	a1,1
ffffffffc02013d2:	8552                	mv	a0,s4
ffffffffc02013d4:	5d7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d8:	4818                	lw	a4,16(s0)
ffffffffc02013da:	478d                	li	a5,3
ffffffffc02013dc:	28f71863          	bne	a4,a5,ffffffffc020166c <default_check+0x3a2>
ffffffffc02013e0:	4505                	li	a0,1
ffffffffc02013e2:	58b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013e6:	89aa                	mv	s3,a0
ffffffffc02013e8:	26050263          	beqz	a0,ffffffffc020164c <default_check+0x382>
ffffffffc02013ec:	4505                	li	a0,1
ffffffffc02013ee:	57f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013f2:	8aaa                	mv	s5,a0
ffffffffc02013f4:	3a050c63          	beqz	a0,ffffffffc02017ac <default_check+0x4e2>
ffffffffc02013f8:	4505                	li	a0,1
ffffffffc02013fa:	573000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013fe:	8a2a                	mv	s4,a0
ffffffffc0201400:	38050663          	beqz	a0,ffffffffc020178c <default_check+0x4c2>
ffffffffc0201404:	4505                	li	a0,1
ffffffffc0201406:	567000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020140a:	36051163          	bnez	a0,ffffffffc020176c <default_check+0x4a2>
ffffffffc020140e:	4585                	li	a1,1
ffffffffc0201410:	854e                	mv	a0,s3
ffffffffc0201412:	599000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201416:	641c                	ld	a5,8(s0)
ffffffffc0201418:	20878a63          	beq	a5,s0,ffffffffc020162c <default_check+0x362>
ffffffffc020141c:	4505                	li	a0,1
ffffffffc020141e:	54f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201422:	30a99563          	bne	s3,a0,ffffffffc020172c <default_check+0x462>
ffffffffc0201426:	4505                	li	a0,1
ffffffffc0201428:	545000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020142c:	2e051063          	bnez	a0,ffffffffc020170c <default_check+0x442>
ffffffffc0201430:	481c                	lw	a5,16(s0)
ffffffffc0201432:	2a079d63          	bnez	a5,ffffffffc02016ec <default_check+0x422>
ffffffffc0201436:	854e                	mv	a0,s3
ffffffffc0201438:	4585                	li	a1,1
ffffffffc020143a:	01843023          	sd	s8,0(s0)
ffffffffc020143e:	01743423          	sd	s7,8(s0)
ffffffffc0201442:	01642823          	sw	s6,16(s0)
ffffffffc0201446:	565000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020144a:	4585                	li	a1,1
ffffffffc020144c:	8556                	mv	a0,s5
ffffffffc020144e:	55d000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201452:	4585                	li	a1,1
ffffffffc0201454:	8552                	mv	a0,s4
ffffffffc0201456:	555000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020145a:	4515                	li	a0,5
ffffffffc020145c:	511000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201460:	89aa                	mv	s3,a0
ffffffffc0201462:	26050563          	beqz	a0,ffffffffc02016cc <default_check+0x402>
ffffffffc0201466:	651c                	ld	a5,8(a0)
ffffffffc0201468:	8385                	srli	a5,a5,0x1
ffffffffc020146a:	8b85                	andi	a5,a5,1
ffffffffc020146c:	54079063          	bnez	a5,ffffffffc02019ac <default_check+0x6e2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	00043b03          	ld	s6,0(s0)
ffffffffc0201476:	00843a83          	ld	s5,8(s0)
ffffffffc020147a:	e000                	sd	s0,0(s0)
ffffffffc020147c:	e400                	sd	s0,8(s0)
ffffffffc020147e:	4ef000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201482:	50051563          	bnez	a0,ffffffffc020198c <default_check+0x6c2>
ffffffffc0201486:	08098a13          	addi	s4,s3,128
ffffffffc020148a:	8552                	mv	a0,s4
ffffffffc020148c:	458d                	li	a1,3
ffffffffc020148e:	01042b83          	lw	s7,16(s0)
ffffffffc0201492:	00090797          	auipc	a5,0x90
ffffffffc0201496:	3207a323          	sw	zero,806(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020149a:	511000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020149e:	4511                	li	a0,4
ffffffffc02014a0:	4cd000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014a4:	4c051463          	bnez	a0,ffffffffc020196c <default_check+0x6a2>
ffffffffc02014a8:	0889b783          	ld	a5,136(s3)
ffffffffc02014ac:	8385                	srli	a5,a5,0x1
ffffffffc02014ae:	8b85                	andi	a5,a5,1
ffffffffc02014b0:	48078e63          	beqz	a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014b4:	0909a703          	lw	a4,144(s3)
ffffffffc02014b8:	478d                	li	a5,3
ffffffffc02014ba:	48f71963          	bne	a4,a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014be:	450d                	li	a0,3
ffffffffc02014c0:	4ad000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014c4:	8c2a                	mv	s8,a0
ffffffffc02014c6:	46050363          	beqz	a0,ffffffffc020192c <default_check+0x662>
ffffffffc02014ca:	4505                	li	a0,1
ffffffffc02014cc:	4a1000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014d0:	42051e63          	bnez	a0,ffffffffc020190c <default_check+0x642>
ffffffffc02014d4:	418a1c63          	bne	s4,s8,ffffffffc02018ec <default_check+0x622>
ffffffffc02014d8:	4585                	li	a1,1
ffffffffc02014da:	854e                	mv	a0,s3
ffffffffc02014dc:	4cf000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e0:	458d                	li	a1,3
ffffffffc02014e2:	8552                	mv	a0,s4
ffffffffc02014e4:	4c7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e8:	0089b783          	ld	a5,8(s3)
ffffffffc02014ec:	04098c13          	addi	s8,s3,64
ffffffffc02014f0:	8385                	srli	a5,a5,0x1
ffffffffc02014f2:	8b85                	andi	a5,a5,1
ffffffffc02014f4:	3c078c63          	beqz	a5,ffffffffc02018cc <default_check+0x602>
ffffffffc02014f8:	0109a703          	lw	a4,16(s3)
ffffffffc02014fc:	4785                	li	a5,1
ffffffffc02014fe:	3cf71763          	bne	a4,a5,ffffffffc02018cc <default_check+0x602>
ffffffffc0201502:	008a3783          	ld	a5,8(s4)
ffffffffc0201506:	8385                	srli	a5,a5,0x1
ffffffffc0201508:	8b85                	andi	a5,a5,1
ffffffffc020150a:	3a078163          	beqz	a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc020150e:	010a2703          	lw	a4,16(s4)
ffffffffc0201512:	478d                	li	a5,3
ffffffffc0201514:	38f71c63          	bne	a4,a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc0201518:	4505                	li	a0,1
ffffffffc020151a:	453000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020151e:	36a99763          	bne	s3,a0,ffffffffc020188c <default_check+0x5c2>
ffffffffc0201522:	4585                	li	a1,1
ffffffffc0201524:	487000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201528:	4509                	li	a0,2
ffffffffc020152a:	443000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020152e:	32aa1f63          	bne	s4,a0,ffffffffc020186c <default_check+0x5a2>
ffffffffc0201532:	4589                	li	a1,2
ffffffffc0201534:	477000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201538:	4585                	li	a1,1
ffffffffc020153a:	8562                	mv	a0,s8
ffffffffc020153c:	46f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201540:	4515                	li	a0,5
ffffffffc0201542:	42b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201546:	89aa                	mv	s3,a0
ffffffffc0201548:	48050263          	beqz	a0,ffffffffc02019cc <default_check+0x702>
ffffffffc020154c:	4505                	li	a0,1
ffffffffc020154e:	41f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201552:	2c051d63          	bnez	a0,ffffffffc020182c <default_check+0x562>
ffffffffc0201556:	481c                	lw	a5,16(s0)
ffffffffc0201558:	2a079a63          	bnez	a5,ffffffffc020180c <default_check+0x542>
ffffffffc020155c:	4595                	li	a1,5
ffffffffc020155e:	854e                	mv	a0,s3
ffffffffc0201560:	01742823          	sw	s7,16(s0)
ffffffffc0201564:	01643023          	sd	s6,0(s0)
ffffffffc0201568:	01543423          	sd	s5,8(s0)
ffffffffc020156c:	43f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201570:	641c                	ld	a5,8(s0)
ffffffffc0201572:	00878963          	beq	a5,s0,ffffffffc0201584 <default_check+0x2ba>
ffffffffc0201576:	ff87a703          	lw	a4,-8(a5)
ffffffffc020157a:	679c                	ld	a5,8(a5)
ffffffffc020157c:	397d                	addiw	s2,s2,-1
ffffffffc020157e:	9c99                	subw	s1,s1,a4
ffffffffc0201580:	fe879be3          	bne	a5,s0,ffffffffc0201576 <default_check+0x2ac>
ffffffffc0201584:	26091463          	bnez	s2,ffffffffc02017ec <default_check+0x522>
ffffffffc0201588:	46049263          	bnez	s1,ffffffffc02019ec <default_check+0x722>
ffffffffc020158c:	60a6                	ld	ra,72(sp)
ffffffffc020158e:	6406                	ld	s0,64(sp)
ffffffffc0201590:	74e2                	ld	s1,56(sp)
ffffffffc0201592:	7942                	ld	s2,48(sp)
ffffffffc0201594:	79a2                	ld	s3,40(sp)
ffffffffc0201596:	7a02                	ld	s4,32(sp)
ffffffffc0201598:	6ae2                	ld	s5,24(sp)
ffffffffc020159a:	6b42                	ld	s6,16(sp)
ffffffffc020159c:	6ba2                	ld	s7,8(sp)
ffffffffc020159e:	6c02                	ld	s8,0(sp)
ffffffffc02015a0:	6161                	addi	sp,sp,80
ffffffffc02015a2:	8082                	ret
ffffffffc02015a4:	4981                	li	s3,0
ffffffffc02015a6:	4481                	li	s1,0
ffffffffc02015a8:	4901                	li	s2,0
ffffffffc02015aa:	b38d                	j	ffffffffc020130c <default_check+0x42>
ffffffffc02015ac:	0000b697          	auipc	a3,0xb
ffffffffc02015b0:	b1468693          	addi	a3,a3,-1260 # ffffffffc020c0c0 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	3cc60613          	addi	a2,a2,972 # ffffffffc020b980 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	b1050513          	addi	a0,a0,-1264 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	b9c68693          	addi	a3,a3,-1124 # ffffffffc020c168 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	3ac60613          	addi	a2,a2,940 # ffffffffc020b980 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	af050513          	addi	a0,a0,-1296 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	ba468693          	addi	a3,a3,-1116 # ffffffffc020c190 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	38c60613          	addi	a2,a2,908 # ffffffffc020b980 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	ad050513          	addi	a0,a0,-1328 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	bc468693          	addi	a3,a3,-1084 # ffffffffc020c1d0 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	36c60613          	addi	a2,a2,876 # ffffffffc020b980 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	ab050513          	addi	a0,a0,-1360 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	c2c68693          	addi	a3,a3,-980 # ffffffffc020c258 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	34c60613          	addi	a2,a2,844 # ffffffffc020b980 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	a9050513          	addi	a0,a0,-1392 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	abc68693          	addi	a3,a3,-1348 # ffffffffc020c108 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	32c60613          	addi	a2,a2,812 # ffffffffc020b980 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	a7050513          	addi	a0,a0,-1424 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	bdc68693          	addi	a3,a3,-1060 # ffffffffc020c248 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	30c60613          	addi	a2,a2,780 # ffffffffc020b980 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	a5050513          	addi	a0,a0,-1456 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	ba468693          	addi	a3,a3,-1116 # ffffffffc020c230 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	2ec60613          	addi	a2,a2,748 # ffffffffc020b980 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	a3050513          	addi	a0,a0,-1488 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	b6468693          	addi	a3,a3,-1180 # ffffffffc020c210 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	2cc60613          	addi	a2,a2,716 # ffffffffc020b980 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	a1050513          	addi	a0,a0,-1520 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	bd468693          	addi	a3,a3,-1068 # ffffffffc020c2a0 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	2ac60613          	addi	a2,a2,684 # ffffffffc020b980 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	9f050513          	addi	a0,a0,-1552 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	ba468693          	addi	a3,a3,-1116 # ffffffffc020c290 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	28c60613          	addi	a2,a2,652 # ffffffffc020b980 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	9d050513          	addi	a0,a0,-1584 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	b2468693          	addi	a3,a3,-1244 # ffffffffc020c230 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	26c60613          	addi	a2,a2,620 # ffffffffc020b980 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	9b050513          	addi	a0,a0,-1616 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	b4468693          	addi	a3,a3,-1212 # ffffffffc020c270 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	24c60613          	addi	a2,a2,588 # ffffffffc020b980 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	99050513          	addi	a0,a0,-1648 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020c108 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	22c60613          	addi	a2,a2,556 # ffffffffc020b980 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	97050513          	addi	a0,a0,-1680 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	ac468693          	addi	a3,a3,-1340 # ffffffffc020c230 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	20c60613          	addi	a2,a2,524 # ffffffffc020b980 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000b517          	auipc	a0,0xb
ffffffffc0201784:	95050513          	addi	a0,a0,-1712 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020c148 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	1ec60613          	addi	a2,a2,492 # ffffffffc020b980 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000b517          	auipc	a0,0xb
ffffffffc02017a4:	93050513          	addi	a0,a0,-1744 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	97c68693          	addi	a3,a3,-1668 # ffffffffc020c128 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	1cc60613          	addi	a2,a2,460 # ffffffffc020b980 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000b517          	auipc	a0,0xb
ffffffffc02017c4:	91050513          	addi	a0,a0,-1776 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	97c68693          	addi	a3,a3,-1668 # ffffffffc020c148 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	1ac60613          	addi	a2,a2,428 # ffffffffc020b980 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000b517          	auipc	a0,0xb
ffffffffc02017e4:	8f050513          	addi	a0,a0,-1808 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	c0468693          	addi	a3,a3,-1020 # ffffffffc020c3f0 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	18c60613          	addi	a2,a2,396 # ffffffffc020b980 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000b517          	auipc	a0,0xb
ffffffffc0201804:	8d050513          	addi	a0,a0,-1840 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	a8468693          	addi	a3,a3,-1404 # ffffffffc020c290 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	16c60613          	addi	a2,a2,364 # ffffffffc020b980 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000b517          	auipc	a0,0xb
ffffffffc0201824:	8b050513          	addi	a0,a0,-1872 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	a0468693          	addi	a3,a3,-1532 # ffffffffc020c230 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	14c60613          	addi	a2,a2,332 # ffffffffc020b980 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000b517          	auipc	a0,0xb
ffffffffc0201844:	89050513          	addi	a0,a0,-1904 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	9a468693          	addi	a3,a3,-1628 # ffffffffc020c1f0 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	12c60613          	addi	a2,a2,300 # ffffffffc020b980 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000b517          	auipc	a0,0xb
ffffffffc0201864:	87050513          	addi	a0,a0,-1936 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	b4468693          	addi	a3,a3,-1212 # ffffffffc020c3b0 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	10c60613          	addi	a2,a2,268 # ffffffffc020b980 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000b517          	auipc	a0,0xb
ffffffffc0201884:	85050513          	addi	a0,a0,-1968 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	b0468693          	addi	a3,a3,-1276 # ffffffffc020c390 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	0ec60613          	addi	a2,a2,236 # ffffffffc020b980 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000b517          	auipc	a0,0xb
ffffffffc02018a4:	83050513          	addi	a0,a0,-2000 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	abc68693          	addi	a3,a3,-1348 # ffffffffc020c368 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	0cc60613          	addi	a2,a2,204 # ffffffffc020b980 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000b517          	auipc	a0,0xb
ffffffffc02018c4:	81050513          	addi	a0,a0,-2032 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	a7468693          	addi	a3,a3,-1420 # ffffffffc020c340 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	0ac60613          	addi	a2,a2,172 # ffffffffc020b980 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000a517          	auipc	a0,0xa
ffffffffc02018e4:	7f050513          	addi	a0,a0,2032 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	a4468693          	addi	a3,a3,-1468 # ffffffffc020c330 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	08c60613          	addi	a2,a2,140 # ffffffffc020b980 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000a517          	auipc	a0,0xa
ffffffffc0201904:	7d050513          	addi	a0,a0,2000 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000b697          	auipc	a3,0xb
ffffffffc0201910:	92468693          	addi	a3,a3,-1756 # ffffffffc020c230 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	06c60613          	addi	a2,a2,108 # ffffffffc020b980 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000a517          	auipc	a0,0xa
ffffffffc0201924:	7b050513          	addi	a0,a0,1968 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	9e468693          	addi	a3,a3,-1564 # ffffffffc020c310 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	04c60613          	addi	a2,a2,76 # ffffffffc020b980 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000a517          	auipc	a0,0xa
ffffffffc0201944:	79050513          	addi	a0,a0,1936 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	99468693          	addi	a3,a3,-1644 # ffffffffc020c2e0 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	02c60613          	addi	a2,a2,44 # ffffffffc020b980 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000a517          	auipc	a0,0xa
ffffffffc0201964:	77050513          	addi	a0,a0,1904 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000b697          	auipc	a3,0xb
ffffffffc0201970:	95c68693          	addi	a3,a3,-1700 # ffffffffc020c2c8 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	00c60613          	addi	a2,a2,12 # ffffffffc020b980 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000a517          	auipc	a0,0xa
ffffffffc0201984:	75050513          	addi	a0,a0,1872 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000b697          	auipc	a3,0xb
ffffffffc0201990:	8a468693          	addi	a3,a3,-1884 # ffffffffc020c230 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	fec60613          	addi	a2,a2,-20 # ffffffffc020b980 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000a517          	auipc	a0,0xa
ffffffffc02019a4:	73050513          	addi	a0,a0,1840 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000b697          	auipc	a3,0xb
ffffffffc02019b0:	90468693          	addi	a3,a3,-1788 # ffffffffc020c2b0 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	fcc60613          	addi	a2,a2,-52 # ffffffffc020b980 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000a517          	auipc	a0,0xa
ffffffffc02019c4:	71050513          	addi	a0,a0,1808 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	a0468693          	addi	a3,a3,-1532 # ffffffffc020c3d0 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	fac60613          	addi	a2,a2,-84 # ffffffffc020b980 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000a517          	auipc	a0,0xa
ffffffffc02019e4:	6f050513          	addi	a0,a0,1776 # ffffffffc020c0d0 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	a1468693          	addi	a3,a3,-1516 # ffffffffc020c400 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	f8c60613          	addi	a2,a2,-116 # ffffffffc020b980 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000a517          	auipc	a0,0xa
ffffffffc0201a04:	6d050513          	addi	a0,a0,1744 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000a697          	auipc	a3,0xa
ffffffffc0201a10:	6dc68693          	addi	a3,a3,1756 # ffffffffc020c0e8 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	f6c60613          	addi	a2,a2,-148 # ffffffffc020b980 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000a517          	auipc	a0,0xa
ffffffffc0201a24:	6b050513          	addi	a0,a0,1712 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000a697          	auipc	a3,0xa
ffffffffc0201a30:	6fc68693          	addi	a3,a3,1788 # ffffffffc020c128 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	f4c60613          	addi	a2,a2,-180 # ffffffffc020b980 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000a517          	auipc	a0,0xa
ffffffffc0201a44:	69050513          	addi	a0,a0,1680 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201a48:	a57fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201a4c <default_free_pages>:
ffffffffc0201a4c:	1141                	addi	sp,sp,-16
ffffffffc0201a4e:	e406                	sd	ra,8(sp)
ffffffffc0201a50:	14058463          	beqz	a1,ffffffffc0201b98 <default_free_pages+0x14c>
ffffffffc0201a54:	00659693          	slli	a3,a1,0x6
ffffffffc0201a58:	96aa                	add	a3,a3,a0
ffffffffc0201a5a:	87aa                	mv	a5,a0
ffffffffc0201a5c:	02d50263          	beq	a0,a3,ffffffffc0201a80 <default_free_pages+0x34>
ffffffffc0201a60:	6798                	ld	a4,8(a5)
ffffffffc0201a62:	8b05                	andi	a4,a4,1
ffffffffc0201a64:	10071a63          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a68:	6798                	ld	a4,8(a5)
ffffffffc0201a6a:	8b09                	andi	a4,a4,2
ffffffffc0201a6c:	10071663          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a70:	0007b423          	sd	zero,8(a5)
ffffffffc0201a74:	0007a023          	sw	zero,0(a5)
ffffffffc0201a78:	04078793          	addi	a5,a5,64
ffffffffc0201a7c:	fed792e3          	bne	a5,a3,ffffffffc0201a60 <default_free_pages+0x14>
ffffffffc0201a80:	2581                	sext.w	a1,a1
ffffffffc0201a82:	c90c                	sw	a1,16(a0)
ffffffffc0201a84:	00850893          	addi	a7,a0,8
ffffffffc0201a88:	4789                	li	a5,2
ffffffffc0201a8a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a8e:	00090697          	auipc	a3,0x90
ffffffffc0201a92:	d1a68693          	addi	a3,a3,-742 # ffffffffc02917a8 <free_area>
ffffffffc0201a96:	4a98                	lw	a4,16(a3)
ffffffffc0201a98:	669c                	ld	a5,8(a3)
ffffffffc0201a9a:	01850613          	addi	a2,a0,24
ffffffffc0201a9e:	9db9                	addw	a1,a1,a4
ffffffffc0201aa0:	ca8c                	sw	a1,16(a3)
ffffffffc0201aa2:	0ad78463          	beq	a5,a3,ffffffffc0201b4a <default_free_pages+0xfe>
ffffffffc0201aa6:	fe878713          	addi	a4,a5,-24
ffffffffc0201aaa:	0006b803          	ld	a6,0(a3)
ffffffffc0201aae:	4581                	li	a1,0
ffffffffc0201ab0:	00e56a63          	bltu	a0,a4,ffffffffc0201ac4 <default_free_pages+0x78>
ffffffffc0201ab4:	6798                	ld	a4,8(a5)
ffffffffc0201ab6:	04d70c63          	beq	a4,a3,ffffffffc0201b0e <default_free_pages+0xc2>
ffffffffc0201aba:	87ba                	mv	a5,a4
ffffffffc0201abc:	fe878713          	addi	a4,a5,-24
ffffffffc0201ac0:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ab4 <default_free_pages+0x68>
ffffffffc0201ac4:	c199                	beqz	a1,ffffffffc0201aca <default_free_pages+0x7e>
ffffffffc0201ac6:	0106b023          	sd	a6,0(a3)
ffffffffc0201aca:	6398                	ld	a4,0(a5)
ffffffffc0201acc:	e390                	sd	a2,0(a5)
ffffffffc0201ace:	e710                	sd	a2,8(a4)
ffffffffc0201ad0:	f11c                	sd	a5,32(a0)
ffffffffc0201ad2:	ed18                	sd	a4,24(a0)
ffffffffc0201ad4:	00d70d63          	beq	a4,a3,ffffffffc0201aee <default_free_pages+0xa2>
ffffffffc0201ad8:	ff872583          	lw	a1,-8(a4)
ffffffffc0201adc:	fe870613          	addi	a2,a4,-24
ffffffffc0201ae0:	02059813          	slli	a6,a1,0x20
ffffffffc0201ae4:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201ae8:	97b2                	add	a5,a5,a2
ffffffffc0201aea:	02f50c63          	beq	a0,a5,ffffffffc0201b22 <default_free_pages+0xd6>
ffffffffc0201aee:	711c                	ld	a5,32(a0)
ffffffffc0201af0:	00d78c63          	beq	a5,a3,ffffffffc0201b08 <default_free_pages+0xbc>
ffffffffc0201af4:	4910                	lw	a2,16(a0)
ffffffffc0201af6:	fe878693          	addi	a3,a5,-24
ffffffffc0201afa:	02061593          	slli	a1,a2,0x20
ffffffffc0201afe:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b02:	972a                	add	a4,a4,a0
ffffffffc0201b04:	04e68a63          	beq	a3,a4,ffffffffc0201b58 <default_free_pages+0x10c>
ffffffffc0201b08:	60a2                	ld	ra,8(sp)
ffffffffc0201b0a:	0141                	addi	sp,sp,16
ffffffffc0201b0c:	8082                	ret
ffffffffc0201b0e:	e790                	sd	a2,8(a5)
ffffffffc0201b10:	f114                	sd	a3,32(a0)
ffffffffc0201b12:	6798                	ld	a4,8(a5)
ffffffffc0201b14:	ed1c                	sd	a5,24(a0)
ffffffffc0201b16:	02d70763          	beq	a4,a3,ffffffffc0201b44 <default_free_pages+0xf8>
ffffffffc0201b1a:	8832                	mv	a6,a2
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	87ba                	mv	a5,a4
ffffffffc0201b20:	bf71                	j	ffffffffc0201abc <default_free_pages+0x70>
ffffffffc0201b22:	491c                	lw	a5,16(a0)
ffffffffc0201b24:	9dbd                	addw	a1,a1,a5
ffffffffc0201b26:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201b2a:	57f5                	li	a5,-3
ffffffffc0201b2c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201b30:	01853803          	ld	a6,24(a0)
ffffffffc0201b34:	710c                	ld	a1,32(a0)
ffffffffc0201b36:	8532                	mv	a0,a2
ffffffffc0201b38:	00b83423          	sd	a1,8(a6)
ffffffffc0201b3c:	671c                	ld	a5,8(a4)
ffffffffc0201b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0201b42:	b77d                	j	ffffffffc0201af0 <default_free_pages+0xa4>
ffffffffc0201b44:	e290                	sd	a2,0(a3)
ffffffffc0201b46:	873e                	mv	a4,a5
ffffffffc0201b48:	bf41                	j	ffffffffc0201ad8 <default_free_pages+0x8c>
ffffffffc0201b4a:	60a2                	ld	ra,8(sp)
ffffffffc0201b4c:	e390                	sd	a2,0(a5)
ffffffffc0201b4e:	e790                	sd	a2,8(a5)
ffffffffc0201b50:	f11c                	sd	a5,32(a0)
ffffffffc0201b52:	ed1c                	sd	a5,24(a0)
ffffffffc0201b54:	0141                	addi	sp,sp,16
ffffffffc0201b56:	8082                	ret
ffffffffc0201b58:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b5c:	ff078693          	addi	a3,a5,-16
ffffffffc0201b60:	9e39                	addw	a2,a2,a4
ffffffffc0201b62:	c910                	sw	a2,16(a0)
ffffffffc0201b64:	5775                	li	a4,-3
ffffffffc0201b66:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201b6a:	6398                	ld	a4,0(a5)
ffffffffc0201b6c:	679c                	ld	a5,8(a5)
ffffffffc0201b6e:	60a2                	ld	ra,8(sp)
ffffffffc0201b70:	e71c                	sd	a5,8(a4)
ffffffffc0201b72:	e398                	sd	a4,0(a5)
ffffffffc0201b74:	0141                	addi	sp,sp,16
ffffffffc0201b76:	8082                	ret
ffffffffc0201b78:	0000b697          	auipc	a3,0xb
ffffffffc0201b7c:	8a068693          	addi	a3,a3,-1888 # ffffffffc020c418 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	e0060613          	addi	a2,a2,-512 # ffffffffc020b980 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000a517          	auipc	a0,0xa
ffffffffc0201b90:	54450513          	addi	a0,a0,1348 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000b697          	auipc	a3,0xb
ffffffffc0201b9c:	87868693          	addi	a3,a3,-1928 # ffffffffc020c410 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	de060613          	addi	a2,a2,-544 # ffffffffc020b980 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000a517          	auipc	a0,0xa
ffffffffc0201bb0:	52450513          	addi	a0,a0,1316 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201bb4:	8ebfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201bb8 <default_alloc_pages>:
ffffffffc0201bb8:	c941                	beqz	a0,ffffffffc0201c48 <default_alloc_pages+0x90>
ffffffffc0201bba:	00090597          	auipc	a1,0x90
ffffffffc0201bbe:	bee58593          	addi	a1,a1,-1042 # ffffffffc02917a8 <free_area>
ffffffffc0201bc2:	0105a803          	lw	a6,16(a1)
ffffffffc0201bc6:	872a                	mv	a4,a0
ffffffffc0201bc8:	02081793          	slli	a5,a6,0x20
ffffffffc0201bcc:	9381                	srli	a5,a5,0x20
ffffffffc0201bce:	00a7ee63          	bltu	a5,a0,ffffffffc0201bea <default_alloc_pages+0x32>
ffffffffc0201bd2:	87ae                	mv	a5,a1
ffffffffc0201bd4:	a801                	j	ffffffffc0201be4 <default_alloc_pages+0x2c>
ffffffffc0201bd6:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201bda:	02069613          	slli	a2,a3,0x20
ffffffffc0201bde:	9201                	srli	a2,a2,0x20
ffffffffc0201be0:	00e67763          	bgeu	a2,a4,ffffffffc0201bee <default_alloc_pages+0x36>
ffffffffc0201be4:	679c                	ld	a5,8(a5)
ffffffffc0201be6:	feb798e3          	bne	a5,a1,ffffffffc0201bd6 <default_alloc_pages+0x1e>
ffffffffc0201bea:	4501                	li	a0,0
ffffffffc0201bec:	8082                	ret
ffffffffc0201bee:	0007b883          	ld	a7,0(a5)
ffffffffc0201bf2:	0087b303          	ld	t1,8(a5)
ffffffffc0201bf6:	fe878513          	addi	a0,a5,-24
ffffffffc0201bfa:	00070e1b          	sext.w	t3,a4
ffffffffc0201bfe:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c02:	01133023          	sd	a7,0(t1)
ffffffffc0201c06:	02c77863          	bgeu	a4,a2,ffffffffc0201c36 <default_alloc_pages+0x7e>
ffffffffc0201c0a:	071a                	slli	a4,a4,0x6
ffffffffc0201c0c:	972a                	add	a4,a4,a0
ffffffffc0201c0e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c12:	cb14                	sw	a3,16(a4)
ffffffffc0201c14:	00870613          	addi	a2,a4,8
ffffffffc0201c18:	4689                	li	a3,2
ffffffffc0201c1a:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201c1e:	0088b683          	ld	a3,8(a7)
ffffffffc0201c22:	01870613          	addi	a2,a4,24
ffffffffc0201c26:	0105a803          	lw	a6,16(a1)
ffffffffc0201c2a:	e290                	sd	a2,0(a3)
ffffffffc0201c2c:	00c8b423          	sd	a2,8(a7)
ffffffffc0201c30:	f314                	sd	a3,32(a4)
ffffffffc0201c32:	01173c23          	sd	a7,24(a4)
ffffffffc0201c36:	41c8083b          	subw	a6,a6,t3
ffffffffc0201c3a:	0105a823          	sw	a6,16(a1)
ffffffffc0201c3e:	5775                	li	a4,-3
ffffffffc0201c40:	17c1                	addi	a5,a5,-16
ffffffffc0201c42:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	0000a697          	auipc	a3,0xa
ffffffffc0201c4e:	7c668693          	addi	a3,a3,1990 # ffffffffc020c410 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	d2e60613          	addi	a2,a2,-722 # ffffffffc020b980 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	47250513          	addi	a0,a0,1138 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201c66:	e406                	sd	ra,8(sp)
ffffffffc0201c68:	837fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c6c <default_init_memmap>:
ffffffffc0201c6c:	1141                	addi	sp,sp,-16
ffffffffc0201c6e:	e406                	sd	ra,8(sp)
ffffffffc0201c70:	c5f1                	beqz	a1,ffffffffc0201d3c <default_init_memmap+0xd0>
ffffffffc0201c72:	00659693          	slli	a3,a1,0x6
ffffffffc0201c76:	96aa                	add	a3,a3,a0
ffffffffc0201c78:	87aa                	mv	a5,a0
ffffffffc0201c7a:	00d50f63          	beq	a0,a3,ffffffffc0201c98 <default_init_memmap+0x2c>
ffffffffc0201c7e:	6798                	ld	a4,8(a5)
ffffffffc0201c80:	8b05                	andi	a4,a4,1
ffffffffc0201c82:	cf49                	beqz	a4,ffffffffc0201d1c <default_init_memmap+0xb0>
ffffffffc0201c84:	0007a823          	sw	zero,16(a5)
ffffffffc0201c88:	0007b423          	sd	zero,8(a5)
ffffffffc0201c8c:	0007a023          	sw	zero,0(a5)
ffffffffc0201c90:	04078793          	addi	a5,a5,64
ffffffffc0201c94:	fed795e3          	bne	a5,a3,ffffffffc0201c7e <default_init_memmap+0x12>
ffffffffc0201c98:	2581                	sext.w	a1,a1
ffffffffc0201c9a:	c90c                	sw	a1,16(a0)
ffffffffc0201c9c:	4789                	li	a5,2
ffffffffc0201c9e:	00850713          	addi	a4,a0,8
ffffffffc0201ca2:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201ca6:	00090697          	auipc	a3,0x90
ffffffffc0201caa:	b0268693          	addi	a3,a3,-1278 # ffffffffc02917a8 <free_area>
ffffffffc0201cae:	4a98                	lw	a4,16(a3)
ffffffffc0201cb0:	669c                	ld	a5,8(a3)
ffffffffc0201cb2:	01850613          	addi	a2,a0,24
ffffffffc0201cb6:	9db9                	addw	a1,a1,a4
ffffffffc0201cb8:	ca8c                	sw	a1,16(a3)
ffffffffc0201cba:	04d78a63          	beq	a5,a3,ffffffffc0201d0e <default_init_memmap+0xa2>
ffffffffc0201cbe:	fe878713          	addi	a4,a5,-24
ffffffffc0201cc2:	0006b803          	ld	a6,0(a3)
ffffffffc0201cc6:	4581                	li	a1,0
ffffffffc0201cc8:	00e56a63          	bltu	a0,a4,ffffffffc0201cdc <default_init_memmap+0x70>
ffffffffc0201ccc:	6798                	ld	a4,8(a5)
ffffffffc0201cce:	02d70263          	beq	a4,a3,ffffffffc0201cf2 <default_init_memmap+0x86>
ffffffffc0201cd2:	87ba                	mv	a5,a4
ffffffffc0201cd4:	fe878713          	addi	a4,a5,-24
ffffffffc0201cd8:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ccc <default_init_memmap+0x60>
ffffffffc0201cdc:	c199                	beqz	a1,ffffffffc0201ce2 <default_init_memmap+0x76>
ffffffffc0201cde:	0106b023          	sd	a6,0(a3)
ffffffffc0201ce2:	6398                	ld	a4,0(a5)
ffffffffc0201ce4:	60a2                	ld	ra,8(sp)
ffffffffc0201ce6:	e390                	sd	a2,0(a5)
ffffffffc0201ce8:	e710                	sd	a2,8(a4)
ffffffffc0201cea:	f11c                	sd	a5,32(a0)
ffffffffc0201cec:	ed18                	sd	a4,24(a0)
ffffffffc0201cee:	0141                	addi	sp,sp,16
ffffffffc0201cf0:	8082                	ret
ffffffffc0201cf2:	e790                	sd	a2,8(a5)
ffffffffc0201cf4:	f114                	sd	a3,32(a0)
ffffffffc0201cf6:	6798                	ld	a4,8(a5)
ffffffffc0201cf8:	ed1c                	sd	a5,24(a0)
ffffffffc0201cfa:	00d70663          	beq	a4,a3,ffffffffc0201d06 <default_init_memmap+0x9a>
ffffffffc0201cfe:	8832                	mv	a6,a2
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	87ba                	mv	a5,a4
ffffffffc0201d04:	bfc1                	j	ffffffffc0201cd4 <default_init_memmap+0x68>
ffffffffc0201d06:	60a2                	ld	ra,8(sp)
ffffffffc0201d08:	e290                	sd	a2,0(a3)
ffffffffc0201d0a:	0141                	addi	sp,sp,16
ffffffffc0201d0c:	8082                	ret
ffffffffc0201d0e:	60a2                	ld	ra,8(sp)
ffffffffc0201d10:	e390                	sd	a2,0(a5)
ffffffffc0201d12:	e790                	sd	a2,8(a5)
ffffffffc0201d14:	f11c                	sd	a5,32(a0)
ffffffffc0201d16:	ed1c                	sd	a5,24(a0)
ffffffffc0201d18:	0141                	addi	sp,sp,16
ffffffffc0201d1a:	8082                	ret
ffffffffc0201d1c:	0000a697          	auipc	a3,0xa
ffffffffc0201d20:	72468693          	addi	a3,a3,1828 # ffffffffc020c440 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	c5c60613          	addi	a2,a2,-932 # ffffffffc020b980 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	3a050513          	addi	a0,a0,928 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000a697          	auipc	a3,0xa
ffffffffc0201d40:	6d468693          	addi	a3,a3,1748 # ffffffffc020c410 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	c3c60613          	addi	a2,a2,-964 # ffffffffc020b980 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	38050513          	addi	a0,a0,896 # ffffffffc020c0d0 <commands+0x960>
ffffffffc0201d58:	f46fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201d5c <slob_free>:
ffffffffc0201d5c:	c94d                	beqz	a0,ffffffffc0201e0e <slob_free+0xb2>
ffffffffc0201d5e:	1141                	addi	sp,sp,-16
ffffffffc0201d60:	e022                	sd	s0,0(sp)
ffffffffc0201d62:	e406                	sd	ra,8(sp)
ffffffffc0201d64:	842a                	mv	s0,a0
ffffffffc0201d66:	e9c1                	bnez	a1,ffffffffc0201df6 <slob_free+0x9a>
ffffffffc0201d68:	100027f3          	csrr	a5,sstatus
ffffffffc0201d6c:	8b89                	andi	a5,a5,2
ffffffffc0201d6e:	4501                	li	a0,0
ffffffffc0201d70:	ebd9                	bnez	a5,ffffffffc0201e06 <slob_free+0xaa>
ffffffffc0201d72:	0008f617          	auipc	a2,0x8f
ffffffffc0201d76:	2de60613          	addi	a2,a2,734 # ffffffffc0291050 <slobfree>
ffffffffc0201d7a:	621c                	ld	a5,0(a2)
ffffffffc0201d7c:	873e                	mv	a4,a5
ffffffffc0201d7e:	679c                	ld	a5,8(a5)
ffffffffc0201d80:	02877a63          	bgeu	a4,s0,ffffffffc0201db4 <slob_free+0x58>
ffffffffc0201d84:	00f46463          	bltu	s0,a5,ffffffffc0201d8c <slob_free+0x30>
ffffffffc0201d88:	fef76ae3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201d8c:	400c                	lw	a1,0(s0)
ffffffffc0201d8e:	00459693          	slli	a3,a1,0x4
ffffffffc0201d92:	96a2                	add	a3,a3,s0
ffffffffc0201d94:	02d78a63          	beq	a5,a3,ffffffffc0201dc8 <slob_free+0x6c>
ffffffffc0201d98:	4314                	lw	a3,0(a4)
ffffffffc0201d9a:	e41c                	sd	a5,8(s0)
ffffffffc0201d9c:	00469793          	slli	a5,a3,0x4
ffffffffc0201da0:	97ba                	add	a5,a5,a4
ffffffffc0201da2:	02f40e63          	beq	s0,a5,ffffffffc0201dde <slob_free+0x82>
ffffffffc0201da6:	e700                	sd	s0,8(a4)
ffffffffc0201da8:	e218                	sd	a4,0(a2)
ffffffffc0201daa:	e129                	bnez	a0,ffffffffc0201dec <slob_free+0x90>
ffffffffc0201dac:	60a2                	ld	ra,8(sp)
ffffffffc0201dae:	6402                	ld	s0,0(sp)
ffffffffc0201db0:	0141                	addi	sp,sp,16
ffffffffc0201db2:	8082                	ret
ffffffffc0201db4:	fcf764e3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201db8:	fcf472e3          	bgeu	s0,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201dbc:	400c                	lw	a1,0(s0)
ffffffffc0201dbe:	00459693          	slli	a3,a1,0x4
ffffffffc0201dc2:	96a2                	add	a3,a3,s0
ffffffffc0201dc4:	fcd79ae3          	bne	a5,a3,ffffffffc0201d98 <slob_free+0x3c>
ffffffffc0201dc8:	4394                	lw	a3,0(a5)
ffffffffc0201dca:	679c                	ld	a5,8(a5)
ffffffffc0201dcc:	9db5                	addw	a1,a1,a3
ffffffffc0201dce:	c00c                	sw	a1,0(s0)
ffffffffc0201dd0:	4314                	lw	a3,0(a4)
ffffffffc0201dd2:	e41c                	sd	a5,8(s0)
ffffffffc0201dd4:	00469793          	slli	a5,a3,0x4
ffffffffc0201dd8:	97ba                	add	a5,a5,a4
ffffffffc0201dda:	fcf416e3          	bne	s0,a5,ffffffffc0201da6 <slob_free+0x4a>
ffffffffc0201dde:	401c                	lw	a5,0(s0)
ffffffffc0201de0:	640c                	ld	a1,8(s0)
ffffffffc0201de2:	e218                	sd	a4,0(a2)
ffffffffc0201de4:	9ebd                	addw	a3,a3,a5
ffffffffc0201de6:	c314                	sw	a3,0(a4)
ffffffffc0201de8:	e70c                	sd	a1,8(a4)
ffffffffc0201dea:	d169                	beqz	a0,ffffffffc0201dac <slob_free+0x50>
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	60a2                	ld	ra,8(sp)
ffffffffc0201df0:	0141                	addi	sp,sp,16
ffffffffc0201df2:	e7bfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201df6:	25bd                	addiw	a1,a1,15
ffffffffc0201df8:	8191                	srli	a1,a1,0x4
ffffffffc0201dfa:	c10c                	sw	a1,0(a0)
ffffffffc0201dfc:	100027f3          	csrr	a5,sstatus
ffffffffc0201e00:	8b89                	andi	a5,a5,2
ffffffffc0201e02:	4501                	li	a0,0
ffffffffc0201e04:	d7bd                	beqz	a5,ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e06:	e6dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e0a:	4505                	li	a0,1
ffffffffc0201e0c:	b79d                	j	ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e0e:	8082                	ret

ffffffffc0201e10 <__slob_get_free_pages.constprop.0>:
ffffffffc0201e10:	4785                	li	a5,1
ffffffffc0201e12:	1141                	addi	sp,sp,-16
ffffffffc0201e14:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e18:	e406                	sd	ra,8(sp)
ffffffffc0201e1a:	352000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201e1e:	c91d                	beqz	a0,ffffffffc0201e54 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e20:	00095697          	auipc	a3,0x95
ffffffffc0201e24:	a886b683          	ld	a3,-1400(a3) # ffffffffc02968a8 <pages>
ffffffffc0201e28:	8d15                	sub	a0,a0,a3
ffffffffc0201e2a:	8519                	srai	a0,a0,0x6
ffffffffc0201e2c:	0000e697          	auipc	a3,0xe
ffffffffc0201e30:	9846b683          	ld	a3,-1660(a3) # ffffffffc020f7b0 <nbase>
ffffffffc0201e34:	9536                	add	a0,a0,a3
ffffffffc0201e36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e3a:	83b1                	srli	a5,a5,0xc
ffffffffc0201e3c:	00095717          	auipc	a4,0x95
ffffffffc0201e40:	a6473703          	ld	a4,-1436(a4) # ffffffffc02968a0 <npage>
ffffffffc0201e44:	0532                	slli	a0,a0,0xc
ffffffffc0201e46:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e5a <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e4a:	00095697          	auipc	a3,0x95
ffffffffc0201e4e:	a6e6b683          	ld	a3,-1426(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201e52:	9536                	add	a0,a0,a3
ffffffffc0201e54:	60a2                	ld	ra,8(sp)
ffffffffc0201e56:	0141                	addi	sp,sp,16
ffffffffc0201e58:	8082                	ret
ffffffffc0201e5a:	86aa                	mv	a3,a0
ffffffffc0201e5c:	0000a617          	auipc	a2,0xa
ffffffffc0201e60:	64460613          	addi	a2,a2,1604 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000a517          	auipc	a0,0xa
ffffffffc0201e6c:	66050513          	addi	a0,a0,1632 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0201e70:	e2efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201e74 <slob_alloc.constprop.0>:
ffffffffc0201e74:	1101                	addi	sp,sp,-32
ffffffffc0201e76:	ec06                	sd	ra,24(sp)
ffffffffc0201e78:	e822                	sd	s0,16(sp)
ffffffffc0201e7a:	e426                	sd	s1,8(sp)
ffffffffc0201e7c:	e04a                	sd	s2,0(sp)
ffffffffc0201e7e:	01050713          	addi	a4,a0,16
ffffffffc0201e82:	6785                	lui	a5,0x1
ffffffffc0201e84:	0cf77363          	bgeu	a4,a5,ffffffffc0201f4a <slob_alloc.constprop.0+0xd6>
ffffffffc0201e88:	00f50493          	addi	s1,a0,15
ffffffffc0201e8c:	8091                	srli	s1,s1,0x4
ffffffffc0201e8e:	2481                	sext.w	s1,s1
ffffffffc0201e90:	10002673          	csrr	a2,sstatus
ffffffffc0201e94:	8a09                	andi	a2,a2,2
ffffffffc0201e96:	e25d                	bnez	a2,ffffffffc0201f3c <slob_alloc.constprop.0+0xc8>
ffffffffc0201e98:	0008f917          	auipc	s2,0x8f
ffffffffc0201e9c:	1b890913          	addi	s2,s2,440 # ffffffffc0291050 <slobfree>
ffffffffc0201ea0:	00093683          	ld	a3,0(s2)
ffffffffc0201ea4:	669c                	ld	a5,8(a3)
ffffffffc0201ea6:	4398                	lw	a4,0(a5)
ffffffffc0201ea8:	08975e63          	bge	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0xd0>
ffffffffc0201eac:	00f68b63          	beq	a3,a5,ffffffffc0201ec2 <slob_alloc.constprop.0+0x4e>
ffffffffc0201eb0:	6780                	ld	s0,8(a5)
ffffffffc0201eb2:	4018                	lw	a4,0(s0)
ffffffffc0201eb4:	02975a63          	bge	a4,s1,ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201eb8:	00093683          	ld	a3,0(s2)
ffffffffc0201ebc:	87a2                	mv	a5,s0
ffffffffc0201ebe:	fef699e3          	bne	a3,a5,ffffffffc0201eb0 <slob_alloc.constprop.0+0x3c>
ffffffffc0201ec2:	ee31                	bnez	a2,ffffffffc0201f1e <slob_alloc.constprop.0+0xaa>
ffffffffc0201ec4:	4501                	li	a0,0
ffffffffc0201ec6:	f4bff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201eca:	842a                	mv	s0,a0
ffffffffc0201ecc:	cd05                	beqz	a0,ffffffffc0201f04 <slob_alloc.constprop.0+0x90>
ffffffffc0201ece:	6585                	lui	a1,0x1
ffffffffc0201ed0:	e8dff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc0201ed4:	10002673          	csrr	a2,sstatus
ffffffffc0201ed8:	8a09                	andi	a2,a2,2
ffffffffc0201eda:	ee05                	bnez	a2,ffffffffc0201f12 <slob_alloc.constprop.0+0x9e>
ffffffffc0201edc:	00093783          	ld	a5,0(s2)
ffffffffc0201ee0:	6780                	ld	s0,8(a5)
ffffffffc0201ee2:	4018                	lw	a4,0(s0)
ffffffffc0201ee4:	fc974ae3          	blt	a4,s1,ffffffffc0201eb8 <slob_alloc.constprop.0+0x44>
ffffffffc0201ee8:	04e48763          	beq	s1,a4,ffffffffc0201f36 <slob_alloc.constprop.0+0xc2>
ffffffffc0201eec:	00449693          	slli	a3,s1,0x4
ffffffffc0201ef0:	96a2                	add	a3,a3,s0
ffffffffc0201ef2:	e794                	sd	a3,8(a5)
ffffffffc0201ef4:	640c                	ld	a1,8(s0)
ffffffffc0201ef6:	9f05                	subw	a4,a4,s1
ffffffffc0201ef8:	c298                	sw	a4,0(a3)
ffffffffc0201efa:	e68c                	sd	a1,8(a3)
ffffffffc0201efc:	c004                	sw	s1,0(s0)
ffffffffc0201efe:	00f93023          	sd	a5,0(s2)
ffffffffc0201f02:	e20d                	bnez	a2,ffffffffc0201f24 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f04:	60e2                	ld	ra,24(sp)
ffffffffc0201f06:	8522                	mv	a0,s0
ffffffffc0201f08:	6442                	ld	s0,16(sp)
ffffffffc0201f0a:	64a2                	ld	s1,8(sp)
ffffffffc0201f0c:	6902                	ld	s2,0(sp)
ffffffffc0201f0e:	6105                	addi	sp,sp,32
ffffffffc0201f10:	8082                	ret
ffffffffc0201f12:	d61fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f16:	00093783          	ld	a5,0(s2)
ffffffffc0201f1a:	4605                	li	a2,1
ffffffffc0201f1c:	b7d1                	j	ffffffffc0201ee0 <slob_alloc.constprop.0+0x6c>
ffffffffc0201f1e:	d4ffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f22:	b74d                	j	ffffffffc0201ec4 <slob_alloc.constprop.0+0x50>
ffffffffc0201f24:	d49fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f28:	60e2                	ld	ra,24(sp)
ffffffffc0201f2a:	8522                	mv	a0,s0
ffffffffc0201f2c:	6442                	ld	s0,16(sp)
ffffffffc0201f2e:	64a2                	ld	s1,8(sp)
ffffffffc0201f30:	6902                	ld	s2,0(sp)
ffffffffc0201f32:	6105                	addi	sp,sp,32
ffffffffc0201f34:	8082                	ret
ffffffffc0201f36:	6418                	ld	a4,8(s0)
ffffffffc0201f38:	e798                	sd	a4,8(a5)
ffffffffc0201f3a:	b7d1                	j	ffffffffc0201efe <slob_alloc.constprop.0+0x8a>
ffffffffc0201f3c:	d37fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f40:	4605                	li	a2,1
ffffffffc0201f42:	bf99                	j	ffffffffc0201e98 <slob_alloc.constprop.0+0x24>
ffffffffc0201f44:	843e                	mv	s0,a5
ffffffffc0201f46:	87b6                	mv	a5,a3
ffffffffc0201f48:	b745                	j	ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201f4a:	0000a697          	auipc	a3,0xa
ffffffffc0201f4e:	58e68693          	addi	a3,a3,1422 # ffffffffc020c4d8 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	a2e60613          	addi	a2,a2,-1490 # ffffffffc020b980 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000a517          	auipc	a0,0xa
ffffffffc0201f62:	59a50513          	addi	a0,a0,1434 # ffffffffc020c4f8 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000a517          	auipc	a0,0xa
ffffffffc0201f70:	5a450513          	addi	a0,a0,1444 # ffffffffc020c510 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000a517          	auipc	a0,0xa
ffffffffc0201f80:	5ac50513          	addi	a0,a0,1452 # ffffffffc020c528 <default_pmm_manager+0xc0>
ffffffffc0201f84:	0141                	addi	sp,sp,16
ffffffffc0201f86:	a20fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201f8a <kallocated>:
ffffffffc0201f8a:	4501                	li	a0,0
ffffffffc0201f8c:	8082                	ret

ffffffffc0201f8e <kmalloc>:
ffffffffc0201f8e:	1101                	addi	sp,sp,-32
ffffffffc0201f90:	e04a                	sd	s2,0(sp)
ffffffffc0201f92:	6905                	lui	s2,0x1
ffffffffc0201f94:	e822                	sd	s0,16(sp)
ffffffffc0201f96:	ec06                	sd	ra,24(sp)
ffffffffc0201f98:	e426                	sd	s1,8(sp)
ffffffffc0201f9a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201f9e:	842a                	mv	s0,a0
ffffffffc0201fa0:	04a7f963          	bgeu	a5,a0,ffffffffc0201ff2 <kmalloc+0x64>
ffffffffc0201fa4:	4561                	li	a0,24
ffffffffc0201fa6:	ecfff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201faa:	84aa                	mv	s1,a0
ffffffffc0201fac:	c929                	beqz	a0,ffffffffc0201ffe <kmalloc+0x70>
ffffffffc0201fae:	0004079b          	sext.w	a5,s0
ffffffffc0201fb2:	4501                	li	a0,0
ffffffffc0201fb4:	00f95763          	bge	s2,a5,ffffffffc0201fc2 <kmalloc+0x34>
ffffffffc0201fb8:	6705                	lui	a4,0x1
ffffffffc0201fba:	8785                	srai	a5,a5,0x1
ffffffffc0201fbc:	2505                	addiw	a0,a0,1
ffffffffc0201fbe:	fef74ee3          	blt	a4,a5,ffffffffc0201fba <kmalloc+0x2c>
ffffffffc0201fc2:	c088                	sw	a0,0(s1)
ffffffffc0201fc4:	e4dff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201fc8:	e488                	sd	a0,8(s1)
ffffffffc0201fca:	842a                	mv	s0,a0
ffffffffc0201fcc:	c525                	beqz	a0,ffffffffc0202034 <kmalloc+0xa6>
ffffffffc0201fce:	100027f3          	csrr	a5,sstatus
ffffffffc0201fd2:	8b89                	andi	a5,a5,2
ffffffffc0201fd4:	ef8d                	bnez	a5,ffffffffc020200e <kmalloc+0x80>
ffffffffc0201fd6:	00095797          	auipc	a5,0x95
ffffffffc0201fda:	8b278793          	addi	a5,a5,-1870 # ffffffffc0296888 <bigblocks>
ffffffffc0201fde:	6398                	ld	a4,0(a5)
ffffffffc0201fe0:	e384                	sd	s1,0(a5)
ffffffffc0201fe2:	e898                	sd	a4,16(s1)
ffffffffc0201fe4:	60e2                	ld	ra,24(sp)
ffffffffc0201fe6:	8522                	mv	a0,s0
ffffffffc0201fe8:	6442                	ld	s0,16(sp)
ffffffffc0201fea:	64a2                	ld	s1,8(sp)
ffffffffc0201fec:	6902                	ld	s2,0(sp)
ffffffffc0201fee:	6105                	addi	sp,sp,32
ffffffffc0201ff0:	8082                	ret
ffffffffc0201ff2:	0541                	addi	a0,a0,16
ffffffffc0201ff4:	e81ff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201ff8:	01050413          	addi	s0,a0,16
ffffffffc0201ffc:	f565                	bnez	a0,ffffffffc0201fe4 <kmalloc+0x56>
ffffffffc0201ffe:	4401                	li	s0,0
ffffffffc0202000:	60e2                	ld	ra,24(sp)
ffffffffc0202002:	8522                	mv	a0,s0
ffffffffc0202004:	6442                	ld	s0,16(sp)
ffffffffc0202006:	64a2                	ld	s1,8(sp)
ffffffffc0202008:	6902                	ld	s2,0(sp)
ffffffffc020200a:	6105                	addi	sp,sp,32
ffffffffc020200c:	8082                	ret
ffffffffc020200e:	c65fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202012:	00095797          	auipc	a5,0x95
ffffffffc0202016:	87678793          	addi	a5,a5,-1930 # ffffffffc0296888 <bigblocks>
ffffffffc020201a:	6398                	ld	a4,0(a5)
ffffffffc020201c:	e384                	sd	s1,0(a5)
ffffffffc020201e:	e898                	sd	a4,16(s1)
ffffffffc0202020:	c4dfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202024:	6480                	ld	s0,8(s1)
ffffffffc0202026:	60e2                	ld	ra,24(sp)
ffffffffc0202028:	64a2                	ld	s1,8(sp)
ffffffffc020202a:	8522                	mv	a0,s0
ffffffffc020202c:	6442                	ld	s0,16(sp)
ffffffffc020202e:	6902                	ld	s2,0(sp)
ffffffffc0202030:	6105                	addi	sp,sp,32
ffffffffc0202032:	8082                	ret
ffffffffc0202034:	45e1                	li	a1,24
ffffffffc0202036:	8526                	mv	a0,s1
ffffffffc0202038:	d25ff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc020203c:	b765                	j	ffffffffc0201fe4 <kmalloc+0x56>

ffffffffc020203e <kfree>:
ffffffffc020203e:	c169                	beqz	a0,ffffffffc0202100 <kfree+0xc2>
ffffffffc0202040:	1101                	addi	sp,sp,-32
ffffffffc0202042:	e822                	sd	s0,16(sp)
ffffffffc0202044:	ec06                	sd	ra,24(sp)
ffffffffc0202046:	e426                	sd	s1,8(sp)
ffffffffc0202048:	03451793          	slli	a5,a0,0x34
ffffffffc020204c:	842a                	mv	s0,a0
ffffffffc020204e:	e3d9                	bnez	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202050:	100027f3          	csrr	a5,sstatus
ffffffffc0202054:	8b89                	andi	a5,a5,2
ffffffffc0202056:	e7d9                	bnez	a5,ffffffffc02020e4 <kfree+0xa6>
ffffffffc0202058:	00095797          	auipc	a5,0x95
ffffffffc020205c:	8307b783          	ld	a5,-2000(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202060:	4601                	li	a2,0
ffffffffc0202062:	cbad                	beqz	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202064:	00095697          	auipc	a3,0x95
ffffffffc0202068:	82468693          	addi	a3,a3,-2012 # ffffffffc0296888 <bigblocks>
ffffffffc020206c:	a021                	j	ffffffffc0202074 <kfree+0x36>
ffffffffc020206e:	01048693          	addi	a3,s1,16
ffffffffc0202072:	c3a5                	beqz	a5,ffffffffc02020d2 <kfree+0x94>
ffffffffc0202074:	6798                	ld	a4,8(a5)
ffffffffc0202076:	84be                	mv	s1,a5
ffffffffc0202078:	6b9c                	ld	a5,16(a5)
ffffffffc020207a:	fe871ae3          	bne	a4,s0,ffffffffc020206e <kfree+0x30>
ffffffffc020207e:	e29c                	sd	a5,0(a3)
ffffffffc0202080:	ee2d                	bnez	a2,ffffffffc02020fa <kfree+0xbc>
ffffffffc0202082:	c02007b7          	lui	a5,0xc0200
ffffffffc0202086:	4098                	lw	a4,0(s1)
ffffffffc0202088:	08f46963          	bltu	s0,a5,ffffffffc020211a <kfree+0xdc>
ffffffffc020208c:	00095697          	auipc	a3,0x95
ffffffffc0202090:	82c6b683          	ld	a3,-2004(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202094:	8c15                	sub	s0,s0,a3
ffffffffc0202096:	8031                	srli	s0,s0,0xc
ffffffffc0202098:	00095797          	auipc	a5,0x95
ffffffffc020209c:	8087b783          	ld	a5,-2040(a5) # ffffffffc02968a0 <npage>
ffffffffc02020a0:	06f47163          	bgeu	s0,a5,ffffffffc0202102 <kfree+0xc4>
ffffffffc02020a4:	0000d517          	auipc	a0,0xd
ffffffffc02020a8:	70c53503          	ld	a0,1804(a0) # ffffffffc020f7b0 <nbase>
ffffffffc02020ac:	8c09                	sub	s0,s0,a0
ffffffffc02020ae:	041a                	slli	s0,s0,0x6
ffffffffc02020b0:	00094517          	auipc	a0,0x94
ffffffffc02020b4:	7f853503          	ld	a0,2040(a0) # ffffffffc02968a8 <pages>
ffffffffc02020b8:	4585                	li	a1,1
ffffffffc02020ba:	9522                	add	a0,a0,s0
ffffffffc02020bc:	00e595bb          	sllw	a1,a1,a4
ffffffffc02020c0:	0ea000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02020c4:	6442                	ld	s0,16(sp)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8526                	mv	a0,s1
ffffffffc02020ca:	64a2                	ld	s1,8(sp)
ffffffffc02020cc:	45e1                	li	a1,24
ffffffffc02020ce:	6105                	addi	sp,sp,32
ffffffffc02020d0:	b171                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020d2:	e20d                	bnez	a2,ffffffffc02020f4 <kfree+0xb6>
ffffffffc02020d4:	ff040513          	addi	a0,s0,-16
ffffffffc02020d8:	6442                	ld	s0,16(sp)
ffffffffc02020da:	60e2                	ld	ra,24(sp)
ffffffffc02020dc:	64a2                	ld	s1,8(sp)
ffffffffc02020de:	4581                	li	a1,0
ffffffffc02020e0:	6105                	addi	sp,sp,32
ffffffffc02020e2:	b9ad                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020e4:	b8ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4605                	li	a2,1
ffffffffc02020f2:	fbad                	bnez	a5,ffffffffc0202064 <kfree+0x26>
ffffffffc02020f4:	b79fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020f8:	bff1                	j	ffffffffc02020d4 <kfree+0x96>
ffffffffc02020fa:	b73fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020fe:	b751                	j	ffffffffc0202082 <kfree+0x44>
ffffffffc0202100:	8082                	ret
ffffffffc0202102:	0000a617          	auipc	a2,0xa
ffffffffc0202106:	46e60613          	addi	a2,a2,1134 # ffffffffc020c570 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	3ba50513          	addi	a0,a0,954 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	42c60613          	addi	a2,a2,1068 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	3a050513          	addi	a0,a0,928 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	43a60613          	addi	a2,a2,1082 # ffffffffc020c570 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	38650513          	addi	a0,a0,902 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	43e60613          	addi	a2,a2,1086 # ffffffffc020c590 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	36a50513          	addi	a0,a0,874 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0202166:	e406                	sd	ra,8(sp)
ffffffffc0202168:	b36fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020216c <alloc_pages>:
ffffffffc020216c:	100027f3          	csrr	a5,sstatus
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	e799                	bnez	a5,ffffffffc0202180 <alloc_pages+0x14>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020217c:	6f9c                	ld	a5,24(a5)
ffffffffc020217e:	8782                	jr	a5
ffffffffc0202180:	1141                	addi	sp,sp,-16
ffffffffc0202182:	e406                	sd	ra,8(sp)
ffffffffc0202184:	e022                	sd	s0,0(sp)
ffffffffc0202186:	842a                	mv	s0,a0
ffffffffc0202188:	aebfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7247b783          	ld	a5,1828(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8522                	mv	a0,s0
ffffffffc0202198:	9782                	jalr	a5
ffffffffc020219a:	842a                	mv	s0,a0
ffffffffc020219c:	ad1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02021a0:	60a2                	ld	ra,8(sp)
ffffffffc02021a2:	8522                	mv	a0,s0
ffffffffc02021a4:	6402                	ld	s0,0(sp)
ffffffffc02021a6:	0141                	addi	sp,sp,16
ffffffffc02021a8:	8082                	ret

ffffffffc02021aa <free_pages>:
ffffffffc02021aa:	100027f3          	csrr	a5,sstatus
ffffffffc02021ae:	8b89                	andi	a5,a5,2
ffffffffc02021b0:	e799                	bnez	a5,ffffffffc02021be <free_pages+0x14>
ffffffffc02021b2:	00094797          	auipc	a5,0x94
ffffffffc02021b6:	6fe7b783          	ld	a5,1790(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021ba:	739c                	ld	a5,32(a5)
ffffffffc02021bc:	8782                	jr	a5
ffffffffc02021be:	1101                	addi	sp,sp,-32
ffffffffc02021c0:	ec06                	sd	ra,24(sp)
ffffffffc02021c2:	e822                	sd	s0,16(sp)
ffffffffc02021c4:	e426                	sd	s1,8(sp)
ffffffffc02021c6:	842a                	mv	s0,a0
ffffffffc02021c8:	84ae                	mv	s1,a1
ffffffffc02021ca:	aa9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02021ce:	00094797          	auipc	a5,0x94
ffffffffc02021d2:	6e27b783          	ld	a5,1762(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021d6:	739c                	ld	a5,32(a5)
ffffffffc02021d8:	85a6                	mv	a1,s1
ffffffffc02021da:	8522                	mv	a0,s0
ffffffffc02021dc:	9782                	jalr	a5
ffffffffc02021de:	6442                	ld	s0,16(sp)
ffffffffc02021e0:	60e2                	ld	ra,24(sp)
ffffffffc02021e2:	64a2                	ld	s1,8(sp)
ffffffffc02021e4:	6105                	addi	sp,sp,32
ffffffffc02021e6:	a87fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02021ea <nr_free_pages>:
ffffffffc02021ea:	100027f3          	csrr	a5,sstatus
ffffffffc02021ee:	8b89                	andi	a5,a5,2
ffffffffc02021f0:	e799                	bnez	a5,ffffffffc02021fe <nr_free_pages+0x14>
ffffffffc02021f2:	00094797          	auipc	a5,0x94
ffffffffc02021f6:	6be7b783          	ld	a5,1726(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021fa:	779c                	ld	a5,40(a5)
ffffffffc02021fc:	8782                	jr	a5
ffffffffc02021fe:	1141                	addi	sp,sp,-16
ffffffffc0202200:	e406                	sd	ra,8(sp)
ffffffffc0202202:	e022                	sd	s0,0(sp)
ffffffffc0202204:	a6ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202208:	00094797          	auipc	a5,0x94
ffffffffc020220c:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202210:	779c                	ld	a5,40(a5)
ffffffffc0202212:	9782                	jalr	a5
ffffffffc0202214:	842a                	mv	s0,a0
ffffffffc0202216:	a57fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020221a:	60a2                	ld	ra,8(sp)
ffffffffc020221c:	8522                	mv	a0,s0
ffffffffc020221e:	6402                	ld	s0,0(sp)
ffffffffc0202220:	0141                	addi	sp,sp,16
ffffffffc0202222:	8082                	ret

ffffffffc0202224 <get_pte>:
ffffffffc0202224:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202228:	1ff7f793          	andi	a5,a5,511
ffffffffc020222c:	7139                	addi	sp,sp,-64
ffffffffc020222e:	078e                	slli	a5,a5,0x3
ffffffffc0202230:	f426                	sd	s1,40(sp)
ffffffffc0202232:	00f504b3          	add	s1,a0,a5
ffffffffc0202236:	6094                	ld	a3,0(s1)
ffffffffc0202238:	f04a                	sd	s2,32(sp)
ffffffffc020223a:	ec4e                	sd	s3,24(sp)
ffffffffc020223c:	e852                	sd	s4,16(sp)
ffffffffc020223e:	fc06                	sd	ra,56(sp)
ffffffffc0202240:	f822                	sd	s0,48(sp)
ffffffffc0202242:	e456                	sd	s5,8(sp)
ffffffffc0202244:	e05a                	sd	s6,0(sp)
ffffffffc0202246:	0016f793          	andi	a5,a3,1
ffffffffc020224a:	892e                	mv	s2,a1
ffffffffc020224c:	8a32                	mv	s4,a2
ffffffffc020224e:	00094997          	auipc	s3,0x94
ffffffffc0202252:	65298993          	addi	s3,s3,1618 # ffffffffc02968a0 <npage>
ffffffffc0202256:	efbd                	bnez	a5,ffffffffc02022d4 <get_pte+0xb0>
ffffffffc0202258:	14060c63          	beqz	a2,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020225c:	100027f3          	csrr	a5,sstatus
ffffffffc0202260:	8b89                	andi	a5,a5,2
ffffffffc0202262:	14079963          	bnez	a5,ffffffffc02023b4 <get_pte+0x190>
ffffffffc0202266:	00094797          	auipc	a5,0x94
ffffffffc020226a:	64a7b783          	ld	a5,1610(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020226e:	6f9c                	ld	a5,24(a5)
ffffffffc0202270:	4505                	li	a0,1
ffffffffc0202272:	9782                	jalr	a5
ffffffffc0202274:	842a                	mv	s0,a0
ffffffffc0202276:	12040d63          	beqz	s0,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020227a:	00094b17          	auipc	s6,0x94
ffffffffc020227e:	62eb0b13          	addi	s6,s6,1582 # ffffffffc02968a8 <pages>
ffffffffc0202282:	000b3503          	ld	a0,0(s6)
ffffffffc0202286:	00080ab7          	lui	s5,0x80
ffffffffc020228a:	00094997          	auipc	s3,0x94
ffffffffc020228e:	61698993          	addi	s3,s3,1558 # ffffffffc02968a0 <npage>
ffffffffc0202292:	40a40533          	sub	a0,s0,a0
ffffffffc0202296:	8519                	srai	a0,a0,0x6
ffffffffc0202298:	9556                	add	a0,a0,s5
ffffffffc020229a:	0009b703          	ld	a4,0(s3)
ffffffffc020229e:	00c51793          	slli	a5,a0,0xc
ffffffffc02022a2:	4685                	li	a3,1
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	83b1                	srli	a5,a5,0xc
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	16e7f763          	bgeu	a5,a4,ffffffffc0202418 <get_pte+0x1f4>
ffffffffc02022ae:	00094797          	auipc	a5,0x94
ffffffffc02022b2:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	953e                	add	a0,a0,a5
ffffffffc02022bc:	1de090ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc02022c0:	000b3683          	ld	a3,0(s6)
ffffffffc02022c4:	40d406b3          	sub	a3,s0,a3
ffffffffc02022c8:	8699                	srai	a3,a3,0x6
ffffffffc02022ca:	96d6                	add	a3,a3,s5
ffffffffc02022cc:	06aa                	slli	a3,a3,0xa
ffffffffc02022ce:	0116e693          	ori	a3,a3,17
ffffffffc02022d2:	e094                	sd	a3,0(s1)
ffffffffc02022d4:	77fd                	lui	a5,0xfffff
ffffffffc02022d6:	068a                	slli	a3,a3,0x2
ffffffffc02022d8:	0009b703          	ld	a4,0(s3)
ffffffffc02022dc:	8efd                	and	a3,a3,a5
ffffffffc02022de:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022e2:	10e7ff63          	bgeu	a5,a4,ffffffffc0202400 <get_pte+0x1dc>
ffffffffc02022e6:	00094a97          	auipc	s5,0x94
ffffffffc02022ea:	5d2a8a93          	addi	s5,s5,1490 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022ee:	000ab403          	ld	s0,0(s5)
ffffffffc02022f2:	01595793          	srli	a5,s2,0x15
ffffffffc02022f6:	1ff7f793          	andi	a5,a5,511
ffffffffc02022fa:	96a2                	add	a3,a3,s0
ffffffffc02022fc:	00379413          	slli	s0,a5,0x3
ffffffffc0202300:	9436                	add	s0,s0,a3
ffffffffc0202302:	6014                	ld	a3,0(s0)
ffffffffc0202304:	0016f793          	andi	a5,a3,1
ffffffffc0202308:	ebad                	bnez	a5,ffffffffc020237a <get_pte+0x156>
ffffffffc020230a:	0a0a0363          	beqz	s4,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020230e:	100027f3          	csrr	a5,sstatus
ffffffffc0202312:	8b89                	andi	a5,a5,2
ffffffffc0202314:	efcd                	bnez	a5,ffffffffc02023ce <get_pte+0x1aa>
ffffffffc0202316:	00094797          	auipc	a5,0x94
ffffffffc020231a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020231e:	6f9c                	ld	a5,24(a5)
ffffffffc0202320:	4505                	li	a0,1
ffffffffc0202322:	9782                	jalr	a5
ffffffffc0202324:	84aa                	mv	s1,a0
ffffffffc0202326:	c4c9                	beqz	s1,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc0202328:	00094b17          	auipc	s6,0x94
ffffffffc020232c:	580b0b13          	addi	s6,s6,1408 # ffffffffc02968a8 <pages>
ffffffffc0202330:	000b3503          	ld	a0,0(s6)
ffffffffc0202334:	00080a37          	lui	s4,0x80
ffffffffc0202338:	0009b703          	ld	a4,0(s3)
ffffffffc020233c:	40a48533          	sub	a0,s1,a0
ffffffffc0202340:	8519                	srai	a0,a0,0x6
ffffffffc0202342:	9552                	add	a0,a0,s4
ffffffffc0202344:	00c51793          	slli	a5,a0,0xc
ffffffffc0202348:	4685                	li	a3,1
ffffffffc020234a:	c094                	sw	a3,0(s1)
ffffffffc020234c:	83b1                	srli	a5,a5,0xc
ffffffffc020234e:	0532                	slli	a0,a0,0xc
ffffffffc0202350:	0ee7f163          	bgeu	a5,a4,ffffffffc0202432 <get_pte+0x20e>
ffffffffc0202354:	000ab783          	ld	a5,0(s5)
ffffffffc0202358:	6605                	lui	a2,0x1
ffffffffc020235a:	4581                	li	a1,0
ffffffffc020235c:	953e                	add	a0,a0,a5
ffffffffc020235e:	13c090ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0202362:	000b3683          	ld	a3,0(s6)
ffffffffc0202366:	40d486b3          	sub	a3,s1,a3
ffffffffc020236a:	8699                	srai	a3,a3,0x6
ffffffffc020236c:	96d2                	add	a3,a3,s4
ffffffffc020236e:	06aa                	slli	a3,a3,0xa
ffffffffc0202370:	0116e693          	ori	a3,a3,17
ffffffffc0202374:	e014                	sd	a3,0(s0)
ffffffffc0202376:	0009b703          	ld	a4,0(s3)
ffffffffc020237a:	068a                	slli	a3,a3,0x2
ffffffffc020237c:	757d                	lui	a0,0xfffff
ffffffffc020237e:	8ee9                	and	a3,a3,a0
ffffffffc0202380:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202384:	06e7f263          	bgeu	a5,a4,ffffffffc02023e8 <get_pte+0x1c4>
ffffffffc0202388:	000ab503          	ld	a0,0(s5)
ffffffffc020238c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202390:	1ff97913          	andi	s2,s2,511
ffffffffc0202394:	96aa                	add	a3,a3,a0
ffffffffc0202396:	00391513          	slli	a0,s2,0x3
ffffffffc020239a:	9536                	add	a0,a0,a3
ffffffffc020239c:	70e2                	ld	ra,56(sp)
ffffffffc020239e:	7442                	ld	s0,48(sp)
ffffffffc02023a0:	74a2                	ld	s1,40(sp)
ffffffffc02023a2:	7902                	ld	s2,32(sp)
ffffffffc02023a4:	69e2                	ld	s3,24(sp)
ffffffffc02023a6:	6a42                	ld	s4,16(sp)
ffffffffc02023a8:	6aa2                	ld	s5,8(sp)
ffffffffc02023aa:	6b02                	ld	s6,0(sp)
ffffffffc02023ac:	6121                	addi	sp,sp,64
ffffffffc02023ae:	8082                	ret
ffffffffc02023b0:	4501                	li	a0,0
ffffffffc02023b2:	b7ed                	j	ffffffffc020239c <get_pte+0x178>
ffffffffc02023b4:	8bffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023b8:	00094797          	auipc	a5,0x94
ffffffffc02023bc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023c0:	6f9c                	ld	a5,24(a5)
ffffffffc02023c2:	4505                	li	a0,1
ffffffffc02023c4:	9782                	jalr	a5
ffffffffc02023c6:	842a                	mv	s0,a0
ffffffffc02023c8:	8a5fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023cc:	b56d                	j	ffffffffc0202276 <get_pte+0x52>
ffffffffc02023ce:	8a5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023d2:	00094797          	auipc	a5,0x94
ffffffffc02023d6:	4de7b783          	ld	a5,1246(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023da:	6f9c                	ld	a5,24(a5)
ffffffffc02023dc:	4505                	li	a0,1
ffffffffc02023de:	9782                	jalr	a5
ffffffffc02023e0:	84aa                	mv	s1,a0
ffffffffc02023e2:	88bfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023e6:	b781                	j	ffffffffc0202326 <get_pte+0x102>
ffffffffc02023e8:	0000a617          	auipc	a2,0xa
ffffffffc02023ec:	0b860613          	addi	a2,a2,184 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	1c450513          	addi	a0,a0,452 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	0a060613          	addi	a2,a2,160 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	1ac50513          	addi	a0,a0,428 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	08660613          	addi	a2,a2,134 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	19250513          	addi	a0,a0,402 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	06c60613          	addi	a2,a2,108 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	17850513          	addi	a0,a0,376 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0202448:	856fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020244c <boot_map_segment>:
ffffffffc020244c:	6785                	lui	a5,0x1
ffffffffc020244e:	7139                	addi	sp,sp,-64
ffffffffc0202450:	00d5c833          	xor	a6,a1,a3
ffffffffc0202454:	17fd                	addi	a5,a5,-1
ffffffffc0202456:	fc06                	sd	ra,56(sp)
ffffffffc0202458:	f822                	sd	s0,48(sp)
ffffffffc020245a:	f426                	sd	s1,40(sp)
ffffffffc020245c:	f04a                	sd	s2,32(sp)
ffffffffc020245e:	ec4e                	sd	s3,24(sp)
ffffffffc0202460:	e852                	sd	s4,16(sp)
ffffffffc0202462:	e456                	sd	s5,8(sp)
ffffffffc0202464:	00f87833          	and	a6,a6,a5
ffffffffc0202468:	08081563          	bnez	a6,ffffffffc02024f2 <boot_map_segment+0xa6>
ffffffffc020246c:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202470:	963e                	add	a2,a2,a5
ffffffffc0202472:	94b2                	add	s1,s1,a2
ffffffffc0202474:	797d                	lui	s2,0xfffff
ffffffffc0202476:	80b1                	srli	s1,s1,0xc
ffffffffc0202478:	0125f5b3          	and	a1,a1,s2
ffffffffc020247c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202480:	c0a1                	beqz	s1,ffffffffc02024c0 <boot_map_segment+0x74>
ffffffffc0202482:	00176713          	ori	a4,a4,1
ffffffffc0202486:	04b2                	slli	s1,s1,0xc
ffffffffc0202488:	02071993          	slli	s3,a4,0x20
ffffffffc020248c:	8a2a                	mv	s4,a0
ffffffffc020248e:	842e                	mv	s0,a1
ffffffffc0202490:	94ae                	add	s1,s1,a1
ffffffffc0202492:	40b68933          	sub	s2,a3,a1
ffffffffc0202496:	0209d993          	srli	s3,s3,0x20
ffffffffc020249a:	6a85                	lui	s5,0x1
ffffffffc020249c:	4605                	li	a2,1
ffffffffc020249e:	85a2                	mv	a1,s0
ffffffffc02024a0:	8552                	mv	a0,s4
ffffffffc02024a2:	d83ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02024a6:	008907b3          	add	a5,s2,s0
ffffffffc02024aa:	c505                	beqz	a0,ffffffffc02024d2 <boot_map_segment+0x86>
ffffffffc02024ac:	83b1                	srli	a5,a5,0xc
ffffffffc02024ae:	07aa                	slli	a5,a5,0xa
ffffffffc02024b0:	0137e7b3          	or	a5,a5,s3
ffffffffc02024b4:	0017e793          	ori	a5,a5,1
ffffffffc02024b8:	e11c                	sd	a5,0(a0)
ffffffffc02024ba:	9456                	add	s0,s0,s5
ffffffffc02024bc:	fe8490e3          	bne	s1,s0,ffffffffc020249c <boot_map_segment+0x50>
ffffffffc02024c0:	70e2                	ld	ra,56(sp)
ffffffffc02024c2:	7442                	ld	s0,48(sp)
ffffffffc02024c4:	74a2                	ld	s1,40(sp)
ffffffffc02024c6:	7902                	ld	s2,32(sp)
ffffffffc02024c8:	69e2                	ld	s3,24(sp)
ffffffffc02024ca:	6a42                	ld	s4,16(sp)
ffffffffc02024cc:	6aa2                	ld	s5,8(sp)
ffffffffc02024ce:	6121                	addi	sp,sp,64
ffffffffc02024d0:	8082                	ret
ffffffffc02024d2:	0000a697          	auipc	a3,0xa
ffffffffc02024d6:	10e68693          	addi	a3,a3,270 # ffffffffc020c5e0 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	4a660613          	addi	a2,a2,1190 # ffffffffc020b980 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	0d250513          	addi	a0,a0,210 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	0d668693          	addi	a3,a3,214 # ffffffffc020c5c8 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	48660613          	addi	a2,a2,1158 # ffffffffc020b980 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	0b250513          	addi	a0,a0,178 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020250e:	f91fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202512 <get_page>:
ffffffffc0202512:	1141                	addi	sp,sp,-16
ffffffffc0202514:	e022                	sd	s0,0(sp)
ffffffffc0202516:	8432                	mv	s0,a2
ffffffffc0202518:	4601                	li	a2,0
ffffffffc020251a:	e406                	sd	ra,8(sp)
ffffffffc020251c:	d09ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202520:	c011                	beqz	s0,ffffffffc0202524 <get_page+0x12>
ffffffffc0202522:	e008                	sd	a0,0(s0)
ffffffffc0202524:	c511                	beqz	a0,ffffffffc0202530 <get_page+0x1e>
ffffffffc0202526:	611c                	ld	a5,0(a0)
ffffffffc0202528:	4501                	li	a0,0
ffffffffc020252a:	0017f713          	andi	a4,a5,1
ffffffffc020252e:	e709                	bnez	a4,ffffffffc0202538 <get_page+0x26>
ffffffffc0202530:	60a2                	ld	ra,8(sp)
ffffffffc0202532:	6402                	ld	s0,0(sp)
ffffffffc0202534:	0141                	addi	sp,sp,16
ffffffffc0202536:	8082                	ret
ffffffffc0202538:	078a                	slli	a5,a5,0x2
ffffffffc020253a:	83b1                	srli	a5,a5,0xc
ffffffffc020253c:	00094717          	auipc	a4,0x94
ffffffffc0202540:	36473703          	ld	a4,868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202544:	00e7ff63          	bgeu	a5,a4,ffffffffc0202562 <get_page+0x50>
ffffffffc0202548:	60a2                	ld	ra,8(sp)
ffffffffc020254a:	6402                	ld	s0,0(sp)
ffffffffc020254c:	fff80537          	lui	a0,0xfff80
ffffffffc0202550:	97aa                	add	a5,a5,a0
ffffffffc0202552:	079a                	slli	a5,a5,0x6
ffffffffc0202554:	00094517          	auipc	a0,0x94
ffffffffc0202558:	35453503          	ld	a0,852(a0) # ffffffffc02968a8 <pages>
ffffffffc020255c:	953e                	add	a0,a0,a5
ffffffffc020255e:	0141                	addi	sp,sp,16
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	bd3ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202566 <unmap_range>:
ffffffffc0202566:	7159                	addi	sp,sp,-112
ffffffffc0202568:	00c5e7b3          	or	a5,a1,a2
ffffffffc020256c:	f486                	sd	ra,104(sp)
ffffffffc020256e:	f0a2                	sd	s0,96(sp)
ffffffffc0202570:	eca6                	sd	s1,88(sp)
ffffffffc0202572:	e8ca                	sd	s2,80(sp)
ffffffffc0202574:	e4ce                	sd	s3,72(sp)
ffffffffc0202576:	e0d2                	sd	s4,64(sp)
ffffffffc0202578:	fc56                	sd	s5,56(sp)
ffffffffc020257a:	f85a                	sd	s6,48(sp)
ffffffffc020257c:	f45e                	sd	s7,40(sp)
ffffffffc020257e:	f062                	sd	s8,32(sp)
ffffffffc0202580:	ec66                	sd	s9,24(sp)
ffffffffc0202582:	e86a                	sd	s10,16(sp)
ffffffffc0202584:	17d2                	slli	a5,a5,0x34
ffffffffc0202586:	e3ed                	bnez	a5,ffffffffc0202668 <unmap_range+0x102>
ffffffffc0202588:	002007b7          	lui	a5,0x200
ffffffffc020258c:	842e                	mv	s0,a1
ffffffffc020258e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202592:	8932                	mv	s2,a2
ffffffffc0202594:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202598:	4785                	li	a5,1
ffffffffc020259a:	07fe                	slli	a5,a5,0x1f
ffffffffc020259c:	0ec7e663          	bltu	a5,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc02025a0:	89aa                	mv	s3,a0
ffffffffc02025a2:	6a05                	lui	s4,0x1
ffffffffc02025a4:	00094c97          	auipc	s9,0x94
ffffffffc02025a8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02968a0 <npage>
ffffffffc02025ac:	00094c17          	auipc	s8,0x94
ffffffffc02025b0:	2fcc0c13          	addi	s8,s8,764 # ffffffffc02968a8 <pages>
ffffffffc02025b4:	fff80bb7          	lui	s7,0xfff80
ffffffffc02025b8:	00094d17          	auipc	s10,0x94
ffffffffc02025bc:	2f8d0d13          	addi	s10,s10,760 # ffffffffc02968b0 <pmm_manager>
ffffffffc02025c0:	00200b37          	lui	s6,0x200
ffffffffc02025c4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025c8:	4601                	li	a2,0
ffffffffc02025ca:	85a2                	mv	a1,s0
ffffffffc02025cc:	854e                	mv	a0,s3
ffffffffc02025ce:	c57ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02025d2:	84aa                	mv	s1,a0
ffffffffc02025d4:	cd29                	beqz	a0,ffffffffc020262e <unmap_range+0xc8>
ffffffffc02025d6:	611c                	ld	a5,0(a0)
ffffffffc02025d8:	e395                	bnez	a5,ffffffffc02025fc <unmap_range+0x96>
ffffffffc02025da:	9452                	add	s0,s0,s4
ffffffffc02025dc:	ff2466e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc02025e0:	70a6                	ld	ra,104(sp)
ffffffffc02025e2:	7406                	ld	s0,96(sp)
ffffffffc02025e4:	64e6                	ld	s1,88(sp)
ffffffffc02025e6:	6946                	ld	s2,80(sp)
ffffffffc02025e8:	69a6                	ld	s3,72(sp)
ffffffffc02025ea:	6a06                	ld	s4,64(sp)
ffffffffc02025ec:	7ae2                	ld	s5,56(sp)
ffffffffc02025ee:	7b42                	ld	s6,48(sp)
ffffffffc02025f0:	7ba2                	ld	s7,40(sp)
ffffffffc02025f2:	7c02                	ld	s8,32(sp)
ffffffffc02025f4:	6ce2                	ld	s9,24(sp)
ffffffffc02025f6:	6d42                	ld	s10,16(sp)
ffffffffc02025f8:	6165                	addi	sp,sp,112
ffffffffc02025fa:	8082                	ret
ffffffffc02025fc:	0017f713          	andi	a4,a5,1
ffffffffc0202600:	df69                	beqz	a4,ffffffffc02025da <unmap_range+0x74>
ffffffffc0202602:	000cb703          	ld	a4,0(s9)
ffffffffc0202606:	078a                	slli	a5,a5,0x2
ffffffffc0202608:	83b1                	srli	a5,a5,0xc
ffffffffc020260a:	08e7ff63          	bgeu	a5,a4,ffffffffc02026a8 <unmap_range+0x142>
ffffffffc020260e:	000c3503          	ld	a0,0(s8)
ffffffffc0202612:	97de                	add	a5,a5,s7
ffffffffc0202614:	079a                	slli	a5,a5,0x6
ffffffffc0202616:	953e                	add	a0,a0,a5
ffffffffc0202618:	411c                	lw	a5,0(a0)
ffffffffc020261a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020261e:	c118                	sw	a4,0(a0)
ffffffffc0202620:	cf11                	beqz	a4,ffffffffc020263c <unmap_range+0xd6>
ffffffffc0202622:	0004b023          	sd	zero,0(s1)
ffffffffc0202626:	12040073          	sfence.vma	s0
ffffffffc020262a:	9452                	add	s0,s0,s4
ffffffffc020262c:	bf45                	j	ffffffffc02025dc <unmap_range+0x76>
ffffffffc020262e:	945a                	add	s0,s0,s6
ffffffffc0202630:	01547433          	and	s0,s0,s5
ffffffffc0202634:	d455                	beqz	s0,ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc0202636:	f92469e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc020263a:	b75d                	j	ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc020263c:	100027f3          	csrr	a5,sstatus
ffffffffc0202640:	8b89                	andi	a5,a5,2
ffffffffc0202642:	e799                	bnez	a5,ffffffffc0202650 <unmap_range+0xea>
ffffffffc0202644:	000d3783          	ld	a5,0(s10)
ffffffffc0202648:	4585                	li	a1,1
ffffffffc020264a:	739c                	ld	a5,32(a5)
ffffffffc020264c:	9782                	jalr	a5
ffffffffc020264e:	bfd1                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202650:	e42a                	sd	a0,8(sp)
ffffffffc0202652:	e20fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202656:	000d3783          	ld	a5,0(s10)
ffffffffc020265a:	6522                	ld	a0,8(sp)
ffffffffc020265c:	4585                	li	a1,1
ffffffffc020265e:	739c                	ld	a5,32(a5)
ffffffffc0202660:	9782                	jalr	a5
ffffffffc0202662:	e0afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202666:	bf75                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202668:	0000a697          	auipc	a3,0xa
ffffffffc020266c:	f8868693          	addi	a3,a3,-120 # ffffffffc020c5f0 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	31060613          	addi	a2,a2,784 # ffffffffc020b980 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	f3c50513          	addi	a0,a0,-196 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	f9868693          	addi	a3,a3,-104 # ffffffffc020c620 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	2f060613          	addi	a2,a2,752 # ffffffffc020b980 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	f1c50513          	addi	a0,a0,-228 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02026a4:	dfbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02026a8:	a8dff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02026ac <exit_range>:
ffffffffc02026ac:	7119                	addi	sp,sp,-128
ffffffffc02026ae:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026b2:	fc86                	sd	ra,120(sp)
ffffffffc02026b4:	f8a2                	sd	s0,112(sp)
ffffffffc02026b6:	f4a6                	sd	s1,104(sp)
ffffffffc02026b8:	f0ca                	sd	s2,96(sp)
ffffffffc02026ba:	ecce                	sd	s3,88(sp)
ffffffffc02026bc:	e8d2                	sd	s4,80(sp)
ffffffffc02026be:	e4d6                	sd	s5,72(sp)
ffffffffc02026c0:	e0da                	sd	s6,64(sp)
ffffffffc02026c2:	fc5e                	sd	s7,56(sp)
ffffffffc02026c4:	f862                	sd	s8,48(sp)
ffffffffc02026c6:	f466                	sd	s9,40(sp)
ffffffffc02026c8:	f06a                	sd	s10,32(sp)
ffffffffc02026ca:	ec6e                	sd	s11,24(sp)
ffffffffc02026cc:	17d2                	slli	a5,a5,0x34
ffffffffc02026ce:	20079a63          	bnez	a5,ffffffffc02028e2 <exit_range+0x236>
ffffffffc02026d2:	002007b7          	lui	a5,0x200
ffffffffc02026d6:	24f5e463          	bltu	a1,a5,ffffffffc020291e <exit_range+0x272>
ffffffffc02026da:	8ab2                	mv	s5,a2
ffffffffc02026dc:	24c5f163          	bgeu	a1,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e0:	4785                	li	a5,1
ffffffffc02026e2:	07fe                	slli	a5,a5,0x1f
ffffffffc02026e4:	22c7ed63          	bltu	a5,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e8:	c00009b7          	lui	s3,0xc0000
ffffffffc02026ec:	0135f9b3          	and	s3,a1,s3
ffffffffc02026f0:	ffe00937          	lui	s2,0xffe00
ffffffffc02026f4:	400007b7          	lui	a5,0x40000
ffffffffc02026f8:	5cfd                	li	s9,-1
ffffffffc02026fa:	8c2a                	mv	s8,a0
ffffffffc02026fc:	0125f933          	and	s2,a1,s2
ffffffffc0202700:	99be                	add	s3,s3,a5
ffffffffc0202702:	00094d17          	auipc	s10,0x94
ffffffffc0202706:	19ed0d13          	addi	s10,s10,414 # ffffffffc02968a0 <npage>
ffffffffc020270a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020270e:	00094717          	auipc	a4,0x94
ffffffffc0202712:	19a70713          	addi	a4,a4,410 # ffffffffc02968a8 <pages>
ffffffffc0202716:	00094d97          	auipc	s11,0x94
ffffffffc020271a:	19ad8d93          	addi	s11,s11,410 # ffffffffc02968b0 <pmm_manager>
ffffffffc020271e:	c0000437          	lui	s0,0xc0000
ffffffffc0202722:	944e                	add	s0,s0,s3
ffffffffc0202724:	8079                	srli	s0,s0,0x1e
ffffffffc0202726:	1ff47413          	andi	s0,s0,511
ffffffffc020272a:	040e                	slli	s0,s0,0x3
ffffffffc020272c:	9462                	add	s0,s0,s8
ffffffffc020272e:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202732:	001a7793          	andi	a5,s4,1
ffffffffc0202736:	eb99                	bnez	a5,ffffffffc020274c <exit_range+0xa0>
ffffffffc0202738:	12098463          	beqz	s3,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc020273c:	400007b7          	lui	a5,0x40000
ffffffffc0202740:	97ce                	add	a5,a5,s3
ffffffffc0202742:	894e                	mv	s2,s3
ffffffffc0202744:	1159fe63          	bgeu	s3,s5,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc0202748:	89be                	mv	s3,a5
ffffffffc020274a:	bfd1                	j	ffffffffc020271e <exit_range+0x72>
ffffffffc020274c:	000d3783          	ld	a5,0(s10)
ffffffffc0202750:	0a0a                	slli	s4,s4,0x2
ffffffffc0202752:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202756:	1cfa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020275a:	fff80637          	lui	a2,0xfff80
ffffffffc020275e:	9652                	add	a2,a2,s4
ffffffffc0202760:	000806b7          	lui	a3,0x80
ffffffffc0202764:	96b2                	add	a3,a3,a2
ffffffffc0202766:	0196f5b3          	and	a1,a3,s9
ffffffffc020276a:	061a                	slli	a2,a2,0x6
ffffffffc020276c:	06b2                	slli	a3,a3,0xc
ffffffffc020276e:	18f5fa63          	bgeu	a1,a5,ffffffffc0202902 <exit_range+0x256>
ffffffffc0202772:	00094817          	auipc	a6,0x94
ffffffffc0202776:	14680813          	addi	a6,a6,326 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020277a:	00083b03          	ld	s6,0(a6)
ffffffffc020277e:	4b85                	li	s7,1
ffffffffc0202780:	fff80e37          	lui	t3,0xfff80
ffffffffc0202784:	9b36                	add	s6,s6,a3
ffffffffc0202786:	00080337          	lui	t1,0x80
ffffffffc020278a:	6885                	lui	a7,0x1
ffffffffc020278c:	a819                	j	ffffffffc02027a2 <exit_range+0xf6>
ffffffffc020278e:	4b81                	li	s7,0
ffffffffc0202790:	002007b7          	lui	a5,0x200
ffffffffc0202794:	993e                	add	s2,s2,a5
ffffffffc0202796:	08090c63          	beqz	s2,ffffffffc020282e <exit_range+0x182>
ffffffffc020279a:	09397a63          	bgeu	s2,s3,ffffffffc020282e <exit_range+0x182>
ffffffffc020279e:	0f597063          	bgeu	s2,s5,ffffffffc020287e <exit_range+0x1d2>
ffffffffc02027a2:	01595493          	srli	s1,s2,0x15
ffffffffc02027a6:	1ff4f493          	andi	s1,s1,511
ffffffffc02027aa:	048e                	slli	s1,s1,0x3
ffffffffc02027ac:	94da                	add	s1,s1,s6
ffffffffc02027ae:	609c                	ld	a5,0(s1)
ffffffffc02027b0:	0017f693          	andi	a3,a5,1
ffffffffc02027b4:	dee9                	beqz	a3,ffffffffc020278e <exit_range+0xe2>
ffffffffc02027b6:	000d3583          	ld	a1,0(s10)
ffffffffc02027ba:	078a                	slli	a5,a5,0x2
ffffffffc02027bc:	83b1                	srli	a5,a5,0xc
ffffffffc02027be:	14b7fe63          	bgeu	a5,a1,ffffffffc020291a <exit_range+0x26e>
ffffffffc02027c2:	97f2                	add	a5,a5,t3
ffffffffc02027c4:	006786b3          	add	a3,a5,t1
ffffffffc02027c8:	0196feb3          	and	t4,a3,s9
ffffffffc02027cc:	00679513          	slli	a0,a5,0x6
ffffffffc02027d0:	06b2                	slli	a3,a3,0xc
ffffffffc02027d2:	12bef863          	bgeu	t4,a1,ffffffffc0202902 <exit_range+0x256>
ffffffffc02027d6:	00083783          	ld	a5,0(a6)
ffffffffc02027da:	96be                	add	a3,a3,a5
ffffffffc02027dc:	011685b3          	add	a1,a3,a7
ffffffffc02027e0:	629c                	ld	a5,0(a3)
ffffffffc02027e2:	8b85                	andi	a5,a5,1
ffffffffc02027e4:	f7d5                	bnez	a5,ffffffffc0202790 <exit_range+0xe4>
ffffffffc02027e6:	06a1                	addi	a3,a3,8
ffffffffc02027e8:	fed59ce3          	bne	a1,a3,ffffffffc02027e0 <exit_range+0x134>
ffffffffc02027ec:	631c                	ld	a5,0(a4)
ffffffffc02027ee:	953e                	add	a0,a0,a5
ffffffffc02027f0:	100027f3          	csrr	a5,sstatus
ffffffffc02027f4:	8b89                	andi	a5,a5,2
ffffffffc02027f6:	e7d9                	bnez	a5,ffffffffc0202884 <exit_range+0x1d8>
ffffffffc02027f8:	000db783          	ld	a5,0(s11)
ffffffffc02027fc:	4585                	li	a1,1
ffffffffc02027fe:	e032                	sd	a2,0(sp)
ffffffffc0202800:	739c                	ld	a5,32(a5)
ffffffffc0202802:	9782                	jalr	a5
ffffffffc0202804:	6602                	ld	a2,0(sp)
ffffffffc0202806:	00094817          	auipc	a6,0x94
ffffffffc020280a:	0b280813          	addi	a6,a6,178 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	00094717          	auipc	a4,0x94
ffffffffc020281c:	09070713          	addi	a4,a4,144 # ffffffffc02968a8 <pages>
ffffffffc0202820:	0004b023          	sd	zero,0(s1)
ffffffffc0202824:	002007b7          	lui	a5,0x200
ffffffffc0202828:	993e                	add	s2,s2,a5
ffffffffc020282a:	f60918e3          	bnez	s2,ffffffffc020279a <exit_range+0xee>
ffffffffc020282e:	f00b85e3          	beqz	s7,ffffffffc0202738 <exit_range+0x8c>
ffffffffc0202832:	000d3783          	ld	a5,0(s10)
ffffffffc0202836:	0efa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020283a:	6308                	ld	a0,0(a4)
ffffffffc020283c:	9532                	add	a0,a0,a2
ffffffffc020283e:	100027f3          	csrr	a5,sstatus
ffffffffc0202842:	8b89                	andi	a5,a5,2
ffffffffc0202844:	efad                	bnez	a5,ffffffffc02028be <exit_range+0x212>
ffffffffc0202846:	000db783          	ld	a5,0(s11)
ffffffffc020284a:	4585                	li	a1,1
ffffffffc020284c:	739c                	ld	a5,32(a5)
ffffffffc020284e:	9782                	jalr	a5
ffffffffc0202850:	00094717          	auipc	a4,0x94
ffffffffc0202854:	05870713          	addi	a4,a4,88 # ffffffffc02968a8 <pages>
ffffffffc0202858:	00043023          	sd	zero,0(s0)
ffffffffc020285c:	ee0990e3          	bnez	s3,ffffffffc020273c <exit_range+0x90>
ffffffffc0202860:	70e6                	ld	ra,120(sp)
ffffffffc0202862:	7446                	ld	s0,112(sp)
ffffffffc0202864:	74a6                	ld	s1,104(sp)
ffffffffc0202866:	7906                	ld	s2,96(sp)
ffffffffc0202868:	69e6                	ld	s3,88(sp)
ffffffffc020286a:	6a46                	ld	s4,80(sp)
ffffffffc020286c:	6aa6                	ld	s5,72(sp)
ffffffffc020286e:	6b06                	ld	s6,64(sp)
ffffffffc0202870:	7be2                	ld	s7,56(sp)
ffffffffc0202872:	7c42                	ld	s8,48(sp)
ffffffffc0202874:	7ca2                	ld	s9,40(sp)
ffffffffc0202876:	7d02                	ld	s10,32(sp)
ffffffffc0202878:	6de2                	ld	s11,24(sp)
ffffffffc020287a:	6109                	addi	sp,sp,128
ffffffffc020287c:	8082                	ret
ffffffffc020287e:	ea0b8fe3          	beqz	s7,ffffffffc020273c <exit_range+0x90>
ffffffffc0202882:	bf45                	j	ffffffffc0202832 <exit_range+0x186>
ffffffffc0202884:	e032                	sd	a2,0(sp)
ffffffffc0202886:	e42a                	sd	a0,8(sp)
ffffffffc0202888:	beafe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020288c:	000db783          	ld	a5,0(s11)
ffffffffc0202890:	6522                	ld	a0,8(sp)
ffffffffc0202892:	4585                	li	a1,1
ffffffffc0202894:	739c                	ld	a5,32(a5)
ffffffffc0202896:	9782                	jalr	a5
ffffffffc0202898:	bd4fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020289c:	6602                	ld	a2,0(sp)
ffffffffc020289e:	00094717          	auipc	a4,0x94
ffffffffc02028a2:	00a70713          	addi	a4,a4,10 # ffffffffc02968a8 <pages>
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00080337          	lui	t1,0x80
ffffffffc02028ac:	fff80e37          	lui	t3,0xfff80
ffffffffc02028b0:	00094817          	auipc	a6,0x94
ffffffffc02028b4:	00880813          	addi	a6,a6,8 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02028b8:	0004b023          	sd	zero,0(s1)
ffffffffc02028bc:	b7a5                	j	ffffffffc0202824 <exit_range+0x178>
ffffffffc02028be:	e02a                	sd	a0,0(sp)
ffffffffc02028c0:	bb2fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02028c4:	000db783          	ld	a5,0(s11)
ffffffffc02028c8:	6502                	ld	a0,0(sp)
ffffffffc02028ca:	4585                	li	a1,1
ffffffffc02028cc:	739c                	ld	a5,32(a5)
ffffffffc02028ce:	9782                	jalr	a5
ffffffffc02028d0:	b9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02028d4:	00094717          	auipc	a4,0x94
ffffffffc02028d8:	fd470713          	addi	a4,a4,-44 # ffffffffc02968a8 <pages>
ffffffffc02028dc:	00043023          	sd	zero,0(s0)
ffffffffc02028e0:	bfb5                	j	ffffffffc020285c <exit_range+0x1b0>
ffffffffc02028e2:	0000a697          	auipc	a3,0xa
ffffffffc02028e6:	d0e68693          	addi	a3,a3,-754 # ffffffffc020c5f0 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	09660613          	addi	a2,a2,150 # ffffffffc020b980 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	cc250513          	addi	a0,a0,-830 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	b9e60613          	addi	a2,a2,-1122 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	bba50513          	addi	a0,a0,-1094 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	d0268693          	addi	a3,a3,-766 # ffffffffc020c620 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	05a60613          	addi	a2,a2,90 # ffffffffc020b980 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	c8650513          	addi	a0,a0,-890 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <page_remove>:
ffffffffc020293e:	7179                	addi	sp,sp,-48
ffffffffc0202940:	4601                	li	a2,0
ffffffffc0202942:	ec26                	sd	s1,24(sp)
ffffffffc0202944:	f406                	sd	ra,40(sp)
ffffffffc0202946:	f022                	sd	s0,32(sp)
ffffffffc0202948:	84ae                	mv	s1,a1
ffffffffc020294a:	8dbff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020294e:	c511                	beqz	a0,ffffffffc020295a <page_remove+0x1c>
ffffffffc0202950:	611c                	ld	a5,0(a0)
ffffffffc0202952:	842a                	mv	s0,a0
ffffffffc0202954:	0017f713          	andi	a4,a5,1
ffffffffc0202958:	e711                	bnez	a4,ffffffffc0202964 <page_remove+0x26>
ffffffffc020295a:	70a2                	ld	ra,40(sp)
ffffffffc020295c:	7402                	ld	s0,32(sp)
ffffffffc020295e:	64e2                	ld	s1,24(sp)
ffffffffc0202960:	6145                	addi	sp,sp,48
ffffffffc0202962:	8082                	ret
ffffffffc0202964:	078a                	slli	a5,a5,0x2
ffffffffc0202966:	83b1                	srli	a5,a5,0xc
ffffffffc0202968:	00094717          	auipc	a4,0x94
ffffffffc020296c:	f3873703          	ld	a4,-200(a4) # ffffffffc02968a0 <npage>
ffffffffc0202970:	06e7f363          	bgeu	a5,a4,ffffffffc02029d6 <page_remove+0x98>
ffffffffc0202974:	fff80537          	lui	a0,0xfff80
ffffffffc0202978:	97aa                	add	a5,a5,a0
ffffffffc020297a:	079a                	slli	a5,a5,0x6
ffffffffc020297c:	00094517          	auipc	a0,0x94
ffffffffc0202980:	f2c53503          	ld	a0,-212(a0) # ffffffffc02968a8 <pages>
ffffffffc0202984:	953e                	add	a0,a0,a5
ffffffffc0202986:	411c                	lw	a5,0(a0)
ffffffffc0202988:	fff7871b          	addiw	a4,a5,-1
ffffffffc020298c:	c118                	sw	a4,0(a0)
ffffffffc020298e:	cb11                	beqz	a4,ffffffffc02029a2 <page_remove+0x64>
ffffffffc0202990:	00043023          	sd	zero,0(s0)
ffffffffc0202994:	12048073          	sfence.vma	s1
ffffffffc0202998:	70a2                	ld	ra,40(sp)
ffffffffc020299a:	7402                	ld	s0,32(sp)
ffffffffc020299c:	64e2                	ld	s1,24(sp)
ffffffffc020299e:	6145                	addi	sp,sp,48
ffffffffc02029a0:	8082                	ret
ffffffffc02029a2:	100027f3          	csrr	a5,sstatus
ffffffffc02029a6:	8b89                	andi	a5,a5,2
ffffffffc02029a8:	eb89                	bnez	a5,ffffffffc02029ba <page_remove+0x7c>
ffffffffc02029aa:	00094797          	auipc	a5,0x94
ffffffffc02029ae:	f067b783          	ld	a5,-250(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029b2:	739c                	ld	a5,32(a5)
ffffffffc02029b4:	4585                	li	a1,1
ffffffffc02029b6:	9782                	jalr	a5
ffffffffc02029b8:	bfe1                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029ba:	e42a                	sd	a0,8(sp)
ffffffffc02029bc:	ab6fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02029c0:	00094797          	auipc	a5,0x94
ffffffffc02029c4:	ef07b783          	ld	a5,-272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029c8:	739c                	ld	a5,32(a5)
ffffffffc02029ca:	6522                	ld	a0,8(sp)
ffffffffc02029cc:	4585                	li	a1,1
ffffffffc02029ce:	9782                	jalr	a5
ffffffffc02029d0:	a9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02029d4:	bf75                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029d6:	f5eff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02029da <page_insert>:
ffffffffc02029da:	7139                	addi	sp,sp,-64
ffffffffc02029dc:	e852                	sd	s4,16(sp)
ffffffffc02029de:	8a32                	mv	s4,a2
ffffffffc02029e0:	f822                	sd	s0,48(sp)
ffffffffc02029e2:	4605                	li	a2,1
ffffffffc02029e4:	842e                	mv	s0,a1
ffffffffc02029e6:	85d2                	mv	a1,s4
ffffffffc02029e8:	f426                	sd	s1,40(sp)
ffffffffc02029ea:	fc06                	sd	ra,56(sp)
ffffffffc02029ec:	f04a                	sd	s2,32(sp)
ffffffffc02029ee:	ec4e                	sd	s3,24(sp)
ffffffffc02029f0:	e456                	sd	s5,8(sp)
ffffffffc02029f2:	84b6                	mv	s1,a3
ffffffffc02029f4:	831ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029f8:	c961                	beqz	a0,ffffffffc0202ac8 <page_insert+0xee>
ffffffffc02029fa:	4014                	lw	a3,0(s0)
ffffffffc02029fc:	611c                	ld	a5,0(a0)
ffffffffc02029fe:	89aa                	mv	s3,a0
ffffffffc0202a00:	0016871b          	addiw	a4,a3,1
ffffffffc0202a04:	c018                	sw	a4,0(s0)
ffffffffc0202a06:	0017f713          	andi	a4,a5,1
ffffffffc0202a0a:	ef05                	bnez	a4,ffffffffc0202a42 <page_insert+0x68>
ffffffffc0202a0c:	00094717          	auipc	a4,0x94
ffffffffc0202a10:	e9c73703          	ld	a4,-356(a4) # ffffffffc02968a8 <pages>
ffffffffc0202a14:	8c19                	sub	s0,s0,a4
ffffffffc0202a16:	000807b7          	lui	a5,0x80
ffffffffc0202a1a:	8419                	srai	s0,s0,0x6
ffffffffc0202a1c:	943e                	add	s0,s0,a5
ffffffffc0202a1e:	042a                	slli	s0,s0,0xa
ffffffffc0202a20:	8cc1                	or	s1,s1,s0
ffffffffc0202a22:	0014e493          	ori	s1,s1,1
ffffffffc0202a26:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202a2a:	120a0073          	sfence.vma	s4
ffffffffc0202a2e:	4501                	li	a0,0
ffffffffc0202a30:	70e2                	ld	ra,56(sp)
ffffffffc0202a32:	7442                	ld	s0,48(sp)
ffffffffc0202a34:	74a2                	ld	s1,40(sp)
ffffffffc0202a36:	7902                	ld	s2,32(sp)
ffffffffc0202a38:	69e2                	ld	s3,24(sp)
ffffffffc0202a3a:	6a42                	ld	s4,16(sp)
ffffffffc0202a3c:	6aa2                	ld	s5,8(sp)
ffffffffc0202a3e:	6121                	addi	sp,sp,64
ffffffffc0202a40:	8082                	ret
ffffffffc0202a42:	078a                	slli	a5,a5,0x2
ffffffffc0202a44:	83b1                	srli	a5,a5,0xc
ffffffffc0202a46:	00094717          	auipc	a4,0x94
ffffffffc0202a4a:	e5a73703          	ld	a4,-422(a4) # ffffffffc02968a0 <npage>
ffffffffc0202a4e:	06e7ff63          	bgeu	a5,a4,ffffffffc0202acc <page_insert+0xf2>
ffffffffc0202a52:	00094a97          	auipc	s5,0x94
ffffffffc0202a56:	e56a8a93          	addi	s5,s5,-426 # ffffffffc02968a8 <pages>
ffffffffc0202a5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202a5e:	fff80937          	lui	s2,0xfff80
ffffffffc0202a62:	993e                	add	s2,s2,a5
ffffffffc0202a64:	091a                	slli	s2,s2,0x6
ffffffffc0202a66:	993a                	add	s2,s2,a4
ffffffffc0202a68:	01240c63          	beq	s0,s2,ffffffffc0202a80 <page_insert+0xa6>
ffffffffc0202a6c:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202a70:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202a74:	00d92023          	sw	a3,0(s2)
ffffffffc0202a78:	c691                	beqz	a3,ffffffffc0202a84 <page_insert+0xaa>
ffffffffc0202a7a:	120a0073          	sfence.vma	s4
ffffffffc0202a7e:	bf59                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a80:	c014                	sw	a3,0(s0)
ffffffffc0202a82:	bf49                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a84:	100027f3          	csrr	a5,sstatus
ffffffffc0202a88:	8b89                	andi	a5,a5,2
ffffffffc0202a8a:	ef91                	bnez	a5,ffffffffc0202aa6 <page_insert+0xcc>
ffffffffc0202a8c:	00094797          	auipc	a5,0x94
ffffffffc0202a90:	e247b783          	ld	a5,-476(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a94:	739c                	ld	a5,32(a5)
ffffffffc0202a96:	4585                	li	a1,1
ffffffffc0202a98:	854a                	mv	a0,s2
ffffffffc0202a9a:	9782                	jalr	a5
ffffffffc0202a9c:	000ab703          	ld	a4,0(s5)
ffffffffc0202aa0:	120a0073          	sfence.vma	s4
ffffffffc0202aa4:	bf85                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202aa6:	9ccfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202aaa:	00094797          	auipc	a5,0x94
ffffffffc0202aae:	e067b783          	ld	a5,-506(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202ab2:	739c                	ld	a5,32(a5)
ffffffffc0202ab4:	4585                	li	a1,1
ffffffffc0202ab6:	854a                	mv	a0,s2
ffffffffc0202ab8:	9782                	jalr	a5
ffffffffc0202aba:	9b2fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202abe:	000ab703          	ld	a4,0(s5)
ffffffffc0202ac2:	120a0073          	sfence.vma	s4
ffffffffc0202ac6:	b7b9                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202ac8:	5571                	li	a0,-4
ffffffffc0202aca:	b79d                	j	ffffffffc0202a30 <page_insert+0x56>
ffffffffc0202acc:	e68ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202ad0 <pmm_init>:
ffffffffc0202ad0:	0000a797          	auipc	a5,0xa
ffffffffc0202ad4:	99878793          	addi	a5,a5,-1640 # ffffffffc020c468 <default_pmm_manager>
ffffffffc0202ad8:	638c                	ld	a1,0(a5)
ffffffffc0202ada:	7159                	addi	sp,sp,-112
ffffffffc0202adc:	f85a                	sd	s6,48(sp)
ffffffffc0202ade:	0000a517          	auipc	a0,0xa
ffffffffc0202ae2:	b5a50513          	addi	a0,a0,-1190 # ffffffffc020c638 <default_pmm_manager+0x1d0>
ffffffffc0202ae6:	00094b17          	auipc	s6,0x94
ffffffffc0202aea:	dcab0b13          	addi	s6,s6,-566 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202aee:	f486                	sd	ra,104(sp)
ffffffffc0202af0:	e8ca                	sd	s2,80(sp)
ffffffffc0202af2:	e4ce                	sd	s3,72(sp)
ffffffffc0202af4:	f0a2                	sd	s0,96(sp)
ffffffffc0202af6:	eca6                	sd	s1,88(sp)
ffffffffc0202af8:	e0d2                	sd	s4,64(sp)
ffffffffc0202afa:	fc56                	sd	s5,56(sp)
ffffffffc0202afc:	f45e                	sd	s7,40(sp)
ffffffffc0202afe:	f062                	sd	s8,32(sp)
ffffffffc0202b00:	ec66                	sd	s9,24(sp)
ffffffffc0202b02:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b06:	ea0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b0a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b0e:	00094997          	auipc	s3,0x94
ffffffffc0202b12:	daa98993          	addi	s3,s3,-598 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202b16:	679c                	ld	a5,8(a5)
ffffffffc0202b18:	9782                	jalr	a5
ffffffffc0202b1a:	57f5                	li	a5,-3
ffffffffc0202b1c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b1e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b22:	f27fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202b26:	892a                	mv	s2,a0
ffffffffc0202b28:	f2bfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202b2c:	280502e3          	beqz	a0,ffffffffc02035b0 <pmm_init+0xae0>
ffffffffc0202b30:	84aa                	mv	s1,a0
ffffffffc0202b32:	0000a517          	auipc	a0,0xa
ffffffffc0202b36:	b3e50513          	addi	a0,a0,-1218 # ffffffffc020c670 <default_pmm_manager+0x208>
ffffffffc0202b3a:	e6cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b3e:	00990433          	add	s0,s2,s1
ffffffffc0202b42:	fff40693          	addi	a3,s0,-1
ffffffffc0202b46:	864a                	mv	a2,s2
ffffffffc0202b48:	85a6                	mv	a1,s1
ffffffffc0202b4a:	0000a517          	auipc	a0,0xa
ffffffffc0202b4e:	b3e50513          	addi	a0,a0,-1218 # ffffffffc020c688 <default_pmm_manager+0x220>
ffffffffc0202b52:	e54fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b56:	c8000737          	lui	a4,0xc8000
ffffffffc0202b5a:	87a2                	mv	a5,s0
ffffffffc0202b5c:	5e876e63          	bltu	a4,s0,ffffffffc0203158 <pmm_init+0x688>
ffffffffc0202b60:	757d                	lui	a0,0xfffff
ffffffffc0202b62:	00095617          	auipc	a2,0x95
ffffffffc0202b66:	dad60613          	addi	a2,a2,-595 # ffffffffc029790f <end+0xfff>
ffffffffc0202b6a:	8e69                	and	a2,a2,a0
ffffffffc0202b6c:	00094497          	auipc	s1,0x94
ffffffffc0202b70:	d3448493          	addi	s1,s1,-716 # ffffffffc02968a0 <npage>
ffffffffc0202b74:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202b78:	00094b97          	auipc	s7,0x94
ffffffffc0202b7c:	d30b8b93          	addi	s7,s7,-720 # ffffffffc02968a8 <pages>
ffffffffc0202b80:	e088                	sd	a0,0(s1)
ffffffffc0202b82:	00cbb023          	sd	a2,0(s7)
ffffffffc0202b86:	000807b7          	lui	a5,0x80
ffffffffc0202b8a:	86b2                	mv	a3,a2
ffffffffc0202b8c:	02f50863          	beq	a0,a5,ffffffffc0202bbc <pmm_init+0xec>
ffffffffc0202b90:	4781                	li	a5,0
ffffffffc0202b92:	4585                	li	a1,1
ffffffffc0202b94:	fff806b7          	lui	a3,0xfff80
ffffffffc0202b98:	00679513          	slli	a0,a5,0x6
ffffffffc0202b9c:	9532                	add	a0,a0,a2
ffffffffc0202b9e:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202ba2:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202ba6:	6088                	ld	a0,0(s1)
ffffffffc0202ba8:	0785                	addi	a5,a5,1
ffffffffc0202baa:	000bb603          	ld	a2,0(s7)
ffffffffc0202bae:	00d50733          	add	a4,a0,a3
ffffffffc0202bb2:	fee7e3e3          	bltu	a5,a4,ffffffffc0202b98 <pmm_init+0xc8>
ffffffffc0202bb6:	071a                	slli	a4,a4,0x6
ffffffffc0202bb8:	00e606b3          	add	a3,a2,a4
ffffffffc0202bbc:	c02007b7          	lui	a5,0xc0200
ffffffffc0202bc0:	3af6eae3          	bltu	a3,a5,ffffffffc0203774 <pmm_init+0xca4>
ffffffffc0202bc4:	0009b583          	ld	a1,0(s3)
ffffffffc0202bc8:	77fd                	lui	a5,0xfffff
ffffffffc0202bca:	8c7d                	and	s0,s0,a5
ffffffffc0202bcc:	8e8d                	sub	a3,a3,a1
ffffffffc0202bce:	5e86e363          	bltu	a3,s0,ffffffffc02031b4 <pmm_init+0x6e4>
ffffffffc0202bd2:	0000a517          	auipc	a0,0xa
ffffffffc0202bd6:	ade50513          	addi	a0,a0,-1314 # ffffffffc020c6b0 <default_pmm_manager+0x248>
ffffffffc0202bda:	dccfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bde:	000b3783          	ld	a5,0(s6)
ffffffffc0202be2:	7b9c                	ld	a5,48(a5)
ffffffffc0202be4:	9782                	jalr	a5
ffffffffc0202be6:	0000a517          	auipc	a0,0xa
ffffffffc0202bea:	ae250513          	addi	a0,a0,-1310 # ffffffffc020c6c8 <default_pmm_manager+0x260>
ffffffffc0202bee:	db8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bf2:	100027f3          	csrr	a5,sstatus
ffffffffc0202bf6:	8b89                	andi	a5,a5,2
ffffffffc0202bf8:	5a079363          	bnez	a5,ffffffffc020319e <pmm_init+0x6ce>
ffffffffc0202bfc:	000b3783          	ld	a5,0(s6)
ffffffffc0202c00:	4505                	li	a0,1
ffffffffc0202c02:	6f9c                	ld	a5,24(a5)
ffffffffc0202c04:	9782                	jalr	a5
ffffffffc0202c06:	842a                	mv	s0,a0
ffffffffc0202c08:	180408e3          	beqz	s0,ffffffffc0203598 <pmm_init+0xac8>
ffffffffc0202c0c:	000bb683          	ld	a3,0(s7)
ffffffffc0202c10:	5a7d                	li	s4,-1
ffffffffc0202c12:	6098                	ld	a4,0(s1)
ffffffffc0202c14:	40d406b3          	sub	a3,s0,a3
ffffffffc0202c18:	8699                	srai	a3,a3,0x6
ffffffffc0202c1a:	00080437          	lui	s0,0x80
ffffffffc0202c1e:	96a2                	add	a3,a3,s0
ffffffffc0202c20:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202c24:	8ff5                	and	a5,a5,a3
ffffffffc0202c26:	06b2                	slli	a3,a3,0xc
ffffffffc0202c28:	30e7fde3          	bgeu	a5,a4,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202c2c:	0009b403          	ld	s0,0(s3)
ffffffffc0202c30:	6605                	lui	a2,0x1
ffffffffc0202c32:	4581                	li	a1,0
ffffffffc0202c34:	9436                	add	s0,s0,a3
ffffffffc0202c36:	8522                	mv	a0,s0
ffffffffc0202c38:	063080ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0202c3c:	0009b683          	ld	a3,0(s3)
ffffffffc0202c40:	77fd                	lui	a5,0xfffff
ffffffffc0202c42:	0000a917          	auipc	s2,0xa
ffffffffc0202c46:	8c190913          	addi	s2,s2,-1855 # ffffffffc020c503 <default_pmm_manager+0x9b>
ffffffffc0202c4a:	00f97933          	and	s2,s2,a5
ffffffffc0202c4e:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202c52:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202c56:	964a                	add	a2,a2,s2
ffffffffc0202c58:	4729                	li	a4,10
ffffffffc0202c5a:	40da86b3          	sub	a3,s5,a3
ffffffffc0202c5e:	c02005b7          	lui	a1,0xc0200
ffffffffc0202c62:	8522                	mv	a0,s0
ffffffffc0202c64:	fe8ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c68:	c8000637          	lui	a2,0xc8000
ffffffffc0202c6c:	41260633          	sub	a2,a2,s2
ffffffffc0202c70:	3f596ce3          	bltu	s2,s5,ffffffffc0203868 <pmm_init+0xd98>
ffffffffc0202c74:	0009b683          	ld	a3,0(s3)
ffffffffc0202c78:	85ca                	mv	a1,s2
ffffffffc0202c7a:	4719                	li	a4,6
ffffffffc0202c7c:	40d906b3          	sub	a3,s2,a3
ffffffffc0202c80:	8522                	mv	a0,s0
ffffffffc0202c82:	00094917          	auipc	s2,0x94
ffffffffc0202c86:	c1690913          	addi	s2,s2,-1002 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202c8a:	fc2ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c8e:	00893023          	sd	s0,0(s2)
ffffffffc0202c92:	2d5464e3          	bltu	s0,s5,ffffffffc020375a <pmm_init+0xc8a>
ffffffffc0202c96:	0009b783          	ld	a5,0(s3)
ffffffffc0202c9a:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202c9c:	8c1d                	sub	s0,s0,a5
ffffffffc0202c9e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202ca2:	00094717          	auipc	a4,0x94
ffffffffc0202ca6:	be873723          	sd	s0,-1042(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202caa:	0147ea33          	or	s4,a5,s4
ffffffffc0202cae:	180a1073          	csrw	satp,s4
ffffffffc0202cb2:	12000073          	sfence.vma
ffffffffc0202cb6:	0000a517          	auipc	a0,0xa
ffffffffc0202cba:	a5250513          	addi	a0,a0,-1454 # ffffffffc020c708 <default_pmm_manager+0x2a0>
ffffffffc0202cbe:	ce8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc2:	0000e717          	auipc	a4,0xe
ffffffffc0202cc6:	33e70713          	addi	a4,a4,830 # ffffffffc0211000 <bootstack>
ffffffffc0202cca:	0000e797          	auipc	a5,0xe
ffffffffc0202cce:	33678793          	addi	a5,a5,822 # ffffffffc0211000 <bootstack>
ffffffffc0202cd2:	5cf70d63          	beq	a4,a5,ffffffffc02032ac <pmm_init+0x7dc>
ffffffffc0202cd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202cda:	8b89                	andi	a5,a5,2
ffffffffc0202cdc:	4a079763          	bnez	a5,ffffffffc020318a <pmm_init+0x6ba>
ffffffffc0202ce0:	000b3783          	ld	a5,0(s6)
ffffffffc0202ce4:	779c                	ld	a5,40(a5)
ffffffffc0202ce6:	9782                	jalr	a5
ffffffffc0202ce8:	842a                	mv	s0,a0
ffffffffc0202cea:	6098                	ld	a4,0(s1)
ffffffffc0202cec:	c80007b7          	lui	a5,0xc8000
ffffffffc0202cf0:	83b1                	srli	a5,a5,0xc
ffffffffc0202cf2:	08e7e3e3          	bltu	a5,a4,ffffffffc0203578 <pmm_init+0xaa8>
ffffffffc0202cf6:	00093503          	ld	a0,0(s2)
ffffffffc0202cfa:	04050fe3          	beqz	a0,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202cfe:	03451793          	slli	a5,a0,0x34
ffffffffc0202d02:	04079be3          	bnez	a5,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202d06:	4601                	li	a2,0
ffffffffc0202d08:	4581                	li	a1,0
ffffffffc0202d0a:	809ff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202d0e:	2e0511e3          	bnez	a0,ffffffffc02037f0 <pmm_init+0xd20>
ffffffffc0202d12:	100027f3          	csrr	a5,sstatus
ffffffffc0202d16:	8b89                	andi	a5,a5,2
ffffffffc0202d18:	44079e63          	bnez	a5,ffffffffc0203174 <pmm_init+0x6a4>
ffffffffc0202d1c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d20:	4505                	li	a0,1
ffffffffc0202d22:	6f9c                	ld	a5,24(a5)
ffffffffc0202d24:	9782                	jalr	a5
ffffffffc0202d26:	8a2a                	mv	s4,a0
ffffffffc0202d28:	00093503          	ld	a0,0(s2)
ffffffffc0202d2c:	4681                	li	a3,0
ffffffffc0202d2e:	4601                	li	a2,0
ffffffffc0202d30:	85d2                	mv	a1,s4
ffffffffc0202d32:	ca9ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202d36:	26051be3          	bnez	a0,ffffffffc02037ac <pmm_init+0xcdc>
ffffffffc0202d3a:	00093503          	ld	a0,0(s2)
ffffffffc0202d3e:	4601                	li	a2,0
ffffffffc0202d40:	4581                	li	a1,0
ffffffffc0202d42:	ce2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202d46:	280505e3          	beqz	a0,ffffffffc02037d0 <pmm_init+0xd00>
ffffffffc0202d4a:	611c                	ld	a5,0(a0)
ffffffffc0202d4c:	0017f713          	andi	a4,a5,1
ffffffffc0202d50:	26070ee3          	beqz	a4,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202d54:	6098                	ld	a4,0(s1)
ffffffffc0202d56:	078a                	slli	a5,a5,0x2
ffffffffc0202d58:	83b1                	srli	a5,a5,0xc
ffffffffc0202d5a:	62e7f363          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202d5e:	000bb683          	ld	a3,0(s7)
ffffffffc0202d62:	fff80637          	lui	a2,0xfff80
ffffffffc0202d66:	97b2                	add	a5,a5,a2
ffffffffc0202d68:	079a                	slli	a5,a5,0x6
ffffffffc0202d6a:	97b6                	add	a5,a5,a3
ffffffffc0202d6c:	2afa12e3          	bne	s4,a5,ffffffffc0203810 <pmm_init+0xd40>
ffffffffc0202d70:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202d74:	4785                	li	a5,1
ffffffffc0202d76:	2cf699e3          	bne	a3,a5,ffffffffc0203848 <pmm_init+0xd78>
ffffffffc0202d7a:	00093503          	ld	a0,0(s2)
ffffffffc0202d7e:	77fd                	lui	a5,0xfffff
ffffffffc0202d80:	6114                	ld	a3,0(a0)
ffffffffc0202d82:	068a                	slli	a3,a3,0x2
ffffffffc0202d84:	8efd                	and	a3,a3,a5
ffffffffc0202d86:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202d8a:	2ae673e3          	bgeu	a2,a4,ffffffffc0203830 <pmm_init+0xd60>
ffffffffc0202d8e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202d92:	96e2                	add	a3,a3,s8
ffffffffc0202d94:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202d98:	0a8a                	slli	s5,s5,0x2
ffffffffc0202d9a:	00fafab3          	and	s5,s5,a5
ffffffffc0202d9e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202da2:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203608 <pmm_init+0xb38>
ffffffffc0202da6:	4601                	li	a2,0
ffffffffc0202da8:	6585                	lui	a1,0x1
ffffffffc0202daa:	9ae2                	add	s5,s5,s8
ffffffffc0202dac:	c78ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202db0:	0aa1                	addi	s5,s5,8
ffffffffc0202db2:	03551be3          	bne	a0,s5,ffffffffc02035e8 <pmm_init+0xb18>
ffffffffc0202db6:	100027f3          	csrr	a5,sstatus
ffffffffc0202dba:	8b89                	andi	a5,a5,2
ffffffffc0202dbc:	3a079163          	bnez	a5,ffffffffc020315e <pmm_init+0x68e>
ffffffffc0202dc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202dc4:	4505                	li	a0,1
ffffffffc0202dc6:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc8:	9782                	jalr	a5
ffffffffc0202dca:	8c2a                	mv	s8,a0
ffffffffc0202dcc:	00093503          	ld	a0,0(s2)
ffffffffc0202dd0:	46d1                	li	a3,20
ffffffffc0202dd2:	6605                	lui	a2,0x1
ffffffffc0202dd4:	85e2                	mv	a1,s8
ffffffffc0202dd6:	c05ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202dda:	1a0519e3          	bnez	a0,ffffffffc020378c <pmm_init+0xcbc>
ffffffffc0202dde:	00093503          	ld	a0,0(s2)
ffffffffc0202de2:	4601                	li	a2,0
ffffffffc0202de4:	6585                	lui	a1,0x1
ffffffffc0202de6:	c3eff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202dea:	10050ce3          	beqz	a0,ffffffffc0203702 <pmm_init+0xc32>
ffffffffc0202dee:	611c                	ld	a5,0(a0)
ffffffffc0202df0:	0107f713          	andi	a4,a5,16
ffffffffc0202df4:	0e0707e3          	beqz	a4,ffffffffc02036e2 <pmm_init+0xc12>
ffffffffc0202df8:	8b91                	andi	a5,a5,4
ffffffffc0202dfa:	0c0784e3          	beqz	a5,ffffffffc02036c2 <pmm_init+0xbf2>
ffffffffc0202dfe:	00093503          	ld	a0,0(s2)
ffffffffc0202e02:	611c                	ld	a5,0(a0)
ffffffffc0202e04:	8bc1                	andi	a5,a5,16
ffffffffc0202e06:	08078ee3          	beqz	a5,ffffffffc02036a2 <pmm_init+0xbd2>
ffffffffc0202e0a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e0e:	4785                	li	a5,1
ffffffffc0202e10:	06f719e3          	bne	a4,a5,ffffffffc0203682 <pmm_init+0xbb2>
ffffffffc0202e14:	4681                	li	a3,0
ffffffffc0202e16:	6605                	lui	a2,0x1
ffffffffc0202e18:	85d2                	mv	a1,s4
ffffffffc0202e1a:	bc1ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202e1e:	040512e3          	bnez	a0,ffffffffc0203662 <pmm_init+0xb92>
ffffffffc0202e22:	000a2703          	lw	a4,0(s4)
ffffffffc0202e26:	4789                	li	a5,2
ffffffffc0202e28:	00f71de3          	bne	a4,a5,ffffffffc0203642 <pmm_init+0xb72>
ffffffffc0202e2c:	000c2783          	lw	a5,0(s8)
ffffffffc0202e30:	7e079963          	bnez	a5,ffffffffc0203622 <pmm_init+0xb52>
ffffffffc0202e34:	00093503          	ld	a0,0(s2)
ffffffffc0202e38:	4601                	li	a2,0
ffffffffc0202e3a:	6585                	lui	a1,0x1
ffffffffc0202e3c:	be8ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202e40:	54050263          	beqz	a0,ffffffffc0203384 <pmm_init+0x8b4>
ffffffffc0202e44:	6118                	ld	a4,0(a0)
ffffffffc0202e46:	00177793          	andi	a5,a4,1
ffffffffc0202e4a:	180781e3          	beqz	a5,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202e4e:	6094                	ld	a3,0(s1)
ffffffffc0202e50:	00271793          	slli	a5,a4,0x2
ffffffffc0202e54:	83b1                	srli	a5,a5,0xc
ffffffffc0202e56:	52d7f563          	bgeu	a5,a3,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202e5a:	000bb683          	ld	a3,0(s7)
ffffffffc0202e5e:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202e62:	97d6                	add	a5,a5,s5
ffffffffc0202e64:	079a                	slli	a5,a5,0x6
ffffffffc0202e66:	97b6                	add	a5,a5,a3
ffffffffc0202e68:	58fa1e63          	bne	s4,a5,ffffffffc0203404 <pmm_init+0x934>
ffffffffc0202e6c:	8b41                	andi	a4,a4,16
ffffffffc0202e6e:	56071b63          	bnez	a4,ffffffffc02033e4 <pmm_init+0x914>
ffffffffc0202e72:	00093503          	ld	a0,0(s2)
ffffffffc0202e76:	4581                	li	a1,0
ffffffffc0202e78:	ac7ff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e7c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202e80:	4785                	li	a5,1
ffffffffc0202e82:	5cfc9163          	bne	s9,a5,ffffffffc0203444 <pmm_init+0x974>
ffffffffc0202e86:	000c2783          	lw	a5,0(s8)
ffffffffc0202e8a:	58079d63          	bnez	a5,ffffffffc0203424 <pmm_init+0x954>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	6585                	lui	a1,0x1
ffffffffc0202e94:	aabff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e98:	000a2783          	lw	a5,0(s4)
ffffffffc0202e9c:	200793e3          	bnez	a5,ffffffffc02038a2 <pmm_init+0xdd2>
ffffffffc0202ea0:	000c2783          	lw	a5,0(s8)
ffffffffc0202ea4:	1c079fe3          	bnez	a5,ffffffffc0203882 <pmm_init+0xdb2>
ffffffffc0202ea8:	00093a03          	ld	s4,0(s2)
ffffffffc0202eac:	608c                	ld	a1,0(s1)
ffffffffc0202eae:	000a3683          	ld	a3,0(s4)
ffffffffc0202eb2:	068a                	slli	a3,a3,0x2
ffffffffc0202eb4:	82b1                	srli	a3,a3,0xc
ffffffffc0202eb6:	4cb6f563          	bgeu	a3,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202eba:	000bb503          	ld	a0,0(s7)
ffffffffc0202ebe:	96d6                	add	a3,a3,s5
ffffffffc0202ec0:	069a                	slli	a3,a3,0x6
ffffffffc0202ec2:	00d507b3          	add	a5,a0,a3
ffffffffc0202ec6:	439c                	lw	a5,0(a5)
ffffffffc0202ec8:	4f979e63          	bne	a5,s9,ffffffffc02033c4 <pmm_init+0x8f4>
ffffffffc0202ecc:	8699                	srai	a3,a3,0x6
ffffffffc0202ece:	00080637          	lui	a2,0x80
ffffffffc0202ed2:	96b2                	add	a3,a3,a2
ffffffffc0202ed4:	00c69713          	slli	a4,a3,0xc
ffffffffc0202ed8:	8331                	srli	a4,a4,0xc
ffffffffc0202eda:	06b2                	slli	a3,a3,0xc
ffffffffc0202edc:	06b773e3          	bgeu	a4,a1,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202ee0:	0009b703          	ld	a4,0(s3)
ffffffffc0202ee4:	96ba                	add	a3,a3,a4
ffffffffc0202ee6:	629c                	ld	a5,0(a3)
ffffffffc0202ee8:	078a                	slli	a5,a5,0x2
ffffffffc0202eea:	83b1                	srli	a5,a5,0xc
ffffffffc0202eec:	48b7fa63          	bgeu	a5,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202ef0:	8f91                	sub	a5,a5,a2
ffffffffc0202ef2:	079a                	slli	a5,a5,0x6
ffffffffc0202ef4:	953e                	add	a0,a0,a5
ffffffffc0202ef6:	100027f3          	csrr	a5,sstatus
ffffffffc0202efa:	8b89                	andi	a5,a5,2
ffffffffc0202efc:	32079463          	bnez	a5,ffffffffc0203224 <pmm_init+0x754>
ffffffffc0202f00:	000b3783          	ld	a5,0(s6)
ffffffffc0202f04:	4585                	li	a1,1
ffffffffc0202f06:	739c                	ld	a5,32(a5)
ffffffffc0202f08:	9782                	jalr	a5
ffffffffc0202f0a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f0e:	6098                	ld	a4,0(s1)
ffffffffc0202f10:	078a                	slli	a5,a5,0x2
ffffffffc0202f12:	83b1                	srli	a5,a5,0xc
ffffffffc0202f14:	46e7f663          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202f18:	000bb503          	ld	a0,0(s7)
ffffffffc0202f1c:	fff80737          	lui	a4,0xfff80
ffffffffc0202f20:	97ba                	add	a5,a5,a4
ffffffffc0202f22:	079a                	slli	a5,a5,0x6
ffffffffc0202f24:	953e                	add	a0,a0,a5
ffffffffc0202f26:	100027f3          	csrr	a5,sstatus
ffffffffc0202f2a:	8b89                	andi	a5,a5,2
ffffffffc0202f2c:	2e079063          	bnez	a5,ffffffffc020320c <pmm_init+0x73c>
ffffffffc0202f30:	000b3783          	ld	a5,0(s6)
ffffffffc0202f34:	4585                	li	a1,1
ffffffffc0202f36:	739c                	ld	a5,32(a5)
ffffffffc0202f38:	9782                	jalr	a5
ffffffffc0202f3a:	00093783          	ld	a5,0(s2)
ffffffffc0202f3e:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202f42:	12000073          	sfence.vma
ffffffffc0202f46:	100027f3          	csrr	a5,sstatus
ffffffffc0202f4a:	8b89                	andi	a5,a5,2
ffffffffc0202f4c:	2a079663          	bnez	a5,ffffffffc02031f8 <pmm_init+0x728>
ffffffffc0202f50:	000b3783          	ld	a5,0(s6)
ffffffffc0202f54:	779c                	ld	a5,40(a5)
ffffffffc0202f56:	9782                	jalr	a5
ffffffffc0202f58:	8a2a                	mv	s4,a0
ffffffffc0202f5a:	7d441463          	bne	s0,s4,ffffffffc0203722 <pmm_init+0xc52>
ffffffffc0202f5e:	0000a517          	auipc	a0,0xa
ffffffffc0202f62:	b0250513          	addi	a0,a0,-1278 # ffffffffc020ca60 <default_pmm_manager+0x5f8>
ffffffffc0202f66:	a40fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202f6a:	100027f3          	csrr	a5,sstatus
ffffffffc0202f6e:	8b89                	andi	a5,a5,2
ffffffffc0202f70:	26079a63          	bnez	a5,ffffffffc02031e4 <pmm_init+0x714>
ffffffffc0202f74:	000b3783          	ld	a5,0(s6)
ffffffffc0202f78:	779c                	ld	a5,40(a5)
ffffffffc0202f7a:	9782                	jalr	a5
ffffffffc0202f7c:	8c2a                	mv	s8,a0
ffffffffc0202f7e:	6098                	ld	a4,0(s1)
ffffffffc0202f80:	c0200437          	lui	s0,0xc0200
ffffffffc0202f84:	7afd                	lui	s5,0xfffff
ffffffffc0202f86:	00c71793          	slli	a5,a4,0xc
ffffffffc0202f8a:	6a05                	lui	s4,0x1
ffffffffc0202f8c:	02f47c63          	bgeu	s0,a5,ffffffffc0202fc4 <pmm_init+0x4f4>
ffffffffc0202f90:	00c45793          	srli	a5,s0,0xc
ffffffffc0202f94:	00093503          	ld	a0,0(s2)
ffffffffc0202f98:	3ae7f763          	bgeu	a5,a4,ffffffffc0203346 <pmm_init+0x876>
ffffffffc0202f9c:	0009b583          	ld	a1,0(s3)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	95a2                	add	a1,a1,s0
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	36050f63          	beqz	a0,ffffffffc0203326 <pmm_init+0x856>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	078a                	slli	a5,a5,0x2
ffffffffc0202fb0:	0157f7b3          	and	a5,a5,s5
ffffffffc0202fb4:	3a879663          	bne	a5,s0,ffffffffc0203360 <pmm_init+0x890>
ffffffffc0202fb8:	6098                	ld	a4,0(s1)
ffffffffc0202fba:	9452                	add	s0,s0,s4
ffffffffc0202fbc:	00c71793          	slli	a5,a4,0xc
ffffffffc0202fc0:	fcf468e3          	bltu	s0,a5,ffffffffc0202f90 <pmm_init+0x4c0>
ffffffffc0202fc4:	00093783          	ld	a5,0(s2)
ffffffffc0202fc8:	639c                	ld	a5,0(a5)
ffffffffc0202fca:	48079d63          	bnez	a5,ffffffffc0203464 <pmm_init+0x994>
ffffffffc0202fce:	100027f3          	csrr	a5,sstatus
ffffffffc0202fd2:	8b89                	andi	a5,a5,2
ffffffffc0202fd4:	26079463          	bnez	a5,ffffffffc020323c <pmm_init+0x76c>
ffffffffc0202fd8:	000b3783          	ld	a5,0(s6)
ffffffffc0202fdc:	4505                	li	a0,1
ffffffffc0202fde:	6f9c                	ld	a5,24(a5)
ffffffffc0202fe0:	9782                	jalr	a5
ffffffffc0202fe2:	8a2a                	mv	s4,a0
ffffffffc0202fe4:	00093503          	ld	a0,0(s2)
ffffffffc0202fe8:	4699                	li	a3,6
ffffffffc0202fea:	10000613          	li	a2,256
ffffffffc0202fee:	85d2                	mv	a1,s4
ffffffffc0202ff0:	9ebff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202ff4:	4a051863          	bnez	a0,ffffffffc02034a4 <pmm_init+0x9d4>
ffffffffc0202ff8:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202ffc:	4785                	li	a5,1
ffffffffc0202ffe:	48f71363          	bne	a4,a5,ffffffffc0203484 <pmm_init+0x9b4>
ffffffffc0203002:	00093503          	ld	a0,0(s2)
ffffffffc0203006:	6405                	lui	s0,0x1
ffffffffc0203008:	4699                	li	a3,6
ffffffffc020300a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020300e:	85d2                	mv	a1,s4
ffffffffc0203010:	9cbff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203014:	38051863          	bnez	a0,ffffffffc02033a4 <pmm_init+0x8d4>
ffffffffc0203018:	000a2703          	lw	a4,0(s4)
ffffffffc020301c:	4789                	li	a5,2
ffffffffc020301e:	4ef71363          	bne	a4,a5,ffffffffc0203504 <pmm_init+0xa34>
ffffffffc0203022:	0000a597          	auipc	a1,0xa
ffffffffc0203026:	b8658593          	addi	a1,a1,-1146 # ffffffffc020cba8 <default_pmm_manager+0x740>
ffffffffc020302a:	10000513          	li	a0,256
ffffffffc020302e:	400080ef          	jal	ra,ffffffffc020b42e <strcpy>
ffffffffc0203032:	10040593          	addi	a1,s0,256
ffffffffc0203036:	10000513          	li	a0,256
ffffffffc020303a:	406080ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc020303e:	4a051363          	bnez	a0,ffffffffc02034e4 <pmm_init+0xa14>
ffffffffc0203042:	000bb683          	ld	a3,0(s7)
ffffffffc0203046:	00080737          	lui	a4,0x80
ffffffffc020304a:	547d                	li	s0,-1
ffffffffc020304c:	40da06b3          	sub	a3,s4,a3
ffffffffc0203050:	8699                	srai	a3,a3,0x6
ffffffffc0203052:	609c                	ld	a5,0(s1)
ffffffffc0203054:	96ba                	add	a3,a3,a4
ffffffffc0203056:	8031                	srli	s0,s0,0xc
ffffffffc0203058:	0086f733          	and	a4,a3,s0
ffffffffc020305c:	06b2                	slli	a3,a3,0xc
ffffffffc020305e:	6ef77263          	bgeu	a4,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203062:	0009b783          	ld	a5,0(s3)
ffffffffc0203066:	10000513          	li	a0,256
ffffffffc020306a:	96be                	add	a3,a3,a5
ffffffffc020306c:	10068023          	sb	zero,256(a3)
ffffffffc0203070:	388080ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc0203074:	44051863          	bnez	a0,ffffffffc02034c4 <pmm_init+0x9f4>
ffffffffc0203078:	00093a83          	ld	s5,0(s2)
ffffffffc020307c:	609c                	ld	a5,0(s1)
ffffffffc020307e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203082:	068a                	slli	a3,a3,0x2
ffffffffc0203084:	82b1                	srli	a3,a3,0xc
ffffffffc0203086:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc020308a:	8c75                	and	s0,s0,a3
ffffffffc020308c:	06b2                	slli	a3,a3,0xc
ffffffffc020308e:	6af47a63          	bgeu	s0,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203092:	0009b403          	ld	s0,0(s3)
ffffffffc0203096:	9436                	add	s0,s0,a3
ffffffffc0203098:	100027f3          	csrr	a5,sstatus
ffffffffc020309c:	8b89                	andi	a5,a5,2
ffffffffc020309e:	1e079c63          	bnez	a5,ffffffffc0203296 <pmm_init+0x7c6>
ffffffffc02030a2:	000b3783          	ld	a5,0(s6)
ffffffffc02030a6:	4585                	li	a1,1
ffffffffc02030a8:	8552                	mv	a0,s4
ffffffffc02030aa:	739c                	ld	a5,32(a5)
ffffffffc02030ac:	9782                	jalr	a5
ffffffffc02030ae:	601c                	ld	a5,0(s0)
ffffffffc02030b0:	6098                	ld	a4,0(s1)
ffffffffc02030b2:	078a                	slli	a5,a5,0x2
ffffffffc02030b4:	83b1                	srli	a5,a5,0xc
ffffffffc02030b6:	2ce7f563          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ba:	000bb503          	ld	a0,0(s7)
ffffffffc02030be:	fff80737          	lui	a4,0xfff80
ffffffffc02030c2:	97ba                	add	a5,a5,a4
ffffffffc02030c4:	079a                	slli	a5,a5,0x6
ffffffffc02030c6:	953e                	add	a0,a0,a5
ffffffffc02030c8:	100027f3          	csrr	a5,sstatus
ffffffffc02030cc:	8b89                	andi	a5,a5,2
ffffffffc02030ce:	1a079863          	bnez	a5,ffffffffc020327e <pmm_init+0x7ae>
ffffffffc02030d2:	000b3783          	ld	a5,0(s6)
ffffffffc02030d6:	4585                	li	a1,1
ffffffffc02030d8:	739c                	ld	a5,32(a5)
ffffffffc02030da:	9782                	jalr	a5
ffffffffc02030dc:	000ab783          	ld	a5,0(s5)
ffffffffc02030e0:	6098                	ld	a4,0(s1)
ffffffffc02030e2:	078a                	slli	a5,a5,0x2
ffffffffc02030e4:	83b1                	srli	a5,a5,0xc
ffffffffc02030e6:	28e7fd63          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ea:	000bb503          	ld	a0,0(s7)
ffffffffc02030ee:	fff80737          	lui	a4,0xfff80
ffffffffc02030f2:	97ba                	add	a5,a5,a4
ffffffffc02030f4:	079a                	slli	a5,a5,0x6
ffffffffc02030f6:	953e                	add	a0,a0,a5
ffffffffc02030f8:	100027f3          	csrr	a5,sstatus
ffffffffc02030fc:	8b89                	andi	a5,a5,2
ffffffffc02030fe:	16079463          	bnez	a5,ffffffffc0203266 <pmm_init+0x796>
ffffffffc0203102:	000b3783          	ld	a5,0(s6)
ffffffffc0203106:	4585                	li	a1,1
ffffffffc0203108:	739c                	ld	a5,32(a5)
ffffffffc020310a:	9782                	jalr	a5
ffffffffc020310c:	00093783          	ld	a5,0(s2)
ffffffffc0203110:	0007b023          	sd	zero,0(a5)
ffffffffc0203114:	12000073          	sfence.vma
ffffffffc0203118:	100027f3          	csrr	a5,sstatus
ffffffffc020311c:	8b89                	andi	a5,a5,2
ffffffffc020311e:	12079a63          	bnez	a5,ffffffffc0203252 <pmm_init+0x782>
ffffffffc0203122:	000b3783          	ld	a5,0(s6)
ffffffffc0203126:	779c                	ld	a5,40(a5)
ffffffffc0203128:	9782                	jalr	a5
ffffffffc020312a:	842a                	mv	s0,a0
ffffffffc020312c:	488c1e63          	bne	s8,s0,ffffffffc02035c8 <pmm_init+0xaf8>
ffffffffc0203130:	0000a517          	auipc	a0,0xa
ffffffffc0203134:	af050513          	addi	a0,a0,-1296 # ffffffffc020cc20 <default_pmm_manager+0x7b8>
ffffffffc0203138:	86efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020313c:	7406                	ld	s0,96(sp)
ffffffffc020313e:	70a6                	ld	ra,104(sp)
ffffffffc0203140:	64e6                	ld	s1,88(sp)
ffffffffc0203142:	6946                	ld	s2,80(sp)
ffffffffc0203144:	69a6                	ld	s3,72(sp)
ffffffffc0203146:	6a06                	ld	s4,64(sp)
ffffffffc0203148:	7ae2                	ld	s5,56(sp)
ffffffffc020314a:	7b42                	ld	s6,48(sp)
ffffffffc020314c:	7ba2                	ld	s7,40(sp)
ffffffffc020314e:	7c02                	ld	s8,32(sp)
ffffffffc0203150:	6ce2                	ld	s9,24(sp)
ffffffffc0203152:	6165                	addi	sp,sp,112
ffffffffc0203154:	e17fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203158:	c80007b7          	lui	a5,0xc8000
ffffffffc020315c:	b411                	j	ffffffffc0202b60 <pmm_init+0x90>
ffffffffc020315e:	b15fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4505                	li	a0,1
ffffffffc0203168:	6f9c                	ld	a5,24(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	8c2a                	mv	s8,a0
ffffffffc020316e:	afffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203172:	b9a9                	j	ffffffffc0202dcc <pmm_init+0x2fc>
ffffffffc0203174:	afffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203178:	000b3783          	ld	a5,0(s6)
ffffffffc020317c:	4505                	li	a0,1
ffffffffc020317e:	6f9c                	ld	a5,24(a5)
ffffffffc0203180:	9782                	jalr	a5
ffffffffc0203182:	8a2a                	mv	s4,a0
ffffffffc0203184:	ae9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203188:	b645                	j	ffffffffc0202d28 <pmm_init+0x258>
ffffffffc020318a:	ae9fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020318e:	000b3783          	ld	a5,0(s6)
ffffffffc0203192:	779c                	ld	a5,40(a5)
ffffffffc0203194:	9782                	jalr	a5
ffffffffc0203196:	842a                	mv	s0,a0
ffffffffc0203198:	ad5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020319c:	b6b9                	j	ffffffffc0202cea <pmm_init+0x21a>
ffffffffc020319e:	ad5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031a2:	000b3783          	ld	a5,0(s6)
ffffffffc02031a6:	4505                	li	a0,1
ffffffffc02031a8:	6f9c                	ld	a5,24(a5)
ffffffffc02031aa:	9782                	jalr	a5
ffffffffc02031ac:	842a                	mv	s0,a0
ffffffffc02031ae:	abffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031b2:	bc99                	j	ffffffffc0202c08 <pmm_init+0x138>
ffffffffc02031b4:	6705                	lui	a4,0x1
ffffffffc02031b6:	177d                	addi	a4,a4,-1
ffffffffc02031b8:	96ba                	add	a3,a3,a4
ffffffffc02031ba:	8ff5                	and	a5,a5,a3
ffffffffc02031bc:	00c7d713          	srli	a4,a5,0xc
ffffffffc02031c0:	1ca77063          	bgeu	a4,a0,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02031c4:	000b3683          	ld	a3,0(s6)
ffffffffc02031c8:	fff80537          	lui	a0,0xfff80
ffffffffc02031cc:	972a                	add	a4,a4,a0
ffffffffc02031ce:	6a94                	ld	a3,16(a3)
ffffffffc02031d0:	8c1d                	sub	s0,s0,a5
ffffffffc02031d2:	00671513          	slli	a0,a4,0x6
ffffffffc02031d6:	00c45593          	srli	a1,s0,0xc
ffffffffc02031da:	9532                	add	a0,a0,a2
ffffffffc02031dc:	9682                	jalr	a3
ffffffffc02031de:	0009b583          	ld	a1,0(s3)
ffffffffc02031e2:	bac5                	j	ffffffffc0202bd2 <pmm_init+0x102>
ffffffffc02031e4:	a8ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031e8:	000b3783          	ld	a5,0(s6)
ffffffffc02031ec:	779c                	ld	a5,40(a5)
ffffffffc02031ee:	9782                	jalr	a5
ffffffffc02031f0:	8c2a                	mv	s8,a0
ffffffffc02031f2:	a7bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031f6:	b361                	j	ffffffffc0202f7e <pmm_init+0x4ae>
ffffffffc02031f8:	a7bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203200:	779c                	ld	a5,40(a5)
ffffffffc0203202:	9782                	jalr	a5
ffffffffc0203204:	8a2a                	mv	s4,a0
ffffffffc0203206:	a67fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020320a:	bb81                	j	ffffffffc0202f5a <pmm_init+0x48a>
ffffffffc020320c:	e42a                	sd	a0,8(sp)
ffffffffc020320e:	a65fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203212:	000b3783          	ld	a5,0(s6)
ffffffffc0203216:	6522                	ld	a0,8(sp)
ffffffffc0203218:	4585                	li	a1,1
ffffffffc020321a:	739c                	ld	a5,32(a5)
ffffffffc020321c:	9782                	jalr	a5
ffffffffc020321e:	a4ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203222:	bb21                	j	ffffffffc0202f3a <pmm_init+0x46a>
ffffffffc0203224:	e42a                	sd	a0,8(sp)
ffffffffc0203226:	a4dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020322a:	000b3783          	ld	a5,0(s6)
ffffffffc020322e:	6522                	ld	a0,8(sp)
ffffffffc0203230:	4585                	li	a1,1
ffffffffc0203232:	739c                	ld	a5,32(a5)
ffffffffc0203234:	9782                	jalr	a5
ffffffffc0203236:	a37fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020323a:	b9c1                	j	ffffffffc0202f0a <pmm_init+0x43a>
ffffffffc020323c:	a37fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203240:	000b3783          	ld	a5,0(s6)
ffffffffc0203244:	4505                	li	a0,1
ffffffffc0203246:	6f9c                	ld	a5,24(a5)
ffffffffc0203248:	9782                	jalr	a5
ffffffffc020324a:	8a2a                	mv	s4,a0
ffffffffc020324c:	a21fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203250:	bb51                	j	ffffffffc0202fe4 <pmm_init+0x514>
ffffffffc0203252:	a21fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203256:	000b3783          	ld	a5,0(s6)
ffffffffc020325a:	779c                	ld	a5,40(a5)
ffffffffc020325c:	9782                	jalr	a5
ffffffffc020325e:	842a                	mv	s0,a0
ffffffffc0203260:	a0dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203264:	b5e1                	j	ffffffffc020312c <pmm_init+0x65c>
ffffffffc0203266:	e42a                	sd	a0,8(sp)
ffffffffc0203268:	a0bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020326c:	000b3783          	ld	a5,0(s6)
ffffffffc0203270:	6522                	ld	a0,8(sp)
ffffffffc0203272:	4585                	li	a1,1
ffffffffc0203274:	739c                	ld	a5,32(a5)
ffffffffc0203276:	9782                	jalr	a5
ffffffffc0203278:	9f5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020327c:	bd41                	j	ffffffffc020310c <pmm_init+0x63c>
ffffffffc020327e:	e42a                	sd	a0,8(sp)
ffffffffc0203280:	9f3fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203284:	000b3783          	ld	a5,0(s6)
ffffffffc0203288:	6522                	ld	a0,8(sp)
ffffffffc020328a:	4585                	li	a1,1
ffffffffc020328c:	739c                	ld	a5,32(a5)
ffffffffc020328e:	9782                	jalr	a5
ffffffffc0203290:	9ddfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203294:	b5a1                	j	ffffffffc02030dc <pmm_init+0x60c>
ffffffffc0203296:	9ddfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020329a:	000b3783          	ld	a5,0(s6)
ffffffffc020329e:	4585                	li	a1,1
ffffffffc02032a0:	8552                	mv	a0,s4
ffffffffc02032a2:	739c                	ld	a5,32(a5)
ffffffffc02032a4:	9782                	jalr	a5
ffffffffc02032a6:	9c7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032aa:	b511                	j	ffffffffc02030ae <pmm_init+0x5de>
ffffffffc02032ac:	00010417          	auipc	s0,0x10
ffffffffc02032b0:	d5440413          	addi	s0,s0,-684 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032b4:	00010797          	auipc	a5,0x10
ffffffffc02032b8:	d4c78793          	addi	a5,a5,-692 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032bc:	a0f41de3          	bne	s0,a5,ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc02032c0:	4581                	li	a1,0
ffffffffc02032c2:	6605                	lui	a2,0x1
ffffffffc02032c4:	8522                	mv	a0,s0
ffffffffc02032c6:	1d4080ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc02032ca:	0000d597          	auipc	a1,0xd
ffffffffc02032ce:	d3658593          	addi	a1,a1,-714 # ffffffffc0210000 <bootstackguard>
ffffffffc02032d2:	0000e797          	auipc	a5,0xe
ffffffffc02032d6:	d20786a3          	sb	zero,-723(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc02032da:	0000d797          	auipc	a5,0xd
ffffffffc02032de:	d2078323          	sb	zero,-730(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02032e2:	00093503          	ld	a0,0(s2)
ffffffffc02032e6:	2555ec63          	bltu	a1,s5,ffffffffc020353e <pmm_init+0xa6e>
ffffffffc02032ea:	0009b683          	ld	a3,0(s3)
ffffffffc02032ee:	4701                	li	a4,0
ffffffffc02032f0:	6605                	lui	a2,0x1
ffffffffc02032f2:	40d586b3          	sub	a3,a1,a3
ffffffffc02032f6:	956ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02032fa:	00093503          	ld	a0,0(s2)
ffffffffc02032fe:	23546363          	bltu	s0,s5,ffffffffc0203524 <pmm_init+0xa54>
ffffffffc0203302:	0009b683          	ld	a3,0(s3)
ffffffffc0203306:	4701                	li	a4,0
ffffffffc0203308:	6605                	lui	a2,0x1
ffffffffc020330a:	40d406b3          	sub	a3,s0,a3
ffffffffc020330e:	85a2                	mv	a1,s0
ffffffffc0203310:	93cff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0203314:	12000073          	sfence.vma
ffffffffc0203318:	00009517          	auipc	a0,0x9
ffffffffc020331c:	41850513          	addi	a0,a0,1048 # ffffffffc020c730 <default_pmm_manager+0x2c8>
ffffffffc0203320:	e87fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203324:	ba4d                	j	ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc0203326:	00009697          	auipc	a3,0x9
ffffffffc020332a:	75a68693          	addi	a3,a3,1882 # ffffffffc020ca80 <default_pmm_manager+0x618>
ffffffffc020332e:	00008617          	auipc	a2,0x8
ffffffffc0203332:	65260613          	addi	a2,a2,1618 # ffffffffc020b980 <commands+0x210>
ffffffffc0203336:	2af00593          	li	a1,687
ffffffffc020333a:	00009517          	auipc	a0,0x9
ffffffffc020333e:	27e50513          	addi	a0,a0,638 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203342:	95cfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203346:	86a2                	mv	a3,s0
ffffffffc0203348:	00009617          	auipc	a2,0x9
ffffffffc020334c:	15860613          	addi	a2,a2,344 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0203350:	2af00593          	li	a1,687
ffffffffc0203354:	00009517          	auipc	a0,0x9
ffffffffc0203358:	26450513          	addi	a0,a0,612 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020335c:	942fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203360:	00009697          	auipc	a3,0x9
ffffffffc0203364:	76068693          	addi	a3,a3,1888 # ffffffffc020cac0 <default_pmm_manager+0x658>
ffffffffc0203368:	00008617          	auipc	a2,0x8
ffffffffc020336c:	61860613          	addi	a2,a2,1560 # ffffffffc020b980 <commands+0x210>
ffffffffc0203370:	2b000593          	li	a1,688
ffffffffc0203374:	00009517          	auipc	a0,0x9
ffffffffc0203378:	24450513          	addi	a0,a0,580 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020337c:	922fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203380:	db5fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203384:	00009697          	auipc	a3,0x9
ffffffffc0203388:	56468693          	addi	a3,a3,1380 # ffffffffc020c8e8 <default_pmm_manager+0x480>
ffffffffc020338c:	00008617          	auipc	a2,0x8
ffffffffc0203390:	5f460613          	addi	a2,a2,1524 # ffffffffc020b980 <commands+0x210>
ffffffffc0203394:	28c00593          	li	a1,652
ffffffffc0203398:	00009517          	auipc	a0,0x9
ffffffffc020339c:	22050513          	addi	a0,a0,544 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02033a0:	8fefd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033a4:	00009697          	auipc	a3,0x9
ffffffffc02033a8:	7a468693          	addi	a3,a3,1956 # ffffffffc020cb48 <default_pmm_manager+0x6e0>
ffffffffc02033ac:	00008617          	auipc	a2,0x8
ffffffffc02033b0:	5d460613          	addi	a2,a2,1492 # ffffffffc020b980 <commands+0x210>
ffffffffc02033b4:	2b900593          	li	a1,697
ffffffffc02033b8:	00009517          	auipc	a0,0x9
ffffffffc02033bc:	20050513          	addi	a0,a0,512 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02033c0:	8defd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033c4:	00009697          	auipc	a3,0x9
ffffffffc02033c8:	64468693          	addi	a3,a3,1604 # ffffffffc020ca08 <default_pmm_manager+0x5a0>
ffffffffc02033cc:	00008617          	auipc	a2,0x8
ffffffffc02033d0:	5b460613          	addi	a2,a2,1460 # ffffffffc020b980 <commands+0x210>
ffffffffc02033d4:	29800593          	li	a1,664
ffffffffc02033d8:	00009517          	auipc	a0,0x9
ffffffffc02033dc:	1e050513          	addi	a0,a0,480 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02033e0:	8befd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033e4:	00009697          	auipc	a3,0x9
ffffffffc02033e8:	5f468693          	addi	a3,a3,1524 # ffffffffc020c9d8 <default_pmm_manager+0x570>
ffffffffc02033ec:	00008617          	auipc	a2,0x8
ffffffffc02033f0:	59460613          	addi	a2,a2,1428 # ffffffffc020b980 <commands+0x210>
ffffffffc02033f4:	28e00593          	li	a1,654
ffffffffc02033f8:	00009517          	auipc	a0,0x9
ffffffffc02033fc:	1c050513          	addi	a0,a0,448 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203400:	89efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203404:	00009697          	auipc	a3,0x9
ffffffffc0203408:	44468693          	addi	a3,a3,1092 # ffffffffc020c848 <default_pmm_manager+0x3e0>
ffffffffc020340c:	00008617          	auipc	a2,0x8
ffffffffc0203410:	57460613          	addi	a2,a2,1396 # ffffffffc020b980 <commands+0x210>
ffffffffc0203414:	28d00593          	li	a1,653
ffffffffc0203418:	00009517          	auipc	a0,0x9
ffffffffc020341c:	1a050513          	addi	a0,a0,416 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203420:	87efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203424:	00009697          	auipc	a3,0x9
ffffffffc0203428:	59c68693          	addi	a3,a3,1436 # ffffffffc020c9c0 <default_pmm_manager+0x558>
ffffffffc020342c:	00008617          	auipc	a2,0x8
ffffffffc0203430:	55460613          	addi	a2,a2,1364 # ffffffffc020b980 <commands+0x210>
ffffffffc0203434:	29200593          	li	a1,658
ffffffffc0203438:	00009517          	auipc	a0,0x9
ffffffffc020343c:	18050513          	addi	a0,a0,384 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203440:	85efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203444:	00009697          	auipc	a3,0x9
ffffffffc0203448:	41c68693          	addi	a3,a3,1052 # ffffffffc020c860 <default_pmm_manager+0x3f8>
ffffffffc020344c:	00008617          	auipc	a2,0x8
ffffffffc0203450:	53460613          	addi	a2,a2,1332 # ffffffffc020b980 <commands+0x210>
ffffffffc0203454:	29100593          	li	a1,657
ffffffffc0203458:	00009517          	auipc	a0,0x9
ffffffffc020345c:	16050513          	addi	a0,a0,352 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203460:	83efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203464:	00009697          	auipc	a3,0x9
ffffffffc0203468:	67468693          	addi	a3,a3,1652 # ffffffffc020cad8 <default_pmm_manager+0x670>
ffffffffc020346c:	00008617          	auipc	a2,0x8
ffffffffc0203470:	51460613          	addi	a2,a2,1300 # ffffffffc020b980 <commands+0x210>
ffffffffc0203474:	2b300593          	li	a1,691
ffffffffc0203478:	00009517          	auipc	a0,0x9
ffffffffc020347c:	14050513          	addi	a0,a0,320 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203480:	81efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203484:	00009697          	auipc	a3,0x9
ffffffffc0203488:	6ac68693          	addi	a3,a3,1708 # ffffffffc020cb30 <default_pmm_manager+0x6c8>
ffffffffc020348c:	00008617          	auipc	a2,0x8
ffffffffc0203490:	4f460613          	addi	a2,a2,1268 # ffffffffc020b980 <commands+0x210>
ffffffffc0203494:	2b800593          	li	a1,696
ffffffffc0203498:	00009517          	auipc	a0,0x9
ffffffffc020349c:	12050513          	addi	a0,a0,288 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02034a0:	ffffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034a4:	00009697          	auipc	a3,0x9
ffffffffc02034a8:	64c68693          	addi	a3,a3,1612 # ffffffffc020caf0 <default_pmm_manager+0x688>
ffffffffc02034ac:	00008617          	auipc	a2,0x8
ffffffffc02034b0:	4d460613          	addi	a2,a2,1236 # ffffffffc020b980 <commands+0x210>
ffffffffc02034b4:	2b700593          	li	a1,695
ffffffffc02034b8:	00009517          	auipc	a0,0x9
ffffffffc02034bc:	10050513          	addi	a0,a0,256 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02034c0:	fdffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034c4:	00009697          	auipc	a3,0x9
ffffffffc02034c8:	73468693          	addi	a3,a3,1844 # ffffffffc020cbf8 <default_pmm_manager+0x790>
ffffffffc02034cc:	00008617          	auipc	a2,0x8
ffffffffc02034d0:	4b460613          	addi	a2,a2,1204 # ffffffffc020b980 <commands+0x210>
ffffffffc02034d4:	2c100593          	li	a1,705
ffffffffc02034d8:	00009517          	auipc	a0,0x9
ffffffffc02034dc:	0e050513          	addi	a0,a0,224 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02034e0:	fbffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034e4:	00009697          	auipc	a3,0x9
ffffffffc02034e8:	6dc68693          	addi	a3,a3,1756 # ffffffffc020cbc0 <default_pmm_manager+0x758>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	49460613          	addi	a2,a2,1172 # ffffffffc020b980 <commands+0x210>
ffffffffc02034f4:	2be00593          	li	a1,702
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	0c050513          	addi	a0,a0,192 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	00009697          	auipc	a3,0x9
ffffffffc0203508:	68c68693          	addi	a3,a3,1676 # ffffffffc020cb90 <default_pmm_manager+0x728>
ffffffffc020350c:	00008617          	auipc	a2,0x8
ffffffffc0203510:	47460613          	addi	a2,a2,1140 # ffffffffc020b980 <commands+0x210>
ffffffffc0203514:	2ba00593          	li	a1,698
ffffffffc0203518:	00009517          	auipc	a0,0x9
ffffffffc020351c:	0a050513          	addi	a0,a0,160 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203520:	f7ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203524:	86a2                	mv	a3,s0
ffffffffc0203526:	00009617          	auipc	a2,0x9
ffffffffc020352a:	02260613          	addi	a2,a2,34 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc020352e:	0dc00593          	li	a1,220
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	08650513          	addi	a0,a0,134 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	86ae                	mv	a3,a1
ffffffffc0203540:	00009617          	auipc	a2,0x9
ffffffffc0203544:	00860613          	addi	a2,a2,8 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0203548:	0db00593          	li	a1,219
ffffffffc020354c:	00009517          	auipc	a0,0x9
ffffffffc0203550:	06c50513          	addi	a0,a0,108 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203554:	f4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203558:	00009697          	auipc	a3,0x9
ffffffffc020355c:	22068693          	addi	a3,a3,544 # ffffffffc020c778 <default_pmm_manager+0x310>
ffffffffc0203560:	00008617          	auipc	a2,0x8
ffffffffc0203564:	42060613          	addi	a2,a2,1056 # ffffffffc020b980 <commands+0x210>
ffffffffc0203568:	27100593          	li	a1,625
ffffffffc020356c:	00009517          	auipc	a0,0x9
ffffffffc0203570:	04c50513          	addi	a0,a0,76 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203574:	f2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203578:	00009697          	auipc	a3,0x9
ffffffffc020357c:	1e068693          	addi	a3,a3,480 # ffffffffc020c758 <default_pmm_manager+0x2f0>
ffffffffc0203580:	00008617          	auipc	a2,0x8
ffffffffc0203584:	40060613          	addi	a2,a2,1024 # ffffffffc020b980 <commands+0x210>
ffffffffc0203588:	27000593          	li	a1,624
ffffffffc020358c:	00009517          	auipc	a0,0x9
ffffffffc0203590:	02c50513          	addi	a0,a0,44 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203594:	f0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203598:	00009617          	auipc	a2,0x9
ffffffffc020359c:	15060613          	addi	a2,a2,336 # ffffffffc020c6e8 <default_pmm_manager+0x280>
ffffffffc02035a0:	0aa00593          	li	a1,170
ffffffffc02035a4:	00009517          	auipc	a0,0x9
ffffffffc02035a8:	01450513          	addi	a0,a0,20 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02035ac:	ef3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b0:	00009617          	auipc	a2,0x9
ffffffffc02035b4:	0a060613          	addi	a2,a2,160 # ffffffffc020c650 <default_pmm_manager+0x1e8>
ffffffffc02035b8:	06500593          	li	a1,101
ffffffffc02035bc:	00009517          	auipc	a0,0x9
ffffffffc02035c0:	ffc50513          	addi	a0,a0,-4 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02035c4:	edbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c8:	00009697          	auipc	a3,0x9
ffffffffc02035cc:	47068693          	addi	a3,a3,1136 # ffffffffc020ca38 <default_pmm_manager+0x5d0>
ffffffffc02035d0:	00008617          	auipc	a2,0x8
ffffffffc02035d4:	3b060613          	addi	a2,a2,944 # ffffffffc020b980 <commands+0x210>
ffffffffc02035d8:	2ca00593          	li	a1,714
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	fdc50513          	addi	a0,a0,-36 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	00009697          	auipc	a3,0x9
ffffffffc02035ec:	29068693          	addi	a3,a3,656 # ffffffffc020c878 <default_pmm_manager+0x410>
ffffffffc02035f0:	00008617          	auipc	a2,0x8
ffffffffc02035f4:	39060613          	addi	a2,a2,912 # ffffffffc020b980 <commands+0x210>
ffffffffc02035f8:	27f00593          	li	a1,639
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	fbc50513          	addi	a0,a0,-68 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	86d6                	mv	a3,s5
ffffffffc020360a:	00009617          	auipc	a2,0x9
ffffffffc020360e:	e9660613          	addi	a2,a2,-362 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0203612:	27e00593          	li	a1,638
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	fa250513          	addi	a0,a0,-94 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	39e68693          	addi	a3,a3,926 # ffffffffc020c9c0 <default_pmm_manager+0x558>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	35660613          	addi	a2,a2,854 # ffffffffc020b980 <commands+0x210>
ffffffffc0203632:	28b00593          	li	a1,651
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	f8250513          	addi	a0,a0,-126 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	36668693          	addi	a3,a3,870 # ffffffffc020c9a8 <default_pmm_manager+0x540>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	33660613          	addi	a2,a2,822 # ffffffffc020b980 <commands+0x210>
ffffffffc0203652:	28a00593          	li	a1,650
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	f6250513          	addi	a0,a0,-158 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	31668693          	addi	a3,a3,790 # ffffffffc020c978 <default_pmm_manager+0x510>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	31660613          	addi	a2,a2,790 # ffffffffc020b980 <commands+0x210>
ffffffffc0203672:	28900593          	li	a1,649
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	f4250513          	addi	a0,a0,-190 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	2de68693          	addi	a3,a3,734 # ffffffffc020c960 <default_pmm_manager+0x4f8>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	2f660613          	addi	a2,a2,758 # ffffffffc020b980 <commands+0x210>
ffffffffc0203692:	28700593          	li	a1,647
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	f2250513          	addi	a0,a0,-222 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	29e68693          	addi	a3,a3,670 # ffffffffc020c940 <default_pmm_manager+0x4d8>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	2d660613          	addi	a2,a2,726 # ffffffffc020b980 <commands+0x210>
ffffffffc02036b2:	28600593          	li	a1,646
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	f0250513          	addi	a0,a0,-254 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	26e68693          	addi	a3,a3,622 # ffffffffc020c930 <default_pmm_manager+0x4c8>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	2b660613          	addi	a2,a2,694 # ffffffffc020b980 <commands+0x210>
ffffffffc02036d2:	28500593          	li	a1,645
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	ee250513          	addi	a0,a0,-286 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	00009697          	auipc	a3,0x9
ffffffffc02036e6:	23e68693          	addi	a3,a3,574 # ffffffffc020c920 <default_pmm_manager+0x4b8>
ffffffffc02036ea:	00008617          	auipc	a2,0x8
ffffffffc02036ee:	29660613          	addi	a2,a2,662 # ffffffffc020b980 <commands+0x210>
ffffffffc02036f2:	28400593          	li	a1,644
ffffffffc02036f6:	00009517          	auipc	a0,0x9
ffffffffc02036fa:	ec250513          	addi	a0,a0,-318 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02036fe:	da1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203702:	00009697          	auipc	a3,0x9
ffffffffc0203706:	1e668693          	addi	a3,a3,486 # ffffffffc020c8e8 <default_pmm_manager+0x480>
ffffffffc020370a:	00008617          	auipc	a2,0x8
ffffffffc020370e:	27660613          	addi	a2,a2,630 # ffffffffc020b980 <commands+0x210>
ffffffffc0203712:	28300593          	li	a1,643
ffffffffc0203716:	00009517          	auipc	a0,0x9
ffffffffc020371a:	ea250513          	addi	a0,a0,-350 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020371e:	d81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203722:	00009697          	auipc	a3,0x9
ffffffffc0203726:	31668693          	addi	a3,a3,790 # ffffffffc020ca38 <default_pmm_manager+0x5d0>
ffffffffc020372a:	00008617          	auipc	a2,0x8
ffffffffc020372e:	25660613          	addi	a2,a2,598 # ffffffffc020b980 <commands+0x210>
ffffffffc0203732:	2a000593          	li	a1,672
ffffffffc0203736:	00009517          	auipc	a0,0x9
ffffffffc020373a:	e8250513          	addi	a0,a0,-382 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020373e:	d61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203742:	00009617          	auipc	a2,0x9
ffffffffc0203746:	d5e60613          	addi	a2,a2,-674 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc020374a:	07100593          	li	a1,113
ffffffffc020374e:	00009517          	auipc	a0,0x9
ffffffffc0203752:	d7a50513          	addi	a0,a0,-646 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0203756:	d49fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020375a:	86a2                	mv	a3,s0
ffffffffc020375c:	00009617          	auipc	a2,0x9
ffffffffc0203760:	dec60613          	addi	a2,a2,-532 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0203764:	0ca00593          	li	a1,202
ffffffffc0203768:	00009517          	auipc	a0,0x9
ffffffffc020376c:	e5050513          	addi	a0,a0,-432 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203770:	d2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203774:	00009617          	auipc	a2,0x9
ffffffffc0203778:	dd460613          	addi	a2,a2,-556 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc020377c:	08100593          	li	a1,129
ffffffffc0203780:	00009517          	auipc	a0,0x9
ffffffffc0203784:	e3850513          	addi	a0,a0,-456 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203788:	d17fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020378c:	00009697          	auipc	a3,0x9
ffffffffc0203790:	11c68693          	addi	a3,a3,284 # ffffffffc020c8a8 <default_pmm_manager+0x440>
ffffffffc0203794:	00008617          	auipc	a2,0x8
ffffffffc0203798:	1ec60613          	addi	a2,a2,492 # ffffffffc020b980 <commands+0x210>
ffffffffc020379c:	28200593          	li	a1,642
ffffffffc02037a0:	00009517          	auipc	a0,0x9
ffffffffc02037a4:	e1850513          	addi	a0,a0,-488 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02037a8:	cf7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ac:	00009697          	auipc	a3,0x9
ffffffffc02037b0:	03c68693          	addi	a3,a3,60 # ffffffffc020c7e8 <default_pmm_manager+0x380>
ffffffffc02037b4:	00008617          	auipc	a2,0x8
ffffffffc02037b8:	1cc60613          	addi	a2,a2,460 # ffffffffc020b980 <commands+0x210>
ffffffffc02037bc:	27600593          	li	a1,630
ffffffffc02037c0:	00009517          	auipc	a0,0x9
ffffffffc02037c4:	df850513          	addi	a0,a0,-520 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02037c8:	cd7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037cc:	985fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc02037d0:	00009697          	auipc	a3,0x9
ffffffffc02037d4:	04868693          	addi	a3,a3,72 # ffffffffc020c818 <default_pmm_manager+0x3b0>
ffffffffc02037d8:	00008617          	auipc	a2,0x8
ffffffffc02037dc:	1a860613          	addi	a2,a2,424 # ffffffffc020b980 <commands+0x210>
ffffffffc02037e0:	27900593          	li	a1,633
ffffffffc02037e4:	00009517          	auipc	a0,0x9
ffffffffc02037e8:	dd450513          	addi	a0,a0,-556 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02037ec:	cb3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037f0:	00009697          	auipc	a3,0x9
ffffffffc02037f4:	fc868693          	addi	a3,a3,-56 # ffffffffc020c7b8 <default_pmm_manager+0x350>
ffffffffc02037f8:	00008617          	auipc	a2,0x8
ffffffffc02037fc:	18860613          	addi	a2,a2,392 # ffffffffc020b980 <commands+0x210>
ffffffffc0203800:	27200593          	li	a1,626
ffffffffc0203804:	00009517          	auipc	a0,0x9
ffffffffc0203808:	db450513          	addi	a0,a0,-588 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020380c:	c93fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203810:	00009697          	auipc	a3,0x9
ffffffffc0203814:	03868693          	addi	a3,a3,56 # ffffffffc020c848 <default_pmm_manager+0x3e0>
ffffffffc0203818:	00008617          	auipc	a2,0x8
ffffffffc020381c:	16860613          	addi	a2,a2,360 # ffffffffc020b980 <commands+0x210>
ffffffffc0203820:	27a00593          	li	a1,634
ffffffffc0203824:	00009517          	auipc	a0,0x9
ffffffffc0203828:	d9450513          	addi	a0,a0,-620 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020382c:	c73fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203830:	00009617          	auipc	a2,0x9
ffffffffc0203834:	c7060613          	addi	a2,a2,-912 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0203838:	27d00593          	li	a1,637
ffffffffc020383c:	00009517          	auipc	a0,0x9
ffffffffc0203840:	d7c50513          	addi	a0,a0,-644 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203844:	c5bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203848:	00009697          	auipc	a3,0x9
ffffffffc020384c:	01868693          	addi	a3,a3,24 # ffffffffc020c860 <default_pmm_manager+0x3f8>
ffffffffc0203850:	00008617          	auipc	a2,0x8
ffffffffc0203854:	13060613          	addi	a2,a2,304 # ffffffffc020b980 <commands+0x210>
ffffffffc0203858:	27b00593          	li	a1,635
ffffffffc020385c:	00009517          	auipc	a0,0x9
ffffffffc0203860:	d5c50513          	addi	a0,a0,-676 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203864:	c3bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203868:	86ca                	mv	a3,s2
ffffffffc020386a:	00009617          	auipc	a2,0x9
ffffffffc020386e:	cde60613          	addi	a2,a2,-802 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0203872:	0c600593          	li	a1,198
ffffffffc0203876:	00009517          	auipc	a0,0x9
ffffffffc020387a:	d4250513          	addi	a0,a0,-702 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020387e:	c21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203882:	00009697          	auipc	a3,0x9
ffffffffc0203886:	13e68693          	addi	a3,a3,318 # ffffffffc020c9c0 <default_pmm_manager+0x558>
ffffffffc020388a:	00008617          	auipc	a2,0x8
ffffffffc020388e:	0f660613          	addi	a2,a2,246 # ffffffffc020b980 <commands+0x210>
ffffffffc0203892:	29600593          	li	a1,662
ffffffffc0203896:	00009517          	auipc	a0,0x9
ffffffffc020389a:	d2250513          	addi	a0,a0,-734 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc020389e:	c01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a2:	00009697          	auipc	a3,0x9
ffffffffc02038a6:	14e68693          	addi	a3,a3,334 # ffffffffc020c9f0 <default_pmm_manager+0x588>
ffffffffc02038aa:	00008617          	auipc	a2,0x8
ffffffffc02038ae:	0d660613          	addi	a2,a2,214 # ffffffffc020b980 <commands+0x210>
ffffffffc02038b2:	29500593          	li	a1,661
ffffffffc02038b6:	00009517          	auipc	a0,0x9
ffffffffc02038ba:	d0250513          	addi	a0,a0,-766 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc02038be:	be1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02038c2 <copy_range>:
ffffffffc02038c2:	7159                	addi	sp,sp,-112
ffffffffc02038c4:	00d667b3          	or	a5,a2,a3
ffffffffc02038c8:	f486                	sd	ra,104(sp)
ffffffffc02038ca:	f0a2                	sd	s0,96(sp)
ffffffffc02038cc:	eca6                	sd	s1,88(sp)
ffffffffc02038ce:	e8ca                	sd	s2,80(sp)
ffffffffc02038d0:	e4ce                	sd	s3,72(sp)
ffffffffc02038d2:	e0d2                	sd	s4,64(sp)
ffffffffc02038d4:	fc56                	sd	s5,56(sp)
ffffffffc02038d6:	f85a                	sd	s6,48(sp)
ffffffffc02038d8:	f45e                	sd	s7,40(sp)
ffffffffc02038da:	f062                	sd	s8,32(sp)
ffffffffc02038dc:	ec66                	sd	s9,24(sp)
ffffffffc02038de:	e86a                	sd	s10,16(sp)
ffffffffc02038e0:	e46e                	sd	s11,8(sp)
ffffffffc02038e2:	17d2                	slli	a5,a5,0x34
ffffffffc02038e4:	20079f63          	bnez	a5,ffffffffc0203b02 <copy_range+0x240>
ffffffffc02038e8:	002007b7          	lui	a5,0x200
ffffffffc02038ec:	8432                	mv	s0,a2
ffffffffc02038ee:	1af66263          	bltu	a2,a5,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f2:	8936                	mv	s2,a3
ffffffffc02038f4:	18d67f63          	bgeu	a2,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc02038f8:	4785                	li	a5,1
ffffffffc02038fa:	07fe                	slli	a5,a5,0x1f
ffffffffc02038fc:	18d7eb63          	bltu	a5,a3,ffffffffc0203a92 <copy_range+0x1d0>
ffffffffc0203900:	5b7d                	li	s6,-1
ffffffffc0203902:	8aaa                	mv	s5,a0
ffffffffc0203904:	89ae                	mv	s3,a1
ffffffffc0203906:	6a05                	lui	s4,0x1
ffffffffc0203908:	00093c17          	auipc	s8,0x93
ffffffffc020390c:	f98c0c13          	addi	s8,s8,-104 # ffffffffc02968a0 <npage>
ffffffffc0203910:	00093b97          	auipc	s7,0x93
ffffffffc0203914:	f98b8b93          	addi	s7,s7,-104 # ffffffffc02968a8 <pages>
ffffffffc0203918:	00cb5b13          	srli	s6,s6,0xc
ffffffffc020391c:	00093c97          	auipc	s9,0x93
ffffffffc0203920:	f94c8c93          	addi	s9,s9,-108 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203924:	4601                	li	a2,0
ffffffffc0203926:	85a2                	mv	a1,s0
ffffffffc0203928:	854e                	mv	a0,s3
ffffffffc020392a:	8fbfe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020392e:	84aa                	mv	s1,a0
ffffffffc0203930:	0e050c63          	beqz	a0,ffffffffc0203a28 <copy_range+0x166>
ffffffffc0203934:	611c                	ld	a5,0(a0)
ffffffffc0203936:	8b85                	andi	a5,a5,1
ffffffffc0203938:	e785                	bnez	a5,ffffffffc0203960 <copy_range+0x9e>
ffffffffc020393a:	9452                	add	s0,s0,s4
ffffffffc020393c:	ff2464e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203940:	4501                	li	a0,0
ffffffffc0203942:	70a6                	ld	ra,104(sp)
ffffffffc0203944:	7406                	ld	s0,96(sp)
ffffffffc0203946:	64e6                	ld	s1,88(sp)
ffffffffc0203948:	6946                	ld	s2,80(sp)
ffffffffc020394a:	69a6                	ld	s3,72(sp)
ffffffffc020394c:	6a06                	ld	s4,64(sp)
ffffffffc020394e:	7ae2                	ld	s5,56(sp)
ffffffffc0203950:	7b42                	ld	s6,48(sp)
ffffffffc0203952:	7ba2                	ld	s7,40(sp)
ffffffffc0203954:	7c02                	ld	s8,32(sp)
ffffffffc0203956:	6ce2                	ld	s9,24(sp)
ffffffffc0203958:	6d42                	ld	s10,16(sp)
ffffffffc020395a:	6da2                	ld	s11,8(sp)
ffffffffc020395c:	6165                	addi	sp,sp,112
ffffffffc020395e:	8082                	ret
ffffffffc0203960:	4605                	li	a2,1
ffffffffc0203962:	85a2                	mv	a1,s0
ffffffffc0203964:	8556                	mv	a0,s5
ffffffffc0203966:	8bffe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020396a:	c56d                	beqz	a0,ffffffffc0203a54 <copy_range+0x192>
ffffffffc020396c:	609c                	ld	a5,0(s1)
ffffffffc020396e:	0017f713          	andi	a4,a5,1
ffffffffc0203972:	01f7f493          	andi	s1,a5,31
ffffffffc0203976:	16070a63          	beqz	a4,ffffffffc0203aea <copy_range+0x228>
ffffffffc020397a:	000c3683          	ld	a3,0(s8)
ffffffffc020397e:	078a                	slli	a5,a5,0x2
ffffffffc0203980:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203984:	14d77763          	bgeu	a4,a3,ffffffffc0203ad2 <copy_range+0x210>
ffffffffc0203988:	000bb783          	ld	a5,0(s7)
ffffffffc020398c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203990:	9736                	add	a4,a4,a3
ffffffffc0203992:	071a                	slli	a4,a4,0x6
ffffffffc0203994:	00e78db3          	add	s11,a5,a4
ffffffffc0203998:	10002773          	csrr	a4,sstatus
ffffffffc020399c:	8b09                	andi	a4,a4,2
ffffffffc020399e:	e345                	bnez	a4,ffffffffc0203a3e <copy_range+0x17c>
ffffffffc02039a0:	000cb703          	ld	a4,0(s9)
ffffffffc02039a4:	4505                	li	a0,1
ffffffffc02039a6:	6f18                	ld	a4,24(a4)
ffffffffc02039a8:	9702                	jalr	a4
ffffffffc02039aa:	8d2a                	mv	s10,a0
ffffffffc02039ac:	0c0d8363          	beqz	s11,ffffffffc0203a72 <copy_range+0x1b0>
ffffffffc02039b0:	100d0163          	beqz	s10,ffffffffc0203ab2 <copy_range+0x1f0>
ffffffffc02039b4:	000bb703          	ld	a4,0(s7)
ffffffffc02039b8:	000805b7          	lui	a1,0x80
ffffffffc02039bc:	000c3603          	ld	a2,0(s8)
ffffffffc02039c0:	40ed86b3          	sub	a3,s11,a4
ffffffffc02039c4:	8699                	srai	a3,a3,0x6
ffffffffc02039c6:	96ae                	add	a3,a3,a1
ffffffffc02039c8:	0166f7b3          	and	a5,a3,s6
ffffffffc02039cc:	06b2                	slli	a3,a3,0xc
ffffffffc02039ce:	08c7f663          	bgeu	a5,a2,ffffffffc0203a5a <copy_range+0x198>
ffffffffc02039d2:	40ed07b3          	sub	a5,s10,a4
ffffffffc02039d6:	00093717          	auipc	a4,0x93
ffffffffc02039da:	ee270713          	addi	a4,a4,-286 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02039de:	6308                	ld	a0,0(a4)
ffffffffc02039e0:	8799                	srai	a5,a5,0x6
ffffffffc02039e2:	97ae                	add	a5,a5,a1
ffffffffc02039e4:	0167f733          	and	a4,a5,s6
ffffffffc02039e8:	00a685b3          	add	a1,a3,a0
ffffffffc02039ec:	07b2                	slli	a5,a5,0xc
ffffffffc02039ee:	06c77563          	bgeu	a4,a2,ffffffffc0203a58 <copy_range+0x196>
ffffffffc02039f2:	6605                	lui	a2,0x1
ffffffffc02039f4:	953e                	add	a0,a0,a5
ffffffffc02039f6:	2f7070ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc02039fa:	86a6                	mv	a3,s1
ffffffffc02039fc:	8622                	mv	a2,s0
ffffffffc02039fe:	85ea                	mv	a1,s10
ffffffffc0203a00:	8556                	mv	a0,s5
ffffffffc0203a02:	fd9fe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203a06:	d915                	beqz	a0,ffffffffc020393a <copy_range+0x78>
ffffffffc0203a08:	00009697          	auipc	a3,0x9
ffffffffc0203a0c:	25868693          	addi	a3,a3,600 # ffffffffc020cc60 <default_pmm_manager+0x7f8>
ffffffffc0203a10:	00008617          	auipc	a2,0x8
ffffffffc0203a14:	f7060613          	addi	a2,a2,-144 # ffffffffc020b980 <commands+0x210>
ffffffffc0203a18:	20e00593          	li	a1,526
ffffffffc0203a1c:	00009517          	auipc	a0,0x9
ffffffffc0203a20:	b9c50513          	addi	a0,a0,-1124 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203a24:	a7bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a28:	00200637          	lui	a2,0x200
ffffffffc0203a2c:	9432                	add	s0,s0,a2
ffffffffc0203a2e:	ffe00637          	lui	a2,0xffe00
ffffffffc0203a32:	8c71                	and	s0,s0,a2
ffffffffc0203a34:	f00406e3          	beqz	s0,ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a38:	ef2466e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203a3c:	b711                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a3e:	a34fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203a42:	000cb703          	ld	a4,0(s9)
ffffffffc0203a46:	4505                	li	a0,1
ffffffffc0203a48:	6f18                	ld	a4,24(a4)
ffffffffc0203a4a:	9702                	jalr	a4
ffffffffc0203a4c:	8d2a                	mv	s10,a0
ffffffffc0203a4e:	a1efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203a52:	bfa9                	j	ffffffffc02039ac <copy_range+0xea>
ffffffffc0203a54:	5571                	li	a0,-4
ffffffffc0203a56:	b5f5                	j	ffffffffc0203942 <copy_range+0x80>
ffffffffc0203a58:	86be                	mv	a3,a5
ffffffffc0203a5a:	00009617          	auipc	a2,0x9
ffffffffc0203a5e:	a4660613          	addi	a2,a2,-1466 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0203a62:	07100593          	li	a1,113
ffffffffc0203a66:	00009517          	auipc	a0,0x9
ffffffffc0203a6a:	a6250513          	addi	a0,a0,-1438 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0203a6e:	a31fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a72:	00009697          	auipc	a3,0x9
ffffffffc0203a76:	1ce68693          	addi	a3,a3,462 # ffffffffc020cc40 <default_pmm_manager+0x7d8>
ffffffffc0203a7a:	00008617          	auipc	a2,0x8
ffffffffc0203a7e:	f0660613          	addi	a2,a2,-250 # ffffffffc020b980 <commands+0x210>
ffffffffc0203a82:	1ce00593          	li	a1,462
ffffffffc0203a86:	00009517          	auipc	a0,0x9
ffffffffc0203a8a:	b3250513          	addi	a0,a0,-1230 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203a8e:	a11fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a92:	00009697          	auipc	a3,0x9
ffffffffc0203a96:	b8e68693          	addi	a3,a3,-1138 # ffffffffc020c620 <default_pmm_manager+0x1b8>
ffffffffc0203a9a:	00008617          	auipc	a2,0x8
ffffffffc0203a9e:	ee660613          	addi	a2,a2,-282 # ffffffffc020b980 <commands+0x210>
ffffffffc0203aa2:	1b600593          	li	a1,438
ffffffffc0203aa6:	00009517          	auipc	a0,0x9
ffffffffc0203aaa:	b1250513          	addi	a0,a0,-1262 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203aae:	9f1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ab2:	00009697          	auipc	a3,0x9
ffffffffc0203ab6:	19e68693          	addi	a3,a3,414 # ffffffffc020cc50 <default_pmm_manager+0x7e8>
ffffffffc0203aba:	00008617          	auipc	a2,0x8
ffffffffc0203abe:	ec660613          	addi	a2,a2,-314 # ffffffffc020b980 <commands+0x210>
ffffffffc0203ac2:	1cf00593          	li	a1,463
ffffffffc0203ac6:	00009517          	auipc	a0,0x9
ffffffffc0203aca:	af250513          	addi	a0,a0,-1294 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203ace:	9d1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ad2:	00009617          	auipc	a2,0x9
ffffffffc0203ad6:	a9e60613          	addi	a2,a2,-1378 # ffffffffc020c570 <default_pmm_manager+0x108>
ffffffffc0203ada:	06900593          	li	a1,105
ffffffffc0203ade:	00009517          	auipc	a0,0x9
ffffffffc0203ae2:	9ea50513          	addi	a0,a0,-1558 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0203ae6:	9b9fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203aea:	00009617          	auipc	a2,0x9
ffffffffc0203aee:	aa660613          	addi	a2,a2,-1370 # ffffffffc020c590 <default_pmm_manager+0x128>
ffffffffc0203af2:	07f00593          	li	a1,127
ffffffffc0203af6:	00009517          	auipc	a0,0x9
ffffffffc0203afa:	9d250513          	addi	a0,a0,-1582 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0203afe:	9a1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b02:	00009697          	auipc	a3,0x9
ffffffffc0203b06:	aee68693          	addi	a3,a3,-1298 # ffffffffc020c5f0 <default_pmm_manager+0x188>
ffffffffc0203b0a:	00008617          	auipc	a2,0x8
ffffffffc0203b0e:	e7660613          	addi	a2,a2,-394 # ffffffffc020b980 <commands+0x210>
ffffffffc0203b12:	1b500593          	li	a1,437
ffffffffc0203b16:	00009517          	auipc	a0,0x9
ffffffffc0203b1a:	aa250513          	addi	a0,a0,-1374 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203b1e:	981fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b22 <pgdir_alloc_page>:
ffffffffc0203b22:	7179                	addi	sp,sp,-48
ffffffffc0203b24:	ec26                	sd	s1,24(sp)
ffffffffc0203b26:	e84a                	sd	s2,16(sp)
ffffffffc0203b28:	e052                	sd	s4,0(sp)
ffffffffc0203b2a:	f406                	sd	ra,40(sp)
ffffffffc0203b2c:	f022                	sd	s0,32(sp)
ffffffffc0203b2e:	e44e                	sd	s3,8(sp)
ffffffffc0203b30:	8a2a                	mv	s4,a0
ffffffffc0203b32:	84ae                	mv	s1,a1
ffffffffc0203b34:	8932                	mv	s2,a2
ffffffffc0203b36:	100027f3          	csrr	a5,sstatus
ffffffffc0203b3a:	8b89                	andi	a5,a5,2
ffffffffc0203b3c:	00093997          	auipc	s3,0x93
ffffffffc0203b40:	d7498993          	addi	s3,s3,-652 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203b44:	ef8d                	bnez	a5,ffffffffc0203b7e <pgdir_alloc_page+0x5c>
ffffffffc0203b46:	0009b783          	ld	a5,0(s3)
ffffffffc0203b4a:	4505                	li	a0,1
ffffffffc0203b4c:	6f9c                	ld	a5,24(a5)
ffffffffc0203b4e:	9782                	jalr	a5
ffffffffc0203b50:	842a                	mv	s0,a0
ffffffffc0203b52:	cc09                	beqz	s0,ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203b54:	86ca                	mv	a3,s2
ffffffffc0203b56:	8626                	mv	a2,s1
ffffffffc0203b58:	85a2                	mv	a1,s0
ffffffffc0203b5a:	8552                	mv	a0,s4
ffffffffc0203b5c:	e7ffe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203b60:	e915                	bnez	a0,ffffffffc0203b94 <pgdir_alloc_page+0x72>
ffffffffc0203b62:	4018                	lw	a4,0(s0)
ffffffffc0203b64:	fc04                	sd	s1,56(s0)
ffffffffc0203b66:	4785                	li	a5,1
ffffffffc0203b68:	04f71e63          	bne	a4,a5,ffffffffc0203bc4 <pgdir_alloc_page+0xa2>
ffffffffc0203b6c:	70a2                	ld	ra,40(sp)
ffffffffc0203b6e:	8522                	mv	a0,s0
ffffffffc0203b70:	7402                	ld	s0,32(sp)
ffffffffc0203b72:	64e2                	ld	s1,24(sp)
ffffffffc0203b74:	6942                	ld	s2,16(sp)
ffffffffc0203b76:	69a2                	ld	s3,8(sp)
ffffffffc0203b78:	6a02                	ld	s4,0(sp)
ffffffffc0203b7a:	6145                	addi	sp,sp,48
ffffffffc0203b7c:	8082                	ret
ffffffffc0203b7e:	8f4fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b82:	0009b783          	ld	a5,0(s3)
ffffffffc0203b86:	4505                	li	a0,1
ffffffffc0203b88:	6f9c                	ld	a5,24(a5)
ffffffffc0203b8a:	9782                	jalr	a5
ffffffffc0203b8c:	842a                	mv	s0,a0
ffffffffc0203b8e:	8defd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b92:	b7c1                	j	ffffffffc0203b52 <pgdir_alloc_page+0x30>
ffffffffc0203b94:	100027f3          	csrr	a5,sstatus
ffffffffc0203b98:	8b89                	andi	a5,a5,2
ffffffffc0203b9a:	eb89                	bnez	a5,ffffffffc0203bac <pgdir_alloc_page+0x8a>
ffffffffc0203b9c:	0009b783          	ld	a5,0(s3)
ffffffffc0203ba0:	8522                	mv	a0,s0
ffffffffc0203ba2:	4585                	li	a1,1
ffffffffc0203ba4:	739c                	ld	a5,32(a5)
ffffffffc0203ba6:	4401                	li	s0,0
ffffffffc0203ba8:	9782                	jalr	a5
ffffffffc0203baa:	b7c9                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bac:	8c6fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203bb0:	0009b783          	ld	a5,0(s3)
ffffffffc0203bb4:	8522                	mv	a0,s0
ffffffffc0203bb6:	4585                	li	a1,1
ffffffffc0203bb8:	739c                	ld	a5,32(a5)
ffffffffc0203bba:	4401                	li	s0,0
ffffffffc0203bbc:	9782                	jalr	a5
ffffffffc0203bbe:	8aefd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203bc2:	b76d                	j	ffffffffc0203b6c <pgdir_alloc_page+0x4a>
ffffffffc0203bc4:	00009697          	auipc	a3,0x9
ffffffffc0203bc8:	0ac68693          	addi	a3,a3,172 # ffffffffc020cc70 <default_pmm_manager+0x808>
ffffffffc0203bcc:	00008617          	auipc	a2,0x8
ffffffffc0203bd0:	db460613          	addi	a2,a2,-588 # ffffffffc020b980 <commands+0x210>
ffffffffc0203bd4:	25700593          	li	a1,599
ffffffffc0203bd8:	00009517          	auipc	a0,0x9
ffffffffc0203bdc:	9e050513          	addi	a0,a0,-1568 # ffffffffc020c5b8 <default_pmm_manager+0x150>
ffffffffc0203be0:	8bffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203be4 <check_vma_overlap.part.0>:
ffffffffc0203be4:	1141                	addi	sp,sp,-16
ffffffffc0203be6:	00009697          	auipc	a3,0x9
ffffffffc0203bea:	0a268693          	addi	a3,a3,162 # ffffffffc020cc88 <default_pmm_manager+0x820>
ffffffffc0203bee:	00008617          	auipc	a2,0x8
ffffffffc0203bf2:	d9260613          	addi	a2,a2,-622 # ffffffffc020b980 <commands+0x210>
ffffffffc0203bf6:	07600593          	li	a1,118
ffffffffc0203bfa:	00009517          	auipc	a0,0x9
ffffffffc0203bfe:	0ae50513          	addi	a0,a0,174 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203c02:	e406                	sd	ra,8(sp)
ffffffffc0203c04:	89bfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c08 <mm_create>:
ffffffffc0203c08:	1141                	addi	sp,sp,-16
ffffffffc0203c0a:	05800513          	li	a0,88
ffffffffc0203c0e:	e022                	sd	s0,0(sp)
ffffffffc0203c10:	e406                	sd	ra,8(sp)
ffffffffc0203c12:	b7cfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203c16:	842a                	mv	s0,a0
ffffffffc0203c18:	c115                	beqz	a0,ffffffffc0203c3c <mm_create+0x34>
ffffffffc0203c1a:	e408                	sd	a0,8(s0)
ffffffffc0203c1c:	e008                	sd	a0,0(s0)
ffffffffc0203c1e:	00053823          	sd	zero,16(a0)
ffffffffc0203c22:	00053c23          	sd	zero,24(a0)
ffffffffc0203c26:	02052023          	sw	zero,32(a0)
ffffffffc0203c2a:	02053423          	sd	zero,40(a0)
ffffffffc0203c2e:	02052823          	sw	zero,48(a0)
ffffffffc0203c32:	4585                	li	a1,1
ffffffffc0203c34:	03850513          	addi	a0,a0,56
ffffffffc0203c38:	123000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203c3c:	60a2                	ld	ra,8(sp)
ffffffffc0203c3e:	8522                	mv	a0,s0
ffffffffc0203c40:	6402                	ld	s0,0(sp)
ffffffffc0203c42:	0141                	addi	sp,sp,16
ffffffffc0203c44:	8082                	ret

ffffffffc0203c46 <find_vma>:
ffffffffc0203c46:	86aa                	mv	a3,a0
ffffffffc0203c48:	c505                	beqz	a0,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c4a:	6908                	ld	a0,16(a0)
ffffffffc0203c4c:	c501                	beqz	a0,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c4e:	651c                	ld	a5,8(a0)
ffffffffc0203c50:	02f5f263          	bgeu	a1,a5,ffffffffc0203c74 <find_vma+0x2e>
ffffffffc0203c54:	669c                	ld	a5,8(a3)
ffffffffc0203c56:	00f68d63          	beq	a3,a5,ffffffffc0203c70 <find_vma+0x2a>
ffffffffc0203c5a:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203c5e:	00e5e663          	bltu	a1,a4,ffffffffc0203c6a <find_vma+0x24>
ffffffffc0203c62:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203c66:	00e5ec63          	bltu	a1,a4,ffffffffc0203c7e <find_vma+0x38>
ffffffffc0203c6a:	679c                	ld	a5,8(a5)
ffffffffc0203c6c:	fef697e3          	bne	a3,a5,ffffffffc0203c5a <find_vma+0x14>
ffffffffc0203c70:	4501                	li	a0,0
ffffffffc0203c72:	8082                	ret
ffffffffc0203c74:	691c                	ld	a5,16(a0)
ffffffffc0203c76:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203c54 <find_vma+0xe>
ffffffffc0203c7a:	ea88                	sd	a0,16(a3)
ffffffffc0203c7c:	8082                	ret
ffffffffc0203c7e:	fe078513          	addi	a0,a5,-32
ffffffffc0203c82:	ea88                	sd	a0,16(a3)
ffffffffc0203c84:	8082                	ret

ffffffffc0203c86 <insert_vma_struct>:
ffffffffc0203c86:	6590                	ld	a2,8(a1)
ffffffffc0203c88:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203c8c:	1141                	addi	sp,sp,-16
ffffffffc0203c8e:	e406                	sd	ra,8(sp)
ffffffffc0203c90:	87aa                	mv	a5,a0
ffffffffc0203c92:	01066763          	bltu	a2,a6,ffffffffc0203ca0 <insert_vma_struct+0x1a>
ffffffffc0203c96:	a085                	j	ffffffffc0203cf6 <insert_vma_struct+0x70>
ffffffffc0203c98:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203c9c:	04e66863          	bltu	a2,a4,ffffffffc0203cec <insert_vma_struct+0x66>
ffffffffc0203ca0:	86be                	mv	a3,a5
ffffffffc0203ca2:	679c                	ld	a5,8(a5)
ffffffffc0203ca4:	fef51ae3          	bne	a0,a5,ffffffffc0203c98 <insert_vma_struct+0x12>
ffffffffc0203ca8:	02a68463          	beq	a3,a0,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cac:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203cb0:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203cb4:	08e8f163          	bgeu	a7,a4,ffffffffc0203d36 <insert_vma_struct+0xb0>
ffffffffc0203cb8:	04e66f63          	bltu	a2,a4,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cbc:	00f50a63          	beq	a0,a5,ffffffffc0203cd0 <insert_vma_struct+0x4a>
ffffffffc0203cc0:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cc4:	05076963          	bltu	a4,a6,ffffffffc0203d16 <insert_vma_struct+0x90>
ffffffffc0203cc8:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203ccc:	02c77363          	bgeu	a4,a2,ffffffffc0203cf2 <insert_vma_struct+0x6c>
ffffffffc0203cd0:	5118                	lw	a4,32(a0)
ffffffffc0203cd2:	e188                	sd	a0,0(a1)
ffffffffc0203cd4:	02058613          	addi	a2,a1,32
ffffffffc0203cd8:	e390                	sd	a2,0(a5)
ffffffffc0203cda:	e690                	sd	a2,8(a3)
ffffffffc0203cdc:	60a2                	ld	ra,8(sp)
ffffffffc0203cde:	f59c                	sd	a5,40(a1)
ffffffffc0203ce0:	f194                	sd	a3,32(a1)
ffffffffc0203ce2:	0017079b          	addiw	a5,a4,1
ffffffffc0203ce6:	d11c                	sw	a5,32(a0)
ffffffffc0203ce8:	0141                	addi	sp,sp,16
ffffffffc0203cea:	8082                	ret
ffffffffc0203cec:	fca690e3          	bne	a3,a0,ffffffffc0203cac <insert_vma_struct+0x26>
ffffffffc0203cf0:	bfd1                	j	ffffffffc0203cc4 <insert_vma_struct+0x3e>
ffffffffc0203cf2:	ef3ff0ef          	jal	ra,ffffffffc0203be4 <check_vma_overlap.part.0>
ffffffffc0203cf6:	00009697          	auipc	a3,0x9
ffffffffc0203cfa:	fc268693          	addi	a3,a3,-62 # ffffffffc020ccb8 <default_pmm_manager+0x850>
ffffffffc0203cfe:	00008617          	auipc	a2,0x8
ffffffffc0203d02:	c8260613          	addi	a2,a2,-894 # ffffffffc020b980 <commands+0x210>
ffffffffc0203d06:	07c00593          	li	a1,124
ffffffffc0203d0a:	00009517          	auipc	a0,0x9
ffffffffc0203d0e:	f9e50513          	addi	a0,a0,-98 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203d12:	f8cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d16:	00009697          	auipc	a3,0x9
ffffffffc0203d1a:	fe268693          	addi	a3,a3,-30 # ffffffffc020ccf8 <default_pmm_manager+0x890>
ffffffffc0203d1e:	00008617          	auipc	a2,0x8
ffffffffc0203d22:	c6260613          	addi	a2,a2,-926 # ffffffffc020b980 <commands+0x210>
ffffffffc0203d26:	07500593          	li	a1,117
ffffffffc0203d2a:	00009517          	auipc	a0,0x9
ffffffffc0203d2e:	f7e50513          	addi	a0,a0,-130 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203d32:	f6cfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d36:	00009697          	auipc	a3,0x9
ffffffffc0203d3a:	fa268693          	addi	a3,a3,-94 # ffffffffc020ccd8 <default_pmm_manager+0x870>
ffffffffc0203d3e:	00008617          	auipc	a2,0x8
ffffffffc0203d42:	c4260613          	addi	a2,a2,-958 # ffffffffc020b980 <commands+0x210>
ffffffffc0203d46:	07400593          	li	a1,116
ffffffffc0203d4a:	00009517          	auipc	a0,0x9
ffffffffc0203d4e:	f5e50513          	addi	a0,a0,-162 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203d52:	f4cfc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d56 <mm_destroy>:
ffffffffc0203d56:	591c                	lw	a5,48(a0)
ffffffffc0203d58:	1141                	addi	sp,sp,-16
ffffffffc0203d5a:	e406                	sd	ra,8(sp)
ffffffffc0203d5c:	e022                	sd	s0,0(sp)
ffffffffc0203d5e:	e78d                	bnez	a5,ffffffffc0203d88 <mm_destroy+0x32>
ffffffffc0203d60:	842a                	mv	s0,a0
ffffffffc0203d62:	6508                	ld	a0,8(a0)
ffffffffc0203d64:	00a40c63          	beq	s0,a0,ffffffffc0203d7c <mm_destroy+0x26>
ffffffffc0203d68:	6118                	ld	a4,0(a0)
ffffffffc0203d6a:	651c                	ld	a5,8(a0)
ffffffffc0203d6c:	1501                	addi	a0,a0,-32
ffffffffc0203d6e:	e71c                	sd	a5,8(a4)
ffffffffc0203d70:	e398                	sd	a4,0(a5)
ffffffffc0203d72:	accfe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203d76:	6408                	ld	a0,8(s0)
ffffffffc0203d78:	fea418e3          	bne	s0,a0,ffffffffc0203d68 <mm_destroy+0x12>
ffffffffc0203d7c:	8522                	mv	a0,s0
ffffffffc0203d7e:	6402                	ld	s0,0(sp)
ffffffffc0203d80:	60a2                	ld	ra,8(sp)
ffffffffc0203d82:	0141                	addi	sp,sp,16
ffffffffc0203d84:	abafe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203d88:	00009697          	auipc	a3,0x9
ffffffffc0203d8c:	f9068693          	addi	a3,a3,-112 # ffffffffc020cd18 <default_pmm_manager+0x8b0>
ffffffffc0203d90:	00008617          	auipc	a2,0x8
ffffffffc0203d94:	bf060613          	addi	a2,a2,-1040 # ffffffffc020b980 <commands+0x210>
ffffffffc0203d98:	0a000593          	li	a1,160
ffffffffc0203d9c:	00009517          	auipc	a0,0x9
ffffffffc0203da0:	f0c50513          	addi	a0,a0,-244 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203da4:	efafc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203da8 <mm_map>:
ffffffffc0203da8:	7139                	addi	sp,sp,-64
ffffffffc0203daa:	f822                	sd	s0,48(sp)
ffffffffc0203dac:	6405                	lui	s0,0x1
ffffffffc0203dae:	147d                	addi	s0,s0,-1
ffffffffc0203db0:	77fd                	lui	a5,0xfffff
ffffffffc0203db2:	9622                	add	a2,a2,s0
ffffffffc0203db4:	962e                	add	a2,a2,a1
ffffffffc0203db6:	f426                	sd	s1,40(sp)
ffffffffc0203db8:	fc06                	sd	ra,56(sp)
ffffffffc0203dba:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203dbe:	f04a                	sd	s2,32(sp)
ffffffffc0203dc0:	ec4e                	sd	s3,24(sp)
ffffffffc0203dc2:	e852                	sd	s4,16(sp)
ffffffffc0203dc4:	e456                	sd	s5,8(sp)
ffffffffc0203dc6:	002005b7          	lui	a1,0x200
ffffffffc0203dca:	00f67433          	and	s0,a2,a5
ffffffffc0203dce:	06b4e363          	bltu	s1,a1,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd2:	0684f163          	bgeu	s1,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dd6:	4785                	li	a5,1
ffffffffc0203dd8:	07fe                	slli	a5,a5,0x1f
ffffffffc0203dda:	0487ed63          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203dde:	89aa                	mv	s3,a0
ffffffffc0203de0:	cd21                	beqz	a0,ffffffffc0203e38 <mm_map+0x90>
ffffffffc0203de2:	85a6                	mv	a1,s1
ffffffffc0203de4:	8ab6                	mv	s5,a3
ffffffffc0203de6:	8a3a                	mv	s4,a4
ffffffffc0203de8:	e5fff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0203dec:	c501                	beqz	a0,ffffffffc0203df4 <mm_map+0x4c>
ffffffffc0203dee:	651c                	ld	a5,8(a0)
ffffffffc0203df0:	0487e263          	bltu	a5,s0,ffffffffc0203e34 <mm_map+0x8c>
ffffffffc0203df4:	03000513          	li	a0,48
ffffffffc0203df8:	996fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203dfc:	892a                	mv	s2,a0
ffffffffc0203dfe:	5571                	li	a0,-4
ffffffffc0203e00:	02090163          	beqz	s2,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e04:	854e                	mv	a0,s3
ffffffffc0203e06:	00993423          	sd	s1,8(s2)
ffffffffc0203e0a:	00893823          	sd	s0,16(s2)
ffffffffc0203e0e:	01592c23          	sw	s5,24(s2)
ffffffffc0203e12:	85ca                	mv	a1,s2
ffffffffc0203e14:	e73ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e18:	4501                	li	a0,0
ffffffffc0203e1a:	000a0463          	beqz	s4,ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e1e:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203e22:	70e2                	ld	ra,56(sp)
ffffffffc0203e24:	7442                	ld	s0,48(sp)
ffffffffc0203e26:	74a2                	ld	s1,40(sp)
ffffffffc0203e28:	7902                	ld	s2,32(sp)
ffffffffc0203e2a:	69e2                	ld	s3,24(sp)
ffffffffc0203e2c:	6a42                	ld	s4,16(sp)
ffffffffc0203e2e:	6aa2                	ld	s5,8(sp)
ffffffffc0203e30:	6121                	addi	sp,sp,64
ffffffffc0203e32:	8082                	ret
ffffffffc0203e34:	5575                	li	a0,-3
ffffffffc0203e36:	b7f5                	j	ffffffffc0203e22 <mm_map+0x7a>
ffffffffc0203e38:	00009697          	auipc	a3,0x9
ffffffffc0203e3c:	ef868693          	addi	a3,a3,-264 # ffffffffc020cd30 <default_pmm_manager+0x8c8>
ffffffffc0203e40:	00008617          	auipc	a2,0x8
ffffffffc0203e44:	b4060613          	addi	a2,a2,-1216 # ffffffffc020b980 <commands+0x210>
ffffffffc0203e48:	0b500593          	li	a1,181
ffffffffc0203e4c:	00009517          	auipc	a0,0x9
ffffffffc0203e50:	e5c50513          	addi	a0,a0,-420 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203e54:	e4afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e58 <dup_mmap>:
ffffffffc0203e58:	7139                	addi	sp,sp,-64
ffffffffc0203e5a:	fc06                	sd	ra,56(sp)
ffffffffc0203e5c:	f822                	sd	s0,48(sp)
ffffffffc0203e5e:	f426                	sd	s1,40(sp)
ffffffffc0203e60:	f04a                	sd	s2,32(sp)
ffffffffc0203e62:	ec4e                	sd	s3,24(sp)
ffffffffc0203e64:	e852                	sd	s4,16(sp)
ffffffffc0203e66:	e456                	sd	s5,8(sp)
ffffffffc0203e68:	c52d                	beqz	a0,ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e6a:	892a                	mv	s2,a0
ffffffffc0203e6c:	84ae                	mv	s1,a1
ffffffffc0203e6e:	842e                	mv	s0,a1
ffffffffc0203e70:	e595                	bnez	a1,ffffffffc0203e9c <dup_mmap+0x44>
ffffffffc0203e72:	a085                	j	ffffffffc0203ed2 <dup_mmap+0x7a>
ffffffffc0203e74:	854a                	mv	a0,s2
ffffffffc0203e76:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203e7a:	0145b823          	sd	s4,16(a1)
ffffffffc0203e7e:	0135ac23          	sw	s3,24(a1)
ffffffffc0203e82:	e05ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203e86:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203e8a:	fe843603          	ld	a2,-24(s0)
ffffffffc0203e8e:	6c8c                	ld	a1,24(s1)
ffffffffc0203e90:	01893503          	ld	a0,24(s2)
ffffffffc0203e94:	4701                	li	a4,0
ffffffffc0203e96:	a2dff0ef          	jal	ra,ffffffffc02038c2 <copy_range>
ffffffffc0203e9a:	e105                	bnez	a0,ffffffffc0203eba <dup_mmap+0x62>
ffffffffc0203e9c:	6000                	ld	s0,0(s0)
ffffffffc0203e9e:	02848863          	beq	s1,s0,ffffffffc0203ece <dup_mmap+0x76>
ffffffffc0203ea2:	03000513          	li	a0,48
ffffffffc0203ea6:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203eaa:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203eae:	ff842983          	lw	s3,-8(s0)
ffffffffc0203eb2:	8dcfe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203eb6:	85aa                	mv	a1,a0
ffffffffc0203eb8:	fd55                	bnez	a0,ffffffffc0203e74 <dup_mmap+0x1c>
ffffffffc0203eba:	5571                	li	a0,-4
ffffffffc0203ebc:	70e2                	ld	ra,56(sp)
ffffffffc0203ebe:	7442                	ld	s0,48(sp)
ffffffffc0203ec0:	74a2                	ld	s1,40(sp)
ffffffffc0203ec2:	7902                	ld	s2,32(sp)
ffffffffc0203ec4:	69e2                	ld	s3,24(sp)
ffffffffc0203ec6:	6a42                	ld	s4,16(sp)
ffffffffc0203ec8:	6aa2                	ld	s5,8(sp)
ffffffffc0203eca:	6121                	addi	sp,sp,64
ffffffffc0203ecc:	8082                	ret
ffffffffc0203ece:	4501                	li	a0,0
ffffffffc0203ed0:	b7f5                	j	ffffffffc0203ebc <dup_mmap+0x64>
ffffffffc0203ed2:	00009697          	auipc	a3,0x9
ffffffffc0203ed6:	e6e68693          	addi	a3,a3,-402 # ffffffffc020cd40 <default_pmm_manager+0x8d8>
ffffffffc0203eda:	00008617          	auipc	a2,0x8
ffffffffc0203ede:	aa660613          	addi	a2,a2,-1370 # ffffffffc020b980 <commands+0x210>
ffffffffc0203ee2:	0d100593          	li	a1,209
ffffffffc0203ee6:	00009517          	auipc	a0,0x9
ffffffffc0203eea:	dc250513          	addi	a0,a0,-574 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203eee:	db0fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203ef2 <exit_mmap>:
ffffffffc0203ef2:	1101                	addi	sp,sp,-32
ffffffffc0203ef4:	ec06                	sd	ra,24(sp)
ffffffffc0203ef6:	e822                	sd	s0,16(sp)
ffffffffc0203ef8:	e426                	sd	s1,8(sp)
ffffffffc0203efa:	e04a                	sd	s2,0(sp)
ffffffffc0203efc:	c531                	beqz	a0,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203efe:	591c                	lw	a5,48(a0)
ffffffffc0203f00:	84aa                	mv	s1,a0
ffffffffc0203f02:	e3b9                	bnez	a5,ffffffffc0203f48 <exit_mmap+0x56>
ffffffffc0203f04:	6500                	ld	s0,8(a0)
ffffffffc0203f06:	01853903          	ld	s2,24(a0)
ffffffffc0203f0a:	02850663          	beq	a0,s0,ffffffffc0203f36 <exit_mmap+0x44>
ffffffffc0203f0e:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f12:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f16:	854a                	mv	a0,s2
ffffffffc0203f18:	e4efe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203f1c:	6400                	ld	s0,8(s0)
ffffffffc0203f1e:	fe8498e3          	bne	s1,s0,ffffffffc0203f0e <exit_mmap+0x1c>
ffffffffc0203f22:	6400                	ld	s0,8(s0)
ffffffffc0203f24:	00848c63          	beq	s1,s0,ffffffffc0203f3c <exit_mmap+0x4a>
ffffffffc0203f28:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f2c:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f30:	854a                	mv	a0,s2
ffffffffc0203f32:	f7afe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203f36:	6400                	ld	s0,8(s0)
ffffffffc0203f38:	fe8498e3          	bne	s1,s0,ffffffffc0203f28 <exit_mmap+0x36>
ffffffffc0203f3c:	60e2                	ld	ra,24(sp)
ffffffffc0203f3e:	6442                	ld	s0,16(sp)
ffffffffc0203f40:	64a2                	ld	s1,8(sp)
ffffffffc0203f42:	6902                	ld	s2,0(sp)
ffffffffc0203f44:	6105                	addi	sp,sp,32
ffffffffc0203f46:	8082                	ret
ffffffffc0203f48:	00009697          	auipc	a3,0x9
ffffffffc0203f4c:	e1868693          	addi	a3,a3,-488 # ffffffffc020cd60 <default_pmm_manager+0x8f8>
ffffffffc0203f50:	00008617          	auipc	a2,0x8
ffffffffc0203f54:	a3060613          	addi	a2,a2,-1488 # ffffffffc020b980 <commands+0x210>
ffffffffc0203f58:	0ea00593          	li	a1,234
ffffffffc0203f5c:	00009517          	auipc	a0,0x9
ffffffffc0203f60:	d4c50513          	addi	a0,a0,-692 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203f64:	d3afc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f68 <vmm_init>:
ffffffffc0203f68:	7139                	addi	sp,sp,-64
ffffffffc0203f6a:	05800513          	li	a0,88
ffffffffc0203f6e:	fc06                	sd	ra,56(sp)
ffffffffc0203f70:	f822                	sd	s0,48(sp)
ffffffffc0203f72:	f426                	sd	s1,40(sp)
ffffffffc0203f74:	f04a                	sd	s2,32(sp)
ffffffffc0203f76:	ec4e                	sd	s3,24(sp)
ffffffffc0203f78:	e852                	sd	s4,16(sp)
ffffffffc0203f7a:	e456                	sd	s5,8(sp)
ffffffffc0203f7c:	812fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f80:	2e050963          	beqz	a0,ffffffffc0204272 <vmm_init+0x30a>
ffffffffc0203f84:	e508                	sd	a0,8(a0)
ffffffffc0203f86:	e108                	sd	a0,0(a0)
ffffffffc0203f88:	00053823          	sd	zero,16(a0)
ffffffffc0203f8c:	00053c23          	sd	zero,24(a0)
ffffffffc0203f90:	02052023          	sw	zero,32(a0)
ffffffffc0203f94:	02053423          	sd	zero,40(a0)
ffffffffc0203f98:	02052823          	sw	zero,48(a0)
ffffffffc0203f9c:	84aa                	mv	s1,a0
ffffffffc0203f9e:	4585                	li	a1,1
ffffffffc0203fa0:	03850513          	addi	a0,a0,56
ffffffffc0203fa4:	5b6000ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0203fa8:	03200413          	li	s0,50
ffffffffc0203fac:	a811                	j	ffffffffc0203fc0 <vmm_init+0x58>
ffffffffc0203fae:	e500                	sd	s0,8(a0)
ffffffffc0203fb0:	e91c                	sd	a5,16(a0)
ffffffffc0203fb2:	00052c23          	sw	zero,24(a0)
ffffffffc0203fb6:	146d                	addi	s0,s0,-5
ffffffffc0203fb8:	8526                	mv	a0,s1
ffffffffc0203fba:	ccdff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc0203fbe:	c80d                	beqz	s0,ffffffffc0203ff0 <vmm_init+0x88>
ffffffffc0203fc0:	03000513          	li	a0,48
ffffffffc0203fc4:	fcbfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203fc8:	85aa                	mv	a1,a0
ffffffffc0203fca:	00240793          	addi	a5,s0,2
ffffffffc0203fce:	f165                	bnez	a0,ffffffffc0203fae <vmm_init+0x46>
ffffffffc0203fd0:	00009697          	auipc	a3,0x9
ffffffffc0203fd4:	f2868693          	addi	a3,a3,-216 # ffffffffc020cef8 <default_pmm_manager+0xa90>
ffffffffc0203fd8:	00008617          	auipc	a2,0x8
ffffffffc0203fdc:	9a860613          	addi	a2,a2,-1624 # ffffffffc020b980 <commands+0x210>
ffffffffc0203fe0:	12e00593          	li	a1,302
ffffffffc0203fe4:	00009517          	auipc	a0,0x9
ffffffffc0203fe8:	cc450513          	addi	a0,a0,-828 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc0203fec:	cb2fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ff0:	03700413          	li	s0,55
ffffffffc0203ff4:	1f900913          	li	s2,505
ffffffffc0203ff8:	a819                	j	ffffffffc020400e <vmm_init+0xa6>
ffffffffc0203ffa:	e500                	sd	s0,8(a0)
ffffffffc0203ffc:	e91c                	sd	a5,16(a0)
ffffffffc0203ffe:	00052c23          	sw	zero,24(a0)
ffffffffc0204002:	0415                	addi	s0,s0,5
ffffffffc0204004:	8526                	mv	a0,s1
ffffffffc0204006:	c81ff0ef          	jal	ra,ffffffffc0203c86 <insert_vma_struct>
ffffffffc020400a:	03240a63          	beq	s0,s2,ffffffffc020403e <vmm_init+0xd6>
ffffffffc020400e:	03000513          	li	a0,48
ffffffffc0204012:	f7dfd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0204016:	85aa                	mv	a1,a0
ffffffffc0204018:	00240793          	addi	a5,s0,2
ffffffffc020401c:	fd79                	bnez	a0,ffffffffc0203ffa <vmm_init+0x92>
ffffffffc020401e:	00009697          	auipc	a3,0x9
ffffffffc0204022:	eda68693          	addi	a3,a3,-294 # ffffffffc020cef8 <default_pmm_manager+0xa90>
ffffffffc0204026:	00008617          	auipc	a2,0x8
ffffffffc020402a:	95a60613          	addi	a2,a2,-1702 # ffffffffc020b980 <commands+0x210>
ffffffffc020402e:	13500593          	li	a1,309
ffffffffc0204032:	00009517          	auipc	a0,0x9
ffffffffc0204036:	c7650513          	addi	a0,a0,-906 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020403a:	c64fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020403e:	649c                	ld	a5,8(s1)
ffffffffc0204040:	471d                	li	a4,7
ffffffffc0204042:	1fb00593          	li	a1,507
ffffffffc0204046:	16f48663          	beq	s1,a5,ffffffffc02041b2 <vmm_init+0x24a>
ffffffffc020404a:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc020404e:	ffe70693          	addi	a3,a4,-2
ffffffffc0204052:	10d61063          	bne	a2,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc0204056:	ff07b683          	ld	a3,-16(a5)
ffffffffc020405a:	0ed71c63          	bne	a4,a3,ffffffffc0204152 <vmm_init+0x1ea>
ffffffffc020405e:	0715                	addi	a4,a4,5
ffffffffc0204060:	679c                	ld	a5,8(a5)
ffffffffc0204062:	feb712e3          	bne	a4,a1,ffffffffc0204046 <vmm_init+0xde>
ffffffffc0204066:	4a1d                	li	s4,7
ffffffffc0204068:	4415                	li	s0,5
ffffffffc020406a:	1f900a93          	li	s5,505
ffffffffc020406e:	85a2                	mv	a1,s0
ffffffffc0204070:	8526                	mv	a0,s1
ffffffffc0204072:	bd5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204076:	892a                	mv	s2,a0
ffffffffc0204078:	16050d63          	beqz	a0,ffffffffc02041f2 <vmm_init+0x28a>
ffffffffc020407c:	00140593          	addi	a1,s0,1
ffffffffc0204080:	8526                	mv	a0,s1
ffffffffc0204082:	bc5ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204086:	89aa                	mv	s3,a0
ffffffffc0204088:	14050563          	beqz	a0,ffffffffc02041d2 <vmm_init+0x26a>
ffffffffc020408c:	85d2                	mv	a1,s4
ffffffffc020408e:	8526                	mv	a0,s1
ffffffffc0204090:	bb7ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc0204094:	16051f63          	bnez	a0,ffffffffc0204212 <vmm_init+0x2aa>
ffffffffc0204098:	00340593          	addi	a1,s0,3
ffffffffc020409c:	8526                	mv	a0,s1
ffffffffc020409e:	ba9ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040a2:	1a051863          	bnez	a0,ffffffffc0204252 <vmm_init+0x2ea>
ffffffffc02040a6:	00440593          	addi	a1,s0,4
ffffffffc02040aa:	8526                	mv	a0,s1
ffffffffc02040ac:	b9bff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040b0:	18051163          	bnez	a0,ffffffffc0204232 <vmm_init+0x2ca>
ffffffffc02040b4:	00893783          	ld	a5,8(s2)
ffffffffc02040b8:	0a879d63          	bne	a5,s0,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040bc:	01093783          	ld	a5,16(s2)
ffffffffc02040c0:	0b479963          	bne	a5,s4,ffffffffc0204172 <vmm_init+0x20a>
ffffffffc02040c4:	0089b783          	ld	a5,8(s3)
ffffffffc02040c8:	0c879563          	bne	a5,s0,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040cc:	0109b783          	ld	a5,16(s3)
ffffffffc02040d0:	0d479163          	bne	a5,s4,ffffffffc0204192 <vmm_init+0x22a>
ffffffffc02040d4:	0415                	addi	s0,s0,5
ffffffffc02040d6:	0a15                	addi	s4,s4,5
ffffffffc02040d8:	f9541be3          	bne	s0,s5,ffffffffc020406e <vmm_init+0x106>
ffffffffc02040dc:	4411                	li	s0,4
ffffffffc02040de:	597d                	li	s2,-1
ffffffffc02040e0:	85a2                	mv	a1,s0
ffffffffc02040e2:	8526                	mv	a0,s1
ffffffffc02040e4:	b63ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02040e8:	0004059b          	sext.w	a1,s0
ffffffffc02040ec:	c90d                	beqz	a0,ffffffffc020411e <vmm_init+0x1b6>
ffffffffc02040ee:	6914                	ld	a3,16(a0)
ffffffffc02040f0:	6510                	ld	a2,8(a0)
ffffffffc02040f2:	00009517          	auipc	a0,0x9
ffffffffc02040f6:	d8e50513          	addi	a0,a0,-626 # ffffffffc020ce80 <default_pmm_manager+0xa18>
ffffffffc02040fa:	8acfc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02040fe:	00009697          	auipc	a3,0x9
ffffffffc0204102:	daa68693          	addi	a3,a3,-598 # ffffffffc020cea8 <default_pmm_manager+0xa40>
ffffffffc0204106:	00008617          	auipc	a2,0x8
ffffffffc020410a:	87a60613          	addi	a2,a2,-1926 # ffffffffc020b980 <commands+0x210>
ffffffffc020410e:	15b00593          	li	a1,347
ffffffffc0204112:	00009517          	auipc	a0,0x9
ffffffffc0204116:	b9650513          	addi	a0,a0,-1130 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020411a:	b84fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020411e:	147d                	addi	s0,s0,-1
ffffffffc0204120:	fd2410e3          	bne	s0,s2,ffffffffc02040e0 <vmm_init+0x178>
ffffffffc0204124:	8526                	mv	a0,s1
ffffffffc0204126:	c31ff0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc020412a:	00009517          	auipc	a0,0x9
ffffffffc020412e:	d9650513          	addi	a0,a0,-618 # ffffffffc020cec0 <default_pmm_manager+0xa58>
ffffffffc0204132:	874fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204136:	7442                	ld	s0,48(sp)
ffffffffc0204138:	70e2                	ld	ra,56(sp)
ffffffffc020413a:	74a2                	ld	s1,40(sp)
ffffffffc020413c:	7902                	ld	s2,32(sp)
ffffffffc020413e:	69e2                	ld	s3,24(sp)
ffffffffc0204140:	6a42                	ld	s4,16(sp)
ffffffffc0204142:	6aa2                	ld	s5,8(sp)
ffffffffc0204144:	00009517          	auipc	a0,0x9
ffffffffc0204148:	d9c50513          	addi	a0,a0,-612 # ffffffffc020cee0 <default_pmm_manager+0xa78>
ffffffffc020414c:	6121                	addi	sp,sp,64
ffffffffc020414e:	858fc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0204152:	00009697          	auipc	a3,0x9
ffffffffc0204156:	c4668693          	addi	a3,a3,-954 # ffffffffc020cd98 <default_pmm_manager+0x930>
ffffffffc020415a:	00008617          	auipc	a2,0x8
ffffffffc020415e:	82660613          	addi	a2,a2,-2010 # ffffffffc020b980 <commands+0x210>
ffffffffc0204162:	13f00593          	li	a1,319
ffffffffc0204166:	00009517          	auipc	a0,0x9
ffffffffc020416a:	b4250513          	addi	a0,a0,-1214 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020416e:	b30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204172:	00009697          	auipc	a3,0x9
ffffffffc0204176:	cae68693          	addi	a3,a3,-850 # ffffffffc020ce20 <default_pmm_manager+0x9b8>
ffffffffc020417a:	00008617          	auipc	a2,0x8
ffffffffc020417e:	80660613          	addi	a2,a2,-2042 # ffffffffc020b980 <commands+0x210>
ffffffffc0204182:	15000593          	li	a1,336
ffffffffc0204186:	00009517          	auipc	a0,0x9
ffffffffc020418a:	b2250513          	addi	a0,a0,-1246 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020418e:	b10fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204192:	00009697          	auipc	a3,0x9
ffffffffc0204196:	cbe68693          	addi	a3,a3,-834 # ffffffffc020ce50 <default_pmm_manager+0x9e8>
ffffffffc020419a:	00007617          	auipc	a2,0x7
ffffffffc020419e:	7e660613          	addi	a2,a2,2022 # ffffffffc020b980 <commands+0x210>
ffffffffc02041a2:	15100593          	li	a1,337
ffffffffc02041a6:	00009517          	auipc	a0,0x9
ffffffffc02041aa:	b0250513          	addi	a0,a0,-1278 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc02041ae:	af0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041b2:	00009697          	auipc	a3,0x9
ffffffffc02041b6:	bce68693          	addi	a3,a3,-1074 # ffffffffc020cd80 <default_pmm_manager+0x918>
ffffffffc02041ba:	00007617          	auipc	a2,0x7
ffffffffc02041be:	7c660613          	addi	a2,a2,1990 # ffffffffc020b980 <commands+0x210>
ffffffffc02041c2:	13d00593          	li	a1,317
ffffffffc02041c6:	00009517          	auipc	a0,0x9
ffffffffc02041ca:	ae250513          	addi	a0,a0,-1310 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc02041ce:	ad0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041d2:	00009697          	auipc	a3,0x9
ffffffffc02041d6:	c0e68693          	addi	a3,a3,-1010 # ffffffffc020cde0 <default_pmm_manager+0x978>
ffffffffc02041da:	00007617          	auipc	a2,0x7
ffffffffc02041de:	7a660613          	addi	a2,a2,1958 # ffffffffc020b980 <commands+0x210>
ffffffffc02041e2:	14800593          	li	a1,328
ffffffffc02041e6:	00009517          	auipc	a0,0x9
ffffffffc02041ea:	ac250513          	addi	a0,a0,-1342 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc02041ee:	ab0fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041f2:	00009697          	auipc	a3,0x9
ffffffffc02041f6:	bde68693          	addi	a3,a3,-1058 # ffffffffc020cdd0 <default_pmm_manager+0x968>
ffffffffc02041fa:	00007617          	auipc	a2,0x7
ffffffffc02041fe:	78660613          	addi	a2,a2,1926 # ffffffffc020b980 <commands+0x210>
ffffffffc0204202:	14600593          	li	a1,326
ffffffffc0204206:	00009517          	auipc	a0,0x9
ffffffffc020420a:	aa250513          	addi	a0,a0,-1374 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020420e:	a90fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204212:	00009697          	auipc	a3,0x9
ffffffffc0204216:	bde68693          	addi	a3,a3,-1058 # ffffffffc020cdf0 <default_pmm_manager+0x988>
ffffffffc020421a:	00007617          	auipc	a2,0x7
ffffffffc020421e:	76660613          	addi	a2,a2,1894 # ffffffffc020b980 <commands+0x210>
ffffffffc0204222:	14a00593          	li	a1,330
ffffffffc0204226:	00009517          	auipc	a0,0x9
ffffffffc020422a:	a8250513          	addi	a0,a0,-1406 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020422e:	a70fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204232:	00009697          	auipc	a3,0x9
ffffffffc0204236:	bde68693          	addi	a3,a3,-1058 # ffffffffc020ce10 <default_pmm_manager+0x9a8>
ffffffffc020423a:	00007617          	auipc	a2,0x7
ffffffffc020423e:	74660613          	addi	a2,a2,1862 # ffffffffc020b980 <commands+0x210>
ffffffffc0204242:	14e00593          	li	a1,334
ffffffffc0204246:	00009517          	auipc	a0,0x9
ffffffffc020424a:	a6250513          	addi	a0,a0,-1438 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020424e:	a50fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204252:	00009697          	auipc	a3,0x9
ffffffffc0204256:	bae68693          	addi	a3,a3,-1106 # ffffffffc020ce00 <default_pmm_manager+0x998>
ffffffffc020425a:	00007617          	auipc	a2,0x7
ffffffffc020425e:	72660613          	addi	a2,a2,1830 # ffffffffc020b980 <commands+0x210>
ffffffffc0204262:	14c00593          	li	a1,332
ffffffffc0204266:	00009517          	auipc	a0,0x9
ffffffffc020426a:	a4250513          	addi	a0,a0,-1470 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020426e:	a30fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204272:	00009697          	auipc	a3,0x9
ffffffffc0204276:	abe68693          	addi	a3,a3,-1346 # ffffffffc020cd30 <default_pmm_manager+0x8c8>
ffffffffc020427a:	00007617          	auipc	a2,0x7
ffffffffc020427e:	70660613          	addi	a2,a2,1798 # ffffffffc020b980 <commands+0x210>
ffffffffc0204282:	12600593          	li	a1,294
ffffffffc0204286:	00009517          	auipc	a0,0x9
ffffffffc020428a:	a2250513          	addi	a0,a0,-1502 # ffffffffc020cca8 <default_pmm_manager+0x840>
ffffffffc020428e:	a10fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204292 <user_mem_check>:
ffffffffc0204292:	7179                	addi	sp,sp,-48
ffffffffc0204294:	f022                	sd	s0,32(sp)
ffffffffc0204296:	f406                	sd	ra,40(sp)
ffffffffc0204298:	ec26                	sd	s1,24(sp)
ffffffffc020429a:	e84a                	sd	s2,16(sp)
ffffffffc020429c:	e44e                	sd	s3,8(sp)
ffffffffc020429e:	e052                	sd	s4,0(sp)
ffffffffc02042a0:	842e                	mv	s0,a1
ffffffffc02042a2:	c135                	beqz	a0,ffffffffc0204306 <user_mem_check+0x74>
ffffffffc02042a4:	002007b7          	lui	a5,0x200
ffffffffc02042a8:	04f5e663          	bltu	a1,a5,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ac:	00c584b3          	add	s1,a1,a2
ffffffffc02042b0:	0495f263          	bgeu	a1,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042b4:	4785                	li	a5,1
ffffffffc02042b6:	07fe                	slli	a5,a5,0x1f
ffffffffc02042b8:	0297ee63          	bltu	a5,s1,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042bc:	892a                	mv	s2,a0
ffffffffc02042be:	89b6                	mv	s3,a3
ffffffffc02042c0:	6a05                	lui	s4,0x1
ffffffffc02042c2:	a821                	j	ffffffffc02042da <user_mem_check+0x48>
ffffffffc02042c4:	0027f693          	andi	a3,a5,2
ffffffffc02042c8:	9752                	add	a4,a4,s4
ffffffffc02042ca:	8ba1                	andi	a5,a5,8
ffffffffc02042cc:	c685                	beqz	a3,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ce:	c399                	beqz	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042d0:	02e46263          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042d4:	6900                	ld	s0,16(a0)
ffffffffc02042d6:	04947663          	bgeu	s0,s1,ffffffffc0204322 <user_mem_check+0x90>
ffffffffc02042da:	85a2                	mv	a1,s0
ffffffffc02042dc:	854a                	mv	a0,s2
ffffffffc02042de:	969ff0ef          	jal	ra,ffffffffc0203c46 <find_vma>
ffffffffc02042e2:	c909                	beqz	a0,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042e4:	6518                	ld	a4,8(a0)
ffffffffc02042e6:	00e46763          	bltu	s0,a4,ffffffffc02042f4 <user_mem_check+0x62>
ffffffffc02042ea:	4d1c                	lw	a5,24(a0)
ffffffffc02042ec:	fc099ce3          	bnez	s3,ffffffffc02042c4 <user_mem_check+0x32>
ffffffffc02042f0:	8b85                	andi	a5,a5,1
ffffffffc02042f2:	f3ed                	bnez	a5,ffffffffc02042d4 <user_mem_check+0x42>
ffffffffc02042f4:	4501                	li	a0,0
ffffffffc02042f6:	70a2                	ld	ra,40(sp)
ffffffffc02042f8:	7402                	ld	s0,32(sp)
ffffffffc02042fa:	64e2                	ld	s1,24(sp)
ffffffffc02042fc:	6942                	ld	s2,16(sp)
ffffffffc02042fe:	69a2                	ld	s3,8(sp)
ffffffffc0204300:	6a02                	ld	s4,0(sp)
ffffffffc0204302:	6145                	addi	sp,sp,48
ffffffffc0204304:	8082                	ret
ffffffffc0204306:	c02007b7          	lui	a5,0xc0200
ffffffffc020430a:	4501                	li	a0,0
ffffffffc020430c:	fef5e5e3          	bltu	a1,a5,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204310:	962e                	add	a2,a2,a1
ffffffffc0204312:	fec5f2e3          	bgeu	a1,a2,ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204316:	c8000537          	lui	a0,0xc8000
ffffffffc020431a:	0505                	addi	a0,a0,1
ffffffffc020431c:	00a63533          	sltu	a0,a2,a0
ffffffffc0204320:	bfd9                	j	ffffffffc02042f6 <user_mem_check+0x64>
ffffffffc0204322:	4505                	li	a0,1
ffffffffc0204324:	bfc9                	j	ffffffffc02042f6 <user_mem_check+0x64>

ffffffffc0204326 <copy_from_user>:
ffffffffc0204326:	1101                	addi	sp,sp,-32
ffffffffc0204328:	e822                	sd	s0,16(sp)
ffffffffc020432a:	e426                	sd	s1,8(sp)
ffffffffc020432c:	8432                	mv	s0,a2
ffffffffc020432e:	84b6                	mv	s1,a3
ffffffffc0204330:	e04a                	sd	s2,0(sp)
ffffffffc0204332:	86ba                	mv	a3,a4
ffffffffc0204334:	892e                	mv	s2,a1
ffffffffc0204336:	8626                	mv	a2,s1
ffffffffc0204338:	85a2                	mv	a1,s0
ffffffffc020433a:	ec06                	sd	ra,24(sp)
ffffffffc020433c:	f57ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204340:	c519                	beqz	a0,ffffffffc020434e <copy_from_user+0x28>
ffffffffc0204342:	8626                	mv	a2,s1
ffffffffc0204344:	85a2                	mv	a1,s0
ffffffffc0204346:	854a                	mv	a0,s2
ffffffffc0204348:	1a4070ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020434c:	4505                	li	a0,1
ffffffffc020434e:	60e2                	ld	ra,24(sp)
ffffffffc0204350:	6442                	ld	s0,16(sp)
ffffffffc0204352:	64a2                	ld	s1,8(sp)
ffffffffc0204354:	6902                	ld	s2,0(sp)
ffffffffc0204356:	6105                	addi	sp,sp,32
ffffffffc0204358:	8082                	ret

ffffffffc020435a <copy_to_user>:
ffffffffc020435a:	1101                	addi	sp,sp,-32
ffffffffc020435c:	e822                	sd	s0,16(sp)
ffffffffc020435e:	8436                	mv	s0,a3
ffffffffc0204360:	e04a                	sd	s2,0(sp)
ffffffffc0204362:	4685                	li	a3,1
ffffffffc0204364:	8932                	mv	s2,a2
ffffffffc0204366:	8622                	mv	a2,s0
ffffffffc0204368:	e426                	sd	s1,8(sp)
ffffffffc020436a:	ec06                	sd	ra,24(sp)
ffffffffc020436c:	84ae                	mv	s1,a1
ffffffffc020436e:	f25ff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0204372:	c519                	beqz	a0,ffffffffc0204380 <copy_to_user+0x26>
ffffffffc0204374:	8622                	mv	a2,s0
ffffffffc0204376:	85ca                	mv	a1,s2
ffffffffc0204378:	8526                	mv	a0,s1
ffffffffc020437a:	172070ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020437e:	4505                	li	a0,1
ffffffffc0204380:	60e2                	ld	ra,24(sp)
ffffffffc0204382:	6442                	ld	s0,16(sp)
ffffffffc0204384:	64a2                	ld	s1,8(sp)
ffffffffc0204386:	6902                	ld	s2,0(sp)
ffffffffc0204388:	6105                	addi	sp,sp,32
ffffffffc020438a:	8082                	ret

ffffffffc020438c <copy_string>:
ffffffffc020438c:	7139                	addi	sp,sp,-64
ffffffffc020438e:	ec4e                	sd	s3,24(sp)
ffffffffc0204390:	6985                	lui	s3,0x1
ffffffffc0204392:	99b2                	add	s3,s3,a2
ffffffffc0204394:	77fd                	lui	a5,0xfffff
ffffffffc0204396:	00f9f9b3          	and	s3,s3,a5
ffffffffc020439a:	f426                	sd	s1,40(sp)
ffffffffc020439c:	f04a                	sd	s2,32(sp)
ffffffffc020439e:	e852                	sd	s4,16(sp)
ffffffffc02043a0:	e456                	sd	s5,8(sp)
ffffffffc02043a2:	fc06                	sd	ra,56(sp)
ffffffffc02043a4:	f822                	sd	s0,48(sp)
ffffffffc02043a6:	84b2                	mv	s1,a2
ffffffffc02043a8:	8aaa                	mv	s5,a0
ffffffffc02043aa:	8a2e                	mv	s4,a1
ffffffffc02043ac:	8936                	mv	s2,a3
ffffffffc02043ae:	40c989b3          	sub	s3,s3,a2
ffffffffc02043b2:	a015                	j	ffffffffc02043d6 <copy_string+0x4a>
ffffffffc02043b4:	05e070ef          	jal	ra,ffffffffc020b412 <strnlen>
ffffffffc02043b8:	87aa                	mv	a5,a0
ffffffffc02043ba:	85a6                	mv	a1,s1
ffffffffc02043bc:	8552                	mv	a0,s4
ffffffffc02043be:	8622                	mv	a2,s0
ffffffffc02043c0:	0487e363          	bltu	a5,s0,ffffffffc0204406 <copy_string+0x7a>
ffffffffc02043c4:	0329f763          	bgeu	s3,s2,ffffffffc02043f2 <copy_string+0x66>
ffffffffc02043c8:	124070ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc02043cc:	9a22                	add	s4,s4,s0
ffffffffc02043ce:	94a2                	add	s1,s1,s0
ffffffffc02043d0:	40890933          	sub	s2,s2,s0
ffffffffc02043d4:	6985                	lui	s3,0x1
ffffffffc02043d6:	4681                	li	a3,0
ffffffffc02043d8:	85a6                	mv	a1,s1
ffffffffc02043da:	8556                	mv	a0,s5
ffffffffc02043dc:	844a                	mv	s0,s2
ffffffffc02043de:	0129f363          	bgeu	s3,s2,ffffffffc02043e4 <copy_string+0x58>
ffffffffc02043e2:	844e                	mv	s0,s3
ffffffffc02043e4:	8622                	mv	a2,s0
ffffffffc02043e6:	eadff0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02043ea:	87aa                	mv	a5,a0
ffffffffc02043ec:	85a2                	mv	a1,s0
ffffffffc02043ee:	8526                	mv	a0,s1
ffffffffc02043f0:	f3f1                	bnez	a5,ffffffffc02043b4 <copy_string+0x28>
ffffffffc02043f2:	4501                	li	a0,0
ffffffffc02043f4:	70e2                	ld	ra,56(sp)
ffffffffc02043f6:	7442                	ld	s0,48(sp)
ffffffffc02043f8:	74a2                	ld	s1,40(sp)
ffffffffc02043fa:	7902                	ld	s2,32(sp)
ffffffffc02043fc:	69e2                	ld	s3,24(sp)
ffffffffc02043fe:	6a42                	ld	s4,16(sp)
ffffffffc0204400:	6aa2                	ld	s5,8(sp)
ffffffffc0204402:	6121                	addi	sp,sp,64
ffffffffc0204404:	8082                	ret
ffffffffc0204406:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc020440a:	0e2070ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020440e:	4505                	li	a0,1
ffffffffc0204410:	b7d5                	j	ffffffffc02043f4 <copy_string+0x68>

ffffffffc0204412 <__down.constprop.0>:
ffffffffc0204412:	715d                	addi	sp,sp,-80
ffffffffc0204414:	e0a2                	sd	s0,64(sp)
ffffffffc0204416:	e486                	sd	ra,72(sp)
ffffffffc0204418:	fc26                	sd	s1,56(sp)
ffffffffc020441a:	842a                	mv	s0,a0
ffffffffc020441c:	100027f3          	csrr	a5,sstatus
ffffffffc0204420:	8b89                	andi	a5,a5,2
ffffffffc0204422:	ebb1                	bnez	a5,ffffffffc0204476 <__down.constprop.0+0x64>
ffffffffc0204424:	411c                	lw	a5,0(a0)
ffffffffc0204426:	00f05a63          	blez	a5,ffffffffc020443a <__down.constprop.0+0x28>
ffffffffc020442a:	37fd                	addiw	a5,a5,-1
ffffffffc020442c:	c11c                	sw	a5,0(a0)
ffffffffc020442e:	4501                	li	a0,0
ffffffffc0204430:	60a6                	ld	ra,72(sp)
ffffffffc0204432:	6406                	ld	s0,64(sp)
ffffffffc0204434:	74e2                	ld	s1,56(sp)
ffffffffc0204436:	6161                	addi	sp,sp,80
ffffffffc0204438:	8082                	ret
ffffffffc020443a:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020443e:	0024                	addi	s1,sp,8
ffffffffc0204440:	10000613          	li	a2,256
ffffffffc0204444:	85a6                	mv	a1,s1
ffffffffc0204446:	8522                	mv	a0,s0
ffffffffc0204448:	2d8000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc020444c:	6d9020ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc0204450:	100027f3          	csrr	a5,sstatus
ffffffffc0204454:	8b89                	andi	a5,a5,2
ffffffffc0204456:	efb9                	bnez	a5,ffffffffc02044b4 <__down.constprop.0+0xa2>
ffffffffc0204458:	8526                	mv	a0,s1
ffffffffc020445a:	19c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc020445e:	e531                	bnez	a0,ffffffffc02044aa <__down.constprop.0+0x98>
ffffffffc0204460:	4542                	lw	a0,16(sp)
ffffffffc0204462:	10000793          	li	a5,256
ffffffffc0204466:	fcf515e3          	bne	a0,a5,ffffffffc0204430 <__down.constprop.0+0x1e>
ffffffffc020446a:	60a6                	ld	ra,72(sp)
ffffffffc020446c:	6406                	ld	s0,64(sp)
ffffffffc020446e:	74e2                	ld	s1,56(sp)
ffffffffc0204470:	4501                	li	a0,0
ffffffffc0204472:	6161                	addi	sp,sp,80
ffffffffc0204474:	8082                	ret
ffffffffc0204476:	ffcfc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020447a:	401c                	lw	a5,0(s0)
ffffffffc020447c:	00f05c63          	blez	a5,ffffffffc0204494 <__down.constprop.0+0x82>
ffffffffc0204480:	37fd                	addiw	a5,a5,-1
ffffffffc0204482:	c01c                	sw	a5,0(s0)
ffffffffc0204484:	fe8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204488:	60a6                	ld	ra,72(sp)
ffffffffc020448a:	6406                	ld	s0,64(sp)
ffffffffc020448c:	74e2                	ld	s1,56(sp)
ffffffffc020448e:	4501                	li	a0,0
ffffffffc0204490:	6161                	addi	sp,sp,80
ffffffffc0204492:	8082                	ret
ffffffffc0204494:	0421                	addi	s0,s0,8
ffffffffc0204496:	0024                	addi	s1,sp,8
ffffffffc0204498:	10000613          	li	a2,256
ffffffffc020449c:	85a6                	mv	a1,s1
ffffffffc020449e:	8522                	mv	a0,s0
ffffffffc02044a0:	280000ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc02044a4:	fc8fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044a8:	b755                	j	ffffffffc020444c <__down.constprop.0+0x3a>
ffffffffc02044aa:	85a6                	mv	a1,s1
ffffffffc02044ac:	8522                	mv	a0,s0
ffffffffc02044ae:	0ee000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044b2:	b77d                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044b4:	fbefc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02044b8:	8526                	mv	a0,s1
ffffffffc02044ba:	13c000ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc02044be:	e501                	bnez	a0,ffffffffc02044c6 <__down.constprop.0+0xb4>
ffffffffc02044c0:	facfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044c4:	bf71                	j	ffffffffc0204460 <__down.constprop.0+0x4e>
ffffffffc02044c6:	85a6                	mv	a1,s1
ffffffffc02044c8:	8522                	mv	a0,s0
ffffffffc02044ca:	0d2000ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc02044ce:	bfcd                	j	ffffffffc02044c0 <__down.constprop.0+0xae>

ffffffffc02044d0 <__up.constprop.0>:
ffffffffc02044d0:	1101                	addi	sp,sp,-32
ffffffffc02044d2:	e822                	sd	s0,16(sp)
ffffffffc02044d4:	ec06                	sd	ra,24(sp)
ffffffffc02044d6:	e426                	sd	s1,8(sp)
ffffffffc02044d8:	e04a                	sd	s2,0(sp)
ffffffffc02044da:	842a                	mv	s0,a0
ffffffffc02044dc:	100027f3          	csrr	a5,sstatus
ffffffffc02044e0:	8b89                	andi	a5,a5,2
ffffffffc02044e2:	4901                	li	s2,0
ffffffffc02044e4:	eba1                	bnez	a5,ffffffffc0204534 <__up.constprop.0+0x64>
ffffffffc02044e6:	00840493          	addi	s1,s0,8
ffffffffc02044ea:	8526                	mv	a0,s1
ffffffffc02044ec:	0ee000ef          	jal	ra,ffffffffc02045da <wait_queue_first>
ffffffffc02044f0:	85aa                	mv	a1,a0
ffffffffc02044f2:	cd0d                	beqz	a0,ffffffffc020452c <__up.constprop.0+0x5c>
ffffffffc02044f4:	6118                	ld	a4,0(a0)
ffffffffc02044f6:	10000793          	li	a5,256
ffffffffc02044fa:	0ec72703          	lw	a4,236(a4)
ffffffffc02044fe:	02f71f63          	bne	a4,a5,ffffffffc020453c <__up.constprop.0+0x6c>
ffffffffc0204502:	4685                	li	a3,1
ffffffffc0204504:	10000613          	li	a2,256
ffffffffc0204508:	8526                	mv	a0,s1
ffffffffc020450a:	0fa000ef          	jal	ra,ffffffffc0204604 <wakeup_wait>
ffffffffc020450e:	00091863          	bnez	s2,ffffffffc020451e <__up.constprop.0+0x4e>
ffffffffc0204512:	60e2                	ld	ra,24(sp)
ffffffffc0204514:	6442                	ld	s0,16(sp)
ffffffffc0204516:	64a2                	ld	s1,8(sp)
ffffffffc0204518:	6902                	ld	s2,0(sp)
ffffffffc020451a:	6105                	addi	sp,sp,32
ffffffffc020451c:	8082                	ret
ffffffffc020451e:	6442                	ld	s0,16(sp)
ffffffffc0204520:	60e2                	ld	ra,24(sp)
ffffffffc0204522:	64a2                	ld	s1,8(sp)
ffffffffc0204524:	6902                	ld	s2,0(sp)
ffffffffc0204526:	6105                	addi	sp,sp,32
ffffffffc0204528:	f44fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc020452c:	401c                	lw	a5,0(s0)
ffffffffc020452e:	2785                	addiw	a5,a5,1
ffffffffc0204530:	c01c                	sw	a5,0(s0)
ffffffffc0204532:	bff1                	j	ffffffffc020450e <__up.constprop.0+0x3e>
ffffffffc0204534:	f3efc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204538:	4905                	li	s2,1
ffffffffc020453a:	b775                	j	ffffffffc02044e6 <__up.constprop.0+0x16>
ffffffffc020453c:	00009697          	auipc	a3,0x9
ffffffffc0204540:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020cf08 <default_pmm_manager+0xaa0>
ffffffffc0204544:	00007617          	auipc	a2,0x7
ffffffffc0204548:	43c60613          	addi	a2,a2,1084 # ffffffffc020b980 <commands+0x210>
ffffffffc020454c:	45e5                	li	a1,25
ffffffffc020454e:	00009517          	auipc	a0,0x9
ffffffffc0204552:	9e250513          	addi	a0,a0,-1566 # ffffffffc020cf30 <default_pmm_manager+0xac8>
ffffffffc0204556:	f49fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020455a <sem_init>:
ffffffffc020455a:	c10c                	sw	a1,0(a0)
ffffffffc020455c:	0521                	addi	a0,a0,8
ffffffffc020455e:	a825                	j	ffffffffc0204596 <wait_queue_init>

ffffffffc0204560 <up>:
ffffffffc0204560:	f71ff06f          	j	ffffffffc02044d0 <__up.constprop.0>

ffffffffc0204564 <down>:
ffffffffc0204564:	1141                	addi	sp,sp,-16
ffffffffc0204566:	e406                	sd	ra,8(sp)
ffffffffc0204568:	eabff0ef          	jal	ra,ffffffffc0204412 <__down.constprop.0>
ffffffffc020456c:	2501                	sext.w	a0,a0
ffffffffc020456e:	e501                	bnez	a0,ffffffffc0204576 <down+0x12>
ffffffffc0204570:	60a2                	ld	ra,8(sp)
ffffffffc0204572:	0141                	addi	sp,sp,16
ffffffffc0204574:	8082                	ret
ffffffffc0204576:	00009697          	auipc	a3,0x9
ffffffffc020457a:	9ca68693          	addi	a3,a3,-1590 # ffffffffc020cf40 <default_pmm_manager+0xad8>
ffffffffc020457e:	00007617          	auipc	a2,0x7
ffffffffc0204582:	40260613          	addi	a2,a2,1026 # ffffffffc020b980 <commands+0x210>
ffffffffc0204586:	04000593          	li	a1,64
ffffffffc020458a:	00009517          	auipc	a0,0x9
ffffffffc020458e:	9a650513          	addi	a0,a0,-1626 # ffffffffc020cf30 <default_pmm_manager+0xac8>
ffffffffc0204592:	f0dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204596 <wait_queue_init>:
ffffffffc0204596:	e508                	sd	a0,8(a0)
ffffffffc0204598:	e108                	sd	a0,0(a0)
ffffffffc020459a:	8082                	ret

ffffffffc020459c <wait_queue_del>:
ffffffffc020459c:	7198                	ld	a4,32(a1)
ffffffffc020459e:	01858793          	addi	a5,a1,24
ffffffffc02045a2:	00e78b63          	beq	a5,a4,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045a6:	6994                	ld	a3,16(a1)
ffffffffc02045a8:	00a69863          	bne	a3,a0,ffffffffc02045b8 <wait_queue_del+0x1c>
ffffffffc02045ac:	6d94                	ld	a3,24(a1)
ffffffffc02045ae:	e698                	sd	a4,8(a3)
ffffffffc02045b0:	e314                	sd	a3,0(a4)
ffffffffc02045b2:	f19c                	sd	a5,32(a1)
ffffffffc02045b4:	ed9c                	sd	a5,24(a1)
ffffffffc02045b6:	8082                	ret
ffffffffc02045b8:	1141                	addi	sp,sp,-16
ffffffffc02045ba:	00009697          	auipc	a3,0x9
ffffffffc02045be:	9e668693          	addi	a3,a3,-1562 # ffffffffc020cfa0 <default_pmm_manager+0xb38>
ffffffffc02045c2:	00007617          	auipc	a2,0x7
ffffffffc02045c6:	3be60613          	addi	a2,a2,958 # ffffffffc020b980 <commands+0x210>
ffffffffc02045ca:	45f1                	li	a1,28
ffffffffc02045cc:	00009517          	auipc	a0,0x9
ffffffffc02045d0:	9bc50513          	addi	a0,a0,-1604 # ffffffffc020cf88 <default_pmm_manager+0xb20>
ffffffffc02045d4:	e406                	sd	ra,8(sp)
ffffffffc02045d6:	ec9fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045da <wait_queue_first>:
ffffffffc02045da:	651c                	ld	a5,8(a0)
ffffffffc02045dc:	00f50563          	beq	a0,a5,ffffffffc02045e6 <wait_queue_first+0xc>
ffffffffc02045e0:	fe878513          	addi	a0,a5,-24
ffffffffc02045e4:	8082                	ret
ffffffffc02045e6:	4501                	li	a0,0
ffffffffc02045e8:	8082                	ret

ffffffffc02045ea <wait_queue_empty>:
ffffffffc02045ea:	651c                	ld	a5,8(a0)
ffffffffc02045ec:	40a78533          	sub	a0,a5,a0
ffffffffc02045f0:	00153513          	seqz	a0,a0
ffffffffc02045f4:	8082                	ret

ffffffffc02045f6 <wait_in_queue>:
ffffffffc02045f6:	711c                	ld	a5,32(a0)
ffffffffc02045f8:	0561                	addi	a0,a0,24
ffffffffc02045fa:	40a78533          	sub	a0,a5,a0
ffffffffc02045fe:	00a03533          	snez	a0,a0
ffffffffc0204602:	8082                	ret

ffffffffc0204604 <wakeup_wait>:
ffffffffc0204604:	e689                	bnez	a3,ffffffffc020460e <wakeup_wait+0xa>
ffffffffc0204606:	6188                	ld	a0,0(a1)
ffffffffc0204608:	c590                	sw	a2,8(a1)
ffffffffc020460a:	4690206f          	j	ffffffffc0207272 <wakeup_proc>
ffffffffc020460e:	7198                	ld	a4,32(a1)
ffffffffc0204610:	01858793          	addi	a5,a1,24
ffffffffc0204614:	00e78e63          	beq	a5,a4,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc0204618:	6994                	ld	a3,16(a1)
ffffffffc020461a:	00d51b63          	bne	a0,a3,ffffffffc0204630 <wakeup_wait+0x2c>
ffffffffc020461e:	6d94                	ld	a3,24(a1)
ffffffffc0204620:	6188                	ld	a0,0(a1)
ffffffffc0204622:	e698                	sd	a4,8(a3)
ffffffffc0204624:	e314                	sd	a3,0(a4)
ffffffffc0204626:	f19c                	sd	a5,32(a1)
ffffffffc0204628:	ed9c                	sd	a5,24(a1)
ffffffffc020462a:	c590                	sw	a2,8(a1)
ffffffffc020462c:	4470206f          	j	ffffffffc0207272 <wakeup_proc>
ffffffffc0204630:	1141                	addi	sp,sp,-16
ffffffffc0204632:	00009697          	auipc	a3,0x9
ffffffffc0204636:	96e68693          	addi	a3,a3,-1682 # ffffffffc020cfa0 <default_pmm_manager+0xb38>
ffffffffc020463a:	00007617          	auipc	a2,0x7
ffffffffc020463e:	34660613          	addi	a2,a2,838 # ffffffffc020b980 <commands+0x210>
ffffffffc0204642:	45f1                	li	a1,28
ffffffffc0204644:	00009517          	auipc	a0,0x9
ffffffffc0204648:	94450513          	addi	a0,a0,-1724 # ffffffffc020cf88 <default_pmm_manager+0xb20>
ffffffffc020464c:	e406                	sd	ra,8(sp)
ffffffffc020464e:	e51fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204652 <wakeup_queue>:
ffffffffc0204652:	651c                	ld	a5,8(a0)
ffffffffc0204654:	0ca78563          	beq	a5,a0,ffffffffc020471e <wakeup_queue+0xcc>
ffffffffc0204658:	1101                	addi	sp,sp,-32
ffffffffc020465a:	e822                	sd	s0,16(sp)
ffffffffc020465c:	e426                	sd	s1,8(sp)
ffffffffc020465e:	e04a                	sd	s2,0(sp)
ffffffffc0204660:	ec06                	sd	ra,24(sp)
ffffffffc0204662:	84aa                	mv	s1,a0
ffffffffc0204664:	892e                	mv	s2,a1
ffffffffc0204666:	fe878413          	addi	s0,a5,-24
ffffffffc020466a:	e23d                	bnez	a2,ffffffffc02046d0 <wakeup_queue+0x7e>
ffffffffc020466c:	6008                	ld	a0,0(s0)
ffffffffc020466e:	01242423          	sw	s2,8(s0)
ffffffffc0204672:	401020ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc0204676:	701c                	ld	a5,32(s0)
ffffffffc0204678:	01840713          	addi	a4,s0,24
ffffffffc020467c:	02e78463          	beq	a5,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204680:	6818                	ld	a4,16(s0)
ffffffffc0204682:	02e49163          	bne	s1,a4,ffffffffc02046a4 <wakeup_queue+0x52>
ffffffffc0204686:	02f48f63          	beq	s1,a5,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc020468a:	fe87b503          	ld	a0,-24(a5)
ffffffffc020468e:	ff27a823          	sw	s2,-16(a5)
ffffffffc0204692:	fe878413          	addi	s0,a5,-24
ffffffffc0204696:	3dd020ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc020469a:	701c                	ld	a5,32(s0)
ffffffffc020469c:	01840713          	addi	a4,s0,24
ffffffffc02046a0:	fee790e3          	bne	a5,a4,ffffffffc0204680 <wakeup_queue+0x2e>
ffffffffc02046a4:	00009697          	auipc	a3,0x9
ffffffffc02046a8:	8fc68693          	addi	a3,a3,-1796 # ffffffffc020cfa0 <default_pmm_manager+0xb38>
ffffffffc02046ac:	00007617          	auipc	a2,0x7
ffffffffc02046b0:	2d460613          	addi	a2,a2,724 # ffffffffc020b980 <commands+0x210>
ffffffffc02046b4:	02200593          	li	a1,34
ffffffffc02046b8:	00009517          	auipc	a0,0x9
ffffffffc02046bc:	8d050513          	addi	a0,a0,-1840 # ffffffffc020cf88 <default_pmm_manager+0xb20>
ffffffffc02046c0:	ddffb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02046c4:	60e2                	ld	ra,24(sp)
ffffffffc02046c6:	6442                	ld	s0,16(sp)
ffffffffc02046c8:	64a2                	ld	s1,8(sp)
ffffffffc02046ca:	6902                	ld	s2,0(sp)
ffffffffc02046cc:	6105                	addi	sp,sp,32
ffffffffc02046ce:	8082                	ret
ffffffffc02046d0:	6798                	ld	a4,8(a5)
ffffffffc02046d2:	02f70763          	beq	a4,a5,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046d6:	6814                	ld	a3,16(s0)
ffffffffc02046d8:	02d49463          	bne	s1,a3,ffffffffc0204700 <wakeup_queue+0xae>
ffffffffc02046dc:	6c14                	ld	a3,24(s0)
ffffffffc02046de:	6008                	ld	a0,0(s0)
ffffffffc02046e0:	e698                	sd	a4,8(a3)
ffffffffc02046e2:	e314                	sd	a3,0(a4)
ffffffffc02046e4:	f01c                	sd	a5,32(s0)
ffffffffc02046e6:	ec1c                	sd	a5,24(s0)
ffffffffc02046e8:	01242423          	sw	s2,8(s0)
ffffffffc02046ec:	387020ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc02046f0:	6480                	ld	s0,8(s1)
ffffffffc02046f2:	fc8489e3          	beq	s1,s0,ffffffffc02046c4 <wakeup_queue+0x72>
ffffffffc02046f6:	6418                	ld	a4,8(s0)
ffffffffc02046f8:	87a2                	mv	a5,s0
ffffffffc02046fa:	1421                	addi	s0,s0,-24
ffffffffc02046fc:	fce79de3          	bne	a5,a4,ffffffffc02046d6 <wakeup_queue+0x84>
ffffffffc0204700:	00009697          	auipc	a3,0x9
ffffffffc0204704:	8a068693          	addi	a3,a3,-1888 # ffffffffc020cfa0 <default_pmm_manager+0xb38>
ffffffffc0204708:	00007617          	auipc	a2,0x7
ffffffffc020470c:	27860613          	addi	a2,a2,632 # ffffffffc020b980 <commands+0x210>
ffffffffc0204710:	45f1                	li	a1,28
ffffffffc0204712:	00009517          	auipc	a0,0x9
ffffffffc0204716:	87650513          	addi	a0,a0,-1930 # ffffffffc020cf88 <default_pmm_manager+0xb20>
ffffffffc020471a:	d85fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020471e:	8082                	ret

ffffffffc0204720 <wait_current_set>:
ffffffffc0204720:	00092797          	auipc	a5,0x92
ffffffffc0204724:	1a07b783          	ld	a5,416(a5) # ffffffffc02968c0 <current>
ffffffffc0204728:	c39d                	beqz	a5,ffffffffc020474e <wait_current_set+0x2e>
ffffffffc020472a:	01858713          	addi	a4,a1,24
ffffffffc020472e:	800006b7          	lui	a3,0x80000
ffffffffc0204732:	ed98                	sd	a4,24(a1)
ffffffffc0204734:	e19c                	sd	a5,0(a1)
ffffffffc0204736:	c594                	sw	a3,8(a1)
ffffffffc0204738:	4685                	li	a3,1
ffffffffc020473a:	c394                	sw	a3,0(a5)
ffffffffc020473c:	0ec7a623          	sw	a2,236(a5)
ffffffffc0204740:	611c                	ld	a5,0(a0)
ffffffffc0204742:	e988                	sd	a0,16(a1)
ffffffffc0204744:	e118                	sd	a4,0(a0)
ffffffffc0204746:	e798                	sd	a4,8(a5)
ffffffffc0204748:	f188                	sd	a0,32(a1)
ffffffffc020474a:	ed9c                	sd	a5,24(a1)
ffffffffc020474c:	8082                	ret
ffffffffc020474e:	1141                	addi	sp,sp,-16
ffffffffc0204750:	00009697          	auipc	a3,0x9
ffffffffc0204754:	89068693          	addi	a3,a3,-1904 # ffffffffc020cfe0 <default_pmm_manager+0xb78>
ffffffffc0204758:	00007617          	auipc	a2,0x7
ffffffffc020475c:	22860613          	addi	a2,a2,552 # ffffffffc020b980 <commands+0x210>
ffffffffc0204760:	07400593          	li	a1,116
ffffffffc0204764:	00009517          	auipc	a0,0x9
ffffffffc0204768:	82450513          	addi	a0,a0,-2012 # ffffffffc020cf88 <default_pmm_manager+0xb20>
ffffffffc020476c:	e406                	sd	ra,8(sp)
ffffffffc020476e:	d31fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204772 <get_fd_array.part.0>:
ffffffffc0204772:	1141                	addi	sp,sp,-16
ffffffffc0204774:	00009697          	auipc	a3,0x9
ffffffffc0204778:	87c68693          	addi	a3,a3,-1924 # ffffffffc020cff0 <default_pmm_manager+0xb88>
ffffffffc020477c:	00007617          	auipc	a2,0x7
ffffffffc0204780:	20460613          	addi	a2,a2,516 # ffffffffc020b980 <commands+0x210>
ffffffffc0204784:	45d1                	li	a1,20
ffffffffc0204786:	00009517          	auipc	a0,0x9
ffffffffc020478a:	89a50513          	addi	a0,a0,-1894 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc020478e:	e406                	sd	ra,8(sp)
ffffffffc0204790:	d0ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204794 <fd_array_alloc>:
ffffffffc0204794:	00092797          	auipc	a5,0x92
ffffffffc0204798:	12c7b783          	ld	a5,300(a5) # ffffffffc02968c0 <current>
ffffffffc020479c:	1487b783          	ld	a5,328(a5)
ffffffffc02047a0:	1141                	addi	sp,sp,-16
ffffffffc02047a2:	e406                	sd	ra,8(sp)
ffffffffc02047a4:	c3a5                	beqz	a5,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047a6:	4b98                	lw	a4,16(a5)
ffffffffc02047a8:	04e05e63          	blez	a4,ffffffffc0204804 <fd_array_alloc+0x70>
ffffffffc02047ac:	775d                	lui	a4,0xffff7
ffffffffc02047ae:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02047b2:	679c                	ld	a5,8(a5)
ffffffffc02047b4:	02e50863          	beq	a0,a4,ffffffffc02047e4 <fd_array_alloc+0x50>
ffffffffc02047b8:	04700713          	li	a4,71
ffffffffc02047bc:	04a76263          	bltu	a4,a0,ffffffffc0204800 <fd_array_alloc+0x6c>
ffffffffc02047c0:	00351713          	slli	a4,a0,0x3
ffffffffc02047c4:	40a70533          	sub	a0,a4,a0
ffffffffc02047c8:	050e                	slli	a0,a0,0x3
ffffffffc02047ca:	97aa                	add	a5,a5,a0
ffffffffc02047cc:	4398                	lw	a4,0(a5)
ffffffffc02047ce:	e71d                	bnez	a4,ffffffffc02047fc <fd_array_alloc+0x68>
ffffffffc02047d0:	5b88                	lw	a0,48(a5)
ffffffffc02047d2:	e91d                	bnez	a0,ffffffffc0204808 <fd_array_alloc+0x74>
ffffffffc02047d4:	4705                	li	a4,1
ffffffffc02047d6:	c398                	sw	a4,0(a5)
ffffffffc02047d8:	0207b423          	sd	zero,40(a5)
ffffffffc02047dc:	e19c                	sd	a5,0(a1)
ffffffffc02047de:	60a2                	ld	ra,8(sp)
ffffffffc02047e0:	0141                	addi	sp,sp,16
ffffffffc02047e2:	8082                	ret
ffffffffc02047e4:	6685                	lui	a3,0x1
ffffffffc02047e6:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02047ea:	96be                	add	a3,a3,a5
ffffffffc02047ec:	4398                	lw	a4,0(a5)
ffffffffc02047ee:	d36d                	beqz	a4,ffffffffc02047d0 <fd_array_alloc+0x3c>
ffffffffc02047f0:	03878793          	addi	a5,a5,56
ffffffffc02047f4:	fef69ce3          	bne	a3,a5,ffffffffc02047ec <fd_array_alloc+0x58>
ffffffffc02047f8:	5529                	li	a0,-22
ffffffffc02047fa:	b7d5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc02047fc:	5545                	li	a0,-15
ffffffffc02047fe:	b7c5                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204800:	5575                	li	a0,-3
ffffffffc0204802:	bff1                	j	ffffffffc02047de <fd_array_alloc+0x4a>
ffffffffc0204804:	f6fff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204808:	00009697          	auipc	a3,0x9
ffffffffc020480c:	82868693          	addi	a3,a3,-2008 # ffffffffc020d030 <default_pmm_manager+0xbc8>
ffffffffc0204810:	00007617          	auipc	a2,0x7
ffffffffc0204814:	17060613          	addi	a2,a2,368 # ffffffffc020b980 <commands+0x210>
ffffffffc0204818:	03b00593          	li	a1,59
ffffffffc020481c:	00009517          	auipc	a0,0x9
ffffffffc0204820:	80450513          	addi	a0,a0,-2044 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204824:	c7bfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204828 <fd_array_free>:
ffffffffc0204828:	411c                	lw	a5,0(a0)
ffffffffc020482a:	1141                	addi	sp,sp,-16
ffffffffc020482c:	e022                	sd	s0,0(sp)
ffffffffc020482e:	e406                	sd	ra,8(sp)
ffffffffc0204830:	4705                	li	a4,1
ffffffffc0204832:	842a                	mv	s0,a0
ffffffffc0204834:	04e78063          	beq	a5,a4,ffffffffc0204874 <fd_array_free+0x4c>
ffffffffc0204838:	470d                	li	a4,3
ffffffffc020483a:	04e79563          	bne	a5,a4,ffffffffc0204884 <fd_array_free+0x5c>
ffffffffc020483e:	591c                	lw	a5,48(a0)
ffffffffc0204840:	c38d                	beqz	a5,ffffffffc0204862 <fd_array_free+0x3a>
ffffffffc0204842:	00008697          	auipc	a3,0x8
ffffffffc0204846:	7ee68693          	addi	a3,a3,2030 # ffffffffc020d030 <default_pmm_manager+0xbc8>
ffffffffc020484a:	00007617          	auipc	a2,0x7
ffffffffc020484e:	13660613          	addi	a2,a2,310 # ffffffffc020b980 <commands+0x210>
ffffffffc0204852:	04500593          	li	a1,69
ffffffffc0204856:	00008517          	auipc	a0,0x8
ffffffffc020485a:	7ca50513          	addi	a0,a0,1994 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc020485e:	c41fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204862:	7408                	ld	a0,40(s0)
ffffffffc0204864:	085030ef          	jal	ra,ffffffffc02080e8 <vfs_close>
ffffffffc0204868:	60a2                	ld	ra,8(sp)
ffffffffc020486a:	00042023          	sw	zero,0(s0)
ffffffffc020486e:	6402                	ld	s0,0(sp)
ffffffffc0204870:	0141                	addi	sp,sp,16
ffffffffc0204872:	8082                	ret
ffffffffc0204874:	591c                	lw	a5,48(a0)
ffffffffc0204876:	f7f1                	bnez	a5,ffffffffc0204842 <fd_array_free+0x1a>
ffffffffc0204878:	60a2                	ld	ra,8(sp)
ffffffffc020487a:	00042023          	sw	zero,0(s0)
ffffffffc020487e:	6402                	ld	s0,0(sp)
ffffffffc0204880:	0141                	addi	sp,sp,16
ffffffffc0204882:	8082                	ret
ffffffffc0204884:	00008697          	auipc	a3,0x8
ffffffffc0204888:	7e468693          	addi	a3,a3,2020 # ffffffffc020d068 <default_pmm_manager+0xc00>
ffffffffc020488c:	00007617          	auipc	a2,0x7
ffffffffc0204890:	0f460613          	addi	a2,a2,244 # ffffffffc020b980 <commands+0x210>
ffffffffc0204894:	04400593          	li	a1,68
ffffffffc0204898:	00008517          	auipc	a0,0x8
ffffffffc020489c:	78850513          	addi	a0,a0,1928 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc02048a0:	bfffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02048a4 <fd_array_release>:
ffffffffc02048a4:	4118                	lw	a4,0(a0)
ffffffffc02048a6:	1141                	addi	sp,sp,-16
ffffffffc02048a8:	e406                	sd	ra,8(sp)
ffffffffc02048aa:	4685                	li	a3,1
ffffffffc02048ac:	3779                	addiw	a4,a4,-2
ffffffffc02048ae:	04e6e063          	bltu	a3,a4,ffffffffc02048ee <fd_array_release+0x4a>
ffffffffc02048b2:	5918                	lw	a4,48(a0)
ffffffffc02048b4:	00e05d63          	blez	a4,ffffffffc02048ce <fd_array_release+0x2a>
ffffffffc02048b8:	fff7069b          	addiw	a3,a4,-1
ffffffffc02048bc:	d914                	sw	a3,48(a0)
ffffffffc02048be:	c681                	beqz	a3,ffffffffc02048c6 <fd_array_release+0x22>
ffffffffc02048c0:	60a2                	ld	ra,8(sp)
ffffffffc02048c2:	0141                	addi	sp,sp,16
ffffffffc02048c4:	8082                	ret
ffffffffc02048c6:	60a2                	ld	ra,8(sp)
ffffffffc02048c8:	0141                	addi	sp,sp,16
ffffffffc02048ca:	f5fff06f          	j	ffffffffc0204828 <fd_array_free>
ffffffffc02048ce:	00009697          	auipc	a3,0x9
ffffffffc02048d2:	80a68693          	addi	a3,a3,-2038 # ffffffffc020d0d8 <default_pmm_manager+0xc70>
ffffffffc02048d6:	00007617          	auipc	a2,0x7
ffffffffc02048da:	0aa60613          	addi	a2,a2,170 # ffffffffc020b980 <commands+0x210>
ffffffffc02048de:	05600593          	li	a1,86
ffffffffc02048e2:	00008517          	auipc	a0,0x8
ffffffffc02048e6:	73e50513          	addi	a0,a0,1854 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc02048ea:	bb5fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048ee:	00008697          	auipc	a3,0x8
ffffffffc02048f2:	7b268693          	addi	a3,a3,1970 # ffffffffc020d0a0 <default_pmm_manager+0xc38>
ffffffffc02048f6:	00007617          	auipc	a2,0x7
ffffffffc02048fa:	08a60613          	addi	a2,a2,138 # ffffffffc020b980 <commands+0x210>
ffffffffc02048fe:	05500593          	li	a1,85
ffffffffc0204902:	00008517          	auipc	a0,0x8
ffffffffc0204906:	71e50513          	addi	a0,a0,1822 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc020490a:	b95fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020490e <fd_array_open.part.0>:
ffffffffc020490e:	1141                	addi	sp,sp,-16
ffffffffc0204910:	00008697          	auipc	a3,0x8
ffffffffc0204914:	7e068693          	addi	a3,a3,2016 # ffffffffc020d0f0 <default_pmm_manager+0xc88>
ffffffffc0204918:	00007617          	auipc	a2,0x7
ffffffffc020491c:	06860613          	addi	a2,a2,104 # ffffffffc020b980 <commands+0x210>
ffffffffc0204920:	05f00593          	li	a1,95
ffffffffc0204924:	00008517          	auipc	a0,0x8
ffffffffc0204928:	6fc50513          	addi	a0,a0,1788 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc020492c:	e406                	sd	ra,8(sp)
ffffffffc020492e:	b71fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204932 <fd_array_init>:
ffffffffc0204932:	4781                	li	a5,0
ffffffffc0204934:	04800713          	li	a4,72
ffffffffc0204938:	cd1c                	sw	a5,24(a0)
ffffffffc020493a:	02052823          	sw	zero,48(a0)
ffffffffc020493e:	00052023          	sw	zero,0(a0)
ffffffffc0204942:	2785                	addiw	a5,a5,1
ffffffffc0204944:	03850513          	addi	a0,a0,56
ffffffffc0204948:	fee798e3          	bne	a5,a4,ffffffffc0204938 <fd_array_init+0x6>
ffffffffc020494c:	8082                	ret

ffffffffc020494e <fd_array_close>:
ffffffffc020494e:	4118                	lw	a4,0(a0)
ffffffffc0204950:	1141                	addi	sp,sp,-16
ffffffffc0204952:	e406                	sd	ra,8(sp)
ffffffffc0204954:	e022                	sd	s0,0(sp)
ffffffffc0204956:	4789                	li	a5,2
ffffffffc0204958:	04f71a63          	bne	a4,a5,ffffffffc02049ac <fd_array_close+0x5e>
ffffffffc020495c:	591c                	lw	a5,48(a0)
ffffffffc020495e:	842a                	mv	s0,a0
ffffffffc0204960:	02f05663          	blez	a5,ffffffffc020498c <fd_array_close+0x3e>
ffffffffc0204964:	37fd                	addiw	a5,a5,-1
ffffffffc0204966:	470d                	li	a4,3
ffffffffc0204968:	c118                	sw	a4,0(a0)
ffffffffc020496a:	d91c                	sw	a5,48(a0)
ffffffffc020496c:	0007871b          	sext.w	a4,a5
ffffffffc0204970:	c709                	beqz	a4,ffffffffc020497a <fd_array_close+0x2c>
ffffffffc0204972:	60a2                	ld	ra,8(sp)
ffffffffc0204974:	6402                	ld	s0,0(sp)
ffffffffc0204976:	0141                	addi	sp,sp,16
ffffffffc0204978:	8082                	ret
ffffffffc020497a:	7508                	ld	a0,40(a0)
ffffffffc020497c:	76c030ef          	jal	ra,ffffffffc02080e8 <vfs_close>
ffffffffc0204980:	60a2                	ld	ra,8(sp)
ffffffffc0204982:	00042023          	sw	zero,0(s0)
ffffffffc0204986:	6402                	ld	s0,0(sp)
ffffffffc0204988:	0141                	addi	sp,sp,16
ffffffffc020498a:	8082                	ret
ffffffffc020498c:	00008697          	auipc	a3,0x8
ffffffffc0204990:	74c68693          	addi	a3,a3,1868 # ffffffffc020d0d8 <default_pmm_manager+0xc70>
ffffffffc0204994:	00007617          	auipc	a2,0x7
ffffffffc0204998:	fec60613          	addi	a2,a2,-20 # ffffffffc020b980 <commands+0x210>
ffffffffc020499c:	06800593          	li	a1,104
ffffffffc02049a0:	00008517          	auipc	a0,0x8
ffffffffc02049a4:	68050513          	addi	a0,a0,1664 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc02049a8:	af7fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049ac:	00008697          	auipc	a3,0x8
ffffffffc02049b0:	69c68693          	addi	a3,a3,1692 # ffffffffc020d048 <default_pmm_manager+0xbe0>
ffffffffc02049b4:	00007617          	auipc	a2,0x7
ffffffffc02049b8:	fcc60613          	addi	a2,a2,-52 # ffffffffc020b980 <commands+0x210>
ffffffffc02049bc:	06700593          	li	a1,103
ffffffffc02049c0:	00008517          	auipc	a0,0x8
ffffffffc02049c4:	66050513          	addi	a0,a0,1632 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc02049c8:	ad7fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049cc <fd_array_dup>:
ffffffffc02049cc:	7179                	addi	sp,sp,-48
ffffffffc02049ce:	e84a                	sd	s2,16(sp)
ffffffffc02049d0:	00052903          	lw	s2,0(a0)
ffffffffc02049d4:	f406                	sd	ra,40(sp)
ffffffffc02049d6:	f022                	sd	s0,32(sp)
ffffffffc02049d8:	ec26                	sd	s1,24(sp)
ffffffffc02049da:	e44e                	sd	s3,8(sp)
ffffffffc02049dc:	4785                	li	a5,1
ffffffffc02049de:	04f91663          	bne	s2,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049e2:	0005a983          	lw	s3,0(a1)
ffffffffc02049e6:	4789                	li	a5,2
ffffffffc02049e8:	04f99163          	bne	s3,a5,ffffffffc0204a2a <fd_array_dup+0x5e>
ffffffffc02049ec:	7584                	ld	s1,40(a1)
ffffffffc02049ee:	699c                	ld	a5,16(a1)
ffffffffc02049f0:	7194                	ld	a3,32(a1)
ffffffffc02049f2:	6598                	ld	a4,8(a1)
ffffffffc02049f4:	842a                	mv	s0,a0
ffffffffc02049f6:	e91c                	sd	a5,16(a0)
ffffffffc02049f8:	f114                	sd	a3,32(a0)
ffffffffc02049fa:	e518                	sd	a4,8(a0)
ffffffffc02049fc:	8526                	mv	a0,s1
ffffffffc02049fe:	649020ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc0204a02:	8526                	mv	a0,s1
ffffffffc0204a04:	64f020ef          	jal	ra,ffffffffc0207852 <inode_open_inc>
ffffffffc0204a08:	401c                	lw	a5,0(s0)
ffffffffc0204a0a:	f404                	sd	s1,40(s0)
ffffffffc0204a0c:	03279f63          	bne	a5,s2,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a10:	cc8d                	beqz	s1,ffffffffc0204a4a <fd_array_dup+0x7e>
ffffffffc0204a12:	581c                	lw	a5,48(s0)
ffffffffc0204a14:	01342023          	sw	s3,0(s0)
ffffffffc0204a18:	70a2                	ld	ra,40(sp)
ffffffffc0204a1a:	2785                	addiw	a5,a5,1
ffffffffc0204a1c:	d81c                	sw	a5,48(s0)
ffffffffc0204a1e:	7402                	ld	s0,32(sp)
ffffffffc0204a20:	64e2                	ld	s1,24(sp)
ffffffffc0204a22:	6942                	ld	s2,16(sp)
ffffffffc0204a24:	69a2                	ld	s3,8(sp)
ffffffffc0204a26:	6145                	addi	sp,sp,48
ffffffffc0204a28:	8082                	ret
ffffffffc0204a2a:	00008697          	auipc	a3,0x8
ffffffffc0204a2e:	6f668693          	addi	a3,a3,1782 # ffffffffc020d120 <default_pmm_manager+0xcb8>
ffffffffc0204a32:	00007617          	auipc	a2,0x7
ffffffffc0204a36:	f4e60613          	addi	a2,a2,-178 # ffffffffc020b980 <commands+0x210>
ffffffffc0204a3a:	07300593          	li	a1,115
ffffffffc0204a3e:	00008517          	auipc	a0,0x8
ffffffffc0204a42:	5e250513          	addi	a0,a0,1506 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204a46:	a59fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a4a:	ec5ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>

ffffffffc0204a4e <file_testfd>:
ffffffffc0204a4e:	04700793          	li	a5,71
ffffffffc0204a52:	04a7e263          	bltu	a5,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a56:	00092797          	auipc	a5,0x92
ffffffffc0204a5a:	e6a7b783          	ld	a5,-406(a5) # ffffffffc02968c0 <current>
ffffffffc0204a5e:	1487b783          	ld	a5,328(a5)
ffffffffc0204a62:	cf85                	beqz	a5,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a64:	4b98                	lw	a4,16(a5)
ffffffffc0204a66:	02e05a63          	blez	a4,ffffffffc0204a9a <file_testfd+0x4c>
ffffffffc0204a6a:	6798                	ld	a4,8(a5)
ffffffffc0204a6c:	00351793          	slli	a5,a0,0x3
ffffffffc0204a70:	8f89                	sub	a5,a5,a0
ffffffffc0204a72:	078e                	slli	a5,a5,0x3
ffffffffc0204a74:	97ba                	add	a5,a5,a4
ffffffffc0204a76:	4394                	lw	a3,0(a5)
ffffffffc0204a78:	4709                	li	a4,2
ffffffffc0204a7a:	00e69e63          	bne	a3,a4,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a7e:	4f98                	lw	a4,24(a5)
ffffffffc0204a80:	00a71b63          	bne	a4,a0,ffffffffc0204a96 <file_testfd+0x48>
ffffffffc0204a84:	c199                	beqz	a1,ffffffffc0204a8a <file_testfd+0x3c>
ffffffffc0204a86:	6788                	ld	a0,8(a5)
ffffffffc0204a88:	c901                	beqz	a0,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8a:	4505                	li	a0,1
ffffffffc0204a8c:	c611                	beqz	a2,ffffffffc0204a98 <file_testfd+0x4a>
ffffffffc0204a8e:	6b88                	ld	a0,16(a5)
ffffffffc0204a90:	00a03533          	snez	a0,a0
ffffffffc0204a94:	8082                	ret
ffffffffc0204a96:	4501                	li	a0,0
ffffffffc0204a98:	8082                	ret
ffffffffc0204a9a:	1141                	addi	sp,sp,-16
ffffffffc0204a9c:	e406                	sd	ra,8(sp)
ffffffffc0204a9e:	cd5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204aa2 <file_open>:
ffffffffc0204aa2:	711d                	addi	sp,sp,-96
ffffffffc0204aa4:	ec86                	sd	ra,88(sp)
ffffffffc0204aa6:	e8a2                	sd	s0,80(sp)
ffffffffc0204aa8:	e4a6                	sd	s1,72(sp)
ffffffffc0204aaa:	e0ca                	sd	s2,64(sp)
ffffffffc0204aac:	fc4e                	sd	s3,56(sp)
ffffffffc0204aae:	f852                	sd	s4,48(sp)
ffffffffc0204ab0:	0035f793          	andi	a5,a1,3
ffffffffc0204ab4:	470d                	li	a4,3
ffffffffc0204ab6:	0ce78163          	beq	a5,a4,ffffffffc0204b78 <file_open+0xd6>
ffffffffc0204aba:	078e                	slli	a5,a5,0x3
ffffffffc0204abc:	00009717          	auipc	a4,0x9
ffffffffc0204ac0:	8d470713          	addi	a4,a4,-1836 # ffffffffc020d390 <CSWTCH.79>
ffffffffc0204ac4:	892a                	mv	s2,a0
ffffffffc0204ac6:	00009697          	auipc	a3,0x9
ffffffffc0204aca:	8b268693          	addi	a3,a3,-1870 # ffffffffc020d378 <CSWTCH.78>
ffffffffc0204ace:	755d                	lui	a0,0xffff7
ffffffffc0204ad0:	96be                	add	a3,a3,a5
ffffffffc0204ad2:	84ae                	mv	s1,a1
ffffffffc0204ad4:	97ba                	add	a5,a5,a4
ffffffffc0204ad6:	858a                	mv	a1,sp
ffffffffc0204ad8:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204adc:	0006ba03          	ld	s4,0(a3)
ffffffffc0204ae0:	0007b983          	ld	s3,0(a5)
ffffffffc0204ae4:	cb1ff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc0204ae8:	842a                	mv	s0,a0
ffffffffc0204aea:	c911                	beqz	a0,ffffffffc0204afe <file_open+0x5c>
ffffffffc0204aec:	60e6                	ld	ra,88(sp)
ffffffffc0204aee:	8522                	mv	a0,s0
ffffffffc0204af0:	6446                	ld	s0,80(sp)
ffffffffc0204af2:	64a6                	ld	s1,72(sp)
ffffffffc0204af4:	6906                	ld	s2,64(sp)
ffffffffc0204af6:	79e2                	ld	s3,56(sp)
ffffffffc0204af8:	7a42                	ld	s4,48(sp)
ffffffffc0204afa:	6125                	addi	sp,sp,96
ffffffffc0204afc:	8082                	ret
ffffffffc0204afe:	0030                	addi	a2,sp,8
ffffffffc0204b00:	85a6                	mv	a1,s1
ffffffffc0204b02:	854a                	mv	a0,s2
ffffffffc0204b04:	43e030ef          	jal	ra,ffffffffc0207f42 <vfs_open>
ffffffffc0204b08:	842a                	mv	s0,a0
ffffffffc0204b0a:	e13d                	bnez	a0,ffffffffc0204b70 <file_open+0xce>
ffffffffc0204b0c:	6782                	ld	a5,0(sp)
ffffffffc0204b0e:	0204f493          	andi	s1,s1,32
ffffffffc0204b12:	6422                	ld	s0,8(sp)
ffffffffc0204b14:	0207b023          	sd	zero,32(a5)
ffffffffc0204b18:	c885                	beqz	s1,ffffffffc0204b48 <file_open+0xa6>
ffffffffc0204b1a:	c03d                	beqz	s0,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b1c:	783c                	ld	a5,112(s0)
ffffffffc0204b1e:	c3ad                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b20:	779c                	ld	a5,40(a5)
ffffffffc0204b22:	cfb9                	beqz	a5,ffffffffc0204b80 <file_open+0xde>
ffffffffc0204b24:	8522                	mv	a0,s0
ffffffffc0204b26:	00008597          	auipc	a1,0x8
ffffffffc0204b2a:	68258593          	addi	a1,a1,1666 # ffffffffc020d1a8 <default_pmm_manager+0xd40>
ffffffffc0204b2e:	531020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0204b32:	783c                	ld	a5,112(s0)
ffffffffc0204b34:	6522                	ld	a0,8(sp)
ffffffffc0204b36:	080c                	addi	a1,sp,16
ffffffffc0204b38:	779c                	ld	a5,40(a5)
ffffffffc0204b3a:	9782                	jalr	a5
ffffffffc0204b3c:	842a                	mv	s0,a0
ffffffffc0204b3e:	e515                	bnez	a0,ffffffffc0204b6a <file_open+0xc8>
ffffffffc0204b40:	6782                	ld	a5,0(sp)
ffffffffc0204b42:	7722                	ld	a4,40(sp)
ffffffffc0204b44:	6422                	ld	s0,8(sp)
ffffffffc0204b46:	f398                	sd	a4,32(a5)
ffffffffc0204b48:	4394                	lw	a3,0(a5)
ffffffffc0204b4a:	f780                	sd	s0,40(a5)
ffffffffc0204b4c:	0147b423          	sd	s4,8(a5)
ffffffffc0204b50:	0137b823          	sd	s3,16(a5)
ffffffffc0204b54:	4705                	li	a4,1
ffffffffc0204b56:	02e69363          	bne	a3,a4,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5a:	c00d                	beqz	s0,ffffffffc0204b7c <file_open+0xda>
ffffffffc0204b5c:	5b98                	lw	a4,48(a5)
ffffffffc0204b5e:	4689                	li	a3,2
ffffffffc0204b60:	4f80                	lw	s0,24(a5)
ffffffffc0204b62:	2705                	addiw	a4,a4,1
ffffffffc0204b64:	c394                	sw	a3,0(a5)
ffffffffc0204b66:	db98                	sw	a4,48(a5)
ffffffffc0204b68:	b751                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b6a:	6522                	ld	a0,8(sp)
ffffffffc0204b6c:	57c030ef          	jal	ra,ffffffffc02080e8 <vfs_close>
ffffffffc0204b70:	6502                	ld	a0,0(sp)
ffffffffc0204b72:	cb7ff0ef          	jal	ra,ffffffffc0204828 <fd_array_free>
ffffffffc0204b76:	bf9d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b78:	5475                	li	s0,-3
ffffffffc0204b7a:	bf8d                	j	ffffffffc0204aec <file_open+0x4a>
ffffffffc0204b7c:	d93ff0ef          	jal	ra,ffffffffc020490e <fd_array_open.part.0>
ffffffffc0204b80:	00008697          	auipc	a3,0x8
ffffffffc0204b84:	5d868693          	addi	a3,a3,1496 # ffffffffc020d158 <default_pmm_manager+0xcf0>
ffffffffc0204b88:	00007617          	auipc	a2,0x7
ffffffffc0204b8c:	df860613          	addi	a2,a2,-520 # ffffffffc020b980 <commands+0x210>
ffffffffc0204b90:	0b500593          	li	a1,181
ffffffffc0204b94:	00008517          	auipc	a0,0x8
ffffffffc0204b98:	48c50513          	addi	a0,a0,1164 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204b9c:	903fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ba0 <file_close>:
ffffffffc0204ba0:	04700713          	li	a4,71
ffffffffc0204ba4:	04a76563          	bltu	a4,a0,ffffffffc0204bee <file_close+0x4e>
ffffffffc0204ba8:	00092717          	auipc	a4,0x92
ffffffffc0204bac:	d1873703          	ld	a4,-744(a4) # ffffffffc02968c0 <current>
ffffffffc0204bb0:	14873703          	ld	a4,328(a4)
ffffffffc0204bb4:	1141                	addi	sp,sp,-16
ffffffffc0204bb6:	e406                	sd	ra,8(sp)
ffffffffc0204bb8:	cf0d                	beqz	a4,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bba:	4b14                	lw	a3,16(a4)
ffffffffc0204bbc:	02d05b63          	blez	a3,ffffffffc0204bf2 <file_close+0x52>
ffffffffc0204bc0:	6718                	ld	a4,8(a4)
ffffffffc0204bc2:	87aa                	mv	a5,a0
ffffffffc0204bc4:	050e                	slli	a0,a0,0x3
ffffffffc0204bc6:	8d1d                	sub	a0,a0,a5
ffffffffc0204bc8:	050e                	slli	a0,a0,0x3
ffffffffc0204bca:	953a                	add	a0,a0,a4
ffffffffc0204bcc:	4114                	lw	a3,0(a0)
ffffffffc0204bce:	4709                	li	a4,2
ffffffffc0204bd0:	00e69b63          	bne	a3,a4,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bd4:	4d18                	lw	a4,24(a0)
ffffffffc0204bd6:	00f71863          	bne	a4,a5,ffffffffc0204be6 <file_close+0x46>
ffffffffc0204bda:	d75ff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0204bde:	60a2                	ld	ra,8(sp)
ffffffffc0204be0:	4501                	li	a0,0
ffffffffc0204be2:	0141                	addi	sp,sp,16
ffffffffc0204be4:	8082                	ret
ffffffffc0204be6:	60a2                	ld	ra,8(sp)
ffffffffc0204be8:	5575                	li	a0,-3
ffffffffc0204bea:	0141                	addi	sp,sp,16
ffffffffc0204bec:	8082                	ret
ffffffffc0204bee:	5575                	li	a0,-3
ffffffffc0204bf0:	8082                	ret
ffffffffc0204bf2:	b81ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204bf6 <file_read>:
ffffffffc0204bf6:	715d                	addi	sp,sp,-80
ffffffffc0204bf8:	e486                	sd	ra,72(sp)
ffffffffc0204bfa:	e0a2                	sd	s0,64(sp)
ffffffffc0204bfc:	fc26                	sd	s1,56(sp)
ffffffffc0204bfe:	f84a                	sd	s2,48(sp)
ffffffffc0204c00:	f44e                	sd	s3,40(sp)
ffffffffc0204c02:	f052                	sd	s4,32(sp)
ffffffffc0204c04:	0006b023          	sd	zero,0(a3)
ffffffffc0204c08:	04700793          	li	a5,71
ffffffffc0204c0c:	0aa7e463          	bltu	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c10:	00092797          	auipc	a5,0x92
ffffffffc0204c14:	cb07b783          	ld	a5,-848(a5) # ffffffffc02968c0 <current>
ffffffffc0204c18:	1487b783          	ld	a5,328(a5)
ffffffffc0204c1c:	cfd1                	beqz	a5,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c1e:	4b98                	lw	a4,16(a5)
ffffffffc0204c20:	08e05c63          	blez	a4,ffffffffc0204cb8 <file_read+0xc2>
ffffffffc0204c24:	6780                	ld	s0,8(a5)
ffffffffc0204c26:	00351793          	slli	a5,a0,0x3
ffffffffc0204c2a:	8f89                	sub	a5,a5,a0
ffffffffc0204c2c:	078e                	slli	a5,a5,0x3
ffffffffc0204c2e:	943e                	add	s0,s0,a5
ffffffffc0204c30:	00042983          	lw	s3,0(s0)
ffffffffc0204c34:	4789                	li	a5,2
ffffffffc0204c36:	06f99f63          	bne	s3,a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c3a:	4c1c                	lw	a5,24(s0)
ffffffffc0204c3c:	06a79c63          	bne	a5,a0,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c40:	641c                	ld	a5,8(s0)
ffffffffc0204c42:	cbad                	beqz	a5,ffffffffc0204cb4 <file_read+0xbe>
ffffffffc0204c44:	581c                	lw	a5,48(s0)
ffffffffc0204c46:	8a36                	mv	s4,a3
ffffffffc0204c48:	7014                	ld	a3,32(s0)
ffffffffc0204c4a:	2785                	addiw	a5,a5,1
ffffffffc0204c4c:	850a                	mv	a0,sp
ffffffffc0204c4e:	d81c                	sw	a5,48(s0)
ffffffffc0204c50:	792000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0204c54:	02843903          	ld	s2,40(s0)
ffffffffc0204c58:	84aa                	mv	s1,a0
ffffffffc0204c5a:	06090163          	beqz	s2,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c5e:	07093783          	ld	a5,112(s2)
ffffffffc0204c62:	cfa9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c64:	6f9c                	ld	a5,24(a5)
ffffffffc0204c66:	cbb9                	beqz	a5,ffffffffc0204cbc <file_read+0xc6>
ffffffffc0204c68:	00008597          	auipc	a1,0x8
ffffffffc0204c6c:	59858593          	addi	a1,a1,1432 # ffffffffc020d200 <default_pmm_manager+0xd98>
ffffffffc0204c70:	854a                	mv	a0,s2
ffffffffc0204c72:	3ed020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0204c76:	07093783          	ld	a5,112(s2)
ffffffffc0204c7a:	7408                	ld	a0,40(s0)
ffffffffc0204c7c:	85a6                	mv	a1,s1
ffffffffc0204c7e:	6f9c                	ld	a5,24(a5)
ffffffffc0204c80:	9782                	jalr	a5
ffffffffc0204c82:	689c                	ld	a5,16(s1)
ffffffffc0204c84:	6c94                	ld	a3,24(s1)
ffffffffc0204c86:	4018                	lw	a4,0(s0)
ffffffffc0204c88:	84aa                	mv	s1,a0
ffffffffc0204c8a:	8f95                	sub	a5,a5,a3
ffffffffc0204c8c:	03370063          	beq	a4,s3,ffffffffc0204cac <file_read+0xb6>
ffffffffc0204c90:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204c94:	8522                	mv	a0,s0
ffffffffc0204c96:	c0fff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204c9a:	60a6                	ld	ra,72(sp)
ffffffffc0204c9c:	6406                	ld	s0,64(sp)
ffffffffc0204c9e:	7942                	ld	s2,48(sp)
ffffffffc0204ca0:	79a2                	ld	s3,40(sp)
ffffffffc0204ca2:	7a02                	ld	s4,32(sp)
ffffffffc0204ca4:	8526                	mv	a0,s1
ffffffffc0204ca6:	74e2                	ld	s1,56(sp)
ffffffffc0204ca8:	6161                	addi	sp,sp,80
ffffffffc0204caa:	8082                	ret
ffffffffc0204cac:	7018                	ld	a4,32(s0)
ffffffffc0204cae:	973e                	add	a4,a4,a5
ffffffffc0204cb0:	f018                	sd	a4,32(s0)
ffffffffc0204cb2:	bff9                	j	ffffffffc0204c90 <file_read+0x9a>
ffffffffc0204cb4:	54f5                	li	s1,-3
ffffffffc0204cb6:	b7d5                	j	ffffffffc0204c9a <file_read+0xa4>
ffffffffc0204cb8:	abbff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204cbc:	00008697          	auipc	a3,0x8
ffffffffc0204cc0:	4f468693          	addi	a3,a3,1268 # ffffffffc020d1b0 <default_pmm_manager+0xd48>
ffffffffc0204cc4:	00007617          	auipc	a2,0x7
ffffffffc0204cc8:	cbc60613          	addi	a2,a2,-836 # ffffffffc020b980 <commands+0x210>
ffffffffc0204ccc:	0de00593          	li	a1,222
ffffffffc0204cd0:	00008517          	auipc	a0,0x8
ffffffffc0204cd4:	35050513          	addi	a0,a0,848 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204cd8:	fc6fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204cdc <file_write>:
ffffffffc0204cdc:	715d                	addi	sp,sp,-80
ffffffffc0204cde:	e486                	sd	ra,72(sp)
ffffffffc0204ce0:	e0a2                	sd	s0,64(sp)
ffffffffc0204ce2:	fc26                	sd	s1,56(sp)
ffffffffc0204ce4:	f84a                	sd	s2,48(sp)
ffffffffc0204ce6:	f44e                	sd	s3,40(sp)
ffffffffc0204ce8:	f052                	sd	s4,32(sp)
ffffffffc0204cea:	0006b023          	sd	zero,0(a3)
ffffffffc0204cee:	04700793          	li	a5,71
ffffffffc0204cf2:	0aa7e463          	bltu	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204cf6:	00092797          	auipc	a5,0x92
ffffffffc0204cfa:	bca7b783          	ld	a5,-1078(a5) # ffffffffc02968c0 <current>
ffffffffc0204cfe:	1487b783          	ld	a5,328(a5)
ffffffffc0204d02:	cfd1                	beqz	a5,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d04:	4b98                	lw	a4,16(a5)
ffffffffc0204d06:	08e05c63          	blez	a4,ffffffffc0204d9e <file_write+0xc2>
ffffffffc0204d0a:	6780                	ld	s0,8(a5)
ffffffffc0204d0c:	00351793          	slli	a5,a0,0x3
ffffffffc0204d10:	8f89                	sub	a5,a5,a0
ffffffffc0204d12:	078e                	slli	a5,a5,0x3
ffffffffc0204d14:	943e                	add	s0,s0,a5
ffffffffc0204d16:	00042983          	lw	s3,0(s0)
ffffffffc0204d1a:	4789                	li	a5,2
ffffffffc0204d1c:	06f99f63          	bne	s3,a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d20:	4c1c                	lw	a5,24(s0)
ffffffffc0204d22:	06a79c63          	bne	a5,a0,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d26:	681c                	ld	a5,16(s0)
ffffffffc0204d28:	cbad                	beqz	a5,ffffffffc0204d9a <file_write+0xbe>
ffffffffc0204d2a:	581c                	lw	a5,48(s0)
ffffffffc0204d2c:	8a36                	mv	s4,a3
ffffffffc0204d2e:	7014                	ld	a3,32(s0)
ffffffffc0204d30:	2785                	addiw	a5,a5,1
ffffffffc0204d32:	850a                	mv	a0,sp
ffffffffc0204d34:	d81c                	sw	a5,48(s0)
ffffffffc0204d36:	6ac000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0204d3a:	02843903          	ld	s2,40(s0)
ffffffffc0204d3e:	84aa                	mv	s1,a0
ffffffffc0204d40:	06090163          	beqz	s2,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d44:	07093783          	ld	a5,112(s2)
ffffffffc0204d48:	cfa9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4a:	739c                	ld	a5,32(a5)
ffffffffc0204d4c:	cbb9                	beqz	a5,ffffffffc0204da2 <file_write+0xc6>
ffffffffc0204d4e:	00008597          	auipc	a1,0x8
ffffffffc0204d52:	50a58593          	addi	a1,a1,1290 # ffffffffc020d258 <default_pmm_manager+0xdf0>
ffffffffc0204d56:	854a                	mv	a0,s2
ffffffffc0204d58:	307020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0204d5c:	07093783          	ld	a5,112(s2)
ffffffffc0204d60:	7408                	ld	a0,40(s0)
ffffffffc0204d62:	85a6                	mv	a1,s1
ffffffffc0204d64:	739c                	ld	a5,32(a5)
ffffffffc0204d66:	9782                	jalr	a5
ffffffffc0204d68:	689c                	ld	a5,16(s1)
ffffffffc0204d6a:	6c94                	ld	a3,24(s1)
ffffffffc0204d6c:	4018                	lw	a4,0(s0)
ffffffffc0204d6e:	84aa                	mv	s1,a0
ffffffffc0204d70:	8f95                	sub	a5,a5,a3
ffffffffc0204d72:	03370063          	beq	a4,s3,ffffffffc0204d92 <file_write+0xb6>
ffffffffc0204d76:	00fa3023          	sd	a5,0(s4)
ffffffffc0204d7a:	8522                	mv	a0,s0
ffffffffc0204d7c:	b29ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204d80:	60a6                	ld	ra,72(sp)
ffffffffc0204d82:	6406                	ld	s0,64(sp)
ffffffffc0204d84:	7942                	ld	s2,48(sp)
ffffffffc0204d86:	79a2                	ld	s3,40(sp)
ffffffffc0204d88:	7a02                	ld	s4,32(sp)
ffffffffc0204d8a:	8526                	mv	a0,s1
ffffffffc0204d8c:	74e2                	ld	s1,56(sp)
ffffffffc0204d8e:	6161                	addi	sp,sp,80
ffffffffc0204d90:	8082                	ret
ffffffffc0204d92:	7018                	ld	a4,32(s0)
ffffffffc0204d94:	973e                	add	a4,a4,a5
ffffffffc0204d96:	f018                	sd	a4,32(s0)
ffffffffc0204d98:	bff9                	j	ffffffffc0204d76 <file_write+0x9a>
ffffffffc0204d9a:	54f5                	li	s1,-3
ffffffffc0204d9c:	b7d5                	j	ffffffffc0204d80 <file_write+0xa4>
ffffffffc0204d9e:	9d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204da2:	00008697          	auipc	a3,0x8
ffffffffc0204da6:	46668693          	addi	a3,a3,1126 # ffffffffc020d208 <default_pmm_manager+0xda0>
ffffffffc0204daa:	00007617          	auipc	a2,0x7
ffffffffc0204dae:	bd660613          	addi	a2,a2,-1066 # ffffffffc020b980 <commands+0x210>
ffffffffc0204db2:	0f800593          	li	a1,248
ffffffffc0204db6:	00008517          	auipc	a0,0x8
ffffffffc0204dba:	26a50513          	addi	a0,a0,618 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204dbe:	ee0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204dc2 <file_seek>:
ffffffffc0204dc2:	7139                	addi	sp,sp,-64
ffffffffc0204dc4:	fc06                	sd	ra,56(sp)
ffffffffc0204dc6:	f822                	sd	s0,48(sp)
ffffffffc0204dc8:	f426                	sd	s1,40(sp)
ffffffffc0204dca:	f04a                	sd	s2,32(sp)
ffffffffc0204dcc:	04700793          	li	a5,71
ffffffffc0204dd0:	08a7e863          	bltu	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dd4:	00092797          	auipc	a5,0x92
ffffffffc0204dd8:	aec7b783          	ld	a5,-1300(a5) # ffffffffc02968c0 <current>
ffffffffc0204ddc:	1487b783          	ld	a5,328(a5)
ffffffffc0204de0:	cfdd                	beqz	a5,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de2:	4b98                	lw	a4,16(a5)
ffffffffc0204de4:	0ae05d63          	blez	a4,ffffffffc0204e9e <file_seek+0xdc>
ffffffffc0204de8:	6780                	ld	s0,8(a5)
ffffffffc0204dea:	00351793          	slli	a5,a0,0x3
ffffffffc0204dee:	8f89                	sub	a5,a5,a0
ffffffffc0204df0:	078e                	slli	a5,a5,0x3
ffffffffc0204df2:	943e                	add	s0,s0,a5
ffffffffc0204df4:	4018                	lw	a4,0(s0)
ffffffffc0204df6:	4789                	li	a5,2
ffffffffc0204df8:	06f71463          	bne	a4,a5,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204dfc:	4c1c                	lw	a5,24(s0)
ffffffffc0204dfe:	06a79163          	bne	a5,a0,ffffffffc0204e60 <file_seek+0x9e>
ffffffffc0204e02:	581c                	lw	a5,48(s0)
ffffffffc0204e04:	4685                	li	a3,1
ffffffffc0204e06:	892e                	mv	s2,a1
ffffffffc0204e08:	2785                	addiw	a5,a5,1
ffffffffc0204e0a:	d81c                	sw	a5,48(s0)
ffffffffc0204e0c:	02d60063          	beq	a2,a3,ffffffffc0204e2c <file_seek+0x6a>
ffffffffc0204e10:	06e60063          	beq	a2,a4,ffffffffc0204e70 <file_seek+0xae>
ffffffffc0204e14:	54f5                	li	s1,-3
ffffffffc0204e16:	ce11                	beqz	a2,ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e18:	8522                	mv	a0,s0
ffffffffc0204e1a:	a8bff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204e1e:	70e2                	ld	ra,56(sp)
ffffffffc0204e20:	7442                	ld	s0,48(sp)
ffffffffc0204e22:	7902                	ld	s2,32(sp)
ffffffffc0204e24:	8526                	mv	a0,s1
ffffffffc0204e26:	74a2                	ld	s1,40(sp)
ffffffffc0204e28:	6121                	addi	sp,sp,64
ffffffffc0204e2a:	8082                	ret
ffffffffc0204e2c:	701c                	ld	a5,32(s0)
ffffffffc0204e2e:	00f58933          	add	s2,a1,a5
ffffffffc0204e32:	7404                	ld	s1,40(s0)
ffffffffc0204e34:	c4bd                	beqz	s1,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e36:	78bc                	ld	a5,112(s1)
ffffffffc0204e38:	c7ad                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3a:	6fbc                	ld	a5,88(a5)
ffffffffc0204e3c:	c3bd                	beqz	a5,ffffffffc0204ea2 <file_seek+0xe0>
ffffffffc0204e3e:	8526                	mv	a0,s1
ffffffffc0204e40:	00008597          	auipc	a1,0x8
ffffffffc0204e44:	47058593          	addi	a1,a1,1136 # ffffffffc020d2b0 <default_pmm_manager+0xe48>
ffffffffc0204e48:	217020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0204e4c:	78bc                	ld	a5,112(s1)
ffffffffc0204e4e:	7408                	ld	a0,40(s0)
ffffffffc0204e50:	85ca                	mv	a1,s2
ffffffffc0204e52:	6fbc                	ld	a5,88(a5)
ffffffffc0204e54:	9782                	jalr	a5
ffffffffc0204e56:	84aa                	mv	s1,a0
ffffffffc0204e58:	f161                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e5a:	03243023          	sd	s2,32(s0)
ffffffffc0204e5e:	bf6d                	j	ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e60:	70e2                	ld	ra,56(sp)
ffffffffc0204e62:	7442                	ld	s0,48(sp)
ffffffffc0204e64:	54f5                	li	s1,-3
ffffffffc0204e66:	7902                	ld	s2,32(sp)
ffffffffc0204e68:	8526                	mv	a0,s1
ffffffffc0204e6a:	74a2                	ld	s1,40(sp)
ffffffffc0204e6c:	6121                	addi	sp,sp,64
ffffffffc0204e6e:	8082                	ret
ffffffffc0204e70:	7404                	ld	s1,40(s0)
ffffffffc0204e72:	c8a1                	beqz	s1,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e74:	78bc                	ld	a5,112(s1)
ffffffffc0204e76:	c7b1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e78:	779c                	ld	a5,40(a5)
ffffffffc0204e7a:	c7a1                	beqz	a5,ffffffffc0204ec2 <file_seek+0x100>
ffffffffc0204e7c:	8526                	mv	a0,s1
ffffffffc0204e7e:	00008597          	auipc	a1,0x8
ffffffffc0204e82:	32a58593          	addi	a1,a1,810 # ffffffffc020d1a8 <default_pmm_manager+0xd40>
ffffffffc0204e86:	1d9020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0204e8a:	78bc                	ld	a5,112(s1)
ffffffffc0204e8c:	7408                	ld	a0,40(s0)
ffffffffc0204e8e:	858a                	mv	a1,sp
ffffffffc0204e90:	779c                	ld	a5,40(a5)
ffffffffc0204e92:	9782                	jalr	a5
ffffffffc0204e94:	84aa                	mv	s1,a0
ffffffffc0204e96:	f149                	bnez	a0,ffffffffc0204e18 <file_seek+0x56>
ffffffffc0204e98:	67e2                	ld	a5,24(sp)
ffffffffc0204e9a:	993e                	add	s2,s2,a5
ffffffffc0204e9c:	bf59                	j	ffffffffc0204e32 <file_seek+0x70>
ffffffffc0204e9e:	8d5ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>
ffffffffc0204ea2:	00008697          	auipc	a3,0x8
ffffffffc0204ea6:	3be68693          	addi	a3,a3,958 # ffffffffc020d260 <default_pmm_manager+0xdf8>
ffffffffc0204eaa:	00007617          	auipc	a2,0x7
ffffffffc0204eae:	ad660613          	addi	a2,a2,-1322 # ffffffffc020b980 <commands+0x210>
ffffffffc0204eb2:	11a00593          	li	a1,282
ffffffffc0204eb6:	00008517          	auipc	a0,0x8
ffffffffc0204eba:	16a50513          	addi	a0,a0,362 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204ebe:	de0fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204ec2:	00008697          	auipc	a3,0x8
ffffffffc0204ec6:	29668693          	addi	a3,a3,662 # ffffffffc020d158 <default_pmm_manager+0xcf0>
ffffffffc0204eca:	00007617          	auipc	a2,0x7
ffffffffc0204ece:	ab660613          	addi	a2,a2,-1354 # ffffffffc020b980 <commands+0x210>
ffffffffc0204ed2:	11200593          	li	a1,274
ffffffffc0204ed6:	00008517          	auipc	a0,0x8
ffffffffc0204eda:	14a50513          	addi	a0,a0,330 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204ede:	dc0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ee2 <file_fstat>:
ffffffffc0204ee2:	1101                	addi	sp,sp,-32
ffffffffc0204ee4:	ec06                	sd	ra,24(sp)
ffffffffc0204ee6:	e822                	sd	s0,16(sp)
ffffffffc0204ee8:	e426                	sd	s1,8(sp)
ffffffffc0204eea:	e04a                	sd	s2,0(sp)
ffffffffc0204eec:	04700793          	li	a5,71
ffffffffc0204ef0:	06a7ef63          	bltu	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204ef4:	00092797          	auipc	a5,0x92
ffffffffc0204ef8:	9cc7b783          	ld	a5,-1588(a5) # ffffffffc02968c0 <current>
ffffffffc0204efc:	1487b783          	ld	a5,328(a5)
ffffffffc0204f00:	cfd9                	beqz	a5,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f02:	4b98                	lw	a4,16(a5)
ffffffffc0204f04:	08e05d63          	blez	a4,ffffffffc0204f9e <file_fstat+0xbc>
ffffffffc0204f08:	6780                	ld	s0,8(a5)
ffffffffc0204f0a:	00351793          	slli	a5,a0,0x3
ffffffffc0204f0e:	8f89                	sub	a5,a5,a0
ffffffffc0204f10:	078e                	slli	a5,a5,0x3
ffffffffc0204f12:	943e                	add	s0,s0,a5
ffffffffc0204f14:	4018                	lw	a4,0(s0)
ffffffffc0204f16:	4789                	li	a5,2
ffffffffc0204f18:	04f71b63          	bne	a4,a5,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f1c:	4c1c                	lw	a5,24(s0)
ffffffffc0204f1e:	04a79863          	bne	a5,a0,ffffffffc0204f6e <file_fstat+0x8c>
ffffffffc0204f22:	581c                	lw	a5,48(s0)
ffffffffc0204f24:	02843903          	ld	s2,40(s0)
ffffffffc0204f28:	2785                	addiw	a5,a5,1
ffffffffc0204f2a:	d81c                	sw	a5,48(s0)
ffffffffc0204f2c:	04090963          	beqz	s2,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f30:	07093783          	ld	a5,112(s2)
ffffffffc0204f34:	c7a9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f36:	779c                	ld	a5,40(a5)
ffffffffc0204f38:	c3b9                	beqz	a5,ffffffffc0204f7e <file_fstat+0x9c>
ffffffffc0204f3a:	84ae                	mv	s1,a1
ffffffffc0204f3c:	854a                	mv	a0,s2
ffffffffc0204f3e:	00008597          	auipc	a1,0x8
ffffffffc0204f42:	26a58593          	addi	a1,a1,618 # ffffffffc020d1a8 <default_pmm_manager+0xd40>
ffffffffc0204f46:	119020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0204f4a:	07093783          	ld	a5,112(s2)
ffffffffc0204f4e:	7408                	ld	a0,40(s0)
ffffffffc0204f50:	85a6                	mv	a1,s1
ffffffffc0204f52:	779c                	ld	a5,40(a5)
ffffffffc0204f54:	9782                	jalr	a5
ffffffffc0204f56:	87aa                	mv	a5,a0
ffffffffc0204f58:	8522                	mv	a0,s0
ffffffffc0204f5a:	843e                	mv	s0,a5
ffffffffc0204f5c:	949ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0204f60:	60e2                	ld	ra,24(sp)
ffffffffc0204f62:	8522                	mv	a0,s0
ffffffffc0204f64:	6442                	ld	s0,16(sp)
ffffffffc0204f66:	64a2                	ld	s1,8(sp)
ffffffffc0204f68:	6902                	ld	s2,0(sp)
ffffffffc0204f6a:	6105                	addi	sp,sp,32
ffffffffc0204f6c:	8082                	ret
ffffffffc0204f6e:	5475                	li	s0,-3
ffffffffc0204f70:	60e2                	ld	ra,24(sp)
ffffffffc0204f72:	8522                	mv	a0,s0
ffffffffc0204f74:	6442                	ld	s0,16(sp)
ffffffffc0204f76:	64a2                	ld	s1,8(sp)
ffffffffc0204f78:	6902                	ld	s2,0(sp)
ffffffffc0204f7a:	6105                	addi	sp,sp,32
ffffffffc0204f7c:	8082                	ret
ffffffffc0204f7e:	00008697          	auipc	a3,0x8
ffffffffc0204f82:	1da68693          	addi	a3,a3,474 # ffffffffc020d158 <default_pmm_manager+0xcf0>
ffffffffc0204f86:	00007617          	auipc	a2,0x7
ffffffffc0204f8a:	9fa60613          	addi	a2,a2,-1542 # ffffffffc020b980 <commands+0x210>
ffffffffc0204f8e:	12c00593          	li	a1,300
ffffffffc0204f92:	00008517          	auipc	a0,0x8
ffffffffc0204f96:	08e50513          	addi	a0,a0,142 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0204f9a:	d04fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204f9e:	fd4ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0204fa2 <file_fsync>:
ffffffffc0204fa2:	1101                	addi	sp,sp,-32
ffffffffc0204fa4:	ec06                	sd	ra,24(sp)
ffffffffc0204fa6:	e822                	sd	s0,16(sp)
ffffffffc0204fa8:	e426                	sd	s1,8(sp)
ffffffffc0204faa:	04700793          	li	a5,71
ffffffffc0204fae:	06a7e863          	bltu	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fb2:	00092797          	auipc	a5,0x92
ffffffffc0204fb6:	90e7b783          	ld	a5,-1778(a5) # ffffffffc02968c0 <current>
ffffffffc0204fba:	1487b783          	ld	a5,328(a5)
ffffffffc0204fbe:	c7d9                	beqz	a5,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc0:	4b98                	lw	a4,16(a5)
ffffffffc0204fc2:	08e05563          	blez	a4,ffffffffc020504c <file_fsync+0xaa>
ffffffffc0204fc6:	6780                	ld	s0,8(a5)
ffffffffc0204fc8:	00351793          	slli	a5,a0,0x3
ffffffffc0204fcc:	8f89                	sub	a5,a5,a0
ffffffffc0204fce:	078e                	slli	a5,a5,0x3
ffffffffc0204fd0:	943e                	add	s0,s0,a5
ffffffffc0204fd2:	4018                	lw	a4,0(s0)
ffffffffc0204fd4:	4789                	li	a5,2
ffffffffc0204fd6:	04f71463          	bne	a4,a5,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fda:	4c1c                	lw	a5,24(s0)
ffffffffc0204fdc:	04a79163          	bne	a5,a0,ffffffffc020501e <file_fsync+0x7c>
ffffffffc0204fe0:	581c                	lw	a5,48(s0)
ffffffffc0204fe2:	7404                	ld	s1,40(s0)
ffffffffc0204fe4:	2785                	addiw	a5,a5,1
ffffffffc0204fe6:	d81c                	sw	a5,48(s0)
ffffffffc0204fe8:	c0b1                	beqz	s1,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fea:	78bc                	ld	a5,112(s1)
ffffffffc0204fec:	c3a1                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204fee:	7b9c                	ld	a5,48(a5)
ffffffffc0204ff0:	cf95                	beqz	a5,ffffffffc020502c <file_fsync+0x8a>
ffffffffc0204ff2:	00008597          	auipc	a1,0x8
ffffffffc0204ff6:	31658593          	addi	a1,a1,790 # ffffffffc020d308 <default_pmm_manager+0xea0>
ffffffffc0204ffa:	8526                	mv	a0,s1
ffffffffc0204ffc:	063020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0205000:	78bc                	ld	a5,112(s1)
ffffffffc0205002:	7408                	ld	a0,40(s0)
ffffffffc0205004:	7b9c                	ld	a5,48(a5)
ffffffffc0205006:	9782                	jalr	a5
ffffffffc0205008:	87aa                	mv	a5,a0
ffffffffc020500a:	8522                	mv	a0,s0
ffffffffc020500c:	843e                	mv	s0,a5
ffffffffc020500e:	897ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc0205012:	60e2                	ld	ra,24(sp)
ffffffffc0205014:	8522                	mv	a0,s0
ffffffffc0205016:	6442                	ld	s0,16(sp)
ffffffffc0205018:	64a2                	ld	s1,8(sp)
ffffffffc020501a:	6105                	addi	sp,sp,32
ffffffffc020501c:	8082                	ret
ffffffffc020501e:	5475                	li	s0,-3
ffffffffc0205020:	60e2                	ld	ra,24(sp)
ffffffffc0205022:	8522                	mv	a0,s0
ffffffffc0205024:	6442                	ld	s0,16(sp)
ffffffffc0205026:	64a2                	ld	s1,8(sp)
ffffffffc0205028:	6105                	addi	sp,sp,32
ffffffffc020502a:	8082                	ret
ffffffffc020502c:	00008697          	auipc	a3,0x8
ffffffffc0205030:	28c68693          	addi	a3,a3,652 # ffffffffc020d2b8 <default_pmm_manager+0xe50>
ffffffffc0205034:	00007617          	auipc	a2,0x7
ffffffffc0205038:	94c60613          	addi	a2,a2,-1716 # ffffffffc020b980 <commands+0x210>
ffffffffc020503c:	13a00593          	li	a1,314
ffffffffc0205040:	00008517          	auipc	a0,0x8
ffffffffc0205044:	fe050513          	addi	a0,a0,-32 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc0205048:	c56fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020504c:	f26ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205050 <file_getdirentry>:
ffffffffc0205050:	715d                	addi	sp,sp,-80
ffffffffc0205052:	e486                	sd	ra,72(sp)
ffffffffc0205054:	e0a2                	sd	s0,64(sp)
ffffffffc0205056:	fc26                	sd	s1,56(sp)
ffffffffc0205058:	f84a                	sd	s2,48(sp)
ffffffffc020505a:	f44e                	sd	s3,40(sp)
ffffffffc020505c:	04700793          	li	a5,71
ffffffffc0205060:	0aa7e063          	bltu	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205064:	00092797          	auipc	a5,0x92
ffffffffc0205068:	85c7b783          	ld	a5,-1956(a5) # ffffffffc02968c0 <current>
ffffffffc020506c:	1487b783          	ld	a5,328(a5)
ffffffffc0205070:	c3e9                	beqz	a5,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205072:	4b98                	lw	a4,16(a5)
ffffffffc0205074:	0ae05f63          	blez	a4,ffffffffc0205132 <file_getdirentry+0xe2>
ffffffffc0205078:	6780                	ld	s0,8(a5)
ffffffffc020507a:	00351793          	slli	a5,a0,0x3
ffffffffc020507e:	8f89                	sub	a5,a5,a0
ffffffffc0205080:	078e                	slli	a5,a5,0x3
ffffffffc0205082:	943e                	add	s0,s0,a5
ffffffffc0205084:	4018                	lw	a4,0(s0)
ffffffffc0205086:	4789                	li	a5,2
ffffffffc0205088:	06f71c63          	bne	a4,a5,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc020508c:	4c1c                	lw	a5,24(s0)
ffffffffc020508e:	06a79963          	bne	a5,a0,ffffffffc0205100 <file_getdirentry+0xb0>
ffffffffc0205092:	581c                	lw	a5,48(s0)
ffffffffc0205094:	6194                	ld	a3,0(a1)
ffffffffc0205096:	84ae                	mv	s1,a1
ffffffffc0205098:	2785                	addiw	a5,a5,1
ffffffffc020509a:	10000613          	li	a2,256
ffffffffc020509e:	d81c                	sw	a5,48(s0)
ffffffffc02050a0:	05a1                	addi	a1,a1,8
ffffffffc02050a2:	850a                	mv	a0,sp
ffffffffc02050a4:	33e000ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02050a8:	02843983          	ld	s3,40(s0)
ffffffffc02050ac:	892a                	mv	s2,a0
ffffffffc02050ae:	06098263          	beqz	s3,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b2:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc02050b6:	cfb1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050b8:	63bc                	ld	a5,64(a5)
ffffffffc02050ba:	cfa1                	beqz	a5,ffffffffc0205112 <file_getdirentry+0xc2>
ffffffffc02050bc:	854e                	mv	a0,s3
ffffffffc02050be:	00008597          	auipc	a1,0x8
ffffffffc02050c2:	2aa58593          	addi	a1,a1,682 # ffffffffc020d368 <default_pmm_manager+0xf00>
ffffffffc02050c6:	798020ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc02050ca:	0709b783          	ld	a5,112(s3)
ffffffffc02050ce:	7408                	ld	a0,40(s0)
ffffffffc02050d0:	85ca                	mv	a1,s2
ffffffffc02050d2:	63bc                	ld	a5,64(a5)
ffffffffc02050d4:	9782                	jalr	a5
ffffffffc02050d6:	89aa                	mv	s3,a0
ffffffffc02050d8:	e909                	bnez	a0,ffffffffc02050ea <file_getdirentry+0x9a>
ffffffffc02050da:	609c                	ld	a5,0(s1)
ffffffffc02050dc:	01093683          	ld	a3,16(s2)
ffffffffc02050e0:	01893703          	ld	a4,24(s2)
ffffffffc02050e4:	97b6                	add	a5,a5,a3
ffffffffc02050e6:	8f99                	sub	a5,a5,a4
ffffffffc02050e8:	e09c                	sd	a5,0(s1)
ffffffffc02050ea:	8522                	mv	a0,s0
ffffffffc02050ec:	fb8ff0ef          	jal	ra,ffffffffc02048a4 <fd_array_release>
ffffffffc02050f0:	60a6                	ld	ra,72(sp)
ffffffffc02050f2:	6406                	ld	s0,64(sp)
ffffffffc02050f4:	74e2                	ld	s1,56(sp)
ffffffffc02050f6:	7942                	ld	s2,48(sp)
ffffffffc02050f8:	854e                	mv	a0,s3
ffffffffc02050fa:	79a2                	ld	s3,40(sp)
ffffffffc02050fc:	6161                	addi	sp,sp,80
ffffffffc02050fe:	8082                	ret
ffffffffc0205100:	60a6                	ld	ra,72(sp)
ffffffffc0205102:	6406                	ld	s0,64(sp)
ffffffffc0205104:	59f5                	li	s3,-3
ffffffffc0205106:	74e2                	ld	s1,56(sp)
ffffffffc0205108:	7942                	ld	s2,48(sp)
ffffffffc020510a:	854e                	mv	a0,s3
ffffffffc020510c:	79a2                	ld	s3,40(sp)
ffffffffc020510e:	6161                	addi	sp,sp,80
ffffffffc0205110:	8082                	ret
ffffffffc0205112:	00008697          	auipc	a3,0x8
ffffffffc0205116:	1fe68693          	addi	a3,a3,510 # ffffffffc020d310 <default_pmm_manager+0xea8>
ffffffffc020511a:	00007617          	auipc	a2,0x7
ffffffffc020511e:	86660613          	addi	a2,a2,-1946 # ffffffffc020b980 <commands+0x210>
ffffffffc0205122:	14a00593          	li	a1,330
ffffffffc0205126:	00008517          	auipc	a0,0x8
ffffffffc020512a:	efa50513          	addi	a0,a0,-262 # ffffffffc020d020 <default_pmm_manager+0xbb8>
ffffffffc020512e:	b70fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205132:	e40ff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc0205136 <file_dup>:
ffffffffc0205136:	04700713          	li	a4,71
ffffffffc020513a:	06a76463          	bltu	a4,a0,ffffffffc02051a2 <file_dup+0x6c>
ffffffffc020513e:	00091717          	auipc	a4,0x91
ffffffffc0205142:	78273703          	ld	a4,1922(a4) # ffffffffc02968c0 <current>
ffffffffc0205146:	14873703          	ld	a4,328(a4)
ffffffffc020514a:	1101                	addi	sp,sp,-32
ffffffffc020514c:	ec06                	sd	ra,24(sp)
ffffffffc020514e:	e822                	sd	s0,16(sp)
ffffffffc0205150:	cb39                	beqz	a4,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205152:	4b14                	lw	a3,16(a4)
ffffffffc0205154:	04d05963          	blez	a3,ffffffffc02051a6 <file_dup+0x70>
ffffffffc0205158:	6700                	ld	s0,8(a4)
ffffffffc020515a:	00351713          	slli	a4,a0,0x3
ffffffffc020515e:	8f09                	sub	a4,a4,a0
ffffffffc0205160:	070e                	slli	a4,a4,0x3
ffffffffc0205162:	943a                	add	s0,s0,a4
ffffffffc0205164:	4014                	lw	a3,0(s0)
ffffffffc0205166:	4709                	li	a4,2
ffffffffc0205168:	02e69863          	bne	a3,a4,ffffffffc0205198 <file_dup+0x62>
ffffffffc020516c:	4c18                	lw	a4,24(s0)
ffffffffc020516e:	02a71563          	bne	a4,a0,ffffffffc0205198 <file_dup+0x62>
ffffffffc0205172:	852e                	mv	a0,a1
ffffffffc0205174:	002c                	addi	a1,sp,8
ffffffffc0205176:	e1eff0ef          	jal	ra,ffffffffc0204794 <fd_array_alloc>
ffffffffc020517a:	c509                	beqz	a0,ffffffffc0205184 <file_dup+0x4e>
ffffffffc020517c:	60e2                	ld	ra,24(sp)
ffffffffc020517e:	6442                	ld	s0,16(sp)
ffffffffc0205180:	6105                	addi	sp,sp,32
ffffffffc0205182:	8082                	ret
ffffffffc0205184:	6522                	ld	a0,8(sp)
ffffffffc0205186:	85a2                	mv	a1,s0
ffffffffc0205188:	845ff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc020518c:	67a2                	ld	a5,8(sp)
ffffffffc020518e:	60e2                	ld	ra,24(sp)
ffffffffc0205190:	6442                	ld	s0,16(sp)
ffffffffc0205192:	4f88                	lw	a0,24(a5)
ffffffffc0205194:	6105                	addi	sp,sp,32
ffffffffc0205196:	8082                	ret
ffffffffc0205198:	60e2                	ld	ra,24(sp)
ffffffffc020519a:	6442                	ld	s0,16(sp)
ffffffffc020519c:	5575                	li	a0,-3
ffffffffc020519e:	6105                	addi	sp,sp,32
ffffffffc02051a0:	8082                	ret
ffffffffc02051a2:	5575                	li	a0,-3
ffffffffc02051a4:	8082                	ret
ffffffffc02051a6:	dccff0ef          	jal	ra,ffffffffc0204772 <get_fd_array.part.0>

ffffffffc02051aa <fs_init>:
ffffffffc02051aa:	1141                	addi	sp,sp,-16
ffffffffc02051ac:	e406                	sd	ra,8(sp)
ffffffffc02051ae:	0cf020ef          	jal	ra,ffffffffc0207a7c <vfs_init>
ffffffffc02051b2:	5a6030ef          	jal	ra,ffffffffc0208758 <dev_init>
ffffffffc02051b6:	60a2                	ld	ra,8(sp)
ffffffffc02051b8:	0141                	addi	sp,sp,16
ffffffffc02051ba:	6f70306f          	j	ffffffffc02090b0 <sfs_init>

ffffffffc02051be <fs_cleanup>:
ffffffffc02051be:	3110206f          	j	ffffffffc0207cce <vfs_cleanup>

ffffffffc02051c2 <lock_files>:
ffffffffc02051c2:	0561                	addi	a0,a0,24
ffffffffc02051c4:	ba0ff06f          	j	ffffffffc0204564 <down>

ffffffffc02051c8 <unlock_files>:
ffffffffc02051c8:	0561                	addi	a0,a0,24
ffffffffc02051ca:	b96ff06f          	j	ffffffffc0204560 <up>

ffffffffc02051ce <files_create>:
ffffffffc02051ce:	1141                	addi	sp,sp,-16
ffffffffc02051d0:	6505                	lui	a0,0x1
ffffffffc02051d2:	e022                	sd	s0,0(sp)
ffffffffc02051d4:	e406                	sd	ra,8(sp)
ffffffffc02051d6:	db9fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02051da:	842a                	mv	s0,a0
ffffffffc02051dc:	cd19                	beqz	a0,ffffffffc02051fa <files_create+0x2c>
ffffffffc02051de:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc02051e2:	00043023          	sd	zero,0(s0)
ffffffffc02051e6:	0561                	addi	a0,a0,24
ffffffffc02051e8:	e41c                	sd	a5,8(s0)
ffffffffc02051ea:	00042823          	sw	zero,16(s0)
ffffffffc02051ee:	4585                	li	a1,1
ffffffffc02051f0:	b6aff0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02051f4:	6408                	ld	a0,8(s0)
ffffffffc02051f6:	f3cff0ef          	jal	ra,ffffffffc0204932 <fd_array_init>
ffffffffc02051fa:	60a2                	ld	ra,8(sp)
ffffffffc02051fc:	8522                	mv	a0,s0
ffffffffc02051fe:	6402                	ld	s0,0(sp)
ffffffffc0205200:	0141                	addi	sp,sp,16
ffffffffc0205202:	8082                	ret

ffffffffc0205204 <files_destroy>:
ffffffffc0205204:	7179                	addi	sp,sp,-48
ffffffffc0205206:	f406                	sd	ra,40(sp)
ffffffffc0205208:	f022                	sd	s0,32(sp)
ffffffffc020520a:	ec26                	sd	s1,24(sp)
ffffffffc020520c:	e84a                	sd	s2,16(sp)
ffffffffc020520e:	e44e                	sd	s3,8(sp)
ffffffffc0205210:	c52d                	beqz	a0,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205212:	491c                	lw	a5,16(a0)
ffffffffc0205214:	89aa                	mv	s3,a0
ffffffffc0205216:	e3b5                	bnez	a5,ffffffffc020527a <files_destroy+0x76>
ffffffffc0205218:	6108                	ld	a0,0(a0)
ffffffffc020521a:	c119                	beqz	a0,ffffffffc0205220 <files_destroy+0x1c>
ffffffffc020521c:	6f8020ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc0205220:	0089b403          	ld	s0,8(s3)
ffffffffc0205224:	6485                	lui	s1,0x1
ffffffffc0205226:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc020522a:	94a2                	add	s1,s1,s0
ffffffffc020522c:	4909                	li	s2,2
ffffffffc020522e:	401c                	lw	a5,0(s0)
ffffffffc0205230:	03278063          	beq	a5,s2,ffffffffc0205250 <files_destroy+0x4c>
ffffffffc0205234:	e39d                	bnez	a5,ffffffffc020525a <files_destroy+0x56>
ffffffffc0205236:	03840413          	addi	s0,s0,56
ffffffffc020523a:	fe849ae3          	bne	s1,s0,ffffffffc020522e <files_destroy+0x2a>
ffffffffc020523e:	7402                	ld	s0,32(sp)
ffffffffc0205240:	70a2                	ld	ra,40(sp)
ffffffffc0205242:	64e2                	ld	s1,24(sp)
ffffffffc0205244:	6942                	ld	s2,16(sp)
ffffffffc0205246:	854e                	mv	a0,s3
ffffffffc0205248:	69a2                	ld	s3,8(sp)
ffffffffc020524a:	6145                	addi	sp,sp,48
ffffffffc020524c:	df3fc06f          	j	ffffffffc020203e <kfree>
ffffffffc0205250:	8522                	mv	a0,s0
ffffffffc0205252:	efcff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc0205256:	401c                	lw	a5,0(s0)
ffffffffc0205258:	bff1                	j	ffffffffc0205234 <files_destroy+0x30>
ffffffffc020525a:	00008697          	auipc	a3,0x8
ffffffffc020525e:	18e68693          	addi	a3,a3,398 # ffffffffc020d3e8 <CSWTCH.79+0x58>
ffffffffc0205262:	00006617          	auipc	a2,0x6
ffffffffc0205266:	71e60613          	addi	a2,a2,1822 # ffffffffc020b980 <commands+0x210>
ffffffffc020526a:	03d00593          	li	a1,61
ffffffffc020526e:	00008517          	auipc	a0,0x8
ffffffffc0205272:	16a50513          	addi	a0,a0,362 # ffffffffc020d3d8 <CSWTCH.79+0x48>
ffffffffc0205276:	a28fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020527a:	00008697          	auipc	a3,0x8
ffffffffc020527e:	12e68693          	addi	a3,a3,302 # ffffffffc020d3a8 <CSWTCH.79+0x18>
ffffffffc0205282:	00006617          	auipc	a2,0x6
ffffffffc0205286:	6fe60613          	addi	a2,a2,1790 # ffffffffc020b980 <commands+0x210>
ffffffffc020528a:	03300593          	li	a1,51
ffffffffc020528e:	00008517          	auipc	a0,0x8
ffffffffc0205292:	14a50513          	addi	a0,a0,330 # ffffffffc020d3d8 <CSWTCH.79+0x48>
ffffffffc0205296:	a08fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020529a <files_closeall>:
ffffffffc020529a:	1101                	addi	sp,sp,-32
ffffffffc020529c:	ec06                	sd	ra,24(sp)
ffffffffc020529e:	e822                	sd	s0,16(sp)
ffffffffc02052a0:	e426                	sd	s1,8(sp)
ffffffffc02052a2:	e04a                	sd	s2,0(sp)
ffffffffc02052a4:	c129                	beqz	a0,ffffffffc02052e6 <files_closeall+0x4c>
ffffffffc02052a6:	491c                	lw	a5,16(a0)
ffffffffc02052a8:	02f05f63          	blez	a5,ffffffffc02052e6 <files_closeall+0x4c>
ffffffffc02052ac:	6504                	ld	s1,8(a0)
ffffffffc02052ae:	6785                	lui	a5,0x1
ffffffffc02052b0:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02052b4:	07048413          	addi	s0,s1,112
ffffffffc02052b8:	4909                	li	s2,2
ffffffffc02052ba:	94be                	add	s1,s1,a5
ffffffffc02052bc:	a029                	j	ffffffffc02052c6 <files_closeall+0x2c>
ffffffffc02052be:	03840413          	addi	s0,s0,56
ffffffffc02052c2:	00848c63          	beq	s1,s0,ffffffffc02052da <files_closeall+0x40>
ffffffffc02052c6:	401c                	lw	a5,0(s0)
ffffffffc02052c8:	ff279be3          	bne	a5,s2,ffffffffc02052be <files_closeall+0x24>
ffffffffc02052cc:	8522                	mv	a0,s0
ffffffffc02052ce:	03840413          	addi	s0,s0,56
ffffffffc02052d2:	e7cff0ef          	jal	ra,ffffffffc020494e <fd_array_close>
ffffffffc02052d6:	fe8498e3          	bne	s1,s0,ffffffffc02052c6 <files_closeall+0x2c>
ffffffffc02052da:	60e2                	ld	ra,24(sp)
ffffffffc02052dc:	6442                	ld	s0,16(sp)
ffffffffc02052de:	64a2                	ld	s1,8(sp)
ffffffffc02052e0:	6902                	ld	s2,0(sp)
ffffffffc02052e2:	6105                	addi	sp,sp,32
ffffffffc02052e4:	8082                	ret
ffffffffc02052e6:	00008697          	auipc	a3,0x8
ffffffffc02052ea:	d0a68693          	addi	a3,a3,-758 # ffffffffc020cff0 <default_pmm_manager+0xb88>
ffffffffc02052ee:	00006617          	auipc	a2,0x6
ffffffffc02052f2:	69260613          	addi	a2,a2,1682 # ffffffffc020b980 <commands+0x210>
ffffffffc02052f6:	04500593          	li	a1,69
ffffffffc02052fa:	00008517          	auipc	a0,0x8
ffffffffc02052fe:	0de50513          	addi	a0,a0,222 # ffffffffc020d3d8 <CSWTCH.79+0x48>
ffffffffc0205302:	99cfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205306 <dup_files>:
ffffffffc0205306:	7179                	addi	sp,sp,-48
ffffffffc0205308:	f406                	sd	ra,40(sp)
ffffffffc020530a:	f022                	sd	s0,32(sp)
ffffffffc020530c:	ec26                	sd	s1,24(sp)
ffffffffc020530e:	e84a                	sd	s2,16(sp)
ffffffffc0205310:	e44e                	sd	s3,8(sp)
ffffffffc0205312:	e052                	sd	s4,0(sp)
ffffffffc0205314:	c52d                	beqz	a0,ffffffffc020537e <dup_files+0x78>
ffffffffc0205316:	842e                	mv	s0,a1
ffffffffc0205318:	c1bd                	beqz	a1,ffffffffc020537e <dup_files+0x78>
ffffffffc020531a:	491c                	lw	a5,16(a0)
ffffffffc020531c:	84aa                	mv	s1,a0
ffffffffc020531e:	e3c1                	bnez	a5,ffffffffc020539e <dup_files+0x98>
ffffffffc0205320:	499c                	lw	a5,16(a1)
ffffffffc0205322:	06f05e63          	blez	a5,ffffffffc020539e <dup_files+0x98>
ffffffffc0205326:	6188                	ld	a0,0(a1)
ffffffffc0205328:	e088                	sd	a0,0(s1)
ffffffffc020532a:	c119                	beqz	a0,ffffffffc0205330 <dup_files+0x2a>
ffffffffc020532c:	51a020ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc0205330:	6400                	ld	s0,8(s0)
ffffffffc0205332:	6905                	lui	s2,0x1
ffffffffc0205334:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205338:	6484                	ld	s1,8(s1)
ffffffffc020533a:	9922                	add	s2,s2,s0
ffffffffc020533c:	4989                	li	s3,2
ffffffffc020533e:	4a05                	li	s4,1
ffffffffc0205340:	a039                	j	ffffffffc020534e <dup_files+0x48>
ffffffffc0205342:	03840413          	addi	s0,s0,56
ffffffffc0205346:	03848493          	addi	s1,s1,56
ffffffffc020534a:	02890163          	beq	s2,s0,ffffffffc020536c <dup_files+0x66>
ffffffffc020534e:	401c                	lw	a5,0(s0)
ffffffffc0205350:	ff3799e3          	bne	a5,s3,ffffffffc0205342 <dup_files+0x3c>
ffffffffc0205354:	0144a023          	sw	s4,0(s1)
ffffffffc0205358:	85a2                	mv	a1,s0
ffffffffc020535a:	8526                	mv	a0,s1
ffffffffc020535c:	03840413          	addi	s0,s0,56
ffffffffc0205360:	e6cff0ef          	jal	ra,ffffffffc02049cc <fd_array_dup>
ffffffffc0205364:	03848493          	addi	s1,s1,56
ffffffffc0205368:	fe8913e3          	bne	s2,s0,ffffffffc020534e <dup_files+0x48>
ffffffffc020536c:	70a2                	ld	ra,40(sp)
ffffffffc020536e:	7402                	ld	s0,32(sp)
ffffffffc0205370:	64e2                	ld	s1,24(sp)
ffffffffc0205372:	6942                	ld	s2,16(sp)
ffffffffc0205374:	69a2                	ld	s3,8(sp)
ffffffffc0205376:	6a02                	ld	s4,0(sp)
ffffffffc0205378:	4501                	li	a0,0
ffffffffc020537a:	6145                	addi	sp,sp,48
ffffffffc020537c:	8082                	ret
ffffffffc020537e:	00008697          	auipc	a3,0x8
ffffffffc0205382:	9c268693          	addi	a3,a3,-1598 # ffffffffc020cd40 <default_pmm_manager+0x8d8>
ffffffffc0205386:	00006617          	auipc	a2,0x6
ffffffffc020538a:	5fa60613          	addi	a2,a2,1530 # ffffffffc020b980 <commands+0x210>
ffffffffc020538e:	05300593          	li	a1,83
ffffffffc0205392:	00008517          	auipc	a0,0x8
ffffffffc0205396:	04650513          	addi	a0,a0,70 # ffffffffc020d3d8 <CSWTCH.79+0x48>
ffffffffc020539a:	904fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020539e:	00008697          	auipc	a3,0x8
ffffffffc02053a2:	06268693          	addi	a3,a3,98 # ffffffffc020d400 <CSWTCH.79+0x70>
ffffffffc02053a6:	00006617          	auipc	a2,0x6
ffffffffc02053aa:	5da60613          	addi	a2,a2,1498 # ffffffffc020b980 <commands+0x210>
ffffffffc02053ae:	05400593          	li	a1,84
ffffffffc02053b2:	00008517          	auipc	a0,0x8
ffffffffc02053b6:	02650513          	addi	a0,a0,38 # ffffffffc020d3d8 <CSWTCH.79+0x48>
ffffffffc02053ba:	8e4fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053be <iobuf_skip.part.0>:
ffffffffc02053be:	1141                	addi	sp,sp,-16
ffffffffc02053c0:	00008697          	auipc	a3,0x8
ffffffffc02053c4:	07068693          	addi	a3,a3,112 # ffffffffc020d430 <CSWTCH.79+0xa0>
ffffffffc02053c8:	00006617          	auipc	a2,0x6
ffffffffc02053cc:	5b860613          	addi	a2,a2,1464 # ffffffffc020b980 <commands+0x210>
ffffffffc02053d0:	04a00593          	li	a1,74
ffffffffc02053d4:	00008517          	auipc	a0,0x8
ffffffffc02053d8:	07450513          	addi	a0,a0,116 # ffffffffc020d448 <CSWTCH.79+0xb8>
ffffffffc02053dc:	e406                	sd	ra,8(sp)
ffffffffc02053de:	8c0fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053e2 <iobuf_init>:
ffffffffc02053e2:	e10c                	sd	a1,0(a0)
ffffffffc02053e4:	e514                	sd	a3,8(a0)
ffffffffc02053e6:	ed10                	sd	a2,24(a0)
ffffffffc02053e8:	e910                	sd	a2,16(a0)
ffffffffc02053ea:	8082                	ret

ffffffffc02053ec <iobuf_move>:
ffffffffc02053ec:	7179                	addi	sp,sp,-48
ffffffffc02053ee:	ec26                	sd	s1,24(sp)
ffffffffc02053f0:	6d04                	ld	s1,24(a0)
ffffffffc02053f2:	f022                	sd	s0,32(sp)
ffffffffc02053f4:	e84a                	sd	s2,16(sp)
ffffffffc02053f6:	e44e                	sd	s3,8(sp)
ffffffffc02053f8:	f406                	sd	ra,40(sp)
ffffffffc02053fa:	842a                	mv	s0,a0
ffffffffc02053fc:	8932                	mv	s2,a2
ffffffffc02053fe:	852e                	mv	a0,a1
ffffffffc0205400:	89ba                	mv	s3,a4
ffffffffc0205402:	00967363          	bgeu	a2,s1,ffffffffc0205408 <iobuf_move+0x1c>
ffffffffc0205406:	84b2                	mv	s1,a2
ffffffffc0205408:	c495                	beqz	s1,ffffffffc0205434 <iobuf_move+0x48>
ffffffffc020540a:	600c                	ld	a1,0(s0)
ffffffffc020540c:	c681                	beqz	a3,ffffffffc0205414 <iobuf_move+0x28>
ffffffffc020540e:	87ae                	mv	a5,a1
ffffffffc0205410:	85aa                	mv	a1,a0
ffffffffc0205412:	853e                	mv	a0,a5
ffffffffc0205414:	8626                	mv	a2,s1
ffffffffc0205416:	096060ef          	jal	ra,ffffffffc020b4ac <memmove>
ffffffffc020541a:	6c1c                	ld	a5,24(s0)
ffffffffc020541c:	0297ea63          	bltu	a5,s1,ffffffffc0205450 <iobuf_move+0x64>
ffffffffc0205420:	6014                	ld	a3,0(s0)
ffffffffc0205422:	6418                	ld	a4,8(s0)
ffffffffc0205424:	8f85                	sub	a5,a5,s1
ffffffffc0205426:	96a6                	add	a3,a3,s1
ffffffffc0205428:	9726                	add	a4,a4,s1
ffffffffc020542a:	e014                	sd	a3,0(s0)
ffffffffc020542c:	e418                	sd	a4,8(s0)
ffffffffc020542e:	ec1c                	sd	a5,24(s0)
ffffffffc0205430:	40990933          	sub	s2,s2,s1
ffffffffc0205434:	00098463          	beqz	s3,ffffffffc020543c <iobuf_move+0x50>
ffffffffc0205438:	0099b023          	sd	s1,0(s3)
ffffffffc020543c:	4501                	li	a0,0
ffffffffc020543e:	00091b63          	bnez	s2,ffffffffc0205454 <iobuf_move+0x68>
ffffffffc0205442:	70a2                	ld	ra,40(sp)
ffffffffc0205444:	7402                	ld	s0,32(sp)
ffffffffc0205446:	64e2                	ld	s1,24(sp)
ffffffffc0205448:	6942                	ld	s2,16(sp)
ffffffffc020544a:	69a2                	ld	s3,8(sp)
ffffffffc020544c:	6145                	addi	sp,sp,48
ffffffffc020544e:	8082                	ret
ffffffffc0205450:	f6fff0ef          	jal	ra,ffffffffc02053be <iobuf_skip.part.0>
ffffffffc0205454:	5571                	li	a0,-4
ffffffffc0205456:	b7f5                	j	ffffffffc0205442 <iobuf_move+0x56>

ffffffffc0205458 <iobuf_skip>:
ffffffffc0205458:	6d1c                	ld	a5,24(a0)
ffffffffc020545a:	00b7eb63          	bltu	a5,a1,ffffffffc0205470 <iobuf_skip+0x18>
ffffffffc020545e:	6114                	ld	a3,0(a0)
ffffffffc0205460:	6518                	ld	a4,8(a0)
ffffffffc0205462:	8f8d                	sub	a5,a5,a1
ffffffffc0205464:	96ae                	add	a3,a3,a1
ffffffffc0205466:	95ba                	add	a1,a1,a4
ffffffffc0205468:	e114                	sd	a3,0(a0)
ffffffffc020546a:	e50c                	sd	a1,8(a0)
ffffffffc020546c:	ed1c                	sd	a5,24(a0)
ffffffffc020546e:	8082                	ret
ffffffffc0205470:	1141                	addi	sp,sp,-16
ffffffffc0205472:	e406                	sd	ra,8(sp)
ffffffffc0205474:	f4bff0ef          	jal	ra,ffffffffc02053be <iobuf_skip.part.0>

ffffffffc0205478 <copy_path>:
ffffffffc0205478:	7139                	addi	sp,sp,-64
ffffffffc020547a:	f04a                	sd	s2,32(sp)
ffffffffc020547c:	00091917          	auipc	s2,0x91
ffffffffc0205480:	44490913          	addi	s2,s2,1092 # ffffffffc02968c0 <current>
ffffffffc0205484:	00093703          	ld	a4,0(s2)
ffffffffc0205488:	ec4e                	sd	s3,24(sp)
ffffffffc020548a:	89aa                	mv	s3,a0
ffffffffc020548c:	6505                	lui	a0,0x1
ffffffffc020548e:	f426                	sd	s1,40(sp)
ffffffffc0205490:	e852                	sd	s4,16(sp)
ffffffffc0205492:	fc06                	sd	ra,56(sp)
ffffffffc0205494:	f822                	sd	s0,48(sp)
ffffffffc0205496:	e456                	sd	s5,8(sp)
ffffffffc0205498:	02873a03          	ld	s4,40(a4)
ffffffffc020549c:	84ae                	mv	s1,a1
ffffffffc020549e:	af1fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02054a2:	c141                	beqz	a0,ffffffffc0205522 <copy_path+0xaa>
ffffffffc02054a4:	842a                	mv	s0,a0
ffffffffc02054a6:	040a0563          	beqz	s4,ffffffffc02054f0 <copy_path+0x78>
ffffffffc02054aa:	038a0a93          	addi	s5,s4,56
ffffffffc02054ae:	8556                	mv	a0,s5
ffffffffc02054b0:	8b4ff0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02054b4:	00093783          	ld	a5,0(s2)
ffffffffc02054b8:	cba1                	beqz	a5,ffffffffc0205508 <copy_path+0x90>
ffffffffc02054ba:	43dc                	lw	a5,4(a5)
ffffffffc02054bc:	6685                	lui	a3,0x1
ffffffffc02054be:	8626                	mv	a2,s1
ffffffffc02054c0:	04fa2823          	sw	a5,80(s4)
ffffffffc02054c4:	85a2                	mv	a1,s0
ffffffffc02054c6:	8552                	mv	a0,s4
ffffffffc02054c8:	ec5fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054cc:	c529                	beqz	a0,ffffffffc0205516 <copy_path+0x9e>
ffffffffc02054ce:	8556                	mv	a0,s5
ffffffffc02054d0:	890ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02054d4:	040a2823          	sw	zero,80(s4)
ffffffffc02054d8:	0089b023          	sd	s0,0(s3)
ffffffffc02054dc:	4501                	li	a0,0
ffffffffc02054de:	70e2                	ld	ra,56(sp)
ffffffffc02054e0:	7442                	ld	s0,48(sp)
ffffffffc02054e2:	74a2                	ld	s1,40(sp)
ffffffffc02054e4:	7902                	ld	s2,32(sp)
ffffffffc02054e6:	69e2                	ld	s3,24(sp)
ffffffffc02054e8:	6a42                	ld	s4,16(sp)
ffffffffc02054ea:	6aa2                	ld	s5,8(sp)
ffffffffc02054ec:	6121                	addi	sp,sp,64
ffffffffc02054ee:	8082                	ret
ffffffffc02054f0:	85aa                	mv	a1,a0
ffffffffc02054f2:	6685                	lui	a3,0x1
ffffffffc02054f4:	8626                	mv	a2,s1
ffffffffc02054f6:	4501                	li	a0,0
ffffffffc02054f8:	e95fe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc02054fc:	fd71                	bnez	a0,ffffffffc02054d8 <copy_path+0x60>
ffffffffc02054fe:	8522                	mv	a0,s0
ffffffffc0205500:	b3ffc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205504:	5575                	li	a0,-3
ffffffffc0205506:	bfe1                	j	ffffffffc02054de <copy_path+0x66>
ffffffffc0205508:	6685                	lui	a3,0x1
ffffffffc020550a:	8626                	mv	a2,s1
ffffffffc020550c:	85a2                	mv	a1,s0
ffffffffc020550e:	8552                	mv	a0,s4
ffffffffc0205510:	e7dfe0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0205514:	fd4d                	bnez	a0,ffffffffc02054ce <copy_path+0x56>
ffffffffc0205516:	8556                	mv	a0,s5
ffffffffc0205518:	848ff0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020551c:	040a2823          	sw	zero,80(s4)
ffffffffc0205520:	bff9                	j	ffffffffc02054fe <copy_path+0x86>
ffffffffc0205522:	5571                	li	a0,-4
ffffffffc0205524:	bf6d                	j	ffffffffc02054de <copy_path+0x66>

ffffffffc0205526 <sysfile_open>:
ffffffffc0205526:	7179                	addi	sp,sp,-48
ffffffffc0205528:	872a                	mv	a4,a0
ffffffffc020552a:	ec26                	sd	s1,24(sp)
ffffffffc020552c:	0028                	addi	a0,sp,8
ffffffffc020552e:	84ae                	mv	s1,a1
ffffffffc0205530:	85ba                	mv	a1,a4
ffffffffc0205532:	f022                	sd	s0,32(sp)
ffffffffc0205534:	f406                	sd	ra,40(sp)
ffffffffc0205536:	f43ff0ef          	jal	ra,ffffffffc0205478 <copy_path>
ffffffffc020553a:	842a                	mv	s0,a0
ffffffffc020553c:	e909                	bnez	a0,ffffffffc020554e <sysfile_open+0x28>
ffffffffc020553e:	6522                	ld	a0,8(sp)
ffffffffc0205540:	85a6                	mv	a1,s1
ffffffffc0205542:	d60ff0ef          	jal	ra,ffffffffc0204aa2 <file_open>
ffffffffc0205546:	842a                	mv	s0,a0
ffffffffc0205548:	6522                	ld	a0,8(sp)
ffffffffc020554a:	af5fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020554e:	70a2                	ld	ra,40(sp)
ffffffffc0205550:	8522                	mv	a0,s0
ffffffffc0205552:	7402                	ld	s0,32(sp)
ffffffffc0205554:	64e2                	ld	s1,24(sp)
ffffffffc0205556:	6145                	addi	sp,sp,48
ffffffffc0205558:	8082                	ret

ffffffffc020555a <sysfile_close>:
ffffffffc020555a:	e46ff06f          	j	ffffffffc0204ba0 <file_close>

ffffffffc020555e <sysfile_read>:
ffffffffc020555e:	7159                	addi	sp,sp,-112
ffffffffc0205560:	f0a2                	sd	s0,96(sp)
ffffffffc0205562:	f486                	sd	ra,104(sp)
ffffffffc0205564:	eca6                	sd	s1,88(sp)
ffffffffc0205566:	e8ca                	sd	s2,80(sp)
ffffffffc0205568:	e4ce                	sd	s3,72(sp)
ffffffffc020556a:	e0d2                	sd	s4,64(sp)
ffffffffc020556c:	fc56                	sd	s5,56(sp)
ffffffffc020556e:	f85a                	sd	s6,48(sp)
ffffffffc0205570:	f45e                	sd	s7,40(sp)
ffffffffc0205572:	f062                	sd	s8,32(sp)
ffffffffc0205574:	ec66                	sd	s9,24(sp)
ffffffffc0205576:	4401                	li	s0,0
ffffffffc0205578:	ee19                	bnez	a2,ffffffffc0205596 <sysfile_read+0x38>
ffffffffc020557a:	70a6                	ld	ra,104(sp)
ffffffffc020557c:	8522                	mv	a0,s0
ffffffffc020557e:	7406                	ld	s0,96(sp)
ffffffffc0205580:	64e6                	ld	s1,88(sp)
ffffffffc0205582:	6946                	ld	s2,80(sp)
ffffffffc0205584:	69a6                	ld	s3,72(sp)
ffffffffc0205586:	6a06                	ld	s4,64(sp)
ffffffffc0205588:	7ae2                	ld	s5,56(sp)
ffffffffc020558a:	7b42                	ld	s6,48(sp)
ffffffffc020558c:	7ba2                	ld	s7,40(sp)
ffffffffc020558e:	7c02                	ld	s8,32(sp)
ffffffffc0205590:	6ce2                	ld	s9,24(sp)
ffffffffc0205592:	6165                	addi	sp,sp,112
ffffffffc0205594:	8082                	ret
ffffffffc0205596:	00091c97          	auipc	s9,0x91
ffffffffc020559a:	32ac8c93          	addi	s9,s9,810 # ffffffffc02968c0 <current>
ffffffffc020559e:	000cb783          	ld	a5,0(s9)
ffffffffc02055a2:	84b2                	mv	s1,a2
ffffffffc02055a4:	8b2e                	mv	s6,a1
ffffffffc02055a6:	4601                	li	a2,0
ffffffffc02055a8:	4585                	li	a1,1
ffffffffc02055aa:	0287b903          	ld	s2,40(a5)
ffffffffc02055ae:	8aaa                	mv	s5,a0
ffffffffc02055b0:	c9eff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc02055b4:	c959                	beqz	a0,ffffffffc020564a <sysfile_read+0xec>
ffffffffc02055b6:	6505                	lui	a0,0x1
ffffffffc02055b8:	9d7fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02055bc:	89aa                	mv	s3,a0
ffffffffc02055be:	c941                	beqz	a0,ffffffffc020564e <sysfile_read+0xf0>
ffffffffc02055c0:	4b81                	li	s7,0
ffffffffc02055c2:	6a05                	lui	s4,0x1
ffffffffc02055c4:	03890c13          	addi	s8,s2,56
ffffffffc02055c8:	0744ec63          	bltu	s1,s4,ffffffffc0205640 <sysfile_read+0xe2>
ffffffffc02055cc:	e452                	sd	s4,8(sp)
ffffffffc02055ce:	6605                	lui	a2,0x1
ffffffffc02055d0:	0034                	addi	a3,sp,8
ffffffffc02055d2:	85ce                	mv	a1,s3
ffffffffc02055d4:	8556                	mv	a0,s5
ffffffffc02055d6:	e20ff0ef          	jal	ra,ffffffffc0204bf6 <file_read>
ffffffffc02055da:	66a2                	ld	a3,8(sp)
ffffffffc02055dc:	842a                	mv	s0,a0
ffffffffc02055de:	ca9d                	beqz	a3,ffffffffc0205614 <sysfile_read+0xb6>
ffffffffc02055e0:	00090c63          	beqz	s2,ffffffffc02055f8 <sysfile_read+0x9a>
ffffffffc02055e4:	8562                	mv	a0,s8
ffffffffc02055e6:	f7ffe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02055ea:	000cb783          	ld	a5,0(s9)
ffffffffc02055ee:	cfa1                	beqz	a5,ffffffffc0205646 <sysfile_read+0xe8>
ffffffffc02055f0:	43dc                	lw	a5,4(a5)
ffffffffc02055f2:	66a2                	ld	a3,8(sp)
ffffffffc02055f4:	04f92823          	sw	a5,80(s2)
ffffffffc02055f8:	864e                	mv	a2,s3
ffffffffc02055fa:	85da                	mv	a1,s6
ffffffffc02055fc:	854a                	mv	a0,s2
ffffffffc02055fe:	d5dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205602:	c50d                	beqz	a0,ffffffffc020562c <sysfile_read+0xce>
ffffffffc0205604:	67a2                	ld	a5,8(sp)
ffffffffc0205606:	04f4e663          	bltu	s1,a5,ffffffffc0205652 <sysfile_read+0xf4>
ffffffffc020560a:	9b3e                	add	s6,s6,a5
ffffffffc020560c:	8c9d                	sub	s1,s1,a5
ffffffffc020560e:	9bbe                	add	s7,s7,a5
ffffffffc0205610:	02091263          	bnez	s2,ffffffffc0205634 <sysfile_read+0xd6>
ffffffffc0205614:	e401                	bnez	s0,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc0205616:	67a2                	ld	a5,8(sp)
ffffffffc0205618:	c391                	beqz	a5,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc020561a:	f4dd                	bnez	s1,ffffffffc02055c8 <sysfile_read+0x6a>
ffffffffc020561c:	854e                	mv	a0,s3
ffffffffc020561e:	a21fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205622:	f40b8ce3          	beqz	s7,ffffffffc020557a <sysfile_read+0x1c>
ffffffffc0205626:	000b841b          	sext.w	s0,s7
ffffffffc020562a:	bf81                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc020562c:	e011                	bnez	s0,ffffffffc0205630 <sysfile_read+0xd2>
ffffffffc020562e:	5475                	li	s0,-3
ffffffffc0205630:	fe0906e3          	beqz	s2,ffffffffc020561c <sysfile_read+0xbe>
ffffffffc0205634:	8562                	mv	a0,s8
ffffffffc0205636:	f2bfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020563a:	04092823          	sw	zero,80(s2)
ffffffffc020563e:	bfd9                	j	ffffffffc0205614 <sysfile_read+0xb6>
ffffffffc0205640:	e426                	sd	s1,8(sp)
ffffffffc0205642:	8626                	mv	a2,s1
ffffffffc0205644:	b771                	j	ffffffffc02055d0 <sysfile_read+0x72>
ffffffffc0205646:	66a2                	ld	a3,8(sp)
ffffffffc0205648:	bf45                	j	ffffffffc02055f8 <sysfile_read+0x9a>
ffffffffc020564a:	5475                	li	s0,-3
ffffffffc020564c:	b73d                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc020564e:	5471                	li	s0,-4
ffffffffc0205650:	b72d                	j	ffffffffc020557a <sysfile_read+0x1c>
ffffffffc0205652:	00008697          	auipc	a3,0x8
ffffffffc0205656:	e0668693          	addi	a3,a3,-506 # ffffffffc020d458 <CSWTCH.79+0xc8>
ffffffffc020565a:	00006617          	auipc	a2,0x6
ffffffffc020565e:	32660613          	addi	a2,a2,806 # ffffffffc020b980 <commands+0x210>
ffffffffc0205662:	05500593          	li	a1,85
ffffffffc0205666:	00008517          	auipc	a0,0x8
ffffffffc020566a:	e0250513          	addi	a0,a0,-510 # ffffffffc020d468 <CSWTCH.79+0xd8>
ffffffffc020566e:	e31fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205672 <sysfile_write>:
ffffffffc0205672:	7159                	addi	sp,sp,-112
ffffffffc0205674:	e8ca                	sd	s2,80(sp)
ffffffffc0205676:	f486                	sd	ra,104(sp)
ffffffffc0205678:	f0a2                	sd	s0,96(sp)
ffffffffc020567a:	eca6                	sd	s1,88(sp)
ffffffffc020567c:	e4ce                	sd	s3,72(sp)
ffffffffc020567e:	e0d2                	sd	s4,64(sp)
ffffffffc0205680:	fc56                	sd	s5,56(sp)
ffffffffc0205682:	f85a                	sd	s6,48(sp)
ffffffffc0205684:	f45e                	sd	s7,40(sp)
ffffffffc0205686:	f062                	sd	s8,32(sp)
ffffffffc0205688:	ec66                	sd	s9,24(sp)
ffffffffc020568a:	4901                	li	s2,0
ffffffffc020568c:	ee19                	bnez	a2,ffffffffc02056aa <sysfile_write+0x38>
ffffffffc020568e:	70a6                	ld	ra,104(sp)
ffffffffc0205690:	7406                	ld	s0,96(sp)
ffffffffc0205692:	64e6                	ld	s1,88(sp)
ffffffffc0205694:	69a6                	ld	s3,72(sp)
ffffffffc0205696:	6a06                	ld	s4,64(sp)
ffffffffc0205698:	7ae2                	ld	s5,56(sp)
ffffffffc020569a:	7b42                	ld	s6,48(sp)
ffffffffc020569c:	7ba2                	ld	s7,40(sp)
ffffffffc020569e:	7c02                	ld	s8,32(sp)
ffffffffc02056a0:	6ce2                	ld	s9,24(sp)
ffffffffc02056a2:	854a                	mv	a0,s2
ffffffffc02056a4:	6946                	ld	s2,80(sp)
ffffffffc02056a6:	6165                	addi	sp,sp,112
ffffffffc02056a8:	8082                	ret
ffffffffc02056aa:	00091c17          	auipc	s8,0x91
ffffffffc02056ae:	216c0c13          	addi	s8,s8,534 # ffffffffc02968c0 <current>
ffffffffc02056b2:	000c3783          	ld	a5,0(s8)
ffffffffc02056b6:	8432                	mv	s0,a2
ffffffffc02056b8:	89ae                	mv	s3,a1
ffffffffc02056ba:	4605                	li	a2,1
ffffffffc02056bc:	4581                	li	a1,0
ffffffffc02056be:	7784                	ld	s1,40(a5)
ffffffffc02056c0:	8baa                	mv	s7,a0
ffffffffc02056c2:	b8cff0ef          	jal	ra,ffffffffc0204a4e <file_testfd>
ffffffffc02056c6:	cd59                	beqz	a0,ffffffffc0205764 <sysfile_write+0xf2>
ffffffffc02056c8:	6505                	lui	a0,0x1
ffffffffc02056ca:	8c5fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02056ce:	8a2a                	mv	s4,a0
ffffffffc02056d0:	cd41                	beqz	a0,ffffffffc0205768 <sysfile_write+0xf6>
ffffffffc02056d2:	4c81                	li	s9,0
ffffffffc02056d4:	6a85                	lui	s5,0x1
ffffffffc02056d6:	03848b13          	addi	s6,s1,56
ffffffffc02056da:	05546a63          	bltu	s0,s5,ffffffffc020572e <sysfile_write+0xbc>
ffffffffc02056de:	e456                	sd	s5,8(sp)
ffffffffc02056e0:	c8a9                	beqz	s1,ffffffffc0205732 <sysfile_write+0xc0>
ffffffffc02056e2:	855a                	mv	a0,s6
ffffffffc02056e4:	e81fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02056e8:	000c3783          	ld	a5,0(s8)
ffffffffc02056ec:	c399                	beqz	a5,ffffffffc02056f2 <sysfile_write+0x80>
ffffffffc02056ee:	43dc                	lw	a5,4(a5)
ffffffffc02056f0:	c8bc                	sw	a5,80(s1)
ffffffffc02056f2:	66a2                	ld	a3,8(sp)
ffffffffc02056f4:	4701                	li	a4,0
ffffffffc02056f6:	864e                	mv	a2,s3
ffffffffc02056f8:	85d2                	mv	a1,s4
ffffffffc02056fa:	8526                	mv	a0,s1
ffffffffc02056fc:	c2bfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205700:	c139                	beqz	a0,ffffffffc0205746 <sysfile_write+0xd4>
ffffffffc0205702:	855a                	mv	a0,s6
ffffffffc0205704:	e5dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205708:	0404a823          	sw	zero,80(s1)
ffffffffc020570c:	6622                	ld	a2,8(sp)
ffffffffc020570e:	0034                	addi	a3,sp,8
ffffffffc0205710:	85d2                	mv	a1,s4
ffffffffc0205712:	855e                	mv	a0,s7
ffffffffc0205714:	dc8ff0ef          	jal	ra,ffffffffc0204cdc <file_write>
ffffffffc0205718:	67a2                	ld	a5,8(sp)
ffffffffc020571a:	892a                	mv	s2,a0
ffffffffc020571c:	ef85                	bnez	a5,ffffffffc0205754 <sysfile_write+0xe2>
ffffffffc020571e:	8552                	mv	a0,s4
ffffffffc0205720:	91ffc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205724:	f60c85e3          	beqz	s9,ffffffffc020568e <sysfile_write+0x1c>
ffffffffc0205728:	000c891b          	sext.w	s2,s9
ffffffffc020572c:	b78d                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc020572e:	e422                	sd	s0,8(sp)
ffffffffc0205730:	f8cd                	bnez	s1,ffffffffc02056e2 <sysfile_write+0x70>
ffffffffc0205732:	66a2                	ld	a3,8(sp)
ffffffffc0205734:	4701                	li	a4,0
ffffffffc0205736:	864e                	mv	a2,s3
ffffffffc0205738:	85d2                	mv	a1,s4
ffffffffc020573a:	4501                	li	a0,0
ffffffffc020573c:	bebfe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc0205740:	f571                	bnez	a0,ffffffffc020570c <sysfile_write+0x9a>
ffffffffc0205742:	5975                	li	s2,-3
ffffffffc0205744:	bfe9                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205746:	855a                	mv	a0,s6
ffffffffc0205748:	e19fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020574c:	5975                	li	s2,-3
ffffffffc020574e:	0404a823          	sw	zero,80(s1)
ffffffffc0205752:	b7f1                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205754:	00f46c63          	bltu	s0,a5,ffffffffc020576c <sysfile_write+0xfa>
ffffffffc0205758:	99be                	add	s3,s3,a5
ffffffffc020575a:	8c1d                	sub	s0,s0,a5
ffffffffc020575c:	9cbe                	add	s9,s9,a5
ffffffffc020575e:	f161                	bnez	a0,ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205760:	fc2d                	bnez	s0,ffffffffc02056da <sysfile_write+0x68>
ffffffffc0205762:	bf75                	j	ffffffffc020571e <sysfile_write+0xac>
ffffffffc0205764:	5975                	li	s2,-3
ffffffffc0205766:	b725                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc0205768:	5971                	li	s2,-4
ffffffffc020576a:	b715                	j	ffffffffc020568e <sysfile_write+0x1c>
ffffffffc020576c:	00008697          	auipc	a3,0x8
ffffffffc0205770:	cec68693          	addi	a3,a3,-788 # ffffffffc020d458 <CSWTCH.79+0xc8>
ffffffffc0205774:	00006617          	auipc	a2,0x6
ffffffffc0205778:	20c60613          	addi	a2,a2,524 # ffffffffc020b980 <commands+0x210>
ffffffffc020577c:	08a00593          	li	a1,138
ffffffffc0205780:	00008517          	auipc	a0,0x8
ffffffffc0205784:	ce850513          	addi	a0,a0,-792 # ffffffffc020d468 <CSWTCH.79+0xd8>
ffffffffc0205788:	d17fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020578c <sysfile_seek>:
ffffffffc020578c:	e36ff06f          	j	ffffffffc0204dc2 <file_seek>

ffffffffc0205790 <sysfile_fstat>:
ffffffffc0205790:	715d                	addi	sp,sp,-80
ffffffffc0205792:	f44e                	sd	s3,40(sp)
ffffffffc0205794:	00091997          	auipc	s3,0x91
ffffffffc0205798:	12c98993          	addi	s3,s3,300 # ffffffffc02968c0 <current>
ffffffffc020579c:	0009b703          	ld	a4,0(s3)
ffffffffc02057a0:	fc26                	sd	s1,56(sp)
ffffffffc02057a2:	84ae                	mv	s1,a1
ffffffffc02057a4:	858a                	mv	a1,sp
ffffffffc02057a6:	e0a2                	sd	s0,64(sp)
ffffffffc02057a8:	f84a                	sd	s2,48(sp)
ffffffffc02057aa:	e486                	sd	ra,72(sp)
ffffffffc02057ac:	02873903          	ld	s2,40(a4)
ffffffffc02057b0:	f052                	sd	s4,32(sp)
ffffffffc02057b2:	f30ff0ef          	jal	ra,ffffffffc0204ee2 <file_fstat>
ffffffffc02057b6:	842a                	mv	s0,a0
ffffffffc02057b8:	e91d                	bnez	a0,ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc02057ba:	04090363          	beqz	s2,ffffffffc0205800 <sysfile_fstat+0x70>
ffffffffc02057be:	03890a13          	addi	s4,s2,56
ffffffffc02057c2:	8552                	mv	a0,s4
ffffffffc02057c4:	da1fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02057c8:	0009b783          	ld	a5,0(s3)
ffffffffc02057cc:	c3b9                	beqz	a5,ffffffffc0205812 <sysfile_fstat+0x82>
ffffffffc02057ce:	43dc                	lw	a5,4(a5)
ffffffffc02057d0:	02000693          	li	a3,32
ffffffffc02057d4:	860a                	mv	a2,sp
ffffffffc02057d6:	04f92823          	sw	a5,80(s2)
ffffffffc02057da:	85a6                	mv	a1,s1
ffffffffc02057dc:	854a                	mv	a0,s2
ffffffffc02057de:	b7dfe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02057e2:	c121                	beqz	a0,ffffffffc0205822 <sysfile_fstat+0x92>
ffffffffc02057e4:	8552                	mv	a0,s4
ffffffffc02057e6:	d7bfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02057ea:	04092823          	sw	zero,80(s2)
ffffffffc02057ee:	60a6                	ld	ra,72(sp)
ffffffffc02057f0:	8522                	mv	a0,s0
ffffffffc02057f2:	6406                	ld	s0,64(sp)
ffffffffc02057f4:	74e2                	ld	s1,56(sp)
ffffffffc02057f6:	7942                	ld	s2,48(sp)
ffffffffc02057f8:	79a2                	ld	s3,40(sp)
ffffffffc02057fa:	7a02                	ld	s4,32(sp)
ffffffffc02057fc:	6161                	addi	sp,sp,80
ffffffffc02057fe:	8082                	ret
ffffffffc0205800:	02000693          	li	a3,32
ffffffffc0205804:	860a                	mv	a2,sp
ffffffffc0205806:	85a6                	mv	a1,s1
ffffffffc0205808:	b53fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc020580c:	f16d                	bnez	a0,ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc020580e:	5475                	li	s0,-3
ffffffffc0205810:	bff9                	j	ffffffffc02057ee <sysfile_fstat+0x5e>
ffffffffc0205812:	02000693          	li	a3,32
ffffffffc0205816:	860a                	mv	a2,sp
ffffffffc0205818:	85a6                	mv	a1,s1
ffffffffc020581a:	854a                	mv	a0,s2
ffffffffc020581c:	b3ffe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205820:	f171                	bnez	a0,ffffffffc02057e4 <sysfile_fstat+0x54>
ffffffffc0205822:	8552                	mv	a0,s4
ffffffffc0205824:	d3dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205828:	5475                	li	s0,-3
ffffffffc020582a:	04092823          	sw	zero,80(s2)
ffffffffc020582e:	b7c1                	j	ffffffffc02057ee <sysfile_fstat+0x5e>

ffffffffc0205830 <sysfile_fsync>:
ffffffffc0205830:	f72ff06f          	j	ffffffffc0204fa2 <file_fsync>

ffffffffc0205834 <sysfile_getcwd>:
ffffffffc0205834:	715d                	addi	sp,sp,-80
ffffffffc0205836:	f44e                	sd	s3,40(sp)
ffffffffc0205838:	00091997          	auipc	s3,0x91
ffffffffc020583c:	08898993          	addi	s3,s3,136 # ffffffffc02968c0 <current>
ffffffffc0205840:	0009b783          	ld	a5,0(s3)
ffffffffc0205844:	f84a                	sd	s2,48(sp)
ffffffffc0205846:	e486                	sd	ra,72(sp)
ffffffffc0205848:	e0a2                	sd	s0,64(sp)
ffffffffc020584a:	fc26                	sd	s1,56(sp)
ffffffffc020584c:	f052                	sd	s4,32(sp)
ffffffffc020584e:	0287b903          	ld	s2,40(a5)
ffffffffc0205852:	cda9                	beqz	a1,ffffffffc02058ac <sysfile_getcwd+0x78>
ffffffffc0205854:	842e                	mv	s0,a1
ffffffffc0205856:	84aa                	mv	s1,a0
ffffffffc0205858:	04090363          	beqz	s2,ffffffffc020589e <sysfile_getcwd+0x6a>
ffffffffc020585c:	03890a13          	addi	s4,s2,56
ffffffffc0205860:	8552                	mv	a0,s4
ffffffffc0205862:	d03fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205866:	0009b783          	ld	a5,0(s3)
ffffffffc020586a:	c781                	beqz	a5,ffffffffc0205872 <sysfile_getcwd+0x3e>
ffffffffc020586c:	43dc                	lw	a5,4(a5)
ffffffffc020586e:	04f92823          	sw	a5,80(s2)
ffffffffc0205872:	4685                	li	a3,1
ffffffffc0205874:	8622                	mv	a2,s0
ffffffffc0205876:	85a6                	mv	a1,s1
ffffffffc0205878:	854a                	mv	a0,s2
ffffffffc020587a:	a19fe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc020587e:	e90d                	bnez	a0,ffffffffc02058b0 <sysfile_getcwd+0x7c>
ffffffffc0205880:	5475                	li	s0,-3
ffffffffc0205882:	8552                	mv	a0,s4
ffffffffc0205884:	cddfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205888:	04092823          	sw	zero,80(s2)
ffffffffc020588c:	60a6                	ld	ra,72(sp)
ffffffffc020588e:	8522                	mv	a0,s0
ffffffffc0205890:	6406                	ld	s0,64(sp)
ffffffffc0205892:	74e2                	ld	s1,56(sp)
ffffffffc0205894:	7942                	ld	s2,48(sp)
ffffffffc0205896:	79a2                	ld	s3,40(sp)
ffffffffc0205898:	7a02                	ld	s4,32(sp)
ffffffffc020589a:	6161                	addi	sp,sp,80
ffffffffc020589c:	8082                	ret
ffffffffc020589e:	862e                	mv	a2,a1
ffffffffc02058a0:	4685                	li	a3,1
ffffffffc02058a2:	85aa                	mv	a1,a0
ffffffffc02058a4:	4501                	li	a0,0
ffffffffc02058a6:	9edfe0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc02058aa:	ed09                	bnez	a0,ffffffffc02058c4 <sysfile_getcwd+0x90>
ffffffffc02058ac:	5475                	li	s0,-3
ffffffffc02058ae:	bff9                	j	ffffffffc020588c <sysfile_getcwd+0x58>
ffffffffc02058b0:	8622                	mv	a2,s0
ffffffffc02058b2:	4681                	li	a3,0
ffffffffc02058b4:	85a6                	mv	a1,s1
ffffffffc02058b6:	850a                	mv	a0,sp
ffffffffc02058b8:	b2bff0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02058bc:	349020ef          	jal	ra,ffffffffc0208404 <vfs_getcwd>
ffffffffc02058c0:	842a                	mv	s0,a0
ffffffffc02058c2:	b7c1                	j	ffffffffc0205882 <sysfile_getcwd+0x4e>
ffffffffc02058c4:	8622                	mv	a2,s0
ffffffffc02058c6:	4681                	li	a3,0
ffffffffc02058c8:	85a6                	mv	a1,s1
ffffffffc02058ca:	850a                	mv	a0,sp
ffffffffc02058cc:	b17ff0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc02058d0:	335020ef          	jal	ra,ffffffffc0208404 <vfs_getcwd>
ffffffffc02058d4:	842a                	mv	s0,a0
ffffffffc02058d6:	bf5d                	j	ffffffffc020588c <sysfile_getcwd+0x58>

ffffffffc02058d8 <sysfile_getdirentry>:
ffffffffc02058d8:	7139                	addi	sp,sp,-64
ffffffffc02058da:	e852                	sd	s4,16(sp)
ffffffffc02058dc:	00091a17          	auipc	s4,0x91
ffffffffc02058e0:	fe4a0a13          	addi	s4,s4,-28 # ffffffffc02968c0 <current>
ffffffffc02058e4:	000a3703          	ld	a4,0(s4)
ffffffffc02058e8:	ec4e                	sd	s3,24(sp)
ffffffffc02058ea:	89aa                	mv	s3,a0
ffffffffc02058ec:	10800513          	li	a0,264
ffffffffc02058f0:	f426                	sd	s1,40(sp)
ffffffffc02058f2:	f04a                	sd	s2,32(sp)
ffffffffc02058f4:	fc06                	sd	ra,56(sp)
ffffffffc02058f6:	f822                	sd	s0,48(sp)
ffffffffc02058f8:	e456                	sd	s5,8(sp)
ffffffffc02058fa:	7704                	ld	s1,40(a4)
ffffffffc02058fc:	892e                	mv	s2,a1
ffffffffc02058fe:	e90fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0205902:	c169                	beqz	a0,ffffffffc02059c4 <sysfile_getdirentry+0xec>
ffffffffc0205904:	842a                	mv	s0,a0
ffffffffc0205906:	c8c1                	beqz	s1,ffffffffc0205996 <sysfile_getdirentry+0xbe>
ffffffffc0205908:	03848a93          	addi	s5,s1,56
ffffffffc020590c:	8556                	mv	a0,s5
ffffffffc020590e:	c57fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205912:	000a3783          	ld	a5,0(s4)
ffffffffc0205916:	c399                	beqz	a5,ffffffffc020591c <sysfile_getdirentry+0x44>
ffffffffc0205918:	43dc                	lw	a5,4(a5)
ffffffffc020591a:	c8bc                	sw	a5,80(s1)
ffffffffc020591c:	4705                	li	a4,1
ffffffffc020591e:	46a1                	li	a3,8
ffffffffc0205920:	864a                	mv	a2,s2
ffffffffc0205922:	85a2                	mv	a1,s0
ffffffffc0205924:	8526                	mv	a0,s1
ffffffffc0205926:	a01fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc020592a:	e505                	bnez	a0,ffffffffc0205952 <sysfile_getdirentry+0x7a>
ffffffffc020592c:	8556                	mv	a0,s5
ffffffffc020592e:	c33fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205932:	59f5                	li	s3,-3
ffffffffc0205934:	0404a823          	sw	zero,80(s1)
ffffffffc0205938:	8522                	mv	a0,s0
ffffffffc020593a:	f04fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020593e:	70e2                	ld	ra,56(sp)
ffffffffc0205940:	7442                	ld	s0,48(sp)
ffffffffc0205942:	74a2                	ld	s1,40(sp)
ffffffffc0205944:	7902                	ld	s2,32(sp)
ffffffffc0205946:	6a42                	ld	s4,16(sp)
ffffffffc0205948:	6aa2                	ld	s5,8(sp)
ffffffffc020594a:	854e                	mv	a0,s3
ffffffffc020594c:	69e2                	ld	s3,24(sp)
ffffffffc020594e:	6121                	addi	sp,sp,64
ffffffffc0205950:	8082                	ret
ffffffffc0205952:	8556                	mv	a0,s5
ffffffffc0205954:	c0dfe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205958:	854e                	mv	a0,s3
ffffffffc020595a:	85a2                	mv	a1,s0
ffffffffc020595c:	0404a823          	sw	zero,80(s1)
ffffffffc0205960:	ef0ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc0205964:	89aa                	mv	s3,a0
ffffffffc0205966:	f969                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc0205968:	8556                	mv	a0,s5
ffffffffc020596a:	bfbfe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020596e:	000a3783          	ld	a5,0(s4)
ffffffffc0205972:	c399                	beqz	a5,ffffffffc0205978 <sysfile_getdirentry+0xa0>
ffffffffc0205974:	43dc                	lw	a5,4(a5)
ffffffffc0205976:	c8bc                	sw	a5,80(s1)
ffffffffc0205978:	10800693          	li	a3,264
ffffffffc020597c:	8622                	mv	a2,s0
ffffffffc020597e:	85ca                	mv	a1,s2
ffffffffc0205980:	8526                	mv	a0,s1
ffffffffc0205982:	9d9fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc0205986:	e111                	bnez	a0,ffffffffc020598a <sysfile_getdirentry+0xb2>
ffffffffc0205988:	59f5                	li	s3,-3
ffffffffc020598a:	8556                	mv	a0,s5
ffffffffc020598c:	bd5fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205990:	0404a823          	sw	zero,80(s1)
ffffffffc0205994:	b755                	j	ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc0205996:	85aa                	mv	a1,a0
ffffffffc0205998:	4705                	li	a4,1
ffffffffc020599a:	46a1                	li	a3,8
ffffffffc020599c:	864a                	mv	a2,s2
ffffffffc020599e:	4501                	li	a0,0
ffffffffc02059a0:	987fe0ef          	jal	ra,ffffffffc0204326 <copy_from_user>
ffffffffc02059a4:	cd11                	beqz	a0,ffffffffc02059c0 <sysfile_getdirentry+0xe8>
ffffffffc02059a6:	854e                	mv	a0,s3
ffffffffc02059a8:	85a2                	mv	a1,s0
ffffffffc02059aa:	ea6ff0ef          	jal	ra,ffffffffc0205050 <file_getdirentry>
ffffffffc02059ae:	89aa                	mv	s3,a0
ffffffffc02059b0:	f541                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059b2:	10800693          	li	a3,264
ffffffffc02059b6:	8622                	mv	a2,s0
ffffffffc02059b8:	85ca                	mv	a1,s2
ffffffffc02059ba:	9a1fe0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02059be:	fd2d                	bnez	a0,ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059c0:	59f5                	li	s3,-3
ffffffffc02059c2:	bf9d                	j	ffffffffc0205938 <sysfile_getdirentry+0x60>
ffffffffc02059c4:	59f1                	li	s3,-4
ffffffffc02059c6:	bfa5                	j	ffffffffc020593e <sysfile_getdirentry+0x66>

ffffffffc02059c8 <sysfile_dup>:
ffffffffc02059c8:	f6eff06f          	j	ffffffffc0205136 <file_dup>

ffffffffc02059cc <kernel_thread_entry>:
ffffffffc02059cc:	8526                	mv	a0,s1
ffffffffc02059ce:	9402                	jalr	s0
ffffffffc02059d0:	626000ef          	jal	ra,ffffffffc0205ff6 <do_exit>

ffffffffc02059d4 <alloc_proc>:
ffffffffc02059d4:	1141                	addi	sp,sp,-16
ffffffffc02059d6:	15000513          	li	a0,336
ffffffffc02059da:	e022                	sd	s0,0(sp)
ffffffffc02059dc:	e406                	sd	ra,8(sp)
ffffffffc02059de:	db0fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02059e2:	842a                	mv	s0,a0
ffffffffc02059e4:	c141                	beqz	a0,ffffffffc0205a64 <alloc_proc+0x90>
ffffffffc02059e6:	57fd                	li	a5,-1
ffffffffc02059e8:	1782                	slli	a5,a5,0x20
ffffffffc02059ea:	e11c                	sd	a5,0(a0)
ffffffffc02059ec:	07000613          	li	a2,112
ffffffffc02059f0:	4581                	li	a1,0
ffffffffc02059f2:	14053423          	sd	zero,328(a0)
ffffffffc02059f6:	00052423          	sw	zero,8(a0)
ffffffffc02059fa:	00053823          	sd	zero,16(a0)
ffffffffc02059fe:	00053c23          	sd	zero,24(a0)
ffffffffc0205a02:	02053023          	sd	zero,32(a0)
ffffffffc0205a06:	02053423          	sd	zero,40(a0)
ffffffffc0205a0a:	03050513          	addi	a0,a0,48
ffffffffc0205a0e:	28d050ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0205a12:	00091797          	auipc	a5,0x91
ffffffffc0205a16:	e7e7b783          	ld	a5,-386(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205a1a:	f45c                	sd	a5,168(s0)
ffffffffc0205a1c:	0a043023          	sd	zero,160(s0)
ffffffffc0205a20:	0a042823          	sw	zero,176(s0)
ffffffffc0205a24:	463d                	li	a2,15
ffffffffc0205a26:	4581                	li	a1,0
ffffffffc0205a28:	0b440513          	addi	a0,s0,180
ffffffffc0205a2c:	26f050ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0205a30:	11040793          	addi	a5,s0,272
ffffffffc0205a34:	0e042623          	sw	zero,236(s0)
ffffffffc0205a38:	0e043c23          	sd	zero,248(s0)
ffffffffc0205a3c:	10043023          	sd	zero,256(s0)
ffffffffc0205a40:	0e043823          	sd	zero,240(s0)
ffffffffc0205a44:	10043423          	sd	zero,264(s0)
ffffffffc0205a48:	10f43c23          	sd	a5,280(s0)
ffffffffc0205a4c:	10f43823          	sd	a5,272(s0)
ffffffffc0205a50:	12042023          	sw	zero,288(s0)
ffffffffc0205a54:	12043423          	sd	zero,296(s0)
ffffffffc0205a58:	12043823          	sd	zero,304(s0)
ffffffffc0205a5c:	12043c23          	sd	zero,312(s0)
ffffffffc0205a60:	14043023          	sd	zero,320(s0)
ffffffffc0205a64:	60a2                	ld	ra,8(sp)
ffffffffc0205a66:	8522                	mv	a0,s0
ffffffffc0205a68:	6402                	ld	s0,0(sp)
ffffffffc0205a6a:	0141                	addi	sp,sp,16
ffffffffc0205a6c:	8082                	ret

ffffffffc0205a6e <forkret>:
ffffffffc0205a6e:	00091797          	auipc	a5,0x91
ffffffffc0205a72:	e527b783          	ld	a5,-430(a5) # ffffffffc02968c0 <current>
ffffffffc0205a76:	73c8                	ld	a0,160(a5)
ffffffffc0205a78:	833fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc0205a7c <put_pgdir.isra.0>:
ffffffffc0205a7c:	1141                	addi	sp,sp,-16
ffffffffc0205a7e:	e406                	sd	ra,8(sp)
ffffffffc0205a80:	c02007b7          	lui	a5,0xc0200
ffffffffc0205a84:	02f56e63          	bltu	a0,a5,ffffffffc0205ac0 <put_pgdir.isra.0+0x44>
ffffffffc0205a88:	00091697          	auipc	a3,0x91
ffffffffc0205a8c:	e306b683          	ld	a3,-464(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205a90:	8d15                	sub	a0,a0,a3
ffffffffc0205a92:	8131                	srli	a0,a0,0xc
ffffffffc0205a94:	00091797          	auipc	a5,0x91
ffffffffc0205a98:	e0c7b783          	ld	a5,-500(a5) # ffffffffc02968a0 <npage>
ffffffffc0205a9c:	02f57f63          	bgeu	a0,a5,ffffffffc0205ada <put_pgdir.isra.0+0x5e>
ffffffffc0205aa0:	0000a697          	auipc	a3,0xa
ffffffffc0205aa4:	d106b683          	ld	a3,-752(a3) # ffffffffc020f7b0 <nbase>
ffffffffc0205aa8:	60a2                	ld	ra,8(sp)
ffffffffc0205aaa:	8d15                	sub	a0,a0,a3
ffffffffc0205aac:	00091797          	auipc	a5,0x91
ffffffffc0205ab0:	dfc7b783          	ld	a5,-516(a5) # ffffffffc02968a8 <pages>
ffffffffc0205ab4:	051a                	slli	a0,a0,0x6
ffffffffc0205ab6:	4585                	li	a1,1
ffffffffc0205ab8:	953e                	add	a0,a0,a5
ffffffffc0205aba:	0141                	addi	sp,sp,16
ffffffffc0205abc:	eeefc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205ac0:	86aa                	mv	a3,a0
ffffffffc0205ac2:	00007617          	auipc	a2,0x7
ffffffffc0205ac6:	a8660613          	addi	a2,a2,-1402 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0205aca:	07700593          	li	a1,119
ffffffffc0205ace:	00007517          	auipc	a0,0x7
ffffffffc0205ad2:	9fa50513          	addi	a0,a0,-1542 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0205ad6:	9c9fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ada:	00007617          	auipc	a2,0x7
ffffffffc0205ade:	a9660613          	addi	a2,a2,-1386 # ffffffffc020c570 <default_pmm_manager+0x108>
ffffffffc0205ae2:	06900593          	li	a1,105
ffffffffc0205ae6:	00007517          	auipc	a0,0x7
ffffffffc0205aea:	9e250513          	addi	a0,a0,-1566 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0205aee:	9b1fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205af2 <proc_run>:
ffffffffc0205af2:	7179                	addi	sp,sp,-48
ffffffffc0205af4:	ec4a                	sd	s2,24(sp)
ffffffffc0205af6:	00091917          	auipc	s2,0x91
ffffffffc0205afa:	dca90913          	addi	s2,s2,-566 # ffffffffc02968c0 <current>
ffffffffc0205afe:	f026                	sd	s1,32(sp)
ffffffffc0205b00:	00093483          	ld	s1,0(s2)
ffffffffc0205b04:	f406                	sd	ra,40(sp)
ffffffffc0205b06:	e84e                	sd	s3,16(sp)
ffffffffc0205b08:	02a48a63          	beq	s1,a0,ffffffffc0205b3c <proc_run+0x4a>
ffffffffc0205b0c:	100027f3          	csrr	a5,sstatus
ffffffffc0205b10:	8b89                	andi	a5,a5,2
ffffffffc0205b12:	4981                	li	s3,0
ffffffffc0205b14:	e3a9                	bnez	a5,ffffffffc0205b56 <proc_run+0x64>
ffffffffc0205b16:	755c                	ld	a5,168(a0)
ffffffffc0205b18:	577d                	li	a4,-1
ffffffffc0205b1a:	177e                	slli	a4,a4,0x3f
ffffffffc0205b1c:	83b1                	srli	a5,a5,0xc
ffffffffc0205b1e:	00a93023          	sd	a0,0(s2)
ffffffffc0205b22:	8fd9                	or	a5,a5,a4
ffffffffc0205b24:	18079073          	csrw	satp,a5
ffffffffc0205b28:	12000073          	sfence.vma
ffffffffc0205b2c:	03050593          	addi	a1,a0,48
ffffffffc0205b30:	03048513          	addi	a0,s1,48
ffffffffc0205b34:	59a010ef          	jal	ra,ffffffffc02070ce <switch_to>
ffffffffc0205b38:	00099863          	bnez	s3,ffffffffc0205b48 <proc_run+0x56>
ffffffffc0205b3c:	70a2                	ld	ra,40(sp)
ffffffffc0205b3e:	7482                	ld	s1,32(sp)
ffffffffc0205b40:	6962                	ld	s2,24(sp)
ffffffffc0205b42:	69c2                	ld	s3,16(sp)
ffffffffc0205b44:	6145                	addi	sp,sp,48
ffffffffc0205b46:	8082                	ret
ffffffffc0205b48:	70a2                	ld	ra,40(sp)
ffffffffc0205b4a:	7482                	ld	s1,32(sp)
ffffffffc0205b4c:	6962                	ld	s2,24(sp)
ffffffffc0205b4e:	69c2                	ld	s3,16(sp)
ffffffffc0205b50:	6145                	addi	sp,sp,48
ffffffffc0205b52:	91afb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205b56:	e42a                	sd	a0,8(sp)
ffffffffc0205b58:	91afb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205b5c:	6522                	ld	a0,8(sp)
ffffffffc0205b5e:	4985                	li	s3,1
ffffffffc0205b60:	bf5d                	j	ffffffffc0205b16 <proc_run+0x24>

ffffffffc0205b62 <do_fork>:
ffffffffc0205b62:	7119                	addi	sp,sp,-128
ffffffffc0205b64:	f0ca                	sd	s2,96(sp)
ffffffffc0205b66:	00091917          	auipc	s2,0x91
ffffffffc0205b6a:	d7290913          	addi	s2,s2,-654 # ffffffffc02968d8 <nr_process>
ffffffffc0205b6e:	00092783          	lw	a5,0(s2)
ffffffffc0205b72:	ecce                	sd	s3,88(sp)
ffffffffc0205b74:	fc86                	sd	ra,120(sp)
ffffffffc0205b76:	f8a2                	sd	s0,112(sp)
ffffffffc0205b78:	f4a6                	sd	s1,104(sp)
ffffffffc0205b7a:	e8d2                	sd	s4,80(sp)
ffffffffc0205b7c:	e4d6                	sd	s5,72(sp)
ffffffffc0205b7e:	e0da                	sd	s6,64(sp)
ffffffffc0205b80:	fc5e                	sd	s7,56(sp)
ffffffffc0205b82:	f862                	sd	s8,48(sp)
ffffffffc0205b84:	f466                	sd	s9,40(sp)
ffffffffc0205b86:	f06a                	sd	s10,32(sp)
ffffffffc0205b88:	ec6e                	sd	s11,24(sp)
ffffffffc0205b8a:	6985                	lui	s3,0x1
ffffffffc0205b8c:	e432                	sd	a2,8(sp)
ffffffffc0205b8e:	3737d763          	bge	a5,s3,ffffffffc0205efc <do_fork+0x39a>
ffffffffc0205b92:	8a2a                	mv	s4,a0
ffffffffc0205b94:	8aae                	mv	s5,a1
ffffffffc0205b96:	e3fff0ef          	jal	ra,ffffffffc02059d4 <alloc_proc>
ffffffffc0205b9a:	842a                	mv	s0,a0
ffffffffc0205b9c:	34050963          	beqz	a0,ffffffffc0205eee <do_fork+0x38c>
ffffffffc0205ba0:	00091b17          	auipc	s6,0x91
ffffffffc0205ba4:	d20b0b13          	addi	s6,s6,-736 # ffffffffc02968c0 <current>
ffffffffc0205ba8:	000b3783          	ld	a5,0(s6)
ffffffffc0205bac:	0ec7a703          	lw	a4,236(a5)
ffffffffc0205bb0:	f11c                	sd	a5,32(a0)
ffffffffc0205bb2:	3c071a63          	bnez	a4,ffffffffc0205f86 <do_fork+0x424>
ffffffffc0205bb6:	4509                	li	a0,2
ffffffffc0205bb8:	db4fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205bbc:	32050663          	beqz	a0,ffffffffc0205ee8 <do_fork+0x386>
ffffffffc0205bc0:	00091c17          	auipc	s8,0x91
ffffffffc0205bc4:	ce8c0c13          	addi	s8,s8,-792 # ffffffffc02968a8 <pages>
ffffffffc0205bc8:	000c3683          	ld	a3,0(s8)
ffffffffc0205bcc:	0000ab97          	auipc	s7,0xa
ffffffffc0205bd0:	be4bbb83          	ld	s7,-1052(s7) # ffffffffc020f7b0 <nbase>
ffffffffc0205bd4:	00091c97          	auipc	s9,0x91
ffffffffc0205bd8:	cccc8c93          	addi	s9,s9,-820 # ffffffffc02968a0 <npage>
ffffffffc0205bdc:	40d506b3          	sub	a3,a0,a3
ffffffffc0205be0:	8699                	srai	a3,a3,0x6
ffffffffc0205be2:	96de                	add	a3,a3,s7
ffffffffc0205be4:	000cb703          	ld	a4,0(s9)
ffffffffc0205be8:	00c69793          	slli	a5,a3,0xc
ffffffffc0205bec:	83b1                	srli	a5,a5,0xc
ffffffffc0205bee:	06b2                	slli	a3,a3,0xc
ffffffffc0205bf0:	30e7fb63          	bgeu	a5,a4,ffffffffc0205f06 <do_fork+0x3a4>
ffffffffc0205bf4:	000b3603          	ld	a2,0(s6)
ffffffffc0205bf8:	00091d17          	auipc	s10,0x91
ffffffffc0205bfc:	cc0d0d13          	addi	s10,s10,-832 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205c00:	000d3783          	ld	a5,0(s10)
ffffffffc0205c04:	14863d83          	ld	s11,328(a2)
ffffffffc0205c08:	96be                	add	a3,a3,a5
ffffffffc0205c0a:	e814                	sd	a3,16(s0)
ffffffffc0205c0c:	340d8d63          	beqz	s11,ffffffffc0205f66 <do_fork+0x404>
ffffffffc0205c10:	80098993          	addi	s3,s3,-2048 # 800 <_binary_bin_swap_img_size-0x7500>
ffffffffc0205c14:	013a79b3          	and	s3,s4,s3
ffffffffc0205c18:	1c098a63          	beqz	s3,ffffffffc0205dec <do_fork+0x28a>
ffffffffc0205c1c:	010da703          	lw	a4,16(s11)
ffffffffc0205c20:	7604                	ld	s1,40(a2)
ffffffffc0205c22:	2705                	addiw	a4,a4,1
ffffffffc0205c24:	00eda823          	sw	a4,16(s11)
ffffffffc0205c28:	15b43423          	sd	s11,328(s0)
ffffffffc0205c2c:	c095                	beqz	s1,ffffffffc0205c50 <do_fork+0xee>
ffffffffc0205c2e:	100a7a13          	andi	s4,s4,256
ffffffffc0205c32:	1c0a0963          	beqz	s4,ffffffffc0205e04 <do_fork+0x2a2>
ffffffffc0205c36:	5898                	lw	a4,48(s1)
ffffffffc0205c38:	6c94                	ld	a3,24(s1)
ffffffffc0205c3a:	c0200637          	lui	a2,0xc0200
ffffffffc0205c3e:	2705                	addiw	a4,a4,1
ffffffffc0205c40:	d898                	sw	a4,48(s1)
ffffffffc0205c42:	f404                	sd	s1,40(s0)
ffffffffc0205c44:	2ec6e963          	bltu	a3,a2,ffffffffc0205f36 <do_fork+0x3d4>
ffffffffc0205c48:	000d3783          	ld	a5,0(s10)
ffffffffc0205c4c:	8e9d                	sub	a3,a3,a5
ffffffffc0205c4e:	f454                	sd	a3,168(s0)
ffffffffc0205c50:	6818                	ld	a4,16(s0)
ffffffffc0205c52:	6622                	ld	a2,8(sp)
ffffffffc0205c54:	6789                	lui	a5,0x2
ffffffffc0205c56:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205c5a:	973e                	add	a4,a4,a5
ffffffffc0205c5c:	f058                	sd	a4,160(s0)
ffffffffc0205c5e:	87ba                	mv	a5,a4
ffffffffc0205c60:	12060893          	addi	a7,a2,288 # ffffffffc0200120 <readline+0x6e>
ffffffffc0205c64:	00063803          	ld	a6,0(a2)
ffffffffc0205c68:	6608                	ld	a0,8(a2)
ffffffffc0205c6a:	6a0c                	ld	a1,16(a2)
ffffffffc0205c6c:	6e14                	ld	a3,24(a2)
ffffffffc0205c6e:	0107b023          	sd	a6,0(a5)
ffffffffc0205c72:	e788                	sd	a0,8(a5)
ffffffffc0205c74:	eb8c                	sd	a1,16(a5)
ffffffffc0205c76:	ef94                	sd	a3,24(a5)
ffffffffc0205c78:	02060613          	addi	a2,a2,32
ffffffffc0205c7c:	02078793          	addi	a5,a5,32
ffffffffc0205c80:	ff1612e3          	bne	a2,a7,ffffffffc0205c64 <do_fork+0x102>
ffffffffc0205c84:	04073823          	sd	zero,80(a4)
ffffffffc0205c88:	120a8f63          	beqz	s5,ffffffffc0205dc6 <do_fork+0x264>
ffffffffc0205c8c:	01573823          	sd	s5,16(a4)
ffffffffc0205c90:	00000797          	auipc	a5,0x0
ffffffffc0205c94:	dde78793          	addi	a5,a5,-546 # ffffffffc0205a6e <forkret>
ffffffffc0205c98:	f81c                	sd	a5,48(s0)
ffffffffc0205c9a:	fc18                	sd	a4,56(s0)
ffffffffc0205c9c:	100027f3          	csrr	a5,sstatus
ffffffffc0205ca0:	8b89                	andi	a5,a5,2
ffffffffc0205ca2:	4981                	li	s3,0
ffffffffc0205ca4:	14079063          	bnez	a5,ffffffffc0205de4 <do_fork+0x282>
ffffffffc0205ca8:	0008b817          	auipc	a6,0x8b
ffffffffc0205cac:	3b080813          	addi	a6,a6,944 # ffffffffc0291058 <last_pid.1>
ffffffffc0205cb0:	00082783          	lw	a5,0(a6)
ffffffffc0205cb4:	6709                	lui	a4,0x2
ffffffffc0205cb6:	0017851b          	addiw	a0,a5,1
ffffffffc0205cba:	00a82023          	sw	a0,0(a6)
ffffffffc0205cbe:	08e55d63          	bge	a0,a4,ffffffffc0205d58 <do_fork+0x1f6>
ffffffffc0205cc2:	0008b317          	auipc	t1,0x8b
ffffffffc0205cc6:	39a30313          	addi	t1,t1,922 # ffffffffc029105c <next_safe.0>
ffffffffc0205cca:	00032783          	lw	a5,0(t1)
ffffffffc0205cce:	00090497          	auipc	s1,0x90
ffffffffc0205cd2:	af248493          	addi	s1,s1,-1294 # ffffffffc02957c0 <proc_list>
ffffffffc0205cd6:	08f55963          	bge	a0,a5,ffffffffc0205d68 <do_fork+0x206>
ffffffffc0205cda:	c048                	sw	a0,4(s0)
ffffffffc0205cdc:	45a9                	li	a1,10
ffffffffc0205cde:	2501                	sext.w	a0,a0
ffffffffc0205ce0:	286050ef          	jal	ra,ffffffffc020af66 <hash32>
ffffffffc0205ce4:	02051793          	slli	a5,a0,0x20
ffffffffc0205ce8:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205cec:	0008c797          	auipc	a5,0x8c
ffffffffc0205cf0:	ad478793          	addi	a5,a5,-1324 # ffffffffc02917c0 <hash_list>
ffffffffc0205cf4:	953e                	add	a0,a0,a5
ffffffffc0205cf6:	650c                	ld	a1,8(a0)
ffffffffc0205cf8:	7014                	ld	a3,32(s0)
ffffffffc0205cfa:	0d840793          	addi	a5,s0,216
ffffffffc0205cfe:	e19c                	sd	a5,0(a1)
ffffffffc0205d00:	6490                	ld	a2,8(s1)
ffffffffc0205d02:	e51c                	sd	a5,8(a0)
ffffffffc0205d04:	7af8                	ld	a4,240(a3)
ffffffffc0205d06:	0c840793          	addi	a5,s0,200
ffffffffc0205d0a:	f06c                	sd	a1,224(s0)
ffffffffc0205d0c:	ec68                	sd	a0,216(s0)
ffffffffc0205d0e:	e21c                	sd	a5,0(a2)
ffffffffc0205d10:	e49c                	sd	a5,8(s1)
ffffffffc0205d12:	e870                	sd	a2,208(s0)
ffffffffc0205d14:	e464                	sd	s1,200(s0)
ffffffffc0205d16:	0e043c23          	sd	zero,248(s0)
ffffffffc0205d1a:	10e43023          	sd	a4,256(s0)
ffffffffc0205d1e:	c311                	beqz	a4,ffffffffc0205d22 <do_fork+0x1c0>
ffffffffc0205d20:	ff60                	sd	s0,248(a4)
ffffffffc0205d22:	00092783          	lw	a5,0(s2)
ffffffffc0205d26:	fae0                	sd	s0,240(a3)
ffffffffc0205d28:	2785                	addiw	a5,a5,1
ffffffffc0205d2a:	00f92023          	sw	a5,0(s2)
ffffffffc0205d2e:	14099663          	bnez	s3,ffffffffc0205e7a <do_fork+0x318>
ffffffffc0205d32:	8522                	mv	a0,s0
ffffffffc0205d34:	53e010ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc0205d38:	4048                	lw	a0,4(s0)
ffffffffc0205d3a:	70e6                	ld	ra,120(sp)
ffffffffc0205d3c:	7446                	ld	s0,112(sp)
ffffffffc0205d3e:	74a6                	ld	s1,104(sp)
ffffffffc0205d40:	7906                	ld	s2,96(sp)
ffffffffc0205d42:	69e6                	ld	s3,88(sp)
ffffffffc0205d44:	6a46                	ld	s4,80(sp)
ffffffffc0205d46:	6aa6                	ld	s5,72(sp)
ffffffffc0205d48:	6b06                	ld	s6,64(sp)
ffffffffc0205d4a:	7be2                	ld	s7,56(sp)
ffffffffc0205d4c:	7c42                	ld	s8,48(sp)
ffffffffc0205d4e:	7ca2                	ld	s9,40(sp)
ffffffffc0205d50:	7d02                	ld	s10,32(sp)
ffffffffc0205d52:	6de2                	ld	s11,24(sp)
ffffffffc0205d54:	6109                	addi	sp,sp,128
ffffffffc0205d56:	8082                	ret
ffffffffc0205d58:	4785                	li	a5,1
ffffffffc0205d5a:	00f82023          	sw	a5,0(a6)
ffffffffc0205d5e:	4505                	li	a0,1
ffffffffc0205d60:	0008b317          	auipc	t1,0x8b
ffffffffc0205d64:	2fc30313          	addi	t1,t1,764 # ffffffffc029105c <next_safe.0>
ffffffffc0205d68:	00090497          	auipc	s1,0x90
ffffffffc0205d6c:	a5848493          	addi	s1,s1,-1448 # ffffffffc02957c0 <proc_list>
ffffffffc0205d70:	0084be03          	ld	t3,8(s1)
ffffffffc0205d74:	6789                	lui	a5,0x2
ffffffffc0205d76:	00f32023          	sw	a5,0(t1)
ffffffffc0205d7a:	86aa                	mv	a3,a0
ffffffffc0205d7c:	4581                	li	a1,0
ffffffffc0205d7e:	6e89                	lui	t4,0x2
ffffffffc0205d80:	169e0963          	beq	t3,s1,ffffffffc0205ef2 <do_fork+0x390>
ffffffffc0205d84:	88ae                	mv	a7,a1
ffffffffc0205d86:	87f2                	mv	a5,t3
ffffffffc0205d88:	6609                	lui	a2,0x2
ffffffffc0205d8a:	a811                	j	ffffffffc0205d9e <do_fork+0x23c>
ffffffffc0205d8c:	00e6d663          	bge	a3,a4,ffffffffc0205d98 <do_fork+0x236>
ffffffffc0205d90:	00c75463          	bge	a4,a2,ffffffffc0205d98 <do_fork+0x236>
ffffffffc0205d94:	863a                	mv	a2,a4
ffffffffc0205d96:	4885                	li	a7,1
ffffffffc0205d98:	679c                	ld	a5,8(a5)
ffffffffc0205d9a:	00978d63          	beq	a5,s1,ffffffffc0205db4 <do_fork+0x252>
ffffffffc0205d9e:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205da2:	fed715e3          	bne	a4,a3,ffffffffc0205d8c <do_fork+0x22a>
ffffffffc0205da6:	2685                	addiw	a3,a3,1
ffffffffc0205da8:	0cc6dc63          	bge	a3,a2,ffffffffc0205e80 <do_fork+0x31e>
ffffffffc0205dac:	679c                	ld	a5,8(a5)
ffffffffc0205dae:	4585                	li	a1,1
ffffffffc0205db0:	fe9797e3          	bne	a5,s1,ffffffffc0205d9e <do_fork+0x23c>
ffffffffc0205db4:	c581                	beqz	a1,ffffffffc0205dbc <do_fork+0x25a>
ffffffffc0205db6:	00d82023          	sw	a3,0(a6)
ffffffffc0205dba:	8536                	mv	a0,a3
ffffffffc0205dbc:	f0088fe3          	beqz	a7,ffffffffc0205cda <do_fork+0x178>
ffffffffc0205dc0:	00c32023          	sw	a2,0(t1)
ffffffffc0205dc4:	bf19                	j	ffffffffc0205cda <do_fork+0x178>
ffffffffc0205dc6:	8aba                	mv	s5,a4
ffffffffc0205dc8:	01573823          	sd	s5,16(a4) # 2010 <_binary_bin_swap_img_size-0x5cf0>
ffffffffc0205dcc:	00000797          	auipc	a5,0x0
ffffffffc0205dd0:	ca278793          	addi	a5,a5,-862 # ffffffffc0205a6e <forkret>
ffffffffc0205dd4:	f81c                	sd	a5,48(s0)
ffffffffc0205dd6:	fc18                	sd	a4,56(s0)
ffffffffc0205dd8:	100027f3          	csrr	a5,sstatus
ffffffffc0205ddc:	8b89                	andi	a5,a5,2
ffffffffc0205dde:	4981                	li	s3,0
ffffffffc0205de0:	ec0784e3          	beqz	a5,ffffffffc0205ca8 <do_fork+0x146>
ffffffffc0205de4:	e8ffa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205de8:	4985                	li	s3,1
ffffffffc0205dea:	bd7d                	j	ffffffffc0205ca8 <do_fork+0x146>
ffffffffc0205dec:	be2ff0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0205df0:	89aa                	mv	s3,a0
ffffffffc0205df2:	c561                	beqz	a0,ffffffffc0205eba <do_fork+0x358>
ffffffffc0205df4:	85ee                	mv	a1,s11
ffffffffc0205df6:	d10ff0ef          	jal	ra,ffffffffc0205306 <dup_files>
ffffffffc0205dfa:	ed4d                	bnez	a0,ffffffffc0205eb4 <do_fork+0x352>
ffffffffc0205dfc:	000b3603          	ld	a2,0(s6)
ffffffffc0205e00:	8dce                	mv	s11,s3
ffffffffc0205e02:	bd29                	j	ffffffffc0205c1c <do_fork+0xba>
ffffffffc0205e04:	e05fd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc0205e08:	8a2a                	mv	s4,a0
ffffffffc0205e0a:	c951                	beqz	a0,ffffffffc0205e9e <do_fork+0x33c>
ffffffffc0205e0c:	4505                	li	a0,1
ffffffffc0205e0e:	b5efc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205e12:	c159                	beqz	a0,ffffffffc0205e98 <do_fork+0x336>
ffffffffc0205e14:	000c3683          	ld	a3,0(s8)
ffffffffc0205e18:	000cb603          	ld	a2,0(s9)
ffffffffc0205e1c:	40d506b3          	sub	a3,a0,a3
ffffffffc0205e20:	8699                	srai	a3,a3,0x6
ffffffffc0205e22:	96de                	add	a3,a3,s7
ffffffffc0205e24:	00c69713          	slli	a4,a3,0xc
ffffffffc0205e28:	8331                	srli	a4,a4,0xc
ffffffffc0205e2a:	06b2                	slli	a3,a3,0xc
ffffffffc0205e2c:	0cc77d63          	bgeu	a4,a2,ffffffffc0205f06 <do_fork+0x3a4>
ffffffffc0205e30:	000d3983          	ld	s3,0(s10)
ffffffffc0205e34:	6605                	lui	a2,0x1
ffffffffc0205e36:	00091597          	auipc	a1,0x91
ffffffffc0205e3a:	a625b583          	ld	a1,-1438(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205e3e:	99b6                	add	s3,s3,a3
ffffffffc0205e40:	854e                	mv	a0,s3
ffffffffc0205e42:	6aa050ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0205e46:	03848d93          	addi	s11,s1,56
ffffffffc0205e4a:	013a3c23          	sd	s3,24(s4)
ffffffffc0205e4e:	856e                	mv	a0,s11
ffffffffc0205e50:	f14fe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0205e54:	000b3703          	ld	a4,0(s6)
ffffffffc0205e58:	c319                	beqz	a4,ffffffffc0205e5e <do_fork+0x2fc>
ffffffffc0205e5a:	4358                	lw	a4,4(a4)
ffffffffc0205e5c:	c8b8                	sw	a4,80(s1)
ffffffffc0205e5e:	85a6                	mv	a1,s1
ffffffffc0205e60:	8552                	mv	a0,s4
ffffffffc0205e62:	ff7fd0ef          	jal	ra,ffffffffc0203e58 <dup_mmap>
ffffffffc0205e66:	89aa                	mv	s3,a0
ffffffffc0205e68:	856e                	mv	a0,s11
ffffffffc0205e6a:	ef6fe0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0205e6e:	0404a823          	sw	zero,80(s1)
ffffffffc0205e72:	00099c63          	bnez	s3,ffffffffc0205e8a <do_fork+0x328>
ffffffffc0205e76:	84d2                	mv	s1,s4
ffffffffc0205e78:	bb7d                	j	ffffffffc0205c36 <do_fork+0xd4>
ffffffffc0205e7a:	df3fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205e7e:	bd55                	j	ffffffffc0205d32 <do_fork+0x1d0>
ffffffffc0205e80:	01d6c363          	blt	a3,t4,ffffffffc0205e86 <do_fork+0x324>
ffffffffc0205e84:	4685                	li	a3,1
ffffffffc0205e86:	4585                	li	a1,1
ffffffffc0205e88:	bde5                	j	ffffffffc0205d80 <do_fork+0x21e>
ffffffffc0205e8a:	8552                	mv	a0,s4
ffffffffc0205e8c:	866fe0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0205e90:	018a3503          	ld	a0,24(s4)
ffffffffc0205e94:	be9ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0205e98:	8552                	mv	a0,s4
ffffffffc0205e9a:	ebdfd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0205e9e:	14843503          	ld	a0,328(s0)
ffffffffc0205ea2:	cd01                	beqz	a0,ffffffffc0205eba <do_fork+0x358>
ffffffffc0205ea4:	491c                	lw	a5,16(a0)
ffffffffc0205ea6:	fff7871b          	addiw	a4,a5,-1
ffffffffc0205eaa:	c918                	sw	a4,16(a0)
ffffffffc0205eac:	e719                	bnez	a4,ffffffffc0205eba <do_fork+0x358>
ffffffffc0205eae:	b56ff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205eb2:	a021                	j	ffffffffc0205eba <do_fork+0x358>
ffffffffc0205eb4:	854e                	mv	a0,s3
ffffffffc0205eb6:	b4eff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0205eba:	6814                	ld	a3,16(s0)
ffffffffc0205ebc:	c02007b7          	lui	a5,0xc0200
ffffffffc0205ec0:	04f6ef63          	bltu	a3,a5,ffffffffc0205f1e <do_fork+0x3bc>
ffffffffc0205ec4:	000d3783          	ld	a5,0(s10)
ffffffffc0205ec8:	000cb703          	ld	a4,0(s9)
ffffffffc0205ecc:	40f687b3          	sub	a5,a3,a5
ffffffffc0205ed0:	83b1                	srli	a5,a5,0xc
ffffffffc0205ed2:	06e7fe63          	bgeu	a5,a4,ffffffffc0205f4e <do_fork+0x3ec>
ffffffffc0205ed6:	000c3503          	ld	a0,0(s8)
ffffffffc0205eda:	417787b3          	sub	a5,a5,s7
ffffffffc0205ede:	079a                	slli	a5,a5,0x6
ffffffffc0205ee0:	4589                	li	a1,2
ffffffffc0205ee2:	953e                	add	a0,a0,a5
ffffffffc0205ee4:	ac6fc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205ee8:	8522                	mv	a0,s0
ffffffffc0205eea:	954fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205eee:	5571                	li	a0,-4
ffffffffc0205ef0:	b5a9                	j	ffffffffc0205d3a <do_fork+0x1d8>
ffffffffc0205ef2:	c599                	beqz	a1,ffffffffc0205f00 <do_fork+0x39e>
ffffffffc0205ef4:	00d82023          	sw	a3,0(a6)
ffffffffc0205ef8:	8536                	mv	a0,a3
ffffffffc0205efa:	b3c5                	j	ffffffffc0205cda <do_fork+0x178>
ffffffffc0205efc:	556d                	li	a0,-5
ffffffffc0205efe:	bd35                	j	ffffffffc0205d3a <do_fork+0x1d8>
ffffffffc0205f00:	00082503          	lw	a0,0(a6)
ffffffffc0205f04:	bbd9                	j	ffffffffc0205cda <do_fork+0x178>
ffffffffc0205f06:	00006617          	auipc	a2,0x6
ffffffffc0205f0a:	59a60613          	addi	a2,a2,1434 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0205f0e:	07100593          	li	a1,113
ffffffffc0205f12:	00006517          	auipc	a0,0x6
ffffffffc0205f16:	5b650513          	addi	a0,a0,1462 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0205f1a:	d84fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f1e:	00006617          	auipc	a2,0x6
ffffffffc0205f22:	62a60613          	addi	a2,a2,1578 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0205f26:	07700593          	li	a1,119
ffffffffc0205f2a:	00006517          	auipc	a0,0x6
ffffffffc0205f2e:	59e50513          	addi	a0,a0,1438 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0205f32:	d6cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f36:	00006617          	auipc	a2,0x6
ffffffffc0205f3a:	61260613          	addi	a2,a2,1554 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0205f3e:	1b700593          	li	a1,439
ffffffffc0205f42:	00007517          	auipc	a0,0x7
ffffffffc0205f46:	55e50513          	addi	a0,a0,1374 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0205f4a:	d54fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f4e:	00006617          	auipc	a2,0x6
ffffffffc0205f52:	62260613          	addi	a2,a2,1570 # ffffffffc020c570 <default_pmm_manager+0x108>
ffffffffc0205f56:	06900593          	li	a1,105
ffffffffc0205f5a:	00006517          	auipc	a0,0x6
ffffffffc0205f5e:	56e50513          	addi	a0,a0,1390 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0205f62:	d3cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f66:	00007697          	auipc	a3,0x7
ffffffffc0205f6a:	55268693          	addi	a3,a3,1362 # ffffffffc020d4b8 <CSWTCH.79+0x128>
ffffffffc0205f6e:	00006617          	auipc	a2,0x6
ffffffffc0205f72:	a1260613          	addi	a2,a2,-1518 # ffffffffc020b980 <commands+0x210>
ffffffffc0205f76:	1d700593          	li	a1,471
ffffffffc0205f7a:	00007517          	auipc	a0,0x7
ffffffffc0205f7e:	52650513          	addi	a0,a0,1318 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0205f82:	d1cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f86:	00007697          	auipc	a3,0x7
ffffffffc0205f8a:	4fa68693          	addi	a3,a3,1274 # ffffffffc020d480 <CSWTCH.79+0xf0>
ffffffffc0205f8e:	00006617          	auipc	a2,0x6
ffffffffc0205f92:	9f260613          	addi	a2,a2,-1550 # ffffffffc020b980 <commands+0x210>
ffffffffc0205f96:	23800593          	li	a1,568
ffffffffc0205f9a:	00007517          	auipc	a0,0x7
ffffffffc0205f9e:	50650513          	addi	a0,a0,1286 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0205fa2:	cfcfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205fa6 <kernel_thread>:
ffffffffc0205fa6:	7129                	addi	sp,sp,-320
ffffffffc0205fa8:	fa22                	sd	s0,304(sp)
ffffffffc0205faa:	f626                	sd	s1,296(sp)
ffffffffc0205fac:	f24a                	sd	s2,288(sp)
ffffffffc0205fae:	84ae                	mv	s1,a1
ffffffffc0205fb0:	892a                	mv	s2,a0
ffffffffc0205fb2:	8432                	mv	s0,a2
ffffffffc0205fb4:	4581                	li	a1,0
ffffffffc0205fb6:	12000613          	li	a2,288
ffffffffc0205fba:	850a                	mv	a0,sp
ffffffffc0205fbc:	fe06                	sd	ra,312(sp)
ffffffffc0205fbe:	4dc050ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0205fc2:	e0ca                	sd	s2,64(sp)
ffffffffc0205fc4:	e4a6                	sd	s1,72(sp)
ffffffffc0205fc6:	100027f3          	csrr	a5,sstatus
ffffffffc0205fca:	edd7f793          	andi	a5,a5,-291
ffffffffc0205fce:	1207e793          	ori	a5,a5,288
ffffffffc0205fd2:	e23e                	sd	a5,256(sp)
ffffffffc0205fd4:	860a                	mv	a2,sp
ffffffffc0205fd6:	10046513          	ori	a0,s0,256
ffffffffc0205fda:	00000797          	auipc	a5,0x0
ffffffffc0205fde:	9f278793          	addi	a5,a5,-1550 # ffffffffc02059cc <kernel_thread_entry>
ffffffffc0205fe2:	4581                	li	a1,0
ffffffffc0205fe4:	e63e                	sd	a5,264(sp)
ffffffffc0205fe6:	b7dff0ef          	jal	ra,ffffffffc0205b62 <do_fork>
ffffffffc0205fea:	70f2                	ld	ra,312(sp)
ffffffffc0205fec:	7452                	ld	s0,304(sp)
ffffffffc0205fee:	74b2                	ld	s1,296(sp)
ffffffffc0205ff0:	7912                	ld	s2,288(sp)
ffffffffc0205ff2:	6131                	addi	sp,sp,320
ffffffffc0205ff4:	8082                	ret

ffffffffc0205ff6 <do_exit>:
ffffffffc0205ff6:	7179                	addi	sp,sp,-48
ffffffffc0205ff8:	f022                	sd	s0,32(sp)
ffffffffc0205ffa:	00091417          	auipc	s0,0x91
ffffffffc0205ffe:	8c640413          	addi	s0,s0,-1850 # ffffffffc02968c0 <current>
ffffffffc0206002:	601c                	ld	a5,0(s0)
ffffffffc0206004:	f406                	sd	ra,40(sp)
ffffffffc0206006:	ec26                	sd	s1,24(sp)
ffffffffc0206008:	e84a                	sd	s2,16(sp)
ffffffffc020600a:	e44e                	sd	s3,8(sp)
ffffffffc020600c:	e052                	sd	s4,0(sp)
ffffffffc020600e:	00091717          	auipc	a4,0x91
ffffffffc0206012:	8ba73703          	ld	a4,-1862(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0206016:	0ee78763          	beq	a5,a4,ffffffffc0206104 <do_exit+0x10e>
ffffffffc020601a:	00091497          	auipc	s1,0x91
ffffffffc020601e:	8b648493          	addi	s1,s1,-1866 # ffffffffc02968d0 <initproc>
ffffffffc0206022:	6098                	ld	a4,0(s1)
ffffffffc0206024:	10e78763          	beq	a5,a4,ffffffffc0206132 <do_exit+0x13c>
ffffffffc0206028:	0287b983          	ld	s3,40(a5)
ffffffffc020602c:	892a                	mv	s2,a0
ffffffffc020602e:	02098e63          	beqz	s3,ffffffffc020606a <do_exit+0x74>
ffffffffc0206032:	00091797          	auipc	a5,0x91
ffffffffc0206036:	85e7b783          	ld	a5,-1954(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020603a:	577d                	li	a4,-1
ffffffffc020603c:	177e                	slli	a4,a4,0x3f
ffffffffc020603e:	83b1                	srli	a5,a5,0xc
ffffffffc0206040:	8fd9                	or	a5,a5,a4
ffffffffc0206042:	18079073          	csrw	satp,a5
ffffffffc0206046:	0309a783          	lw	a5,48(s3)
ffffffffc020604a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020604e:	02e9a823          	sw	a4,48(s3)
ffffffffc0206052:	c769                	beqz	a4,ffffffffc020611c <do_exit+0x126>
ffffffffc0206054:	601c                	ld	a5,0(s0)
ffffffffc0206056:	1487b503          	ld	a0,328(a5)
ffffffffc020605a:	0207b423          	sd	zero,40(a5)
ffffffffc020605e:	c511                	beqz	a0,ffffffffc020606a <do_exit+0x74>
ffffffffc0206060:	491c                	lw	a5,16(a0)
ffffffffc0206062:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206066:	c918                	sw	a4,16(a0)
ffffffffc0206068:	cb59                	beqz	a4,ffffffffc02060fe <do_exit+0x108>
ffffffffc020606a:	601c                	ld	a5,0(s0)
ffffffffc020606c:	470d                	li	a4,3
ffffffffc020606e:	c398                	sw	a4,0(a5)
ffffffffc0206070:	0f27a423          	sw	s2,232(a5)
ffffffffc0206074:	100027f3          	csrr	a5,sstatus
ffffffffc0206078:	8b89                	andi	a5,a5,2
ffffffffc020607a:	4a01                	li	s4,0
ffffffffc020607c:	e7f9                	bnez	a5,ffffffffc020614a <do_exit+0x154>
ffffffffc020607e:	6018                	ld	a4,0(s0)
ffffffffc0206080:	800007b7          	lui	a5,0x80000
ffffffffc0206084:	0785                	addi	a5,a5,1
ffffffffc0206086:	7308                	ld	a0,32(a4)
ffffffffc0206088:	0ec52703          	lw	a4,236(a0)
ffffffffc020608c:	0cf70363          	beq	a4,a5,ffffffffc0206152 <do_exit+0x15c>
ffffffffc0206090:	6018                	ld	a4,0(s0)
ffffffffc0206092:	7b7c                	ld	a5,240(a4)
ffffffffc0206094:	c3a1                	beqz	a5,ffffffffc02060d4 <do_exit+0xde>
ffffffffc0206096:	800009b7          	lui	s3,0x80000
ffffffffc020609a:	490d                	li	s2,3
ffffffffc020609c:	0985                	addi	s3,s3,1
ffffffffc020609e:	a021                	j	ffffffffc02060a6 <do_exit+0xb0>
ffffffffc02060a0:	6018                	ld	a4,0(s0)
ffffffffc02060a2:	7b7c                	ld	a5,240(a4)
ffffffffc02060a4:	cb85                	beqz	a5,ffffffffc02060d4 <do_exit+0xde>
ffffffffc02060a6:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc02060aa:	6088                	ld	a0,0(s1)
ffffffffc02060ac:	fb74                	sd	a3,240(a4)
ffffffffc02060ae:	7978                	ld	a4,240(a0)
ffffffffc02060b0:	0e07bc23          	sd	zero,248(a5)
ffffffffc02060b4:	10e7b023          	sd	a4,256(a5)
ffffffffc02060b8:	c311                	beqz	a4,ffffffffc02060bc <do_exit+0xc6>
ffffffffc02060ba:	ff7c                	sd	a5,248(a4)
ffffffffc02060bc:	4398                	lw	a4,0(a5)
ffffffffc02060be:	f388                	sd	a0,32(a5)
ffffffffc02060c0:	f97c                	sd	a5,240(a0)
ffffffffc02060c2:	fd271fe3          	bne	a4,s2,ffffffffc02060a0 <do_exit+0xaa>
ffffffffc02060c6:	0ec52783          	lw	a5,236(a0)
ffffffffc02060ca:	fd379be3          	bne	a5,s3,ffffffffc02060a0 <do_exit+0xaa>
ffffffffc02060ce:	1a4010ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc02060d2:	b7f9                	j	ffffffffc02060a0 <do_exit+0xaa>
ffffffffc02060d4:	020a1263          	bnez	s4,ffffffffc02060f8 <do_exit+0x102>
ffffffffc02060d8:	24c010ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc02060dc:	601c                	ld	a5,0(s0)
ffffffffc02060de:	00007617          	auipc	a2,0x7
ffffffffc02060e2:	41260613          	addi	a2,a2,1042 # ffffffffc020d4f0 <CSWTCH.79+0x160>
ffffffffc02060e6:	29a00593          	li	a1,666
ffffffffc02060ea:	43d4                	lw	a3,4(a5)
ffffffffc02060ec:	00007517          	auipc	a0,0x7
ffffffffc02060f0:	3b450513          	addi	a0,a0,948 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc02060f4:	baafa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02060f8:	b75fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02060fc:	bff1                	j	ffffffffc02060d8 <do_exit+0xe2>
ffffffffc02060fe:	906ff0ef          	jal	ra,ffffffffc0205204 <files_destroy>
ffffffffc0206102:	b7a5                	j	ffffffffc020606a <do_exit+0x74>
ffffffffc0206104:	00007617          	auipc	a2,0x7
ffffffffc0206108:	3cc60613          	addi	a2,a2,972 # ffffffffc020d4d0 <CSWTCH.79+0x140>
ffffffffc020610c:	26500593          	li	a1,613
ffffffffc0206110:	00007517          	auipc	a0,0x7
ffffffffc0206114:	39050513          	addi	a0,a0,912 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206118:	b86fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020611c:	854e                	mv	a0,s3
ffffffffc020611e:	dd5fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206122:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc0206126:	957ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc020612a:	854e                	mv	a0,s3
ffffffffc020612c:	c2bfd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206130:	b715                	j	ffffffffc0206054 <do_exit+0x5e>
ffffffffc0206132:	00007617          	auipc	a2,0x7
ffffffffc0206136:	3ae60613          	addi	a2,a2,942 # ffffffffc020d4e0 <CSWTCH.79+0x150>
ffffffffc020613a:	26900593          	li	a1,617
ffffffffc020613e:	00007517          	auipc	a0,0x7
ffffffffc0206142:	36250513          	addi	a0,a0,866 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206146:	b58fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020614a:	b29fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020614e:	4a05                	li	s4,1
ffffffffc0206150:	b73d                	j	ffffffffc020607e <do_exit+0x88>
ffffffffc0206152:	120010ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc0206156:	bf2d                	j	ffffffffc0206090 <do_exit+0x9a>

ffffffffc0206158 <do_wait.part.0>:
ffffffffc0206158:	715d                	addi	sp,sp,-80
ffffffffc020615a:	f84a                	sd	s2,48(sp)
ffffffffc020615c:	f44e                	sd	s3,40(sp)
ffffffffc020615e:	80000937          	lui	s2,0x80000
ffffffffc0206162:	6989                	lui	s3,0x2
ffffffffc0206164:	fc26                	sd	s1,56(sp)
ffffffffc0206166:	f052                	sd	s4,32(sp)
ffffffffc0206168:	ec56                	sd	s5,24(sp)
ffffffffc020616a:	e85a                	sd	s6,16(sp)
ffffffffc020616c:	e45e                	sd	s7,8(sp)
ffffffffc020616e:	e486                	sd	ra,72(sp)
ffffffffc0206170:	e0a2                	sd	s0,64(sp)
ffffffffc0206172:	84aa                	mv	s1,a0
ffffffffc0206174:	8a2e                	mv	s4,a1
ffffffffc0206176:	00090b97          	auipc	s7,0x90
ffffffffc020617a:	74ab8b93          	addi	s7,s7,1866 # ffffffffc02968c0 <current>
ffffffffc020617e:	00050b1b          	sext.w	s6,a0
ffffffffc0206182:	fff50a9b          	addiw	s5,a0,-1
ffffffffc0206186:	19f9                	addi	s3,s3,-2
ffffffffc0206188:	0905                	addi	s2,s2,1
ffffffffc020618a:	ccbd                	beqz	s1,ffffffffc0206208 <do_wait.part.0+0xb0>
ffffffffc020618c:	0359e863          	bltu	s3,s5,ffffffffc02061bc <do_wait.part.0+0x64>
ffffffffc0206190:	45a9                	li	a1,10
ffffffffc0206192:	855a                	mv	a0,s6
ffffffffc0206194:	5d3040ef          	jal	ra,ffffffffc020af66 <hash32>
ffffffffc0206198:	02051793          	slli	a5,a0,0x20
ffffffffc020619c:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02061a0:	0008b797          	auipc	a5,0x8b
ffffffffc02061a4:	62078793          	addi	a5,a5,1568 # ffffffffc02917c0 <hash_list>
ffffffffc02061a8:	953e                	add	a0,a0,a5
ffffffffc02061aa:	842a                	mv	s0,a0
ffffffffc02061ac:	a029                	j	ffffffffc02061b6 <do_wait.part.0+0x5e>
ffffffffc02061ae:	f2c42783          	lw	a5,-212(s0)
ffffffffc02061b2:	02978163          	beq	a5,s1,ffffffffc02061d4 <do_wait.part.0+0x7c>
ffffffffc02061b6:	6400                	ld	s0,8(s0)
ffffffffc02061b8:	fe851be3          	bne	a0,s0,ffffffffc02061ae <do_wait.part.0+0x56>
ffffffffc02061bc:	5579                	li	a0,-2
ffffffffc02061be:	60a6                	ld	ra,72(sp)
ffffffffc02061c0:	6406                	ld	s0,64(sp)
ffffffffc02061c2:	74e2                	ld	s1,56(sp)
ffffffffc02061c4:	7942                	ld	s2,48(sp)
ffffffffc02061c6:	79a2                	ld	s3,40(sp)
ffffffffc02061c8:	7a02                	ld	s4,32(sp)
ffffffffc02061ca:	6ae2                	ld	s5,24(sp)
ffffffffc02061cc:	6b42                	ld	s6,16(sp)
ffffffffc02061ce:	6ba2                	ld	s7,8(sp)
ffffffffc02061d0:	6161                	addi	sp,sp,80
ffffffffc02061d2:	8082                	ret
ffffffffc02061d4:	000bb683          	ld	a3,0(s7)
ffffffffc02061d8:	f4843783          	ld	a5,-184(s0)
ffffffffc02061dc:	fed790e3          	bne	a5,a3,ffffffffc02061bc <do_wait.part.0+0x64>
ffffffffc02061e0:	f2842703          	lw	a4,-216(s0)
ffffffffc02061e4:	478d                	li	a5,3
ffffffffc02061e6:	0ef70b63          	beq	a4,a5,ffffffffc02062dc <do_wait.part.0+0x184>
ffffffffc02061ea:	4785                	li	a5,1
ffffffffc02061ec:	c29c                	sw	a5,0(a3)
ffffffffc02061ee:	0f26a623          	sw	s2,236(a3)
ffffffffc02061f2:	132010ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc02061f6:	000bb783          	ld	a5,0(s7)
ffffffffc02061fa:	0b07a783          	lw	a5,176(a5)
ffffffffc02061fe:	8b85                	andi	a5,a5,1
ffffffffc0206200:	d7c9                	beqz	a5,ffffffffc020618a <do_wait.part.0+0x32>
ffffffffc0206202:	555d                	li	a0,-9
ffffffffc0206204:	df3ff0ef          	jal	ra,ffffffffc0205ff6 <do_exit>
ffffffffc0206208:	000bb683          	ld	a3,0(s7)
ffffffffc020620c:	7ae0                	ld	s0,240(a3)
ffffffffc020620e:	d45d                	beqz	s0,ffffffffc02061bc <do_wait.part.0+0x64>
ffffffffc0206210:	470d                	li	a4,3
ffffffffc0206212:	a021                	j	ffffffffc020621a <do_wait.part.0+0xc2>
ffffffffc0206214:	10043403          	ld	s0,256(s0)
ffffffffc0206218:	d869                	beqz	s0,ffffffffc02061ea <do_wait.part.0+0x92>
ffffffffc020621a:	401c                	lw	a5,0(s0)
ffffffffc020621c:	fee79ce3          	bne	a5,a4,ffffffffc0206214 <do_wait.part.0+0xbc>
ffffffffc0206220:	00090797          	auipc	a5,0x90
ffffffffc0206224:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0206228:	0c878963          	beq	a5,s0,ffffffffc02062fa <do_wait.part.0+0x1a2>
ffffffffc020622c:	00090797          	auipc	a5,0x90
ffffffffc0206230:	6a47b783          	ld	a5,1700(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206234:	0cf40363          	beq	s0,a5,ffffffffc02062fa <do_wait.part.0+0x1a2>
ffffffffc0206238:	000a0663          	beqz	s4,ffffffffc0206244 <do_wait.part.0+0xec>
ffffffffc020623c:	0e842783          	lw	a5,232(s0)
ffffffffc0206240:	00fa2023          	sw	a5,0(s4)
ffffffffc0206244:	100027f3          	csrr	a5,sstatus
ffffffffc0206248:	8b89                	andi	a5,a5,2
ffffffffc020624a:	4581                	li	a1,0
ffffffffc020624c:	e7c1                	bnez	a5,ffffffffc02062d4 <do_wait.part.0+0x17c>
ffffffffc020624e:	6c70                	ld	a2,216(s0)
ffffffffc0206250:	7074                	ld	a3,224(s0)
ffffffffc0206252:	10043703          	ld	a4,256(s0)
ffffffffc0206256:	7c7c                	ld	a5,248(s0)
ffffffffc0206258:	e614                	sd	a3,8(a2)
ffffffffc020625a:	e290                	sd	a2,0(a3)
ffffffffc020625c:	6470                	ld	a2,200(s0)
ffffffffc020625e:	6874                	ld	a3,208(s0)
ffffffffc0206260:	e614                	sd	a3,8(a2)
ffffffffc0206262:	e290                	sd	a2,0(a3)
ffffffffc0206264:	c319                	beqz	a4,ffffffffc020626a <do_wait.part.0+0x112>
ffffffffc0206266:	ff7c                	sd	a5,248(a4)
ffffffffc0206268:	7c7c                	ld	a5,248(s0)
ffffffffc020626a:	c3b5                	beqz	a5,ffffffffc02062ce <do_wait.part.0+0x176>
ffffffffc020626c:	10e7b023          	sd	a4,256(a5)
ffffffffc0206270:	00090717          	auipc	a4,0x90
ffffffffc0206274:	66870713          	addi	a4,a4,1640 # ffffffffc02968d8 <nr_process>
ffffffffc0206278:	431c                	lw	a5,0(a4)
ffffffffc020627a:	37fd                	addiw	a5,a5,-1
ffffffffc020627c:	c31c                	sw	a5,0(a4)
ffffffffc020627e:	e5a9                	bnez	a1,ffffffffc02062c8 <do_wait.part.0+0x170>
ffffffffc0206280:	6814                	ld	a3,16(s0)
ffffffffc0206282:	c02007b7          	lui	a5,0xc0200
ffffffffc0206286:	04f6ee63          	bltu	a3,a5,ffffffffc02062e2 <do_wait.part.0+0x18a>
ffffffffc020628a:	00090797          	auipc	a5,0x90
ffffffffc020628e:	62e7b783          	ld	a5,1582(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206292:	8e9d                	sub	a3,a3,a5
ffffffffc0206294:	82b1                	srli	a3,a3,0xc
ffffffffc0206296:	00090797          	auipc	a5,0x90
ffffffffc020629a:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968a0 <npage>
ffffffffc020629e:	06f6fa63          	bgeu	a3,a5,ffffffffc0206312 <do_wait.part.0+0x1ba>
ffffffffc02062a2:	00009517          	auipc	a0,0x9
ffffffffc02062a6:	50e53503          	ld	a0,1294(a0) # ffffffffc020f7b0 <nbase>
ffffffffc02062aa:	8e89                	sub	a3,a3,a0
ffffffffc02062ac:	069a                	slli	a3,a3,0x6
ffffffffc02062ae:	00090517          	auipc	a0,0x90
ffffffffc02062b2:	5fa53503          	ld	a0,1530(a0) # ffffffffc02968a8 <pages>
ffffffffc02062b6:	9536                	add	a0,a0,a3
ffffffffc02062b8:	4589                	li	a1,2
ffffffffc02062ba:	ef1fb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02062be:	8522                	mv	a0,s0
ffffffffc02062c0:	d7ffb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02062c4:	4501                	li	a0,0
ffffffffc02062c6:	bde5                	j	ffffffffc02061be <do_wait.part.0+0x66>
ffffffffc02062c8:	9a5fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02062cc:	bf55                	j	ffffffffc0206280 <do_wait.part.0+0x128>
ffffffffc02062ce:	701c                	ld	a5,32(s0)
ffffffffc02062d0:	fbf8                	sd	a4,240(a5)
ffffffffc02062d2:	bf79                	j	ffffffffc0206270 <do_wait.part.0+0x118>
ffffffffc02062d4:	99ffa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02062d8:	4585                	li	a1,1
ffffffffc02062da:	bf95                	j	ffffffffc020624e <do_wait.part.0+0xf6>
ffffffffc02062dc:	f2840413          	addi	s0,s0,-216
ffffffffc02062e0:	b781                	j	ffffffffc0206220 <do_wait.part.0+0xc8>
ffffffffc02062e2:	00006617          	auipc	a2,0x6
ffffffffc02062e6:	26660613          	addi	a2,a2,614 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc02062ea:	07700593          	li	a1,119
ffffffffc02062ee:	00006517          	auipc	a0,0x6
ffffffffc02062f2:	1da50513          	addi	a0,a0,474 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc02062f6:	9a8fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02062fa:	00007617          	auipc	a2,0x7
ffffffffc02062fe:	21660613          	addi	a2,a2,534 # ffffffffc020d510 <CSWTCH.79+0x180>
ffffffffc0206302:	42200593          	li	a1,1058
ffffffffc0206306:	00007517          	auipc	a0,0x7
ffffffffc020630a:	19a50513          	addi	a0,a0,410 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc020630e:	990fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206312:	00006617          	auipc	a2,0x6
ffffffffc0206316:	25e60613          	addi	a2,a2,606 # ffffffffc020c570 <default_pmm_manager+0x108>
ffffffffc020631a:	06900593          	li	a1,105
ffffffffc020631e:	00006517          	auipc	a0,0x6
ffffffffc0206322:	1aa50513          	addi	a0,a0,426 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0206326:	978fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020632a <init_main>:
ffffffffc020632a:	1141                	addi	sp,sp,-16
ffffffffc020632c:	00007517          	auipc	a0,0x7
ffffffffc0206330:	20450513          	addi	a0,a0,516 # ffffffffc020d530 <CSWTCH.79+0x1a0>
ffffffffc0206334:	e406                	sd	ra,8(sp)
ffffffffc0206336:	75e010ef          	jal	ra,ffffffffc0207a94 <vfs_set_bootfs>
ffffffffc020633a:	e179                	bnez	a0,ffffffffc0206400 <init_main+0xd6>
ffffffffc020633c:	eaffb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0206340:	c4bfb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc0206344:	4601                	li	a2,0
ffffffffc0206346:	4581                	li	a1,0
ffffffffc0206348:	00001517          	auipc	a0,0x1
ffffffffc020634c:	98450513          	addi	a0,a0,-1660 # ffffffffc0206ccc <user_main>
ffffffffc0206350:	c57ff0ef          	jal	ra,ffffffffc0205fa6 <kernel_thread>
ffffffffc0206354:	00a04563          	bgtz	a0,ffffffffc020635e <init_main+0x34>
ffffffffc0206358:	a841                	j	ffffffffc02063e8 <init_main+0xbe>
ffffffffc020635a:	7cb000ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc020635e:	4581                	li	a1,0
ffffffffc0206360:	4501                	li	a0,0
ffffffffc0206362:	df7ff0ef          	jal	ra,ffffffffc0206158 <do_wait.part.0>
ffffffffc0206366:	d975                	beqz	a0,ffffffffc020635a <init_main+0x30>
ffffffffc0206368:	e57fe0ef          	jal	ra,ffffffffc02051be <fs_cleanup>
ffffffffc020636c:	00007517          	auipc	a0,0x7
ffffffffc0206370:	20c50513          	addi	a0,a0,524 # ffffffffc020d578 <CSWTCH.79+0x1e8>
ffffffffc0206374:	e33f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206378:	00090797          	auipc	a5,0x90
ffffffffc020637c:	5587b783          	ld	a5,1368(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206380:	7bf8                	ld	a4,240(a5)
ffffffffc0206382:	e339                	bnez	a4,ffffffffc02063c8 <init_main+0x9e>
ffffffffc0206384:	7ff8                	ld	a4,248(a5)
ffffffffc0206386:	e329                	bnez	a4,ffffffffc02063c8 <init_main+0x9e>
ffffffffc0206388:	1007b703          	ld	a4,256(a5)
ffffffffc020638c:	ef15                	bnez	a4,ffffffffc02063c8 <init_main+0x9e>
ffffffffc020638e:	00090697          	auipc	a3,0x90
ffffffffc0206392:	54a6a683          	lw	a3,1354(a3) # ffffffffc02968d8 <nr_process>
ffffffffc0206396:	4709                	li	a4,2
ffffffffc0206398:	0ce69163          	bne	a3,a4,ffffffffc020645a <init_main+0x130>
ffffffffc020639c:	0008f717          	auipc	a4,0x8f
ffffffffc02063a0:	42470713          	addi	a4,a4,1060 # ffffffffc02957c0 <proc_list>
ffffffffc02063a4:	6714                	ld	a3,8(a4)
ffffffffc02063a6:	0c878793          	addi	a5,a5,200
ffffffffc02063aa:	08d79863          	bne	a5,a3,ffffffffc020643a <init_main+0x110>
ffffffffc02063ae:	6318                	ld	a4,0(a4)
ffffffffc02063b0:	06e79563          	bne	a5,a4,ffffffffc020641a <init_main+0xf0>
ffffffffc02063b4:	00007517          	auipc	a0,0x7
ffffffffc02063b8:	2ac50513          	addi	a0,a0,684 # ffffffffc020d660 <CSWTCH.79+0x2d0>
ffffffffc02063bc:	debf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063c0:	60a2                	ld	ra,8(sp)
ffffffffc02063c2:	4501                	li	a0,0
ffffffffc02063c4:	0141                	addi	sp,sp,16
ffffffffc02063c6:	8082                	ret
ffffffffc02063c8:	00007697          	auipc	a3,0x7
ffffffffc02063cc:	1d868693          	addi	a3,a3,472 # ffffffffc020d5a0 <CSWTCH.79+0x210>
ffffffffc02063d0:	00005617          	auipc	a2,0x5
ffffffffc02063d4:	5b060613          	addi	a2,a2,1456 # ffffffffc020b980 <commands+0x210>
ffffffffc02063d8:	49800593          	li	a1,1176
ffffffffc02063dc:	00007517          	auipc	a0,0x7
ffffffffc02063e0:	0c450513          	addi	a0,a0,196 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc02063e4:	8bafa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063e8:	00007617          	auipc	a2,0x7
ffffffffc02063ec:	17060613          	addi	a2,a2,368 # ffffffffc020d558 <CSWTCH.79+0x1c8>
ffffffffc02063f0:	48b00593          	li	a1,1163
ffffffffc02063f4:	00007517          	auipc	a0,0x7
ffffffffc02063f8:	0ac50513          	addi	a0,a0,172 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc02063fc:	8a2fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206400:	86aa                	mv	a3,a0
ffffffffc0206402:	00007617          	auipc	a2,0x7
ffffffffc0206406:	13660613          	addi	a2,a2,310 # ffffffffc020d538 <CSWTCH.79+0x1a8>
ffffffffc020640a:	48300593          	li	a1,1155
ffffffffc020640e:	00007517          	auipc	a0,0x7
ffffffffc0206412:	09250513          	addi	a0,a0,146 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206416:	888fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020641a:	00007697          	auipc	a3,0x7
ffffffffc020641e:	21668693          	addi	a3,a3,534 # ffffffffc020d630 <CSWTCH.79+0x2a0>
ffffffffc0206422:	00005617          	auipc	a2,0x5
ffffffffc0206426:	55e60613          	addi	a2,a2,1374 # ffffffffc020b980 <commands+0x210>
ffffffffc020642a:	49b00593          	li	a1,1179
ffffffffc020642e:	00007517          	auipc	a0,0x7
ffffffffc0206432:	07250513          	addi	a0,a0,114 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206436:	868fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020643a:	00007697          	auipc	a3,0x7
ffffffffc020643e:	1c668693          	addi	a3,a3,454 # ffffffffc020d600 <CSWTCH.79+0x270>
ffffffffc0206442:	00005617          	auipc	a2,0x5
ffffffffc0206446:	53e60613          	addi	a2,a2,1342 # ffffffffc020b980 <commands+0x210>
ffffffffc020644a:	49a00593          	li	a1,1178
ffffffffc020644e:	00007517          	auipc	a0,0x7
ffffffffc0206452:	05250513          	addi	a0,a0,82 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206456:	848fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020645a:	00007697          	auipc	a3,0x7
ffffffffc020645e:	19668693          	addi	a3,a3,406 # ffffffffc020d5f0 <CSWTCH.79+0x260>
ffffffffc0206462:	00005617          	auipc	a2,0x5
ffffffffc0206466:	51e60613          	addi	a2,a2,1310 # ffffffffc020b980 <commands+0x210>
ffffffffc020646a:	49900593          	li	a1,1177
ffffffffc020646e:	00007517          	auipc	a0,0x7
ffffffffc0206472:	03250513          	addi	a0,a0,50 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206476:	828fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020647a <do_execve>:
ffffffffc020647a:	c9010113          	addi	sp,sp,-880
ffffffffc020647e:	33513c23          	sd	s5,824(sp)
ffffffffc0206482:	00090a97          	auipc	s5,0x90
ffffffffc0206486:	43ea8a93          	addi	s5,s5,1086 # ffffffffc02968c0 <current>
ffffffffc020648a:	000ab683          	ld	a3,0(s5)
ffffffffc020648e:	fff5871b          	addiw	a4,a1,-1
ffffffffc0206492:	33713423          	sd	s7,808(sp)
ffffffffc0206496:	36113423          	sd	ra,872(sp)
ffffffffc020649a:	36813023          	sd	s0,864(sp)
ffffffffc020649e:	34913c23          	sd	s1,856(sp)
ffffffffc02064a2:	35213823          	sd	s2,848(sp)
ffffffffc02064a6:	35313423          	sd	s3,840(sp)
ffffffffc02064aa:	35413023          	sd	s4,832(sp)
ffffffffc02064ae:	33613823          	sd	s6,816(sp)
ffffffffc02064b2:	33813023          	sd	s8,800(sp)
ffffffffc02064b6:	31913c23          	sd	s9,792(sp)
ffffffffc02064ba:	31a13823          	sd	s10,784(sp)
ffffffffc02064be:	31b13423          	sd	s11,776(sp)
ffffffffc02064c2:	c83a                	sw	a4,16(sp)
ffffffffc02064c4:	47fd                	li	a5,31
ffffffffc02064c6:	0286bb83          	ld	s7,40(a3)
ffffffffc02064ca:	5ee7ea63          	bltu	a5,a4,ffffffffc0206abe <do_execve+0x644>
ffffffffc02064ce:	842e                	mv	s0,a1
ffffffffc02064d0:	84aa                	mv	s1,a0
ffffffffc02064d2:	8b32                	mv	s6,a2
ffffffffc02064d4:	4581                	li	a1,0
ffffffffc02064d6:	4641                	li	a2,16
ffffffffc02064d8:	1888                	addi	a0,sp,112
ffffffffc02064da:	7c1040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc02064de:	000b8c63          	beqz	s7,ffffffffc02064f6 <do_execve+0x7c>
ffffffffc02064e2:	038b8513          	addi	a0,s7,56
ffffffffc02064e6:	87efe0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02064ea:	000ab783          	ld	a5,0(s5)
ffffffffc02064ee:	c781                	beqz	a5,ffffffffc02064f6 <do_execve+0x7c>
ffffffffc02064f0:	43dc                	lw	a5,4(a5)
ffffffffc02064f2:	04fba823          	sw	a5,80(s7)
ffffffffc02064f6:	24048263          	beqz	s1,ffffffffc020673a <do_execve+0x2c0>
ffffffffc02064fa:	46c1                	li	a3,16
ffffffffc02064fc:	8626                	mv	a2,s1
ffffffffc02064fe:	188c                	addi	a1,sp,112
ffffffffc0206500:	855e                	mv	a0,s7
ffffffffc0206502:	e8bfd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0206506:	6a050963          	beqz	a0,ffffffffc0206bb8 <do_execve+0x73e>
ffffffffc020650a:	00341d93          	slli	s11,s0,0x3
ffffffffc020650e:	4681                	li	a3,0
ffffffffc0206510:	866e                	mv	a2,s11
ffffffffc0206512:	85da                	mv	a1,s6
ffffffffc0206514:	855e                	mv	a0,s7
ffffffffc0206516:	d7dfd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc020651a:	89da                	mv	s3,s6
ffffffffc020651c:	68050a63          	beqz	a0,ffffffffc0206bb0 <do_execve+0x736>
ffffffffc0206520:	0f810a13          	addi	s4,sp,248
ffffffffc0206524:	4481                	li	s1,0
ffffffffc0206526:	a011                	j	ffffffffc020652a <do_execve+0xb0>
ffffffffc0206528:	84e2                	mv	s1,s8
ffffffffc020652a:	6505                	lui	a0,0x1
ffffffffc020652c:	a63fb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0206530:	892a                	mv	s2,a0
ffffffffc0206532:	18050163          	beqz	a0,ffffffffc02066b4 <do_execve+0x23a>
ffffffffc0206536:	0009b603          	ld	a2,0(s3) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020653a:	85aa                	mv	a1,a0
ffffffffc020653c:	6685                	lui	a3,0x1
ffffffffc020653e:	855e                	mv	a0,s7
ffffffffc0206540:	e4dfd0ef          	jal	ra,ffffffffc020438c <copy_string>
ffffffffc0206544:	1e050663          	beqz	a0,ffffffffc0206730 <do_execve+0x2b6>
ffffffffc0206548:	012a3023          	sd	s2,0(s4)
ffffffffc020654c:	00148c1b          	addiw	s8,s1,1
ffffffffc0206550:	0a21                	addi	s4,s4,8
ffffffffc0206552:	09a1                	addi	s3,s3,8
ffffffffc0206554:	fd841ae3          	bne	s0,s8,ffffffffc0206528 <do_execve+0xae>
ffffffffc0206558:	000b3903          	ld	s2,0(s6)
ffffffffc020655c:	100b8963          	beqz	s7,ffffffffc020666e <do_execve+0x1f4>
ffffffffc0206560:	038b8513          	addi	a0,s7,56
ffffffffc0206564:	ffdfd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206568:	000ab703          	ld	a4,0(s5)
ffffffffc020656c:	040ba823          	sw	zero,80(s7)
ffffffffc0206570:	14873503          	ld	a0,328(a4)
ffffffffc0206574:	d27fe0ef          	jal	ra,ffffffffc020529a <files_closeall>
ffffffffc0206578:	854a                	mv	a0,s2
ffffffffc020657a:	4581                	li	a1,0
ffffffffc020657c:	fabfe0ef          	jal	ra,ffffffffc0205526 <sysfile_open>
ffffffffc0206580:	892a                	mv	s2,a0
ffffffffc0206582:	0c054163          	bltz	a0,ffffffffc0206644 <do_execve+0x1ca>
ffffffffc0206586:	00090717          	auipc	a4,0x90
ffffffffc020658a:	30a73703          	ld	a4,778(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020658e:	56fd                	li	a3,-1
ffffffffc0206590:	16fe                	slli	a3,a3,0x3f
ffffffffc0206592:	8331                	srli	a4,a4,0xc
ffffffffc0206594:	8f55                	or	a4,a4,a3
ffffffffc0206596:	18071073          	csrw	satp,a4
ffffffffc020659a:	030ba703          	lw	a4,48(s7)
ffffffffc020659e:	fff7069b          	addiw	a3,a4,-1
ffffffffc02065a2:	02dba823          	sw	a3,48(s7)
ffffffffc02065a6:	1a068663          	beqz	a3,ffffffffc0206752 <do_execve+0x2d8>
ffffffffc02065aa:	000ab703          	ld	a4,0(s5)
ffffffffc02065ae:	02073423          	sd	zero,40(a4)
ffffffffc02065b2:	e56fd0ef          	jal	ra,ffffffffc0203c08 <mm_create>
ffffffffc02065b6:	89aa                	mv	s3,a0
ffffffffc02065b8:	0e050c63          	beqz	a0,ffffffffc02066b0 <do_execve+0x236>
ffffffffc02065bc:	4505                	li	a0,1
ffffffffc02065be:	baffb0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02065c2:	0e050463          	beqz	a0,ffffffffc02066aa <do_execve+0x230>
ffffffffc02065c6:	00090c97          	auipc	s9,0x90
ffffffffc02065ca:	2e2c8c93          	addi	s9,s9,738 # ffffffffc02968a8 <pages>
ffffffffc02065ce:	000cb683          	ld	a3,0(s9)
ffffffffc02065d2:	00090d17          	auipc	s10,0x90
ffffffffc02065d6:	2ced0d13          	addi	s10,s10,718 # ffffffffc02968a0 <npage>
ffffffffc02065da:	00009797          	auipc	a5,0x9
ffffffffc02065de:	1d67b783          	ld	a5,470(a5) # ffffffffc020f7b0 <nbase>
ffffffffc02065e2:	40d506b3          	sub	a3,a0,a3
ffffffffc02065e6:	567d                	li	a2,-1
ffffffffc02065e8:	8699                	srai	a3,a3,0x6
ffffffffc02065ea:	000d3703          	ld	a4,0(s10)
ffffffffc02065ee:	96be                	add	a3,a3,a5
ffffffffc02065f0:	f03e                	sd	a5,32(sp)
ffffffffc02065f2:	00c65793          	srli	a5,a2,0xc
ffffffffc02065f6:	00f6f633          	and	a2,a3,a5
ffffffffc02065fa:	e43e                	sd	a5,8(sp)
ffffffffc02065fc:	06b2                	slli	a3,a3,0xc
ffffffffc02065fe:	60e67e63          	bgeu	a2,a4,ffffffffc0206c1a <do_execve+0x7a0>
ffffffffc0206602:	00090797          	auipc	a5,0x90
ffffffffc0206606:	2b678793          	addi	a5,a5,694 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020660a:	0007ba03          	ld	s4,0(a5)
ffffffffc020660e:	6605                	lui	a2,0x1
ffffffffc0206610:	00090597          	auipc	a1,0x90
ffffffffc0206614:	2885b583          	ld	a1,648(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0206618:	9a36                	add	s4,s4,a3
ffffffffc020661a:	8552                	mv	a0,s4
ffffffffc020661c:	6d1040ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0206620:	4601                	li	a2,0
ffffffffc0206622:	0149bc23          	sd	s4,24(s3)
ffffffffc0206626:	4581                	li	a1,0
ffffffffc0206628:	854a                	mv	a0,s2
ffffffffc020662a:	962ff0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc020662e:	8b2a                	mv	s6,a0
ffffffffc0206630:	12050c63          	beqz	a0,ffffffffc0206768 <do_execve+0x2ee>
ffffffffc0206634:	0189b503          	ld	a0,24(s3)
ffffffffc0206638:	895a                	mv	s2,s6
ffffffffc020663a:	c42ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc020663e:	854e                	mv	a0,s3
ffffffffc0206640:	f16fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206644:	67c2                	ld	a5,16(sp)
ffffffffc0206646:	147d                	addi	s0,s0,-1
ffffffffc0206648:	11a4                	addi	s1,sp,232
ffffffffc020664a:	02079713          	slli	a4,a5,0x20
ffffffffc020664e:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206652:	040e                	slli	s0,s0,0x3
ffffffffc0206654:	94ee                	add	s1,s1,s11
ffffffffc0206656:	19b8                	addi	a4,sp,248
ffffffffc0206658:	943a                	add	s0,s0,a4
ffffffffc020665a:	8c9d                	sub	s1,s1,a5
ffffffffc020665c:	6008                	ld	a0,0(s0)
ffffffffc020665e:	1461                	addi	s0,s0,-8
ffffffffc0206660:	9dffb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206664:	fe941ce3          	bne	s0,s1,ffffffffc020665c <do_execve+0x1e2>
ffffffffc0206668:	854a                	mv	a0,s2
ffffffffc020666a:	98dff0ef          	jal	ra,ffffffffc0205ff6 <do_exit>
ffffffffc020666e:	000ab703          	ld	a4,0(s5)
ffffffffc0206672:	14873503          	ld	a0,328(a4)
ffffffffc0206676:	c25fe0ef          	jal	ra,ffffffffc020529a <files_closeall>
ffffffffc020667a:	854a                	mv	a0,s2
ffffffffc020667c:	4581                	li	a1,0
ffffffffc020667e:	ea9fe0ef          	jal	ra,ffffffffc0205526 <sysfile_open>
ffffffffc0206682:	892a                	mv	s2,a0
ffffffffc0206684:	fc0540e3          	bltz	a0,ffffffffc0206644 <do_execve+0x1ca>
ffffffffc0206688:	000ab703          	ld	a4,0(s5)
ffffffffc020668c:	7718                	ld	a4,40(a4)
ffffffffc020668e:	f20702e3          	beqz	a4,ffffffffc02065b2 <do_execve+0x138>
ffffffffc0206692:	00007617          	auipc	a2,0x7
ffffffffc0206696:	ffe60613          	addi	a2,a2,-2 # ffffffffc020d690 <CSWTCH.79+0x300>
ffffffffc020669a:	2cc00593          	li	a1,716
ffffffffc020669e:	00007517          	auipc	a0,0x7
ffffffffc02066a2:	e0250513          	addi	a0,a0,-510 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc02066a6:	df9f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02066aa:	854e                	mv	a0,s3
ffffffffc02066ac:	eaafd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc02066b0:	5971                	li	s2,-4
ffffffffc02066b2:	bf49                	j	ffffffffc0206644 <do_execve+0x1ca>
ffffffffc02066b4:	5b71                	li	s6,-4
ffffffffc02066b6:	c49d                	beqz	s1,ffffffffc02066e4 <do_execve+0x26a>
ffffffffc02066b8:	00349713          	slli	a4,s1,0x3
ffffffffc02066bc:	fff48413          	addi	s0,s1,-1
ffffffffc02066c0:	11bc                	addi	a5,sp,232
ffffffffc02066c2:	34fd                	addiw	s1,s1,-1
ffffffffc02066c4:	97ba                	add	a5,a5,a4
ffffffffc02066c6:	02049713          	slli	a4,s1,0x20
ffffffffc02066ca:	01d75493          	srli	s1,a4,0x1d
ffffffffc02066ce:	040e                	slli	s0,s0,0x3
ffffffffc02066d0:	19b8                	addi	a4,sp,248
ffffffffc02066d2:	943a                	add	s0,s0,a4
ffffffffc02066d4:	409784b3          	sub	s1,a5,s1
ffffffffc02066d8:	6008                	ld	a0,0(s0)
ffffffffc02066da:	1461                	addi	s0,s0,-8
ffffffffc02066dc:	963fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02066e0:	fe849ce3          	bne	s1,s0,ffffffffc02066d8 <do_execve+0x25e>
ffffffffc02066e4:	000b8863          	beqz	s7,ffffffffc02066f4 <do_execve+0x27a>
ffffffffc02066e8:	038b8513          	addi	a0,s7,56
ffffffffc02066ec:	e75fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02066f0:	040ba823          	sw	zero,80(s7)
ffffffffc02066f4:	36813083          	ld	ra,872(sp)
ffffffffc02066f8:	36013403          	ld	s0,864(sp)
ffffffffc02066fc:	35813483          	ld	s1,856(sp)
ffffffffc0206700:	35013903          	ld	s2,848(sp)
ffffffffc0206704:	34813983          	ld	s3,840(sp)
ffffffffc0206708:	34013a03          	ld	s4,832(sp)
ffffffffc020670c:	33813a83          	ld	s5,824(sp)
ffffffffc0206710:	32813b83          	ld	s7,808(sp)
ffffffffc0206714:	32013c03          	ld	s8,800(sp)
ffffffffc0206718:	31813c83          	ld	s9,792(sp)
ffffffffc020671c:	31013d03          	ld	s10,784(sp)
ffffffffc0206720:	30813d83          	ld	s11,776(sp)
ffffffffc0206724:	855a                	mv	a0,s6
ffffffffc0206726:	33013b03          	ld	s6,816(sp)
ffffffffc020672a:	37010113          	addi	sp,sp,880
ffffffffc020672e:	8082                	ret
ffffffffc0206730:	854a                	mv	a0,s2
ffffffffc0206732:	90dfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206736:	5b75                	li	s6,-3
ffffffffc0206738:	bfbd                	j	ffffffffc02066b6 <do_execve+0x23c>
ffffffffc020673a:	000ab783          	ld	a5,0(s5)
ffffffffc020673e:	00007617          	auipc	a2,0x7
ffffffffc0206742:	f4260613          	addi	a2,a2,-190 # ffffffffc020d680 <CSWTCH.79+0x2f0>
ffffffffc0206746:	45c1                	li	a1,16
ffffffffc0206748:	43d4                	lw	a3,4(a5)
ffffffffc020674a:	1888                	addi	a0,sp,112
ffffffffc020674c:	45f040ef          	jal	ra,ffffffffc020b3aa <snprintf>
ffffffffc0206750:	bb6d                	j	ffffffffc020650a <do_execve+0x90>
ffffffffc0206752:	855e                	mv	a0,s7
ffffffffc0206754:	f9efd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206758:	018bb503          	ld	a0,24(s7)
ffffffffc020675c:	b20ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206760:	855e                	mv	a0,s7
ffffffffc0206762:	df4fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206766:	b591                	j	ffffffffc02065aa <do_execve+0x130>
ffffffffc0206768:	04000613          	li	a2,64
ffffffffc020676c:	192c                	addi	a1,sp,184
ffffffffc020676e:	854a                	mv	a0,s2
ffffffffc0206770:	deffe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc0206774:	04000713          	li	a4,64
ffffffffc0206778:	00e50863          	beq	a0,a4,ffffffffc0206788 <do_execve+0x30e>
ffffffffc020677c:	00050b1b          	sext.w	s6,a0
ffffffffc0206780:	ea054ae3          	bltz	a0,ffffffffc0206634 <do_execve+0x1ba>
ffffffffc0206784:	5b7d                	li	s6,-1
ffffffffc0206786:	b57d                	j	ffffffffc0206634 <do_execve+0x1ba>
ffffffffc0206788:	56ea                	lw	a3,184(sp)
ffffffffc020678a:	464c4737          	lui	a4,0x464c4
ffffffffc020678e:	57f70713          	addi	a4,a4,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc0206792:	20e69f63          	bne	a3,a4,ffffffffc02069b0 <do_execve+0x536>
ffffffffc0206796:	0f015703          	lhu	a4,240(sp)
ffffffffc020679a:	e882                	sd	zero,80(sp)
ffffffffc020679c:	f402                	sd	zero,40(sp)
ffffffffc020679e:	cb49                	beqz	a4,ffffffffc0206830 <do_execve+0x3b6>
ffffffffc02067a0:	fc6e                	sd	s11,56(sp)
ffffffffc02067a2:	f0e2                	sd	s8,96(sp)
ffffffffc02067a4:	f4a6                	sd	s1,104(sp)
ffffffffc02067a6:	ecda                	sd	s6,88(sp)
ffffffffc02067a8:	e0a2                	sd	s0,64(sp)
ffffffffc02067aa:	65ee                	ld	a1,216(sp)
ffffffffc02067ac:	77a2                	ld	a5,40(sp)
ffffffffc02067ae:	4601                	li	a2,0
ffffffffc02067b0:	854a                	mv	a0,s2
ffffffffc02067b2:	95be                	add	a1,a1,a5
ffffffffc02067b4:	fd9fe0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc02067b8:	e02a                	sd	a0,0(sp)
ffffffffc02067ba:	1e051863          	bnez	a0,ffffffffc02069aa <do_execve+0x530>
ffffffffc02067be:	03800613          	li	a2,56
ffffffffc02067c2:	010c                	addi	a1,sp,128
ffffffffc02067c4:	854a                	mv	a0,s2
ffffffffc02067c6:	d99fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc02067ca:	03800793          	li	a5,56
ffffffffc02067ce:	02f50763          	beq	a0,a5,ffffffffc02067fc <do_execve+0x382>
ffffffffc02067d2:	7de2                	ld	s11,56(sp)
ffffffffc02067d4:	6406                	ld	s0,64(sp)
ffffffffc02067d6:	8a2a                	mv	s4,a0
ffffffffc02067d8:	00054363          	bltz	a0,ffffffffc02067de <do_execve+0x364>
ffffffffc02067dc:	5a7d                	li	s4,-1
ffffffffc02067de:	000a079b          	sext.w	a5,s4
ffffffffc02067e2:	e03e                	sd	a5,0(sp)
ffffffffc02067e4:	854e                	mv	a0,s3
ffffffffc02067e6:	f0cfd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc02067ea:	0189b503          	ld	a0,24(s3)
ffffffffc02067ee:	6902                	ld	s2,0(sp)
ffffffffc02067f0:	a8cff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc02067f4:	854e                	mv	a0,s3
ffffffffc02067f6:	d60fd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc02067fa:	b5a9                	j	ffffffffc0206644 <do_execve+0x1ca>
ffffffffc02067fc:	478a                	lw	a5,128(sp)
ffffffffc02067fe:	4705                	li	a4,1
ffffffffc0206800:	00e79863          	bne	a5,a4,ffffffffc0206810 <do_execve+0x396>
ffffffffc0206804:	762a                	ld	a2,168(sp)
ffffffffc0206806:	778a                	ld	a5,160(sp)
ffffffffc0206808:	3cf66263          	bltu	a2,a5,ffffffffc0206bcc <do_execve+0x752>
ffffffffc020680c:	1a061b63          	bnez	a2,ffffffffc02069c2 <do_execve+0x548>
ffffffffc0206810:	6746                	ld	a4,80(sp)
ffffffffc0206812:	76a2                	ld	a3,40(sp)
ffffffffc0206814:	0f015783          	lhu	a5,240(sp)
ffffffffc0206818:	2705                	addiw	a4,a4,1
ffffffffc020681a:	03868693          	addi	a3,a3,56 # 1038 <_binary_bin_swap_img_size-0x6cc8>
ffffffffc020681e:	e8ba                	sd	a4,80(sp)
ffffffffc0206820:	f436                	sd	a3,40(sp)
ffffffffc0206822:	f8f744e3          	blt	a4,a5,ffffffffc02067aa <do_execve+0x330>
ffffffffc0206826:	7de2                	ld	s11,56(sp)
ffffffffc0206828:	7c06                	ld	s8,96(sp)
ffffffffc020682a:	74a6                	ld	s1,104(sp)
ffffffffc020682c:	6b66                	ld	s6,88(sp)
ffffffffc020682e:	6406                	ld	s0,64(sp)
ffffffffc0206830:	4701                	li	a4,0
ffffffffc0206832:	46ad                	li	a3,11
ffffffffc0206834:	00100637          	lui	a2,0x100
ffffffffc0206838:	7ff005b7          	lui	a1,0x7ff00
ffffffffc020683c:	854e                	mv	a0,s3
ffffffffc020683e:	d6afd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc0206842:	e02a                	sd	a0,0(sp)
ffffffffc0206844:	f145                	bnez	a0,ffffffffc02067e4 <do_execve+0x36a>
ffffffffc0206846:	0189b503          	ld	a0,24(s3)
ffffffffc020684a:	467d                	li	a2,31
ffffffffc020684c:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0206850:	ad2fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206854:	44050c63          	beqz	a0,ffffffffc0206cac <do_execve+0x832>
ffffffffc0206858:	0189b503          	ld	a0,24(s3)
ffffffffc020685c:	467d                	li	a2,31
ffffffffc020685e:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc0206862:	ac0fd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206866:	42050363          	beqz	a0,ffffffffc0206c8c <do_execve+0x812>
ffffffffc020686a:	0189b503          	ld	a0,24(s3)
ffffffffc020686e:	467d                	li	a2,31
ffffffffc0206870:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc0206874:	aaefd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206878:	3e050a63          	beqz	a0,ffffffffc0206c6c <do_execve+0x7f2>
ffffffffc020687c:	0189b503          	ld	a0,24(s3)
ffffffffc0206880:	467d                	li	a2,31
ffffffffc0206882:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc0206886:	a9cfd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc020688a:	3c050163          	beqz	a0,ffffffffc0206c4c <do_execve+0x7d2>
ffffffffc020688e:	0309a703          	lw	a4,48(s3)
ffffffffc0206892:	000ab603          	ld	a2,0(s5)
ffffffffc0206896:	0189b683          	ld	a3,24(s3)
ffffffffc020689a:	2705                	addiw	a4,a4,1
ffffffffc020689c:	02e9a823          	sw	a4,48(s3)
ffffffffc02068a0:	03363423          	sd	s3,40(a2) # 100028 <_binary_bin_sfs_img_size+0x8ad28>
ffffffffc02068a4:	c0200737          	lui	a4,0xc0200
ffffffffc02068a8:	34e6ec63          	bltu	a3,a4,ffffffffc0206c00 <do_execve+0x786>
ffffffffc02068ac:	00090797          	auipc	a5,0x90
ffffffffc02068b0:	00c78793          	addi	a5,a5,12 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02068b4:	6398                	ld	a4,0(a5)
ffffffffc02068b6:	8e99                	sub	a3,a3,a4
ffffffffc02068b8:	00c6d713          	srli	a4,a3,0xc
ffffffffc02068bc:	f654                	sd	a3,168(a2)
ffffffffc02068be:	56fd                	li	a3,-1
ffffffffc02068c0:	16fe                	slli	a3,a3,0x3f
ffffffffc02068c2:	8f55                	or	a4,a4,a3
ffffffffc02068c4:	18071073          	csrw	satp,a4
ffffffffc02068c8:	12000073          	sfence.vma
ffffffffc02068cc:	4905                	li	s2,1
ffffffffc02068ce:	6a02                	ld	s4,0(sp)
ffffffffc02068d0:	1f810b93          	addi	s7,sp,504
ffffffffc02068d4:	0f810c93          	addi	s9,sp,248
ffffffffc02068d8:	097e                	slli	s2,s2,0x1f
ffffffffc02068da:	a011                	j	ffffffffc02068de <do_execve+0x464>
ffffffffc02068dc:	8a3e                	mv	s4,a5
ffffffffc02068de:	000cbd03          	ld	s10,0(s9)
ffffffffc02068e2:	856a                	mv	a0,s10
ffffffffc02068e4:	315040ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc02068e8:	00150693          	addi	a3,a0,1
ffffffffc02068ec:	40d90933          	sub	s2,s2,a3
ffffffffc02068f0:	866a                	mv	a2,s10
ffffffffc02068f2:	85ca                	mv	a1,s2
ffffffffc02068f4:	854e                	mv	a0,s3
ffffffffc02068f6:	012bb023          	sd	s2,0(s7)
ffffffffc02068fa:	a61fd0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc02068fe:	2e050263          	beqz	a0,ffffffffc0206be2 <do_execve+0x768>
ffffffffc0206902:	001a079b          	addiw	a5,s4,1
ffffffffc0206906:	0ca1                	addi	s9,s9,8
ffffffffc0206908:	0ba1                	addi	s7,s7,8
ffffffffc020690a:	fc9a49e3          	blt	s4,s1,ffffffffc02068dc <do_execve+0x462>
ffffffffc020690e:	008d8693          	addi	a3,s11,8
ffffffffc0206912:	ff897493          	andi	s1,s2,-8
ffffffffc0206916:	003c1793          	slli	a5,s8,0x3
ffffffffc020691a:	0618                	addi	a4,sp,768
ffffffffc020691c:	8c95                	sub	s1,s1,a3
ffffffffc020691e:	97ba                	add	a5,a5,a4
ffffffffc0206920:	1bb0                	addi	a2,sp,504
ffffffffc0206922:	85a6                	mv	a1,s1
ffffffffc0206924:	854e                	mv	a0,s3
ffffffffc0206926:	ee07bc23          	sd	zero,-264(a5)
ffffffffc020692a:	a31fd0ef          	jal	ra,ffffffffc020435a <copy_to_user>
ffffffffc020692e:	2a050d63          	beqz	a0,ffffffffc0206be8 <do_execve+0x76e>
ffffffffc0206932:	000ab783          	ld	a5,0(s5)
ffffffffc0206936:	12000613          	li	a2,288
ffffffffc020693a:	4581                	li	a1,0
ffffffffc020693c:	0a07b903          	ld	s2,160(a5)
ffffffffc0206940:	10093983          	ld	s3,256(s2) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc0206944:	854a                	mv	a0,s2
ffffffffc0206946:	355040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc020694a:	674e                	ld	a4,208(sp)
ffffffffc020694c:	edf9f793          	andi	a5,s3,-289
ffffffffc0206950:	0207e793          	ori	a5,a5,32
ffffffffc0206954:	00993823          	sd	s1,16(s2)
ffffffffc0206958:	10e93423          	sd	a4,264(s2)
ffffffffc020695c:	10f93023          	sd	a5,256(s2)
ffffffffc0206960:	04893823          	sd	s0,80(s2)
ffffffffc0206964:	04993c23          	sd	s1,88(s2)
ffffffffc0206968:	67c2                	ld	a5,16(sp)
ffffffffc020696a:	147d                	addi	s0,s0,-1
ffffffffc020696c:	11a4                	addi	s1,sp,232
ffffffffc020696e:	02079713          	slli	a4,a5,0x20
ffffffffc0206972:	01d75793          	srli	a5,a4,0x1d
ffffffffc0206976:	040e                	slli	s0,s0,0x3
ffffffffc0206978:	94ee                	add	s1,s1,s11
ffffffffc020697a:	19b8                	addi	a4,sp,248
ffffffffc020697c:	943a                	add	s0,s0,a4
ffffffffc020697e:	8c9d                	sub	s1,s1,a5
ffffffffc0206980:	6008                	ld	a0,0(s0)
ffffffffc0206982:	1461                	addi	s0,s0,-8
ffffffffc0206984:	ebafb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206988:	fe941ce3          	bne	s0,s1,ffffffffc0206980 <do_execve+0x506>
ffffffffc020698c:	000ab403          	ld	s0,0(s5)
ffffffffc0206990:	4641                	li	a2,16
ffffffffc0206992:	4581                	li	a1,0
ffffffffc0206994:	0b440413          	addi	s0,s0,180
ffffffffc0206998:	8522                	mv	a0,s0
ffffffffc020699a:	301040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc020699e:	463d                	li	a2,15
ffffffffc02069a0:	188c                	addi	a1,sp,112
ffffffffc02069a2:	8522                	mv	a0,s0
ffffffffc02069a4:	349040ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc02069a8:	b3b1                	j	ffffffffc02066f4 <do_execve+0x27a>
ffffffffc02069aa:	7de2                	ld	s11,56(sp)
ffffffffc02069ac:	6406                	ld	s0,64(sp)
ffffffffc02069ae:	bd1d                	j	ffffffffc02067e4 <do_execve+0x36a>
ffffffffc02069b0:	0189b503          	ld	a0,24(s3)
ffffffffc02069b4:	5961                	li	s2,-8
ffffffffc02069b6:	8c6ff0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc02069ba:	854e                	mv	a0,s3
ffffffffc02069bc:	b9afd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc02069c0:	b151                	j	ffffffffc0206644 <do_execve+0x1ca>
ffffffffc02069c2:	479a                	lw	a5,132(sp)
ffffffffc02069c4:	0017f693          	andi	a3,a5,1
ffffffffc02069c8:	c291                	beqz	a3,ffffffffc02069cc <do_execve+0x552>
ffffffffc02069ca:	4691                	li	a3,4
ffffffffc02069cc:	0027f713          	andi	a4,a5,2
ffffffffc02069d0:	8b91                	andi	a5,a5,4
ffffffffc02069d2:	e771                	bnez	a4,ffffffffc0206a9e <do_execve+0x624>
ffffffffc02069d4:	4745                	li	a4,17
ffffffffc02069d6:	e4ba                	sd	a4,72(sp)
ffffffffc02069d8:	c789                	beqz	a5,ffffffffc02069e2 <do_execve+0x568>
ffffffffc02069da:	47cd                	li	a5,19
ffffffffc02069dc:	0016e693          	ori	a3,a3,1
ffffffffc02069e0:	e4be                	sd	a5,72(sp)
ffffffffc02069e2:	0026f793          	andi	a5,a3,2
ffffffffc02069e6:	efdd                	bnez	a5,ffffffffc0206aa4 <do_execve+0x62a>
ffffffffc02069e8:	0046f793          	andi	a5,a3,4
ffffffffc02069ec:	c789                	beqz	a5,ffffffffc02069f6 <do_execve+0x57c>
ffffffffc02069ee:	67a6                	ld	a5,72(sp)
ffffffffc02069f0:	0087e793          	ori	a5,a5,8
ffffffffc02069f4:	e4be                	sd	a5,72(sp)
ffffffffc02069f6:	65ca                	ld	a1,144(sp)
ffffffffc02069f8:	4701                	li	a4,0
ffffffffc02069fa:	854e                	mv	a0,s3
ffffffffc02069fc:	bacfd0ef          	jal	ra,ffffffffc0203da8 <mm_map>
ffffffffc0206a00:	e02a                	sd	a0,0(sp)
ffffffffc0206a02:	f545                	bnez	a0,ffffffffc02069aa <do_execve+0x530>
ffffffffc0206a04:	644a                	ld	s0,144(sp)
ffffffffc0206a06:	7c0a                	ld	s8,160(sp)
ffffffffc0206a08:	77fd                	lui	a5,0xfffff
ffffffffc0206a0a:	6baa                	ld	s7,136(sp)
ffffffffc0206a0c:	01840a33          	add	s4,s0,s8
ffffffffc0206a10:	00f47b33          	and	s6,s0,a5
ffffffffc0206a14:	1d447163          	bgeu	s0,s4,ffffffffc0206bd6 <do_execve+0x75c>
ffffffffc0206a18:	57f1                	li	a5,-4
ffffffffc0206a1a:	e03e                	sd	a5,0(sp)
ffffffffc0206a1c:	ec4e                	sd	s3,24(sp)
ffffffffc0206a1e:	8c5a                	mv	s8,s6
ffffffffc0206a20:	67e2                	ld	a5,24(sp)
ffffffffc0206a22:	6626                	ld	a2,72(sp)
ffffffffc0206a24:	85e2                	mv	a1,s8
ffffffffc0206a26:	6f88                	ld	a0,24(a5)
ffffffffc0206a28:	8fafd0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206a2c:	8daa                	mv	s11,a0
ffffffffc0206a2e:	c951                	beqz	a0,ffffffffc0206ac2 <do_execve+0x648>
ffffffffc0206a30:	6785                	lui	a5,0x1
ffffffffc0206a32:	00fc0b33          	add	s6,s8,a5
ffffffffc0206a36:	408b09b3          	sub	s3,s6,s0
ffffffffc0206a3a:	016a7463          	bgeu	s4,s6,ffffffffc0206a42 <do_execve+0x5c8>
ffffffffc0206a3e:	408a09b3          	sub	s3,s4,s0
ffffffffc0206a42:	000cb483          	ld	s1,0(s9)
ffffffffc0206a46:	7782                	ld	a5,32(sp)
ffffffffc0206a48:	000d3603          	ld	a2,0(s10)
ffffffffc0206a4c:	409d84b3          	sub	s1,s11,s1
ffffffffc0206a50:	8499                	srai	s1,s1,0x6
ffffffffc0206a52:	94be                	add	s1,s1,a5
ffffffffc0206a54:	67a2                	ld	a5,8(sp)
ffffffffc0206a56:	00f4f5b3          	and	a1,s1,a5
ffffffffc0206a5a:	04b2                	slli	s1,s1,0xc
ffffffffc0206a5c:	1ac5fe63          	bgeu	a1,a2,ffffffffc0206c18 <do_execve+0x79e>
ffffffffc0206a60:	00090797          	auipc	a5,0x90
ffffffffc0206a64:	e5878793          	addi	a5,a5,-424 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206a68:	639c                	ld	a5,0(a5)
ffffffffc0206a6a:	4601                	li	a2,0
ffffffffc0206a6c:	85de                	mv	a1,s7
ffffffffc0206a6e:	854a                	mv	a0,s2
ffffffffc0206a70:	f83e                	sd	a5,48(sp)
ffffffffc0206a72:	d1bfe0ef          	jal	ra,ffffffffc020578c <sysfile_seek>
ffffffffc0206a76:	e02a                	sd	a0,0(sp)
ffffffffc0206a78:	ed1d                	bnez	a0,ffffffffc0206ab6 <do_execve+0x63c>
ffffffffc0206a7a:	77c2                	ld	a5,48(sp)
ffffffffc0206a7c:	418405b3          	sub	a1,s0,s8
ffffffffc0206a80:	864e                	mv	a2,s3
ffffffffc0206a82:	94be                	add	s1,s1,a5
ffffffffc0206a84:	95a6                	add	a1,a1,s1
ffffffffc0206a86:	854a                	mv	a0,s2
ffffffffc0206a88:	ad7fe0ef          	jal	ra,ffffffffc020555e <sysfile_read>
ffffffffc0206a8c:	00a98f63          	beq	s3,a0,ffffffffc0206aaa <do_execve+0x630>
ffffffffc0206a90:	7de2                	ld	s11,56(sp)
ffffffffc0206a92:	69e2                	ld	s3,24(sp)
ffffffffc0206a94:	6406                	ld	s0,64(sp)
ffffffffc0206a96:	8a2a                	mv	s4,a0
ffffffffc0206a98:	d40552e3          	bgez	a0,ffffffffc02067dc <do_execve+0x362>
ffffffffc0206a9c:	b389                	j	ffffffffc02067de <do_execve+0x364>
ffffffffc0206a9e:	0026e693          	ori	a3,a3,2
ffffffffc0206aa2:	ff85                	bnez	a5,ffffffffc02069da <do_execve+0x560>
ffffffffc0206aa4:	47dd                	li	a5,23
ffffffffc0206aa6:	e4be                	sd	a5,72(sp)
ffffffffc0206aa8:	b781                	j	ffffffffc02069e8 <do_execve+0x56e>
ffffffffc0206aaa:	944e                	add	s0,s0,s3
ffffffffc0206aac:	9bce                	add	s7,s7,s3
ffffffffc0206aae:	03447d63          	bgeu	s0,s4,ffffffffc0206ae8 <do_execve+0x66e>
ffffffffc0206ab2:	8c5a                	mv	s8,s6
ffffffffc0206ab4:	b7b5                	j	ffffffffc0206a20 <do_execve+0x5a6>
ffffffffc0206ab6:	7de2                	ld	s11,56(sp)
ffffffffc0206ab8:	69e2                	ld	s3,24(sp)
ffffffffc0206aba:	6406                	ld	s0,64(sp)
ffffffffc0206abc:	b325                	j	ffffffffc02067e4 <do_execve+0x36a>
ffffffffc0206abe:	5b75                	li	s6,-3
ffffffffc0206ac0:	b915                	j	ffffffffc02066f4 <do_execve+0x27a>
ffffffffc0206ac2:	7de2                	ld	s11,56(sp)
ffffffffc0206ac4:	69e2                	ld	s3,24(sp)
ffffffffc0206ac6:	6b66                	ld	s6,88(sp)
ffffffffc0206ac8:	6406                	ld	s0,64(sp)
ffffffffc0206aca:	854e                	mv	a0,s3
ffffffffc0206acc:	c26fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206ad0:	0189b503          	ld	a0,24(s3)
ffffffffc0206ad4:	fa9fe0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206ad8:	854e                	mv	a0,s3
ffffffffc0206ada:	a7cfd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206ade:	6782                	ld	a5,0(sp)
ffffffffc0206ae0:	e80784e3          	beqz	a5,ffffffffc0206968 <do_execve+0x4ee>
ffffffffc0206ae4:	6902                	ld	s2,0(sp)
ffffffffc0206ae6:	beb9                	j	ffffffffc0206644 <do_execve+0x1ca>
ffffffffc0206ae8:	69e2                	ld	s3,24(sp)
ffffffffc0206aea:	64ca                	ld	s1,144(sp)
ffffffffc0206aec:	8a5a                	mv	s4,s6
ffffffffc0206aee:	762a                	ld	a2,168(sp)
ffffffffc0206af0:	94b2                	add	s1,s1,a2
ffffffffc0206af2:	05447b63          	bgeu	s0,s4,ffffffffc0206b48 <do_execve+0x6ce>
ffffffffc0206af6:	d0947de3          	bgeu	s0,s1,ffffffffc0206810 <do_execve+0x396>
ffffffffc0206afa:	6785                	lui	a5,0x1
ffffffffc0206afc:	00f40533          	add	a0,s0,a5
ffffffffc0206b00:	41450533          	sub	a0,a0,s4
ffffffffc0206b04:	40848b33          	sub	s6,s1,s0
ffffffffc0206b08:	0144e463          	bltu	s1,s4,ffffffffc0206b10 <do_execve+0x696>
ffffffffc0206b0c:	408a0b33          	sub	s6,s4,s0
ffffffffc0206b10:	000cb583          	ld	a1,0(s9)
ffffffffc0206b14:	7782                	ld	a5,32(sp)
ffffffffc0206b16:	000d3603          	ld	a2,0(s10)
ffffffffc0206b1a:	40bd86b3          	sub	a3,s11,a1
ffffffffc0206b1e:	8699                	srai	a3,a3,0x6
ffffffffc0206b20:	96be                	add	a3,a3,a5
ffffffffc0206b22:	67a2                	ld	a5,8(sp)
ffffffffc0206b24:	00f6f5b3          	and	a1,a3,a5
ffffffffc0206b28:	06b2                	slli	a3,a3,0xc
ffffffffc0206b2a:	0ec5f863          	bgeu	a1,a2,ffffffffc0206c1a <do_execve+0x7a0>
ffffffffc0206b2e:	00090797          	auipc	a5,0x90
ffffffffc0206b32:	d8a78793          	addi	a5,a5,-630 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206b36:	0007b803          	ld	a6,0(a5)
ffffffffc0206b3a:	865a                	mv	a2,s6
ffffffffc0206b3c:	4581                	li	a1,0
ffffffffc0206b3e:	96c2                	add	a3,a3,a6
ffffffffc0206b40:	9536                	add	a0,a0,a3
ffffffffc0206b42:	159040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0206b46:	945a                	add	s0,s0,s6
ffffffffc0206b48:	cc9474e3          	bgeu	s0,s1,ffffffffc0206810 <do_execve+0x396>
ffffffffc0206b4c:	6b26                	ld	s6,72(sp)
ffffffffc0206b4e:	7b82                	ld	s7,32(sp)
ffffffffc0206b50:	a0a9                	j	ffffffffc0206b9a <do_execve+0x720>
ffffffffc0206b52:	6785                	lui	a5,0x1
ffffffffc0206b54:	41440733          	sub	a4,s0,s4
ffffffffc0206b58:	9a3e                	add	s4,s4,a5
ffffffffc0206b5a:	408a0633          	sub	a2,s4,s0
ffffffffc0206b5e:	0144f463          	bgeu	s1,s4,ffffffffc0206b66 <do_execve+0x6ec>
ffffffffc0206b62:	40848633          	sub	a2,s1,s0
ffffffffc0206b66:	000cb783          	ld	a5,0(s9)
ffffffffc0206b6a:	65a2                	ld	a1,8(sp)
ffffffffc0206b6c:	000d3683          	ld	a3,0(s10)
ffffffffc0206b70:	40f507b3          	sub	a5,a0,a5
ffffffffc0206b74:	8799                	srai	a5,a5,0x6
ffffffffc0206b76:	97de                	add	a5,a5,s7
ffffffffc0206b78:	8dfd                	and	a1,a1,a5
ffffffffc0206b7a:	07b2                	slli	a5,a5,0xc
ffffffffc0206b7c:	0ad5fb63          	bgeu	a1,a3,ffffffffc0206c32 <do_execve+0x7b8>
ffffffffc0206b80:	00090697          	auipc	a3,0x90
ffffffffc0206b84:	d3868693          	addi	a3,a3,-712 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206b88:	6288                	ld	a0,0(a3)
ffffffffc0206b8a:	9432                	add	s0,s0,a2
ffffffffc0206b8c:	4581                	li	a1,0
ffffffffc0206b8e:	953e                	add	a0,a0,a5
ffffffffc0206b90:	953a                	add	a0,a0,a4
ffffffffc0206b92:	109040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0206b96:	c6947de3          	bgeu	s0,s1,ffffffffc0206810 <do_execve+0x396>
ffffffffc0206b9a:	0189b503          	ld	a0,24(s3)
ffffffffc0206b9e:	865a                	mv	a2,s6
ffffffffc0206ba0:	85d2                	mv	a1,s4
ffffffffc0206ba2:	f81fc0ef          	jal	ra,ffffffffc0203b22 <pgdir_alloc_page>
ffffffffc0206ba6:	f555                	bnez	a0,ffffffffc0206b52 <do_execve+0x6d8>
ffffffffc0206ba8:	7de2                	ld	s11,56(sp)
ffffffffc0206baa:	6b66                	ld	s6,88(sp)
ffffffffc0206bac:	6406                	ld	s0,64(sp)
ffffffffc0206bae:	bf31                	j	ffffffffc0206aca <do_execve+0x650>
ffffffffc0206bb0:	5b75                	li	s6,-3
ffffffffc0206bb2:	b20b9be3          	bnez	s7,ffffffffc02066e8 <do_execve+0x26e>
ffffffffc0206bb6:	be3d                	j	ffffffffc02066f4 <do_execve+0x27a>
ffffffffc0206bb8:	f00b83e3          	beqz	s7,ffffffffc0206abe <do_execve+0x644>
ffffffffc0206bbc:	038b8513          	addi	a0,s7,56
ffffffffc0206bc0:	9a1fd0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0206bc4:	5b75                	li	s6,-3
ffffffffc0206bc6:	040ba823          	sw	zero,80(s7)
ffffffffc0206bca:	b62d                	j	ffffffffc02066f4 <do_execve+0x27a>
ffffffffc0206bcc:	57e1                	li	a5,-8
ffffffffc0206bce:	7de2                	ld	s11,56(sp)
ffffffffc0206bd0:	6406                	ld	s0,64(sp)
ffffffffc0206bd2:	e03e                	sd	a5,0(sp)
ffffffffc0206bd4:	b901                	j	ffffffffc02067e4 <do_execve+0x36a>
ffffffffc0206bd6:	57f1                	li	a5,-4
ffffffffc0206bd8:	84a2                	mv	s1,s0
ffffffffc0206bda:	8a5a                	mv	s4,s6
ffffffffc0206bdc:	4d81                	li	s11,0
ffffffffc0206bde:	e03e                	sd	a5,0(sp)
ffffffffc0206be0:	b739                	j	ffffffffc0206aee <do_execve+0x674>
ffffffffc0206be2:	57f5                	li	a5,-3
ffffffffc0206be4:	e03e                	sd	a5,0(sp)
ffffffffc0206be6:	befd                	j	ffffffffc02067e4 <do_execve+0x36a>
ffffffffc0206be8:	854e                	mv	a0,s3
ffffffffc0206bea:	b08fd0ef          	jal	ra,ffffffffc0203ef2 <exit_mmap>
ffffffffc0206bee:	0189b503          	ld	a0,24(s3)
ffffffffc0206bf2:	5975                	li	s2,-3
ffffffffc0206bf4:	e89fe0ef          	jal	ra,ffffffffc0205a7c <put_pgdir.isra.0>
ffffffffc0206bf8:	854e                	mv	a0,s3
ffffffffc0206bfa:	95cfd0ef          	jal	ra,ffffffffc0203d56 <mm_destroy>
ffffffffc0206bfe:	b499                	j	ffffffffc0206644 <do_execve+0x1ca>
ffffffffc0206c00:	00006617          	auipc	a2,0x6
ffffffffc0206c04:	94860613          	addi	a2,a2,-1720 # ffffffffc020c548 <default_pmm_manager+0xe0>
ffffffffc0206c08:	33e00593          	li	a1,830
ffffffffc0206c0c:	00007517          	auipc	a0,0x7
ffffffffc0206c10:	89450513          	addi	a0,a0,-1900 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206c14:	88bf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c18:	86a6                	mv	a3,s1
ffffffffc0206c1a:	00006617          	auipc	a2,0x6
ffffffffc0206c1e:	88660613          	addi	a2,a2,-1914 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0206c22:	07100593          	li	a1,113
ffffffffc0206c26:	00006517          	auipc	a0,0x6
ffffffffc0206c2a:	8a250513          	addi	a0,a0,-1886 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0206c2e:	871f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c32:	86be                	mv	a3,a5
ffffffffc0206c34:	00006617          	auipc	a2,0x6
ffffffffc0206c38:	86c60613          	addi	a2,a2,-1940 # ffffffffc020c4a0 <default_pmm_manager+0x38>
ffffffffc0206c3c:	07100593          	li	a1,113
ffffffffc0206c40:	00006517          	auipc	a0,0x6
ffffffffc0206c44:	88850513          	addi	a0,a0,-1912 # ffffffffc020c4c8 <default_pmm_manager+0x60>
ffffffffc0206c48:	857f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c4c:	00007697          	auipc	a3,0x7
ffffffffc0206c50:	b4468693          	addi	a3,a3,-1212 # ffffffffc020d790 <CSWTCH.79+0x400>
ffffffffc0206c54:	00005617          	auipc	a2,0x5
ffffffffc0206c58:	d2c60613          	addi	a2,a2,-724 # ffffffffc020b980 <commands+0x210>
ffffffffc0206c5c:	33900593          	li	a1,825
ffffffffc0206c60:	00007517          	auipc	a0,0x7
ffffffffc0206c64:	84050513          	addi	a0,a0,-1984 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206c68:	837f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c6c:	00007697          	auipc	a3,0x7
ffffffffc0206c70:	adc68693          	addi	a3,a3,-1316 # ffffffffc020d748 <CSWTCH.79+0x3b8>
ffffffffc0206c74:	00005617          	auipc	a2,0x5
ffffffffc0206c78:	d0c60613          	addi	a2,a2,-756 # ffffffffc020b980 <commands+0x210>
ffffffffc0206c7c:	33800593          	li	a1,824
ffffffffc0206c80:	00007517          	auipc	a0,0x7
ffffffffc0206c84:	82050513          	addi	a0,a0,-2016 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206c88:	817f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c8c:	00007697          	auipc	a3,0x7
ffffffffc0206c90:	a7468693          	addi	a3,a3,-1420 # ffffffffc020d700 <CSWTCH.79+0x370>
ffffffffc0206c94:	00005617          	auipc	a2,0x5
ffffffffc0206c98:	cec60613          	addi	a2,a2,-788 # ffffffffc020b980 <commands+0x210>
ffffffffc0206c9c:	33700593          	li	a1,823
ffffffffc0206ca0:	00007517          	auipc	a0,0x7
ffffffffc0206ca4:	80050513          	addi	a0,a0,-2048 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206ca8:	ff6f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206cac:	00007697          	auipc	a3,0x7
ffffffffc0206cb0:	a0c68693          	addi	a3,a3,-1524 # ffffffffc020d6b8 <CSWTCH.79+0x328>
ffffffffc0206cb4:	00005617          	auipc	a2,0x5
ffffffffc0206cb8:	ccc60613          	addi	a2,a2,-820 # ffffffffc020b980 <commands+0x210>
ffffffffc0206cbc:	33600593          	li	a1,822
ffffffffc0206cc0:	00006517          	auipc	a0,0x6
ffffffffc0206cc4:	7e050513          	addi	a0,a0,2016 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206cc8:	fd6f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206ccc <user_main>:
ffffffffc0206ccc:	7179                	addi	sp,sp,-48
ffffffffc0206cce:	e84a                	sd	s2,16(sp)
ffffffffc0206cd0:	00090917          	auipc	s2,0x90
ffffffffc0206cd4:	bf090913          	addi	s2,s2,-1040 # ffffffffc02968c0 <current>
ffffffffc0206cd8:	00093783          	ld	a5,0(s2)
ffffffffc0206cdc:	00007617          	auipc	a2,0x7
ffffffffc0206ce0:	afc60613          	addi	a2,a2,-1284 # ffffffffc020d7d8 <CSWTCH.79+0x448>
ffffffffc0206ce4:	00007517          	auipc	a0,0x7
ffffffffc0206ce8:	afc50513          	addi	a0,a0,-1284 # ffffffffc020d7e0 <CSWTCH.79+0x450>
ffffffffc0206cec:	43cc                	lw	a1,4(a5)
ffffffffc0206cee:	f406                	sd	ra,40(sp)
ffffffffc0206cf0:	f022                	sd	s0,32(sp)
ffffffffc0206cf2:	ec26                	sd	s1,24(sp)
ffffffffc0206cf4:	e032                	sd	a2,0(sp)
ffffffffc0206cf6:	e402                	sd	zero,8(sp)
ffffffffc0206cf8:	caef90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206cfc:	6782                	ld	a5,0(sp)
ffffffffc0206cfe:	cfb9                	beqz	a5,ffffffffc0206d5c <user_main+0x90>
ffffffffc0206d00:	003c                	addi	a5,sp,8
ffffffffc0206d02:	4401                	li	s0,0
ffffffffc0206d04:	6398                	ld	a4,0(a5)
ffffffffc0206d06:	0405                	addi	s0,s0,1
ffffffffc0206d08:	07a1                	addi	a5,a5,8
ffffffffc0206d0a:	ff6d                	bnez	a4,ffffffffc0206d04 <user_main+0x38>
ffffffffc0206d0c:	00093783          	ld	a5,0(s2)
ffffffffc0206d10:	12000613          	li	a2,288
ffffffffc0206d14:	6b84                	ld	s1,16(a5)
ffffffffc0206d16:	73cc                	ld	a1,160(a5)
ffffffffc0206d18:	6789                	lui	a5,0x2
ffffffffc0206d1a:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206d1e:	94be                	add	s1,s1,a5
ffffffffc0206d20:	8526                	mv	a0,s1
ffffffffc0206d22:	7ca040ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0206d26:	00093783          	ld	a5,0(s2)
ffffffffc0206d2a:	860a                	mv	a2,sp
ffffffffc0206d2c:	0004059b          	sext.w	a1,s0
ffffffffc0206d30:	f3c4                	sd	s1,160(a5)
ffffffffc0206d32:	00007517          	auipc	a0,0x7
ffffffffc0206d36:	aa650513          	addi	a0,a0,-1370 # ffffffffc020d7d8 <CSWTCH.79+0x448>
ffffffffc0206d3a:	f40ff0ef          	jal	ra,ffffffffc020647a <do_execve>
ffffffffc0206d3e:	8126                	mv	sp,s1
ffffffffc0206d40:	d10fa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0206d44:	00007617          	auipc	a2,0x7
ffffffffc0206d48:	ac460613          	addi	a2,a2,-1340 # ffffffffc020d808 <CSWTCH.79+0x478>
ffffffffc0206d4c:	47900593          	li	a1,1145
ffffffffc0206d50:	00006517          	auipc	a0,0x6
ffffffffc0206d54:	75050513          	addi	a0,a0,1872 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206d58:	f46f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206d5c:	4401                	li	s0,0
ffffffffc0206d5e:	b77d                	j	ffffffffc0206d0c <user_main+0x40>

ffffffffc0206d60 <do_yield>:
ffffffffc0206d60:	00090797          	auipc	a5,0x90
ffffffffc0206d64:	b607b783          	ld	a5,-1184(a5) # ffffffffc02968c0 <current>
ffffffffc0206d68:	4705                	li	a4,1
ffffffffc0206d6a:	ef98                	sd	a4,24(a5)
ffffffffc0206d6c:	4501                	li	a0,0
ffffffffc0206d6e:	8082                	ret

ffffffffc0206d70 <do_wait>:
ffffffffc0206d70:	1101                	addi	sp,sp,-32
ffffffffc0206d72:	e822                	sd	s0,16(sp)
ffffffffc0206d74:	e426                	sd	s1,8(sp)
ffffffffc0206d76:	ec06                	sd	ra,24(sp)
ffffffffc0206d78:	842e                	mv	s0,a1
ffffffffc0206d7a:	84aa                	mv	s1,a0
ffffffffc0206d7c:	c999                	beqz	a1,ffffffffc0206d92 <do_wait+0x22>
ffffffffc0206d7e:	00090797          	auipc	a5,0x90
ffffffffc0206d82:	b427b783          	ld	a5,-1214(a5) # ffffffffc02968c0 <current>
ffffffffc0206d86:	7788                	ld	a0,40(a5)
ffffffffc0206d88:	4685                	li	a3,1
ffffffffc0206d8a:	4611                	li	a2,4
ffffffffc0206d8c:	d06fd0ef          	jal	ra,ffffffffc0204292 <user_mem_check>
ffffffffc0206d90:	c909                	beqz	a0,ffffffffc0206da2 <do_wait+0x32>
ffffffffc0206d92:	85a2                	mv	a1,s0
ffffffffc0206d94:	6442                	ld	s0,16(sp)
ffffffffc0206d96:	60e2                	ld	ra,24(sp)
ffffffffc0206d98:	8526                	mv	a0,s1
ffffffffc0206d9a:	64a2                	ld	s1,8(sp)
ffffffffc0206d9c:	6105                	addi	sp,sp,32
ffffffffc0206d9e:	bbaff06f          	j	ffffffffc0206158 <do_wait.part.0>
ffffffffc0206da2:	60e2                	ld	ra,24(sp)
ffffffffc0206da4:	6442                	ld	s0,16(sp)
ffffffffc0206da6:	64a2                	ld	s1,8(sp)
ffffffffc0206da8:	5575                	li	a0,-3
ffffffffc0206daa:	6105                	addi	sp,sp,32
ffffffffc0206dac:	8082                	ret

ffffffffc0206dae <do_kill>:
ffffffffc0206dae:	1141                	addi	sp,sp,-16
ffffffffc0206db0:	6789                	lui	a5,0x2
ffffffffc0206db2:	e406                	sd	ra,8(sp)
ffffffffc0206db4:	e022                	sd	s0,0(sp)
ffffffffc0206db6:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206dba:	17f9                	addi	a5,a5,-2
ffffffffc0206dbc:	02e7e963          	bltu	a5,a4,ffffffffc0206dee <do_kill+0x40>
ffffffffc0206dc0:	842a                	mv	s0,a0
ffffffffc0206dc2:	45a9                	li	a1,10
ffffffffc0206dc4:	2501                	sext.w	a0,a0
ffffffffc0206dc6:	1a0040ef          	jal	ra,ffffffffc020af66 <hash32>
ffffffffc0206dca:	02051793          	slli	a5,a0,0x20
ffffffffc0206dce:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206dd2:	0008b797          	auipc	a5,0x8b
ffffffffc0206dd6:	9ee78793          	addi	a5,a5,-1554 # ffffffffc02917c0 <hash_list>
ffffffffc0206dda:	953e                	add	a0,a0,a5
ffffffffc0206ddc:	87aa                	mv	a5,a0
ffffffffc0206dde:	a029                	j	ffffffffc0206de8 <do_kill+0x3a>
ffffffffc0206de0:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206de4:	00870b63          	beq	a4,s0,ffffffffc0206dfa <do_kill+0x4c>
ffffffffc0206de8:	679c                	ld	a5,8(a5)
ffffffffc0206dea:	fef51be3          	bne	a0,a5,ffffffffc0206de0 <do_kill+0x32>
ffffffffc0206dee:	5475                	li	s0,-3
ffffffffc0206df0:	60a2                	ld	ra,8(sp)
ffffffffc0206df2:	8522                	mv	a0,s0
ffffffffc0206df4:	6402                	ld	s0,0(sp)
ffffffffc0206df6:	0141                	addi	sp,sp,16
ffffffffc0206df8:	8082                	ret
ffffffffc0206dfa:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206dfe:	00177693          	andi	a3,a4,1
ffffffffc0206e02:	e295                	bnez	a3,ffffffffc0206e26 <do_kill+0x78>
ffffffffc0206e04:	4bd4                	lw	a3,20(a5)
ffffffffc0206e06:	00176713          	ori	a4,a4,1
ffffffffc0206e0a:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206e0e:	4401                	li	s0,0
ffffffffc0206e10:	fe06d0e3          	bgez	a3,ffffffffc0206df0 <do_kill+0x42>
ffffffffc0206e14:	f2878513          	addi	a0,a5,-216
ffffffffc0206e18:	45a000ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc0206e1c:	60a2                	ld	ra,8(sp)
ffffffffc0206e1e:	8522                	mv	a0,s0
ffffffffc0206e20:	6402                	ld	s0,0(sp)
ffffffffc0206e22:	0141                	addi	sp,sp,16
ffffffffc0206e24:	8082                	ret
ffffffffc0206e26:	545d                	li	s0,-9
ffffffffc0206e28:	b7e1                	j	ffffffffc0206df0 <do_kill+0x42>

ffffffffc0206e2a <proc_init>:
ffffffffc0206e2a:	1101                	addi	sp,sp,-32
ffffffffc0206e2c:	e426                	sd	s1,8(sp)
ffffffffc0206e2e:	0008f797          	auipc	a5,0x8f
ffffffffc0206e32:	99278793          	addi	a5,a5,-1646 # ffffffffc02957c0 <proc_list>
ffffffffc0206e36:	ec06                	sd	ra,24(sp)
ffffffffc0206e38:	e822                	sd	s0,16(sp)
ffffffffc0206e3a:	e04a                	sd	s2,0(sp)
ffffffffc0206e3c:	0008b497          	auipc	s1,0x8b
ffffffffc0206e40:	98448493          	addi	s1,s1,-1660 # ffffffffc02917c0 <hash_list>
ffffffffc0206e44:	e79c                	sd	a5,8(a5)
ffffffffc0206e46:	e39c                	sd	a5,0(a5)
ffffffffc0206e48:	0008f717          	auipc	a4,0x8f
ffffffffc0206e4c:	97870713          	addi	a4,a4,-1672 # ffffffffc02957c0 <proc_list>
ffffffffc0206e50:	87a6                	mv	a5,s1
ffffffffc0206e52:	e79c                	sd	a5,8(a5)
ffffffffc0206e54:	e39c                	sd	a5,0(a5)
ffffffffc0206e56:	07c1                	addi	a5,a5,16
ffffffffc0206e58:	fef71de3          	bne	a4,a5,ffffffffc0206e52 <proc_init+0x28>
ffffffffc0206e5c:	b79fe0ef          	jal	ra,ffffffffc02059d4 <alloc_proc>
ffffffffc0206e60:	00090917          	auipc	s2,0x90
ffffffffc0206e64:	a6890913          	addi	s2,s2,-1432 # ffffffffc02968c8 <idleproc>
ffffffffc0206e68:	00a93023          	sd	a0,0(s2)
ffffffffc0206e6c:	842a                	mv	s0,a0
ffffffffc0206e6e:	12050863          	beqz	a0,ffffffffc0206f9e <proc_init+0x174>
ffffffffc0206e72:	4789                	li	a5,2
ffffffffc0206e74:	e11c                	sd	a5,0(a0)
ffffffffc0206e76:	0000a797          	auipc	a5,0xa
ffffffffc0206e7a:	18a78793          	addi	a5,a5,394 # ffffffffc0211000 <bootstack>
ffffffffc0206e7e:	e91c                	sd	a5,16(a0)
ffffffffc0206e80:	4785                	li	a5,1
ffffffffc0206e82:	ed1c                	sd	a5,24(a0)
ffffffffc0206e84:	b4afe0ef          	jal	ra,ffffffffc02051ce <files_create>
ffffffffc0206e88:	14a43423          	sd	a0,328(s0)
ffffffffc0206e8c:	0e050d63          	beqz	a0,ffffffffc0206f86 <proc_init+0x15c>
ffffffffc0206e90:	00093403          	ld	s0,0(s2)
ffffffffc0206e94:	4641                	li	a2,16
ffffffffc0206e96:	4581                	li	a1,0
ffffffffc0206e98:	14843703          	ld	a4,328(s0)
ffffffffc0206e9c:	0b440413          	addi	s0,s0,180
ffffffffc0206ea0:	8522                	mv	a0,s0
ffffffffc0206ea2:	4b1c                	lw	a5,16(a4)
ffffffffc0206ea4:	2785                	addiw	a5,a5,1
ffffffffc0206ea6:	cb1c                	sw	a5,16(a4)
ffffffffc0206ea8:	5f2040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0206eac:	463d                	li	a2,15
ffffffffc0206eae:	00007597          	auipc	a1,0x7
ffffffffc0206eb2:	9ba58593          	addi	a1,a1,-1606 # ffffffffc020d868 <CSWTCH.79+0x4d8>
ffffffffc0206eb6:	8522                	mv	a0,s0
ffffffffc0206eb8:	634040ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0206ebc:	00090717          	auipc	a4,0x90
ffffffffc0206ec0:	a1c70713          	addi	a4,a4,-1508 # ffffffffc02968d8 <nr_process>
ffffffffc0206ec4:	431c                	lw	a5,0(a4)
ffffffffc0206ec6:	00093683          	ld	a3,0(s2)
ffffffffc0206eca:	4601                	li	a2,0
ffffffffc0206ecc:	2785                	addiw	a5,a5,1
ffffffffc0206ece:	4581                	li	a1,0
ffffffffc0206ed0:	fffff517          	auipc	a0,0xfffff
ffffffffc0206ed4:	45a50513          	addi	a0,a0,1114 # ffffffffc020632a <init_main>
ffffffffc0206ed8:	c31c                	sw	a5,0(a4)
ffffffffc0206eda:	00090797          	auipc	a5,0x90
ffffffffc0206ede:	9ed7b323          	sd	a3,-1562(a5) # ffffffffc02968c0 <current>
ffffffffc0206ee2:	8c4ff0ef          	jal	ra,ffffffffc0205fa6 <kernel_thread>
ffffffffc0206ee6:	842a                	mv	s0,a0
ffffffffc0206ee8:	08a05363          	blez	a0,ffffffffc0206f6e <proc_init+0x144>
ffffffffc0206eec:	6789                	lui	a5,0x2
ffffffffc0206eee:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206ef2:	17f9                	addi	a5,a5,-2
ffffffffc0206ef4:	2501                	sext.w	a0,a0
ffffffffc0206ef6:	02e7e363          	bltu	a5,a4,ffffffffc0206f1c <proc_init+0xf2>
ffffffffc0206efa:	45a9                	li	a1,10
ffffffffc0206efc:	06a040ef          	jal	ra,ffffffffc020af66 <hash32>
ffffffffc0206f00:	02051793          	slli	a5,a0,0x20
ffffffffc0206f04:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206f08:	96a6                	add	a3,a3,s1
ffffffffc0206f0a:	87b6                	mv	a5,a3
ffffffffc0206f0c:	a029                	j	ffffffffc0206f16 <proc_init+0xec>
ffffffffc0206f0e:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206f12:	04870b63          	beq	a4,s0,ffffffffc0206f68 <proc_init+0x13e>
ffffffffc0206f16:	679c                	ld	a5,8(a5)
ffffffffc0206f18:	fef69be3          	bne	a3,a5,ffffffffc0206f0e <proc_init+0xe4>
ffffffffc0206f1c:	4781                	li	a5,0
ffffffffc0206f1e:	0b478493          	addi	s1,a5,180
ffffffffc0206f22:	4641                	li	a2,16
ffffffffc0206f24:	4581                	li	a1,0
ffffffffc0206f26:	00090417          	auipc	s0,0x90
ffffffffc0206f2a:	9aa40413          	addi	s0,s0,-1622 # ffffffffc02968d0 <initproc>
ffffffffc0206f2e:	8526                	mv	a0,s1
ffffffffc0206f30:	e01c                	sd	a5,0(s0)
ffffffffc0206f32:	568040ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0206f36:	463d                	li	a2,15
ffffffffc0206f38:	00007597          	auipc	a1,0x7
ffffffffc0206f3c:	95858593          	addi	a1,a1,-1704 # ffffffffc020d890 <CSWTCH.79+0x500>
ffffffffc0206f40:	8526                	mv	a0,s1
ffffffffc0206f42:	5aa040ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc0206f46:	00093783          	ld	a5,0(s2)
ffffffffc0206f4a:	c7d1                	beqz	a5,ffffffffc0206fd6 <proc_init+0x1ac>
ffffffffc0206f4c:	43dc                	lw	a5,4(a5)
ffffffffc0206f4e:	e7c1                	bnez	a5,ffffffffc0206fd6 <proc_init+0x1ac>
ffffffffc0206f50:	601c                	ld	a5,0(s0)
ffffffffc0206f52:	c3b5                	beqz	a5,ffffffffc0206fb6 <proc_init+0x18c>
ffffffffc0206f54:	43d8                	lw	a4,4(a5)
ffffffffc0206f56:	4785                	li	a5,1
ffffffffc0206f58:	04f71f63          	bne	a4,a5,ffffffffc0206fb6 <proc_init+0x18c>
ffffffffc0206f5c:	60e2                	ld	ra,24(sp)
ffffffffc0206f5e:	6442                	ld	s0,16(sp)
ffffffffc0206f60:	64a2                	ld	s1,8(sp)
ffffffffc0206f62:	6902                	ld	s2,0(sp)
ffffffffc0206f64:	6105                	addi	sp,sp,32
ffffffffc0206f66:	8082                	ret
ffffffffc0206f68:	f2878793          	addi	a5,a5,-216
ffffffffc0206f6c:	bf4d                	j	ffffffffc0206f1e <proc_init+0xf4>
ffffffffc0206f6e:	00007617          	auipc	a2,0x7
ffffffffc0206f72:	90260613          	addi	a2,a2,-1790 # ffffffffc020d870 <CSWTCH.79+0x4e0>
ffffffffc0206f76:	4c500593          	li	a1,1221
ffffffffc0206f7a:	00006517          	auipc	a0,0x6
ffffffffc0206f7e:	52650513          	addi	a0,a0,1318 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206f82:	d1cf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f86:	00007617          	auipc	a2,0x7
ffffffffc0206f8a:	8ba60613          	addi	a2,a2,-1862 # ffffffffc020d840 <CSWTCH.79+0x4b0>
ffffffffc0206f8e:	4b900593          	li	a1,1209
ffffffffc0206f92:	00006517          	auipc	a0,0x6
ffffffffc0206f96:	50e50513          	addi	a0,a0,1294 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206f9a:	d04f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206f9e:	00007617          	auipc	a2,0x7
ffffffffc0206fa2:	88a60613          	addi	a2,a2,-1910 # ffffffffc020d828 <CSWTCH.79+0x498>
ffffffffc0206fa6:	4af00593          	li	a1,1199
ffffffffc0206faa:	00006517          	auipc	a0,0x6
ffffffffc0206fae:	4f650513          	addi	a0,a0,1270 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206fb2:	cecf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fb6:	00007697          	auipc	a3,0x7
ffffffffc0206fba:	90a68693          	addi	a3,a3,-1782 # ffffffffc020d8c0 <CSWTCH.79+0x530>
ffffffffc0206fbe:	00005617          	auipc	a2,0x5
ffffffffc0206fc2:	9c260613          	addi	a2,a2,-1598 # ffffffffc020b980 <commands+0x210>
ffffffffc0206fc6:	4cc00593          	li	a1,1228
ffffffffc0206fca:	00006517          	auipc	a0,0x6
ffffffffc0206fce:	4d650513          	addi	a0,a0,1238 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206fd2:	cccf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206fd6:	00007697          	auipc	a3,0x7
ffffffffc0206fda:	8c268693          	addi	a3,a3,-1854 # ffffffffc020d898 <CSWTCH.79+0x508>
ffffffffc0206fde:	00005617          	auipc	a2,0x5
ffffffffc0206fe2:	9a260613          	addi	a2,a2,-1630 # ffffffffc020b980 <commands+0x210>
ffffffffc0206fe6:	4cb00593          	li	a1,1227
ffffffffc0206fea:	00006517          	auipc	a0,0x6
ffffffffc0206fee:	4b650513          	addi	a0,a0,1206 # ffffffffc020d4a0 <CSWTCH.79+0x110>
ffffffffc0206ff2:	cacf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206ff6 <cpu_idle>:
ffffffffc0206ff6:	1141                	addi	sp,sp,-16
ffffffffc0206ff8:	e022                	sd	s0,0(sp)
ffffffffc0206ffa:	e406                	sd	ra,8(sp)
ffffffffc0206ffc:	00090417          	auipc	s0,0x90
ffffffffc0207000:	8c440413          	addi	s0,s0,-1852 # ffffffffc02968c0 <current>
ffffffffc0207004:	6018                	ld	a4,0(s0)
ffffffffc0207006:	6f1c                	ld	a5,24(a4)
ffffffffc0207008:	dffd                	beqz	a5,ffffffffc0207006 <cpu_idle+0x10>
ffffffffc020700a:	31a000ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc020700e:	bfdd                	j	ffffffffc0207004 <cpu_idle+0xe>

ffffffffc0207010 <lab6_set_priority>:
ffffffffc0207010:	1141                	addi	sp,sp,-16
ffffffffc0207012:	e022                	sd	s0,0(sp)
ffffffffc0207014:	85aa                	mv	a1,a0
ffffffffc0207016:	842a                	mv	s0,a0
ffffffffc0207018:	00007517          	auipc	a0,0x7
ffffffffc020701c:	8d050513          	addi	a0,a0,-1840 # ffffffffc020d8e8 <CSWTCH.79+0x558>
ffffffffc0207020:	e406                	sd	ra,8(sp)
ffffffffc0207022:	984f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207026:	00090797          	auipc	a5,0x90
ffffffffc020702a:	89a7b783          	ld	a5,-1894(a5) # ffffffffc02968c0 <current>
ffffffffc020702e:	e801                	bnez	s0,ffffffffc020703e <lab6_set_priority+0x2e>
ffffffffc0207030:	60a2                	ld	ra,8(sp)
ffffffffc0207032:	6402                	ld	s0,0(sp)
ffffffffc0207034:	4705                	li	a4,1
ffffffffc0207036:	14e7a223          	sw	a4,324(a5)
ffffffffc020703a:	0141                	addi	sp,sp,16
ffffffffc020703c:	8082                	ret
ffffffffc020703e:	60a2                	ld	ra,8(sp)
ffffffffc0207040:	1487a223          	sw	s0,324(a5)
ffffffffc0207044:	6402                	ld	s0,0(sp)
ffffffffc0207046:	0141                	addi	sp,sp,16
ffffffffc0207048:	8082                	ret

ffffffffc020704a <do_sleep>:
ffffffffc020704a:	c539                	beqz	a0,ffffffffc0207098 <do_sleep+0x4e>
ffffffffc020704c:	7179                	addi	sp,sp,-48
ffffffffc020704e:	f022                	sd	s0,32(sp)
ffffffffc0207050:	f406                	sd	ra,40(sp)
ffffffffc0207052:	842a                	mv	s0,a0
ffffffffc0207054:	100027f3          	csrr	a5,sstatus
ffffffffc0207058:	8b89                	andi	a5,a5,2
ffffffffc020705a:	e3a9                	bnez	a5,ffffffffc020709c <do_sleep+0x52>
ffffffffc020705c:	00090797          	auipc	a5,0x90
ffffffffc0207060:	8647b783          	ld	a5,-1948(a5) # ffffffffc02968c0 <current>
ffffffffc0207064:	0818                	addi	a4,sp,16
ffffffffc0207066:	c02a                	sw	a0,0(sp)
ffffffffc0207068:	ec3a                	sd	a4,24(sp)
ffffffffc020706a:	e83a                	sd	a4,16(sp)
ffffffffc020706c:	e43e                	sd	a5,8(sp)
ffffffffc020706e:	4705                	li	a4,1
ffffffffc0207070:	c398                	sw	a4,0(a5)
ffffffffc0207072:	80000737          	lui	a4,0x80000
ffffffffc0207076:	840a                	mv	s0,sp
ffffffffc0207078:	0709                	addi	a4,a4,2
ffffffffc020707a:	0ee7a623          	sw	a4,236(a5)
ffffffffc020707e:	8522                	mv	a0,s0
ffffffffc0207080:	364000ef          	jal	ra,ffffffffc02073e4 <add_timer>
ffffffffc0207084:	2a0000ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc0207088:	8522                	mv	a0,s0
ffffffffc020708a:	422000ef          	jal	ra,ffffffffc02074ac <del_timer>
ffffffffc020708e:	70a2                	ld	ra,40(sp)
ffffffffc0207090:	7402                	ld	s0,32(sp)
ffffffffc0207092:	4501                	li	a0,0
ffffffffc0207094:	6145                	addi	sp,sp,48
ffffffffc0207096:	8082                	ret
ffffffffc0207098:	4501                	li	a0,0
ffffffffc020709a:	8082                	ret
ffffffffc020709c:	bd7f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02070a0:	00090797          	auipc	a5,0x90
ffffffffc02070a4:	8207b783          	ld	a5,-2016(a5) # ffffffffc02968c0 <current>
ffffffffc02070a8:	0818                	addi	a4,sp,16
ffffffffc02070aa:	c022                	sw	s0,0(sp)
ffffffffc02070ac:	e43e                	sd	a5,8(sp)
ffffffffc02070ae:	ec3a                	sd	a4,24(sp)
ffffffffc02070b0:	e83a                	sd	a4,16(sp)
ffffffffc02070b2:	4705                	li	a4,1
ffffffffc02070b4:	c398                	sw	a4,0(a5)
ffffffffc02070b6:	80000737          	lui	a4,0x80000
ffffffffc02070ba:	0709                	addi	a4,a4,2
ffffffffc02070bc:	840a                	mv	s0,sp
ffffffffc02070be:	8522                	mv	a0,s0
ffffffffc02070c0:	0ee7a623          	sw	a4,236(a5)
ffffffffc02070c4:	320000ef          	jal	ra,ffffffffc02073e4 <add_timer>
ffffffffc02070c8:	ba5f90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02070cc:	bf65                	j	ffffffffc0207084 <do_sleep+0x3a>

ffffffffc02070ce <switch_to>:
ffffffffc02070ce:	00153023          	sd	ra,0(a0)
ffffffffc02070d2:	00253423          	sd	sp,8(a0)
ffffffffc02070d6:	e900                	sd	s0,16(a0)
ffffffffc02070d8:	ed04                	sd	s1,24(a0)
ffffffffc02070da:	03253023          	sd	s2,32(a0)
ffffffffc02070de:	03353423          	sd	s3,40(a0)
ffffffffc02070e2:	03453823          	sd	s4,48(a0)
ffffffffc02070e6:	03553c23          	sd	s5,56(a0)
ffffffffc02070ea:	05653023          	sd	s6,64(a0)
ffffffffc02070ee:	05753423          	sd	s7,72(a0)
ffffffffc02070f2:	05853823          	sd	s8,80(a0)
ffffffffc02070f6:	05953c23          	sd	s9,88(a0)
ffffffffc02070fa:	07a53023          	sd	s10,96(a0)
ffffffffc02070fe:	07b53423          	sd	s11,104(a0)
ffffffffc0207102:	0005b083          	ld	ra,0(a1)
ffffffffc0207106:	0085b103          	ld	sp,8(a1)
ffffffffc020710a:	6980                	ld	s0,16(a1)
ffffffffc020710c:	6d84                	ld	s1,24(a1)
ffffffffc020710e:	0205b903          	ld	s2,32(a1)
ffffffffc0207112:	0285b983          	ld	s3,40(a1)
ffffffffc0207116:	0305ba03          	ld	s4,48(a1)
ffffffffc020711a:	0385ba83          	ld	s5,56(a1)
ffffffffc020711e:	0405bb03          	ld	s6,64(a1)
ffffffffc0207122:	0485bb83          	ld	s7,72(a1)
ffffffffc0207126:	0505bc03          	ld	s8,80(a1)
ffffffffc020712a:	0585bc83          	ld	s9,88(a1)
ffffffffc020712e:	0605bd03          	ld	s10,96(a1)
ffffffffc0207132:	0685bd83          	ld	s11,104(a1)
ffffffffc0207136:	8082                	ret

ffffffffc0207138 <RR_init>:
ffffffffc0207138:	e508                	sd	a0,8(a0)
ffffffffc020713a:	e108                	sd	a0,0(a0)
ffffffffc020713c:	00052823          	sw	zero,16(a0)
ffffffffc0207140:	8082                	ret

ffffffffc0207142 <RR_pick_next>:
ffffffffc0207142:	651c                	ld	a5,8(a0)
ffffffffc0207144:	00f50563          	beq	a0,a5,ffffffffc020714e <RR_pick_next+0xc>
ffffffffc0207148:	ef078513          	addi	a0,a5,-272
ffffffffc020714c:	8082                	ret
ffffffffc020714e:	4501                	li	a0,0
ffffffffc0207150:	8082                	ret

ffffffffc0207152 <RR_proc_tick>:
ffffffffc0207152:	1205a783          	lw	a5,288(a1)
ffffffffc0207156:	00f05563          	blez	a5,ffffffffc0207160 <RR_proc_tick+0xe>
ffffffffc020715a:	37fd                	addiw	a5,a5,-1
ffffffffc020715c:	12f5a023          	sw	a5,288(a1)
ffffffffc0207160:	e399                	bnez	a5,ffffffffc0207166 <RR_proc_tick+0x14>
ffffffffc0207162:	4785                	li	a5,1
ffffffffc0207164:	ed9c                	sd	a5,24(a1)
ffffffffc0207166:	8082                	ret

ffffffffc0207168 <RR_dequeue>:
ffffffffc0207168:	1185b703          	ld	a4,280(a1)
ffffffffc020716c:	11058793          	addi	a5,a1,272
ffffffffc0207170:	02e78363          	beq	a5,a4,ffffffffc0207196 <RR_dequeue+0x2e>
ffffffffc0207174:	1085b683          	ld	a3,264(a1)
ffffffffc0207178:	00a69f63          	bne	a3,a0,ffffffffc0207196 <RR_dequeue+0x2e>
ffffffffc020717c:	1105b503          	ld	a0,272(a1)
ffffffffc0207180:	4a90                	lw	a2,16(a3)
ffffffffc0207182:	e518                	sd	a4,8(a0)
ffffffffc0207184:	e308                	sd	a0,0(a4)
ffffffffc0207186:	10f5bc23          	sd	a5,280(a1)
ffffffffc020718a:	10f5b823          	sd	a5,272(a1)
ffffffffc020718e:	fff6079b          	addiw	a5,a2,-1
ffffffffc0207192:	ca9c                	sw	a5,16(a3)
ffffffffc0207194:	8082                	ret
ffffffffc0207196:	1141                	addi	sp,sp,-16
ffffffffc0207198:	00006697          	auipc	a3,0x6
ffffffffc020719c:	76868693          	addi	a3,a3,1896 # ffffffffc020d900 <CSWTCH.79+0x570>
ffffffffc02071a0:	00004617          	auipc	a2,0x4
ffffffffc02071a4:	7e060613          	addi	a2,a2,2016 # ffffffffc020b980 <commands+0x210>
ffffffffc02071a8:	03c00593          	li	a1,60
ffffffffc02071ac:	00006517          	auipc	a0,0x6
ffffffffc02071b0:	78c50513          	addi	a0,a0,1932 # ffffffffc020d938 <CSWTCH.79+0x5a8>
ffffffffc02071b4:	e406                	sd	ra,8(sp)
ffffffffc02071b6:	ae8f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02071ba <RR_enqueue>:
ffffffffc02071ba:	1185b703          	ld	a4,280(a1)
ffffffffc02071be:	11058793          	addi	a5,a1,272
ffffffffc02071c2:	02e79d63          	bne	a5,a4,ffffffffc02071fc <RR_enqueue+0x42>
ffffffffc02071c6:	6118                	ld	a4,0(a0)
ffffffffc02071c8:	1205a683          	lw	a3,288(a1)
ffffffffc02071cc:	e11c                	sd	a5,0(a0)
ffffffffc02071ce:	e71c                	sd	a5,8(a4)
ffffffffc02071d0:	10a5bc23          	sd	a0,280(a1)
ffffffffc02071d4:	10e5b823          	sd	a4,272(a1)
ffffffffc02071d8:	495c                	lw	a5,20(a0)
ffffffffc02071da:	ea89                	bnez	a3,ffffffffc02071ec <RR_enqueue+0x32>
ffffffffc02071dc:	12f5a023          	sw	a5,288(a1)
ffffffffc02071e0:	491c                	lw	a5,16(a0)
ffffffffc02071e2:	10a5b423          	sd	a0,264(a1)
ffffffffc02071e6:	2785                	addiw	a5,a5,1
ffffffffc02071e8:	c91c                	sw	a5,16(a0)
ffffffffc02071ea:	8082                	ret
ffffffffc02071ec:	fed7c8e3          	blt	a5,a3,ffffffffc02071dc <RR_enqueue+0x22>
ffffffffc02071f0:	491c                	lw	a5,16(a0)
ffffffffc02071f2:	10a5b423          	sd	a0,264(a1)
ffffffffc02071f6:	2785                	addiw	a5,a5,1
ffffffffc02071f8:	c91c                	sw	a5,16(a0)
ffffffffc02071fa:	8082                	ret
ffffffffc02071fc:	1141                	addi	sp,sp,-16
ffffffffc02071fe:	00006697          	auipc	a3,0x6
ffffffffc0207202:	75a68693          	addi	a3,a3,1882 # ffffffffc020d958 <CSWTCH.79+0x5c8>
ffffffffc0207206:	00004617          	auipc	a2,0x4
ffffffffc020720a:	77a60613          	addi	a2,a2,1914 # ffffffffc020b980 <commands+0x210>
ffffffffc020720e:	02800593          	li	a1,40
ffffffffc0207212:	00006517          	auipc	a0,0x6
ffffffffc0207216:	72650513          	addi	a0,a0,1830 # ffffffffc020d938 <CSWTCH.79+0x5a8>
ffffffffc020721a:	e406                	sd	ra,8(sp)
ffffffffc020721c:	a82f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207220 <sched_init>:
ffffffffc0207220:	1141                	addi	sp,sp,-16
ffffffffc0207222:	0008a717          	auipc	a4,0x8a
ffffffffc0207226:	dfe70713          	addi	a4,a4,-514 # ffffffffc0291020 <default_sched_class>
ffffffffc020722a:	e022                	sd	s0,0(sp)
ffffffffc020722c:	e406                	sd	ra,8(sp)
ffffffffc020722e:	0008e797          	auipc	a5,0x8e
ffffffffc0207232:	5c278793          	addi	a5,a5,1474 # ffffffffc02957f0 <timer_list>
ffffffffc0207236:	6714                	ld	a3,8(a4)
ffffffffc0207238:	0008e517          	auipc	a0,0x8e
ffffffffc020723c:	59850513          	addi	a0,a0,1432 # ffffffffc02957d0 <__rq>
ffffffffc0207240:	e79c                	sd	a5,8(a5)
ffffffffc0207242:	e39c                	sd	a5,0(a5)
ffffffffc0207244:	4795                	li	a5,5
ffffffffc0207246:	c95c                	sw	a5,20(a0)
ffffffffc0207248:	0008f417          	auipc	s0,0x8f
ffffffffc020724c:	6a040413          	addi	s0,s0,1696 # ffffffffc02968e8 <sched_class>
ffffffffc0207250:	0008f797          	auipc	a5,0x8f
ffffffffc0207254:	68a7b823          	sd	a0,1680(a5) # ffffffffc02968e0 <rq>
ffffffffc0207258:	e018                	sd	a4,0(s0)
ffffffffc020725a:	9682                	jalr	a3
ffffffffc020725c:	601c                	ld	a5,0(s0)
ffffffffc020725e:	6402                	ld	s0,0(sp)
ffffffffc0207260:	60a2                	ld	ra,8(sp)
ffffffffc0207262:	638c                	ld	a1,0(a5)
ffffffffc0207264:	00006517          	auipc	a0,0x6
ffffffffc0207268:	72450513          	addi	a0,a0,1828 # ffffffffc020d988 <CSWTCH.79+0x5f8>
ffffffffc020726c:	0141                	addi	sp,sp,16
ffffffffc020726e:	f39f806f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0207272 <wakeup_proc>:
ffffffffc0207272:	4118                	lw	a4,0(a0)
ffffffffc0207274:	1101                	addi	sp,sp,-32
ffffffffc0207276:	ec06                	sd	ra,24(sp)
ffffffffc0207278:	e822                	sd	s0,16(sp)
ffffffffc020727a:	e426                	sd	s1,8(sp)
ffffffffc020727c:	478d                	li	a5,3
ffffffffc020727e:	08f70363          	beq	a4,a5,ffffffffc0207304 <wakeup_proc+0x92>
ffffffffc0207282:	842a                	mv	s0,a0
ffffffffc0207284:	100027f3          	csrr	a5,sstatus
ffffffffc0207288:	8b89                	andi	a5,a5,2
ffffffffc020728a:	4481                	li	s1,0
ffffffffc020728c:	e7bd                	bnez	a5,ffffffffc02072fa <wakeup_proc+0x88>
ffffffffc020728e:	4789                	li	a5,2
ffffffffc0207290:	04f70863          	beq	a4,a5,ffffffffc02072e0 <wakeup_proc+0x6e>
ffffffffc0207294:	c01c                	sw	a5,0(s0)
ffffffffc0207296:	0e042623          	sw	zero,236(s0)
ffffffffc020729a:	0008f797          	auipc	a5,0x8f
ffffffffc020729e:	6267b783          	ld	a5,1574(a5) # ffffffffc02968c0 <current>
ffffffffc02072a2:	02878363          	beq	a5,s0,ffffffffc02072c8 <wakeup_proc+0x56>
ffffffffc02072a6:	0008f797          	auipc	a5,0x8f
ffffffffc02072aa:	6227b783          	ld	a5,1570(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02072ae:	00f40d63          	beq	s0,a5,ffffffffc02072c8 <wakeup_proc+0x56>
ffffffffc02072b2:	0008f797          	auipc	a5,0x8f
ffffffffc02072b6:	6367b783          	ld	a5,1590(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02072ba:	6b9c                	ld	a5,16(a5)
ffffffffc02072bc:	85a2                	mv	a1,s0
ffffffffc02072be:	0008f517          	auipc	a0,0x8f
ffffffffc02072c2:	62253503          	ld	a0,1570(a0) # ffffffffc02968e0 <rq>
ffffffffc02072c6:	9782                	jalr	a5
ffffffffc02072c8:	e491                	bnez	s1,ffffffffc02072d4 <wakeup_proc+0x62>
ffffffffc02072ca:	60e2                	ld	ra,24(sp)
ffffffffc02072cc:	6442                	ld	s0,16(sp)
ffffffffc02072ce:	64a2                	ld	s1,8(sp)
ffffffffc02072d0:	6105                	addi	sp,sp,32
ffffffffc02072d2:	8082                	ret
ffffffffc02072d4:	6442                	ld	s0,16(sp)
ffffffffc02072d6:	60e2                	ld	ra,24(sp)
ffffffffc02072d8:	64a2                	ld	s1,8(sp)
ffffffffc02072da:	6105                	addi	sp,sp,32
ffffffffc02072dc:	991f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02072e0:	00006617          	auipc	a2,0x6
ffffffffc02072e4:	6f860613          	addi	a2,a2,1784 # ffffffffc020d9d8 <CSWTCH.79+0x648>
ffffffffc02072e8:	05200593          	li	a1,82
ffffffffc02072ec:	00006517          	auipc	a0,0x6
ffffffffc02072f0:	6d450513          	addi	a0,a0,1748 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc02072f4:	a12f90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02072f8:	bfc1                	j	ffffffffc02072c8 <wakeup_proc+0x56>
ffffffffc02072fa:	979f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02072fe:	4018                	lw	a4,0(s0)
ffffffffc0207300:	4485                	li	s1,1
ffffffffc0207302:	b771                	j	ffffffffc020728e <wakeup_proc+0x1c>
ffffffffc0207304:	00006697          	auipc	a3,0x6
ffffffffc0207308:	69c68693          	addi	a3,a3,1692 # ffffffffc020d9a0 <CSWTCH.79+0x610>
ffffffffc020730c:	00004617          	auipc	a2,0x4
ffffffffc0207310:	67460613          	addi	a2,a2,1652 # ffffffffc020b980 <commands+0x210>
ffffffffc0207314:	04300593          	li	a1,67
ffffffffc0207318:	00006517          	auipc	a0,0x6
ffffffffc020731c:	6a850513          	addi	a0,a0,1704 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc0207320:	97ef90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207324 <schedule>:
ffffffffc0207324:	7179                	addi	sp,sp,-48
ffffffffc0207326:	f406                	sd	ra,40(sp)
ffffffffc0207328:	f022                	sd	s0,32(sp)
ffffffffc020732a:	ec26                	sd	s1,24(sp)
ffffffffc020732c:	e84a                	sd	s2,16(sp)
ffffffffc020732e:	e44e                	sd	s3,8(sp)
ffffffffc0207330:	e052                	sd	s4,0(sp)
ffffffffc0207332:	100027f3          	csrr	a5,sstatus
ffffffffc0207336:	8b89                	andi	a5,a5,2
ffffffffc0207338:	4a01                	li	s4,0
ffffffffc020733a:	e3cd                	bnez	a5,ffffffffc02073dc <schedule+0xb8>
ffffffffc020733c:	0008f497          	auipc	s1,0x8f
ffffffffc0207340:	58448493          	addi	s1,s1,1412 # ffffffffc02968c0 <current>
ffffffffc0207344:	608c                	ld	a1,0(s1)
ffffffffc0207346:	0008f997          	auipc	s3,0x8f
ffffffffc020734a:	5a298993          	addi	s3,s3,1442 # ffffffffc02968e8 <sched_class>
ffffffffc020734e:	0008f917          	auipc	s2,0x8f
ffffffffc0207352:	59290913          	addi	s2,s2,1426 # ffffffffc02968e0 <rq>
ffffffffc0207356:	4194                	lw	a3,0(a1)
ffffffffc0207358:	0005bc23          	sd	zero,24(a1)
ffffffffc020735c:	4709                	li	a4,2
ffffffffc020735e:	0009b783          	ld	a5,0(s3)
ffffffffc0207362:	00093503          	ld	a0,0(s2)
ffffffffc0207366:	04e68e63          	beq	a3,a4,ffffffffc02073c2 <schedule+0x9e>
ffffffffc020736a:	739c                	ld	a5,32(a5)
ffffffffc020736c:	9782                	jalr	a5
ffffffffc020736e:	842a                	mv	s0,a0
ffffffffc0207370:	c521                	beqz	a0,ffffffffc02073b8 <schedule+0x94>
ffffffffc0207372:	0009b783          	ld	a5,0(s3)
ffffffffc0207376:	00093503          	ld	a0,0(s2)
ffffffffc020737a:	85a2                	mv	a1,s0
ffffffffc020737c:	6f9c                	ld	a5,24(a5)
ffffffffc020737e:	9782                	jalr	a5
ffffffffc0207380:	441c                	lw	a5,8(s0)
ffffffffc0207382:	6098                	ld	a4,0(s1)
ffffffffc0207384:	2785                	addiw	a5,a5,1
ffffffffc0207386:	c41c                	sw	a5,8(s0)
ffffffffc0207388:	00870563          	beq	a4,s0,ffffffffc0207392 <schedule+0x6e>
ffffffffc020738c:	8522                	mv	a0,s0
ffffffffc020738e:	f64fe0ef          	jal	ra,ffffffffc0205af2 <proc_run>
ffffffffc0207392:	000a1a63          	bnez	s4,ffffffffc02073a6 <schedule+0x82>
ffffffffc0207396:	70a2                	ld	ra,40(sp)
ffffffffc0207398:	7402                	ld	s0,32(sp)
ffffffffc020739a:	64e2                	ld	s1,24(sp)
ffffffffc020739c:	6942                	ld	s2,16(sp)
ffffffffc020739e:	69a2                	ld	s3,8(sp)
ffffffffc02073a0:	6a02                	ld	s4,0(sp)
ffffffffc02073a2:	6145                	addi	sp,sp,48
ffffffffc02073a4:	8082                	ret
ffffffffc02073a6:	7402                	ld	s0,32(sp)
ffffffffc02073a8:	70a2                	ld	ra,40(sp)
ffffffffc02073aa:	64e2                	ld	s1,24(sp)
ffffffffc02073ac:	6942                	ld	s2,16(sp)
ffffffffc02073ae:	69a2                	ld	s3,8(sp)
ffffffffc02073b0:	6a02                	ld	s4,0(sp)
ffffffffc02073b2:	6145                	addi	sp,sp,48
ffffffffc02073b4:	8b9f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02073b8:	0008f417          	auipc	s0,0x8f
ffffffffc02073bc:	51043403          	ld	s0,1296(s0) # ffffffffc02968c8 <idleproc>
ffffffffc02073c0:	b7c1                	j	ffffffffc0207380 <schedule+0x5c>
ffffffffc02073c2:	0008f717          	auipc	a4,0x8f
ffffffffc02073c6:	50673703          	ld	a4,1286(a4) # ffffffffc02968c8 <idleproc>
ffffffffc02073ca:	fae580e3          	beq	a1,a4,ffffffffc020736a <schedule+0x46>
ffffffffc02073ce:	6b9c                	ld	a5,16(a5)
ffffffffc02073d0:	9782                	jalr	a5
ffffffffc02073d2:	0009b783          	ld	a5,0(s3)
ffffffffc02073d6:	00093503          	ld	a0,0(s2)
ffffffffc02073da:	bf41                	j	ffffffffc020736a <schedule+0x46>
ffffffffc02073dc:	897f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02073e0:	4a05                	li	s4,1
ffffffffc02073e2:	bfa9                	j	ffffffffc020733c <schedule+0x18>

ffffffffc02073e4 <add_timer>:
ffffffffc02073e4:	1141                	addi	sp,sp,-16
ffffffffc02073e6:	e022                	sd	s0,0(sp)
ffffffffc02073e8:	e406                	sd	ra,8(sp)
ffffffffc02073ea:	842a                	mv	s0,a0
ffffffffc02073ec:	100027f3          	csrr	a5,sstatus
ffffffffc02073f0:	8b89                	andi	a5,a5,2
ffffffffc02073f2:	4501                	li	a0,0
ffffffffc02073f4:	eba5                	bnez	a5,ffffffffc0207464 <add_timer+0x80>
ffffffffc02073f6:	401c                	lw	a5,0(s0)
ffffffffc02073f8:	cbb5                	beqz	a5,ffffffffc020746c <add_timer+0x88>
ffffffffc02073fa:	6418                	ld	a4,8(s0)
ffffffffc02073fc:	cb25                	beqz	a4,ffffffffc020746c <add_timer+0x88>
ffffffffc02073fe:	6c18                	ld	a4,24(s0)
ffffffffc0207400:	01040593          	addi	a1,s0,16
ffffffffc0207404:	08e59463          	bne	a1,a4,ffffffffc020748c <add_timer+0xa8>
ffffffffc0207408:	0008e617          	auipc	a2,0x8e
ffffffffc020740c:	3e860613          	addi	a2,a2,1000 # ffffffffc02957f0 <timer_list>
ffffffffc0207410:	6618                	ld	a4,8(a2)
ffffffffc0207412:	00c71863          	bne	a4,a2,ffffffffc0207422 <add_timer+0x3e>
ffffffffc0207416:	a80d                	j	ffffffffc0207448 <add_timer+0x64>
ffffffffc0207418:	6718                	ld	a4,8(a4)
ffffffffc020741a:	9f95                	subw	a5,a5,a3
ffffffffc020741c:	c01c                	sw	a5,0(s0)
ffffffffc020741e:	02c70563          	beq	a4,a2,ffffffffc0207448 <add_timer+0x64>
ffffffffc0207422:	ff072683          	lw	a3,-16(a4)
ffffffffc0207426:	fed7f9e3          	bgeu	a5,a3,ffffffffc0207418 <add_timer+0x34>
ffffffffc020742a:	40f687bb          	subw	a5,a3,a5
ffffffffc020742e:	fef72823          	sw	a5,-16(a4)
ffffffffc0207432:	631c                	ld	a5,0(a4)
ffffffffc0207434:	e30c                	sd	a1,0(a4)
ffffffffc0207436:	e78c                	sd	a1,8(a5)
ffffffffc0207438:	ec18                	sd	a4,24(s0)
ffffffffc020743a:	e81c                	sd	a5,16(s0)
ffffffffc020743c:	c105                	beqz	a0,ffffffffc020745c <add_timer+0x78>
ffffffffc020743e:	6402                	ld	s0,0(sp)
ffffffffc0207440:	60a2                	ld	ra,8(sp)
ffffffffc0207442:	0141                	addi	sp,sp,16
ffffffffc0207444:	829f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207448:	0008e717          	auipc	a4,0x8e
ffffffffc020744c:	3a870713          	addi	a4,a4,936 # ffffffffc02957f0 <timer_list>
ffffffffc0207450:	631c                	ld	a5,0(a4)
ffffffffc0207452:	e30c                	sd	a1,0(a4)
ffffffffc0207454:	e78c                	sd	a1,8(a5)
ffffffffc0207456:	ec18                	sd	a4,24(s0)
ffffffffc0207458:	e81c                	sd	a5,16(s0)
ffffffffc020745a:	f175                	bnez	a0,ffffffffc020743e <add_timer+0x5a>
ffffffffc020745c:	60a2                	ld	ra,8(sp)
ffffffffc020745e:	6402                	ld	s0,0(sp)
ffffffffc0207460:	0141                	addi	sp,sp,16
ffffffffc0207462:	8082                	ret
ffffffffc0207464:	80ff90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207468:	4505                	li	a0,1
ffffffffc020746a:	b771                	j	ffffffffc02073f6 <add_timer+0x12>
ffffffffc020746c:	00006697          	auipc	a3,0x6
ffffffffc0207470:	58c68693          	addi	a3,a3,1420 # ffffffffc020d9f8 <CSWTCH.79+0x668>
ffffffffc0207474:	00004617          	auipc	a2,0x4
ffffffffc0207478:	50c60613          	addi	a2,a2,1292 # ffffffffc020b980 <commands+0x210>
ffffffffc020747c:	07a00593          	li	a1,122
ffffffffc0207480:	00006517          	auipc	a0,0x6
ffffffffc0207484:	54050513          	addi	a0,a0,1344 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc0207488:	816f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020748c:	00006697          	auipc	a3,0x6
ffffffffc0207490:	59c68693          	addi	a3,a3,1436 # ffffffffc020da28 <CSWTCH.79+0x698>
ffffffffc0207494:	00004617          	auipc	a2,0x4
ffffffffc0207498:	4ec60613          	addi	a2,a2,1260 # ffffffffc020b980 <commands+0x210>
ffffffffc020749c:	07b00593          	li	a1,123
ffffffffc02074a0:	00006517          	auipc	a0,0x6
ffffffffc02074a4:	52050513          	addi	a0,a0,1312 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc02074a8:	ff7f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02074ac <del_timer>:
ffffffffc02074ac:	1101                	addi	sp,sp,-32
ffffffffc02074ae:	e822                	sd	s0,16(sp)
ffffffffc02074b0:	ec06                	sd	ra,24(sp)
ffffffffc02074b2:	e426                	sd	s1,8(sp)
ffffffffc02074b4:	842a                	mv	s0,a0
ffffffffc02074b6:	100027f3          	csrr	a5,sstatus
ffffffffc02074ba:	8b89                	andi	a5,a5,2
ffffffffc02074bc:	01050493          	addi	s1,a0,16
ffffffffc02074c0:	eb9d                	bnez	a5,ffffffffc02074f6 <del_timer+0x4a>
ffffffffc02074c2:	6d1c                	ld	a5,24(a0)
ffffffffc02074c4:	02978463          	beq	a5,s1,ffffffffc02074ec <del_timer+0x40>
ffffffffc02074c8:	4114                	lw	a3,0(a0)
ffffffffc02074ca:	6918                	ld	a4,16(a0)
ffffffffc02074cc:	ce81                	beqz	a3,ffffffffc02074e4 <del_timer+0x38>
ffffffffc02074ce:	0008e617          	auipc	a2,0x8e
ffffffffc02074d2:	32260613          	addi	a2,a2,802 # ffffffffc02957f0 <timer_list>
ffffffffc02074d6:	00c78763          	beq	a5,a2,ffffffffc02074e4 <del_timer+0x38>
ffffffffc02074da:	ff07a603          	lw	a2,-16(a5)
ffffffffc02074de:	9eb1                	addw	a3,a3,a2
ffffffffc02074e0:	fed7a823          	sw	a3,-16(a5)
ffffffffc02074e4:	e71c                	sd	a5,8(a4)
ffffffffc02074e6:	e398                	sd	a4,0(a5)
ffffffffc02074e8:	ec04                	sd	s1,24(s0)
ffffffffc02074ea:	e804                	sd	s1,16(s0)
ffffffffc02074ec:	60e2                	ld	ra,24(sp)
ffffffffc02074ee:	6442                	ld	s0,16(sp)
ffffffffc02074f0:	64a2                	ld	s1,8(sp)
ffffffffc02074f2:	6105                	addi	sp,sp,32
ffffffffc02074f4:	8082                	ret
ffffffffc02074f6:	f7cf90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02074fa:	6c1c                	ld	a5,24(s0)
ffffffffc02074fc:	02978463          	beq	a5,s1,ffffffffc0207524 <del_timer+0x78>
ffffffffc0207500:	4014                	lw	a3,0(s0)
ffffffffc0207502:	6818                	ld	a4,16(s0)
ffffffffc0207504:	ce81                	beqz	a3,ffffffffc020751c <del_timer+0x70>
ffffffffc0207506:	0008e617          	auipc	a2,0x8e
ffffffffc020750a:	2ea60613          	addi	a2,a2,746 # ffffffffc02957f0 <timer_list>
ffffffffc020750e:	00c78763          	beq	a5,a2,ffffffffc020751c <del_timer+0x70>
ffffffffc0207512:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207516:	9eb1                	addw	a3,a3,a2
ffffffffc0207518:	fed7a823          	sw	a3,-16(a5)
ffffffffc020751c:	e71c                	sd	a5,8(a4)
ffffffffc020751e:	e398                	sd	a4,0(a5)
ffffffffc0207520:	ec04                	sd	s1,24(s0)
ffffffffc0207522:	e804                	sd	s1,16(s0)
ffffffffc0207524:	6442                	ld	s0,16(sp)
ffffffffc0207526:	60e2                	ld	ra,24(sp)
ffffffffc0207528:	64a2                	ld	s1,8(sp)
ffffffffc020752a:	6105                	addi	sp,sp,32
ffffffffc020752c:	f40f906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc0207530 <run_timer_list>:
ffffffffc0207530:	7139                	addi	sp,sp,-64
ffffffffc0207532:	fc06                	sd	ra,56(sp)
ffffffffc0207534:	f822                	sd	s0,48(sp)
ffffffffc0207536:	f426                	sd	s1,40(sp)
ffffffffc0207538:	f04a                	sd	s2,32(sp)
ffffffffc020753a:	ec4e                	sd	s3,24(sp)
ffffffffc020753c:	e852                	sd	s4,16(sp)
ffffffffc020753e:	e456                	sd	s5,8(sp)
ffffffffc0207540:	e05a                	sd	s6,0(sp)
ffffffffc0207542:	100027f3          	csrr	a5,sstatus
ffffffffc0207546:	8b89                	andi	a5,a5,2
ffffffffc0207548:	4b01                	li	s6,0
ffffffffc020754a:	efe9                	bnez	a5,ffffffffc0207624 <run_timer_list+0xf4>
ffffffffc020754c:	0008e997          	auipc	s3,0x8e
ffffffffc0207550:	2a498993          	addi	s3,s3,676 # ffffffffc02957f0 <timer_list>
ffffffffc0207554:	0089b403          	ld	s0,8(s3)
ffffffffc0207558:	07340a63          	beq	s0,s3,ffffffffc02075cc <run_timer_list+0x9c>
ffffffffc020755c:	ff042783          	lw	a5,-16(s0)
ffffffffc0207560:	ff040913          	addi	s2,s0,-16
ffffffffc0207564:	0e078763          	beqz	a5,ffffffffc0207652 <run_timer_list+0x122>
ffffffffc0207568:	fff7871b          	addiw	a4,a5,-1
ffffffffc020756c:	fee42823          	sw	a4,-16(s0)
ffffffffc0207570:	ef31                	bnez	a4,ffffffffc02075cc <run_timer_list+0x9c>
ffffffffc0207572:	00006a97          	auipc	s5,0x6
ffffffffc0207576:	51ea8a93          	addi	s5,s5,1310 # ffffffffc020da90 <CSWTCH.79+0x700>
ffffffffc020757a:	00006a17          	auipc	s4,0x6
ffffffffc020757e:	446a0a13          	addi	s4,s4,1094 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc0207582:	a005                	j	ffffffffc02075a2 <run_timer_list+0x72>
ffffffffc0207584:	0a07d763          	bgez	a5,ffffffffc0207632 <run_timer_list+0x102>
ffffffffc0207588:	8526                	mv	a0,s1
ffffffffc020758a:	ce9ff0ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc020758e:	854a                	mv	a0,s2
ffffffffc0207590:	f1dff0ef          	jal	ra,ffffffffc02074ac <del_timer>
ffffffffc0207594:	03340c63          	beq	s0,s3,ffffffffc02075cc <run_timer_list+0x9c>
ffffffffc0207598:	ff042783          	lw	a5,-16(s0)
ffffffffc020759c:	ff040913          	addi	s2,s0,-16
ffffffffc02075a0:	e795                	bnez	a5,ffffffffc02075cc <run_timer_list+0x9c>
ffffffffc02075a2:	00893483          	ld	s1,8(s2)
ffffffffc02075a6:	6400                	ld	s0,8(s0)
ffffffffc02075a8:	0ec4a783          	lw	a5,236(s1)
ffffffffc02075ac:	ffe1                	bnez	a5,ffffffffc0207584 <run_timer_list+0x54>
ffffffffc02075ae:	40d4                	lw	a3,4(s1)
ffffffffc02075b0:	8656                	mv	a2,s5
ffffffffc02075b2:	0ba00593          	li	a1,186
ffffffffc02075b6:	8552                	mv	a0,s4
ffffffffc02075b8:	f4ff80ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02075bc:	8526                	mv	a0,s1
ffffffffc02075be:	cb5ff0ef          	jal	ra,ffffffffc0207272 <wakeup_proc>
ffffffffc02075c2:	854a                	mv	a0,s2
ffffffffc02075c4:	ee9ff0ef          	jal	ra,ffffffffc02074ac <del_timer>
ffffffffc02075c8:	fd3418e3          	bne	s0,s3,ffffffffc0207598 <run_timer_list+0x68>
ffffffffc02075cc:	0008f597          	auipc	a1,0x8f
ffffffffc02075d0:	2f45b583          	ld	a1,756(a1) # ffffffffc02968c0 <current>
ffffffffc02075d4:	c18d                	beqz	a1,ffffffffc02075f6 <run_timer_list+0xc6>
ffffffffc02075d6:	0008f797          	auipc	a5,0x8f
ffffffffc02075da:	2f27b783          	ld	a5,754(a5) # ffffffffc02968c8 <idleproc>
ffffffffc02075de:	04f58763          	beq	a1,a5,ffffffffc020762c <run_timer_list+0xfc>
ffffffffc02075e2:	0008f797          	auipc	a5,0x8f
ffffffffc02075e6:	3067b783          	ld	a5,774(a5) # ffffffffc02968e8 <sched_class>
ffffffffc02075ea:	779c                	ld	a5,40(a5)
ffffffffc02075ec:	0008f517          	auipc	a0,0x8f
ffffffffc02075f0:	2f453503          	ld	a0,756(a0) # ffffffffc02968e0 <rq>
ffffffffc02075f4:	9782                	jalr	a5
ffffffffc02075f6:	000b1c63          	bnez	s6,ffffffffc020760e <run_timer_list+0xde>
ffffffffc02075fa:	70e2                	ld	ra,56(sp)
ffffffffc02075fc:	7442                	ld	s0,48(sp)
ffffffffc02075fe:	74a2                	ld	s1,40(sp)
ffffffffc0207600:	7902                	ld	s2,32(sp)
ffffffffc0207602:	69e2                	ld	s3,24(sp)
ffffffffc0207604:	6a42                	ld	s4,16(sp)
ffffffffc0207606:	6aa2                	ld	s5,8(sp)
ffffffffc0207608:	6b02                	ld	s6,0(sp)
ffffffffc020760a:	6121                	addi	sp,sp,64
ffffffffc020760c:	8082                	ret
ffffffffc020760e:	7442                	ld	s0,48(sp)
ffffffffc0207610:	70e2                	ld	ra,56(sp)
ffffffffc0207612:	74a2                	ld	s1,40(sp)
ffffffffc0207614:	7902                	ld	s2,32(sp)
ffffffffc0207616:	69e2                	ld	s3,24(sp)
ffffffffc0207618:	6a42                	ld	s4,16(sp)
ffffffffc020761a:	6aa2                	ld	s5,8(sp)
ffffffffc020761c:	6b02                	ld	s6,0(sp)
ffffffffc020761e:	6121                	addi	sp,sp,64
ffffffffc0207620:	e4cf906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207624:	e4ef90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207628:	4b05                	li	s6,1
ffffffffc020762a:	b70d                	j	ffffffffc020754c <run_timer_list+0x1c>
ffffffffc020762c:	4785                	li	a5,1
ffffffffc020762e:	ed9c                	sd	a5,24(a1)
ffffffffc0207630:	b7d9                	j	ffffffffc02075f6 <run_timer_list+0xc6>
ffffffffc0207632:	00006697          	auipc	a3,0x6
ffffffffc0207636:	43668693          	addi	a3,a3,1078 # ffffffffc020da68 <CSWTCH.79+0x6d8>
ffffffffc020763a:	00004617          	auipc	a2,0x4
ffffffffc020763e:	34660613          	addi	a2,a2,838 # ffffffffc020b980 <commands+0x210>
ffffffffc0207642:	0b600593          	li	a1,182
ffffffffc0207646:	00006517          	auipc	a0,0x6
ffffffffc020764a:	37a50513          	addi	a0,a0,890 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc020764e:	e51f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207652:	00006697          	auipc	a3,0x6
ffffffffc0207656:	3fe68693          	addi	a3,a3,1022 # ffffffffc020da50 <CSWTCH.79+0x6c0>
ffffffffc020765a:	00004617          	auipc	a2,0x4
ffffffffc020765e:	32660613          	addi	a2,a2,806 # ffffffffc020b980 <commands+0x210>
ffffffffc0207662:	0ae00593          	li	a1,174
ffffffffc0207666:	00006517          	auipc	a0,0x6
ffffffffc020766a:	35a50513          	addi	a0,a0,858 # ffffffffc020d9c0 <CSWTCH.79+0x630>
ffffffffc020766e:	e31f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207672 <sys_getpid>:
ffffffffc0207672:	0008f797          	auipc	a5,0x8f
ffffffffc0207676:	24e7b783          	ld	a5,590(a5) # ffffffffc02968c0 <current>
ffffffffc020767a:	43c8                	lw	a0,4(a5)
ffffffffc020767c:	8082                	ret

ffffffffc020767e <sys_pgdir>:
ffffffffc020767e:	4501                	li	a0,0
ffffffffc0207680:	8082                	ret

ffffffffc0207682 <sys_gettime>:
ffffffffc0207682:	0008f797          	auipc	a5,0x8f
ffffffffc0207686:	1ee7b783          	ld	a5,494(a5) # ffffffffc0296870 <ticks>
ffffffffc020768a:	0027951b          	slliw	a0,a5,0x2
ffffffffc020768e:	9d3d                	addw	a0,a0,a5
ffffffffc0207690:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207694:	8082                	ret

ffffffffc0207696 <sys_lab6_set_priority>:
ffffffffc0207696:	4108                	lw	a0,0(a0)
ffffffffc0207698:	1141                	addi	sp,sp,-16
ffffffffc020769a:	e406                	sd	ra,8(sp)
ffffffffc020769c:	975ff0ef          	jal	ra,ffffffffc0207010 <lab6_set_priority>
ffffffffc02076a0:	60a2                	ld	ra,8(sp)
ffffffffc02076a2:	4501                	li	a0,0
ffffffffc02076a4:	0141                	addi	sp,sp,16
ffffffffc02076a6:	8082                	ret

ffffffffc02076a8 <sys_dup>:
ffffffffc02076a8:	450c                	lw	a1,8(a0)
ffffffffc02076aa:	4108                	lw	a0,0(a0)
ffffffffc02076ac:	b1cfe06f          	j	ffffffffc02059c8 <sysfile_dup>

ffffffffc02076b0 <sys_getdirentry>:
ffffffffc02076b0:	650c                	ld	a1,8(a0)
ffffffffc02076b2:	4108                	lw	a0,0(a0)
ffffffffc02076b4:	a24fe06f          	j	ffffffffc02058d8 <sysfile_getdirentry>

ffffffffc02076b8 <sys_getcwd>:
ffffffffc02076b8:	650c                	ld	a1,8(a0)
ffffffffc02076ba:	6108                	ld	a0,0(a0)
ffffffffc02076bc:	978fe06f          	j	ffffffffc0205834 <sysfile_getcwd>

ffffffffc02076c0 <sys_fsync>:
ffffffffc02076c0:	4108                	lw	a0,0(a0)
ffffffffc02076c2:	96efe06f          	j	ffffffffc0205830 <sysfile_fsync>

ffffffffc02076c6 <sys_fstat>:
ffffffffc02076c6:	650c                	ld	a1,8(a0)
ffffffffc02076c8:	4108                	lw	a0,0(a0)
ffffffffc02076ca:	8c6fe06f          	j	ffffffffc0205790 <sysfile_fstat>

ffffffffc02076ce <sys_seek>:
ffffffffc02076ce:	4910                	lw	a2,16(a0)
ffffffffc02076d0:	650c                	ld	a1,8(a0)
ffffffffc02076d2:	4108                	lw	a0,0(a0)
ffffffffc02076d4:	8b8fe06f          	j	ffffffffc020578c <sysfile_seek>

ffffffffc02076d8 <sys_write>:
ffffffffc02076d8:	6910                	ld	a2,16(a0)
ffffffffc02076da:	650c                	ld	a1,8(a0)
ffffffffc02076dc:	4108                	lw	a0,0(a0)
ffffffffc02076de:	f95fd06f          	j	ffffffffc0205672 <sysfile_write>

ffffffffc02076e2 <sys_read>:
ffffffffc02076e2:	6910                	ld	a2,16(a0)
ffffffffc02076e4:	650c                	ld	a1,8(a0)
ffffffffc02076e6:	4108                	lw	a0,0(a0)
ffffffffc02076e8:	e77fd06f          	j	ffffffffc020555e <sysfile_read>

ffffffffc02076ec <sys_close>:
ffffffffc02076ec:	4108                	lw	a0,0(a0)
ffffffffc02076ee:	e6dfd06f          	j	ffffffffc020555a <sysfile_close>

ffffffffc02076f2 <sys_open>:
ffffffffc02076f2:	450c                	lw	a1,8(a0)
ffffffffc02076f4:	6108                	ld	a0,0(a0)
ffffffffc02076f6:	e31fd06f          	j	ffffffffc0205526 <sysfile_open>

ffffffffc02076fa <sys_putc>:
ffffffffc02076fa:	4108                	lw	a0,0(a0)
ffffffffc02076fc:	1141                	addi	sp,sp,-16
ffffffffc02076fe:	e406                	sd	ra,8(sp)
ffffffffc0207700:	ae3f80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0207704:	60a2                	ld	ra,8(sp)
ffffffffc0207706:	4501                	li	a0,0
ffffffffc0207708:	0141                	addi	sp,sp,16
ffffffffc020770a:	8082                	ret

ffffffffc020770c <sys_kill>:
ffffffffc020770c:	4108                	lw	a0,0(a0)
ffffffffc020770e:	ea0ff06f          	j	ffffffffc0206dae <do_kill>

ffffffffc0207712 <sys_sleep>:
ffffffffc0207712:	4108                	lw	a0,0(a0)
ffffffffc0207714:	937ff06f          	j	ffffffffc020704a <do_sleep>

ffffffffc0207718 <sys_yield>:
ffffffffc0207718:	e48ff06f          	j	ffffffffc0206d60 <do_yield>

ffffffffc020771c <sys_exec>:
ffffffffc020771c:	6910                	ld	a2,16(a0)
ffffffffc020771e:	450c                	lw	a1,8(a0)
ffffffffc0207720:	6108                	ld	a0,0(a0)
ffffffffc0207722:	d59fe06f          	j	ffffffffc020647a <do_execve>

ffffffffc0207726 <sys_wait>:
ffffffffc0207726:	650c                	ld	a1,8(a0)
ffffffffc0207728:	4108                	lw	a0,0(a0)
ffffffffc020772a:	e46ff06f          	j	ffffffffc0206d70 <do_wait>

ffffffffc020772e <sys_fork>:
ffffffffc020772e:	0008f797          	auipc	a5,0x8f
ffffffffc0207732:	1927b783          	ld	a5,402(a5) # ffffffffc02968c0 <current>
ffffffffc0207736:	73d0                	ld	a2,160(a5)
ffffffffc0207738:	4501                	li	a0,0
ffffffffc020773a:	6a0c                	ld	a1,16(a2)
ffffffffc020773c:	c26fe06f          	j	ffffffffc0205b62 <do_fork>

ffffffffc0207740 <sys_exit>:
ffffffffc0207740:	4108                	lw	a0,0(a0)
ffffffffc0207742:	8b5fe06f          	j	ffffffffc0205ff6 <do_exit>

ffffffffc0207746 <syscall>:
ffffffffc0207746:	715d                	addi	sp,sp,-80
ffffffffc0207748:	fc26                	sd	s1,56(sp)
ffffffffc020774a:	0008f497          	auipc	s1,0x8f
ffffffffc020774e:	17648493          	addi	s1,s1,374 # ffffffffc02968c0 <current>
ffffffffc0207752:	6098                	ld	a4,0(s1)
ffffffffc0207754:	e0a2                	sd	s0,64(sp)
ffffffffc0207756:	f84a                	sd	s2,48(sp)
ffffffffc0207758:	7340                	ld	s0,160(a4)
ffffffffc020775a:	e486                	sd	ra,72(sp)
ffffffffc020775c:	0ff00793          	li	a5,255
ffffffffc0207760:	05042903          	lw	s2,80(s0)
ffffffffc0207764:	0327ee63          	bltu	a5,s2,ffffffffc02077a0 <syscall+0x5a>
ffffffffc0207768:	00391713          	slli	a4,s2,0x3
ffffffffc020776c:	00006797          	auipc	a5,0x6
ffffffffc0207770:	38c78793          	addi	a5,a5,908 # ffffffffc020daf8 <syscalls>
ffffffffc0207774:	97ba                	add	a5,a5,a4
ffffffffc0207776:	639c                	ld	a5,0(a5)
ffffffffc0207778:	c785                	beqz	a5,ffffffffc02077a0 <syscall+0x5a>
ffffffffc020777a:	6c28                	ld	a0,88(s0)
ffffffffc020777c:	702c                	ld	a1,96(s0)
ffffffffc020777e:	7430                	ld	a2,104(s0)
ffffffffc0207780:	7834                	ld	a3,112(s0)
ffffffffc0207782:	7c38                	ld	a4,120(s0)
ffffffffc0207784:	e42a                	sd	a0,8(sp)
ffffffffc0207786:	e82e                	sd	a1,16(sp)
ffffffffc0207788:	ec32                	sd	a2,24(sp)
ffffffffc020778a:	f036                	sd	a3,32(sp)
ffffffffc020778c:	f43a                	sd	a4,40(sp)
ffffffffc020778e:	0028                	addi	a0,sp,8
ffffffffc0207790:	9782                	jalr	a5
ffffffffc0207792:	60a6                	ld	ra,72(sp)
ffffffffc0207794:	e828                	sd	a0,80(s0)
ffffffffc0207796:	6406                	ld	s0,64(sp)
ffffffffc0207798:	74e2                	ld	s1,56(sp)
ffffffffc020779a:	7942                	ld	s2,48(sp)
ffffffffc020779c:	6161                	addi	sp,sp,80
ffffffffc020779e:	8082                	ret
ffffffffc02077a0:	8522                	mv	a0,s0
ffffffffc02077a2:	fe8f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc02077a6:	609c                	ld	a5,0(s1)
ffffffffc02077a8:	86ca                	mv	a3,s2
ffffffffc02077aa:	00006617          	auipc	a2,0x6
ffffffffc02077ae:	30660613          	addi	a2,a2,774 # ffffffffc020dab0 <CSWTCH.79+0x720>
ffffffffc02077b2:	43d8                	lw	a4,4(a5)
ffffffffc02077b4:	0d800593          	li	a1,216
ffffffffc02077b8:	0b478793          	addi	a5,a5,180
ffffffffc02077bc:	00006517          	auipc	a0,0x6
ffffffffc02077c0:	32450513          	addi	a0,a0,804 # ffffffffc020dae0 <CSWTCH.79+0x750>
ffffffffc02077c4:	cdbf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02077c8 <__alloc_inode>:
ffffffffc02077c8:	1141                	addi	sp,sp,-16
ffffffffc02077ca:	e022                	sd	s0,0(sp)
ffffffffc02077cc:	842a                	mv	s0,a0
ffffffffc02077ce:	07800513          	li	a0,120
ffffffffc02077d2:	e406                	sd	ra,8(sp)
ffffffffc02077d4:	fbafa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02077d8:	c111                	beqz	a0,ffffffffc02077dc <__alloc_inode+0x14>
ffffffffc02077da:	cd20                	sw	s0,88(a0)
ffffffffc02077dc:	60a2                	ld	ra,8(sp)
ffffffffc02077de:	6402                	ld	s0,0(sp)
ffffffffc02077e0:	0141                	addi	sp,sp,16
ffffffffc02077e2:	8082                	ret

ffffffffc02077e4 <inode_init>:
ffffffffc02077e4:	4785                	li	a5,1
ffffffffc02077e6:	06052023          	sw	zero,96(a0)
ffffffffc02077ea:	f92c                	sd	a1,112(a0)
ffffffffc02077ec:	f530                	sd	a2,104(a0)
ffffffffc02077ee:	cd7c                	sw	a5,92(a0)
ffffffffc02077f0:	8082                	ret

ffffffffc02077f2 <inode_kill>:
ffffffffc02077f2:	4d78                	lw	a4,92(a0)
ffffffffc02077f4:	1141                	addi	sp,sp,-16
ffffffffc02077f6:	e406                	sd	ra,8(sp)
ffffffffc02077f8:	e719                	bnez	a4,ffffffffc0207806 <inode_kill+0x14>
ffffffffc02077fa:	513c                	lw	a5,96(a0)
ffffffffc02077fc:	e78d                	bnez	a5,ffffffffc0207826 <inode_kill+0x34>
ffffffffc02077fe:	60a2                	ld	ra,8(sp)
ffffffffc0207800:	0141                	addi	sp,sp,16
ffffffffc0207802:	83dfa06f          	j	ffffffffc020203e <kfree>
ffffffffc0207806:	00007697          	auipc	a3,0x7
ffffffffc020780a:	af268693          	addi	a3,a3,-1294 # ffffffffc020e2f8 <syscalls+0x800>
ffffffffc020780e:	00004617          	auipc	a2,0x4
ffffffffc0207812:	17260613          	addi	a2,a2,370 # ffffffffc020b980 <commands+0x210>
ffffffffc0207816:	02900593          	li	a1,41
ffffffffc020781a:	00007517          	auipc	a0,0x7
ffffffffc020781e:	afe50513          	addi	a0,a0,-1282 # ffffffffc020e318 <syscalls+0x820>
ffffffffc0207822:	c7df80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207826:	00007697          	auipc	a3,0x7
ffffffffc020782a:	b0a68693          	addi	a3,a3,-1270 # ffffffffc020e330 <syscalls+0x838>
ffffffffc020782e:	00004617          	auipc	a2,0x4
ffffffffc0207832:	15260613          	addi	a2,a2,338 # ffffffffc020b980 <commands+0x210>
ffffffffc0207836:	02a00593          	li	a1,42
ffffffffc020783a:	00007517          	auipc	a0,0x7
ffffffffc020783e:	ade50513          	addi	a0,a0,-1314 # ffffffffc020e318 <syscalls+0x820>
ffffffffc0207842:	c5df80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207846 <inode_ref_inc>:
ffffffffc0207846:	4d7c                	lw	a5,92(a0)
ffffffffc0207848:	2785                	addiw	a5,a5,1
ffffffffc020784a:	cd7c                	sw	a5,92(a0)
ffffffffc020784c:	0007851b          	sext.w	a0,a5
ffffffffc0207850:	8082                	ret

ffffffffc0207852 <inode_open_inc>:
ffffffffc0207852:	513c                	lw	a5,96(a0)
ffffffffc0207854:	2785                	addiw	a5,a5,1
ffffffffc0207856:	d13c                	sw	a5,96(a0)
ffffffffc0207858:	0007851b          	sext.w	a0,a5
ffffffffc020785c:	8082                	ret

ffffffffc020785e <inode_check>:
ffffffffc020785e:	1141                	addi	sp,sp,-16
ffffffffc0207860:	e406                	sd	ra,8(sp)
ffffffffc0207862:	c90d                	beqz	a0,ffffffffc0207894 <inode_check+0x36>
ffffffffc0207864:	793c                	ld	a5,112(a0)
ffffffffc0207866:	c79d                	beqz	a5,ffffffffc0207894 <inode_check+0x36>
ffffffffc0207868:	6398                	ld	a4,0(a5)
ffffffffc020786a:	4625d7b7          	lui	a5,0x4625d
ffffffffc020786e:	0786                	slli	a5,a5,0x1
ffffffffc0207870:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc0207874:	08f71063          	bne	a4,a5,ffffffffc02078f4 <inode_check+0x96>
ffffffffc0207878:	4d78                	lw	a4,92(a0)
ffffffffc020787a:	513c                	lw	a5,96(a0)
ffffffffc020787c:	04f74c63          	blt	a4,a5,ffffffffc02078d4 <inode_check+0x76>
ffffffffc0207880:	0407ca63          	bltz	a5,ffffffffc02078d4 <inode_check+0x76>
ffffffffc0207884:	66c1                	lui	a3,0x10
ffffffffc0207886:	02d75763          	bge	a4,a3,ffffffffc02078b4 <inode_check+0x56>
ffffffffc020788a:	02d7d563          	bge	a5,a3,ffffffffc02078b4 <inode_check+0x56>
ffffffffc020788e:	60a2                	ld	ra,8(sp)
ffffffffc0207890:	0141                	addi	sp,sp,16
ffffffffc0207892:	8082                	ret
ffffffffc0207894:	00007697          	auipc	a3,0x7
ffffffffc0207898:	abc68693          	addi	a3,a3,-1348 # ffffffffc020e350 <syscalls+0x858>
ffffffffc020789c:	00004617          	auipc	a2,0x4
ffffffffc02078a0:	0e460613          	addi	a2,a2,228 # ffffffffc020b980 <commands+0x210>
ffffffffc02078a4:	06e00593          	li	a1,110
ffffffffc02078a8:	00007517          	auipc	a0,0x7
ffffffffc02078ac:	a7050513          	addi	a0,a0,-1424 # ffffffffc020e318 <syscalls+0x820>
ffffffffc02078b0:	beff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078b4:	00007697          	auipc	a3,0x7
ffffffffc02078b8:	b1c68693          	addi	a3,a3,-1252 # ffffffffc020e3d0 <syscalls+0x8d8>
ffffffffc02078bc:	00004617          	auipc	a2,0x4
ffffffffc02078c0:	0c460613          	addi	a2,a2,196 # ffffffffc020b980 <commands+0x210>
ffffffffc02078c4:	07200593          	li	a1,114
ffffffffc02078c8:	00007517          	auipc	a0,0x7
ffffffffc02078cc:	a5050513          	addi	a0,a0,-1456 # ffffffffc020e318 <syscalls+0x820>
ffffffffc02078d0:	bcff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078d4:	00007697          	auipc	a3,0x7
ffffffffc02078d8:	acc68693          	addi	a3,a3,-1332 # ffffffffc020e3a0 <syscalls+0x8a8>
ffffffffc02078dc:	00004617          	auipc	a2,0x4
ffffffffc02078e0:	0a460613          	addi	a2,a2,164 # ffffffffc020b980 <commands+0x210>
ffffffffc02078e4:	07100593          	li	a1,113
ffffffffc02078e8:	00007517          	auipc	a0,0x7
ffffffffc02078ec:	a3050513          	addi	a0,a0,-1488 # ffffffffc020e318 <syscalls+0x820>
ffffffffc02078f0:	baff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078f4:	00007697          	auipc	a3,0x7
ffffffffc02078f8:	a8468693          	addi	a3,a3,-1404 # ffffffffc020e378 <syscalls+0x880>
ffffffffc02078fc:	00004617          	auipc	a2,0x4
ffffffffc0207900:	08460613          	addi	a2,a2,132 # ffffffffc020b980 <commands+0x210>
ffffffffc0207904:	06f00593          	li	a1,111
ffffffffc0207908:	00007517          	auipc	a0,0x7
ffffffffc020790c:	a1050513          	addi	a0,a0,-1520 # ffffffffc020e318 <syscalls+0x820>
ffffffffc0207910:	b8ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207914 <inode_ref_dec>:
ffffffffc0207914:	4d7c                	lw	a5,92(a0)
ffffffffc0207916:	1101                	addi	sp,sp,-32
ffffffffc0207918:	ec06                	sd	ra,24(sp)
ffffffffc020791a:	e822                	sd	s0,16(sp)
ffffffffc020791c:	e426                	sd	s1,8(sp)
ffffffffc020791e:	e04a                	sd	s2,0(sp)
ffffffffc0207920:	06f05e63          	blez	a5,ffffffffc020799c <inode_ref_dec+0x88>
ffffffffc0207924:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207928:	cd64                	sw	s1,92(a0)
ffffffffc020792a:	842a                	mv	s0,a0
ffffffffc020792c:	e09d                	bnez	s1,ffffffffc0207952 <inode_ref_dec+0x3e>
ffffffffc020792e:	793c                	ld	a5,112(a0)
ffffffffc0207930:	c7b1                	beqz	a5,ffffffffc020797c <inode_ref_dec+0x68>
ffffffffc0207932:	0487b903          	ld	s2,72(a5)
ffffffffc0207936:	04090363          	beqz	s2,ffffffffc020797c <inode_ref_dec+0x68>
ffffffffc020793a:	00007597          	auipc	a1,0x7
ffffffffc020793e:	b4658593          	addi	a1,a1,-1210 # ffffffffc020e480 <syscalls+0x988>
ffffffffc0207942:	f1dff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0207946:	8522                	mv	a0,s0
ffffffffc0207948:	9902                	jalr	s2
ffffffffc020794a:	c501                	beqz	a0,ffffffffc0207952 <inode_ref_dec+0x3e>
ffffffffc020794c:	57c5                	li	a5,-15
ffffffffc020794e:	00f51963          	bne	a0,a5,ffffffffc0207960 <inode_ref_dec+0x4c>
ffffffffc0207952:	60e2                	ld	ra,24(sp)
ffffffffc0207954:	6442                	ld	s0,16(sp)
ffffffffc0207956:	6902                	ld	s2,0(sp)
ffffffffc0207958:	8526                	mv	a0,s1
ffffffffc020795a:	64a2                	ld	s1,8(sp)
ffffffffc020795c:	6105                	addi	sp,sp,32
ffffffffc020795e:	8082                	ret
ffffffffc0207960:	85aa                	mv	a1,a0
ffffffffc0207962:	00007517          	auipc	a0,0x7
ffffffffc0207966:	b2650513          	addi	a0,a0,-1242 # ffffffffc020e488 <syscalls+0x990>
ffffffffc020796a:	83df80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020796e:	60e2                	ld	ra,24(sp)
ffffffffc0207970:	6442                	ld	s0,16(sp)
ffffffffc0207972:	6902                	ld	s2,0(sp)
ffffffffc0207974:	8526                	mv	a0,s1
ffffffffc0207976:	64a2                	ld	s1,8(sp)
ffffffffc0207978:	6105                	addi	sp,sp,32
ffffffffc020797a:	8082                	ret
ffffffffc020797c:	00007697          	auipc	a3,0x7
ffffffffc0207980:	ab468693          	addi	a3,a3,-1356 # ffffffffc020e430 <syscalls+0x938>
ffffffffc0207984:	00004617          	auipc	a2,0x4
ffffffffc0207988:	ffc60613          	addi	a2,a2,-4 # ffffffffc020b980 <commands+0x210>
ffffffffc020798c:	04400593          	li	a1,68
ffffffffc0207990:	00007517          	auipc	a0,0x7
ffffffffc0207994:	98850513          	addi	a0,a0,-1656 # ffffffffc020e318 <syscalls+0x820>
ffffffffc0207998:	b07f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020799c:	00007697          	auipc	a3,0x7
ffffffffc02079a0:	a7468693          	addi	a3,a3,-1420 # ffffffffc020e410 <syscalls+0x918>
ffffffffc02079a4:	00004617          	auipc	a2,0x4
ffffffffc02079a8:	fdc60613          	addi	a2,a2,-36 # ffffffffc020b980 <commands+0x210>
ffffffffc02079ac:	03f00593          	li	a1,63
ffffffffc02079b0:	00007517          	auipc	a0,0x7
ffffffffc02079b4:	96850513          	addi	a0,a0,-1688 # ffffffffc020e318 <syscalls+0x820>
ffffffffc02079b8:	ae7f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02079bc <inode_open_dec>:
ffffffffc02079bc:	513c                	lw	a5,96(a0)
ffffffffc02079be:	1101                	addi	sp,sp,-32
ffffffffc02079c0:	ec06                	sd	ra,24(sp)
ffffffffc02079c2:	e822                	sd	s0,16(sp)
ffffffffc02079c4:	e426                	sd	s1,8(sp)
ffffffffc02079c6:	e04a                	sd	s2,0(sp)
ffffffffc02079c8:	06f05b63          	blez	a5,ffffffffc0207a3e <inode_open_dec+0x82>
ffffffffc02079cc:	fff7849b          	addiw	s1,a5,-1
ffffffffc02079d0:	d124                	sw	s1,96(a0)
ffffffffc02079d2:	842a                	mv	s0,a0
ffffffffc02079d4:	e085                	bnez	s1,ffffffffc02079f4 <inode_open_dec+0x38>
ffffffffc02079d6:	793c                	ld	a5,112(a0)
ffffffffc02079d8:	c3b9                	beqz	a5,ffffffffc0207a1e <inode_open_dec+0x62>
ffffffffc02079da:	0107b903          	ld	s2,16(a5)
ffffffffc02079de:	04090063          	beqz	s2,ffffffffc0207a1e <inode_open_dec+0x62>
ffffffffc02079e2:	00007597          	auipc	a1,0x7
ffffffffc02079e6:	b3658593          	addi	a1,a1,-1226 # ffffffffc020e518 <syscalls+0xa20>
ffffffffc02079ea:	e75ff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc02079ee:	8522                	mv	a0,s0
ffffffffc02079f0:	9902                	jalr	s2
ffffffffc02079f2:	e901                	bnez	a0,ffffffffc0207a02 <inode_open_dec+0x46>
ffffffffc02079f4:	60e2                	ld	ra,24(sp)
ffffffffc02079f6:	6442                	ld	s0,16(sp)
ffffffffc02079f8:	6902                	ld	s2,0(sp)
ffffffffc02079fa:	8526                	mv	a0,s1
ffffffffc02079fc:	64a2                	ld	s1,8(sp)
ffffffffc02079fe:	6105                	addi	sp,sp,32
ffffffffc0207a00:	8082                	ret
ffffffffc0207a02:	85aa                	mv	a1,a0
ffffffffc0207a04:	00007517          	auipc	a0,0x7
ffffffffc0207a08:	b1c50513          	addi	a0,a0,-1252 # ffffffffc020e520 <syscalls+0xa28>
ffffffffc0207a0c:	f9af80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207a10:	60e2                	ld	ra,24(sp)
ffffffffc0207a12:	6442                	ld	s0,16(sp)
ffffffffc0207a14:	6902                	ld	s2,0(sp)
ffffffffc0207a16:	8526                	mv	a0,s1
ffffffffc0207a18:	64a2                	ld	s1,8(sp)
ffffffffc0207a1a:	6105                	addi	sp,sp,32
ffffffffc0207a1c:	8082                	ret
ffffffffc0207a1e:	00007697          	auipc	a3,0x7
ffffffffc0207a22:	aaa68693          	addi	a3,a3,-1366 # ffffffffc020e4c8 <syscalls+0x9d0>
ffffffffc0207a26:	00004617          	auipc	a2,0x4
ffffffffc0207a2a:	f5a60613          	addi	a2,a2,-166 # ffffffffc020b980 <commands+0x210>
ffffffffc0207a2e:	06100593          	li	a1,97
ffffffffc0207a32:	00007517          	auipc	a0,0x7
ffffffffc0207a36:	8e650513          	addi	a0,a0,-1818 # ffffffffc020e318 <syscalls+0x820>
ffffffffc0207a3a:	a65f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207a3e:	00007697          	auipc	a3,0x7
ffffffffc0207a42:	a6a68693          	addi	a3,a3,-1430 # ffffffffc020e4a8 <syscalls+0x9b0>
ffffffffc0207a46:	00004617          	auipc	a2,0x4
ffffffffc0207a4a:	f3a60613          	addi	a2,a2,-198 # ffffffffc020b980 <commands+0x210>
ffffffffc0207a4e:	05c00593          	li	a1,92
ffffffffc0207a52:	00007517          	auipc	a0,0x7
ffffffffc0207a56:	8c650513          	addi	a0,a0,-1850 # ffffffffc020e318 <syscalls+0x820>
ffffffffc0207a5a:	a45f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207a5e <__alloc_fs>:
ffffffffc0207a5e:	1141                	addi	sp,sp,-16
ffffffffc0207a60:	e022                	sd	s0,0(sp)
ffffffffc0207a62:	842a                	mv	s0,a0
ffffffffc0207a64:	0d800513          	li	a0,216
ffffffffc0207a68:	e406                	sd	ra,8(sp)
ffffffffc0207a6a:	d24fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207a6e:	c119                	beqz	a0,ffffffffc0207a74 <__alloc_fs+0x16>
ffffffffc0207a70:	0a852823          	sw	s0,176(a0)
ffffffffc0207a74:	60a2                	ld	ra,8(sp)
ffffffffc0207a76:	6402                	ld	s0,0(sp)
ffffffffc0207a78:	0141                	addi	sp,sp,16
ffffffffc0207a7a:	8082                	ret

ffffffffc0207a7c <vfs_init>:
ffffffffc0207a7c:	1141                	addi	sp,sp,-16
ffffffffc0207a7e:	4585                	li	a1,1
ffffffffc0207a80:	0008e517          	auipc	a0,0x8e
ffffffffc0207a84:	d8050513          	addi	a0,a0,-640 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a88:	e406                	sd	ra,8(sp)
ffffffffc0207a8a:	ad1fc0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0207a8e:	60a2                	ld	ra,8(sp)
ffffffffc0207a90:	0141                	addi	sp,sp,16
ffffffffc0207a92:	a40d                	j	ffffffffc0207cb4 <vfs_devlist_init>

ffffffffc0207a94 <vfs_set_bootfs>:
ffffffffc0207a94:	7179                	addi	sp,sp,-48
ffffffffc0207a96:	f022                	sd	s0,32(sp)
ffffffffc0207a98:	f406                	sd	ra,40(sp)
ffffffffc0207a9a:	ec26                	sd	s1,24(sp)
ffffffffc0207a9c:	e402                	sd	zero,8(sp)
ffffffffc0207a9e:	842a                	mv	s0,a0
ffffffffc0207aa0:	c915                	beqz	a0,ffffffffc0207ad4 <vfs_set_bootfs+0x40>
ffffffffc0207aa2:	03a00593          	li	a1,58
ffffffffc0207aa6:	1df030ef          	jal	ra,ffffffffc020b484 <strchr>
ffffffffc0207aaa:	c135                	beqz	a0,ffffffffc0207b0e <vfs_set_bootfs+0x7a>
ffffffffc0207aac:	00154783          	lbu	a5,1(a0)
ffffffffc0207ab0:	efb9                	bnez	a5,ffffffffc0207b0e <vfs_set_bootfs+0x7a>
ffffffffc0207ab2:	8522                	mv	a0,s0
ffffffffc0207ab4:	11f000ef          	jal	ra,ffffffffc02083d2 <vfs_chdir>
ffffffffc0207ab8:	842a                	mv	s0,a0
ffffffffc0207aba:	c519                	beqz	a0,ffffffffc0207ac8 <vfs_set_bootfs+0x34>
ffffffffc0207abc:	70a2                	ld	ra,40(sp)
ffffffffc0207abe:	8522                	mv	a0,s0
ffffffffc0207ac0:	7402                	ld	s0,32(sp)
ffffffffc0207ac2:	64e2                	ld	s1,24(sp)
ffffffffc0207ac4:	6145                	addi	sp,sp,48
ffffffffc0207ac6:	8082                	ret
ffffffffc0207ac8:	0028                	addi	a0,sp,8
ffffffffc0207aca:	013000ef          	jal	ra,ffffffffc02082dc <vfs_get_curdir>
ffffffffc0207ace:	842a                	mv	s0,a0
ffffffffc0207ad0:	f575                	bnez	a0,ffffffffc0207abc <vfs_set_bootfs+0x28>
ffffffffc0207ad2:	6422                	ld	s0,8(sp)
ffffffffc0207ad4:	0008e517          	auipc	a0,0x8e
ffffffffc0207ad8:	d2c50513          	addi	a0,a0,-724 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207adc:	a89fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207ae0:	0008f797          	auipc	a5,0x8f
ffffffffc0207ae4:	e1078793          	addi	a5,a5,-496 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207ae8:	6384                	ld	s1,0(a5)
ffffffffc0207aea:	0008e517          	auipc	a0,0x8e
ffffffffc0207aee:	d1650513          	addi	a0,a0,-746 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207af2:	e380                	sd	s0,0(a5)
ffffffffc0207af4:	4401                	li	s0,0
ffffffffc0207af6:	a6bfc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207afa:	d0e9                	beqz	s1,ffffffffc0207abc <vfs_set_bootfs+0x28>
ffffffffc0207afc:	8526                	mv	a0,s1
ffffffffc0207afe:	e17ff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc0207b02:	70a2                	ld	ra,40(sp)
ffffffffc0207b04:	8522                	mv	a0,s0
ffffffffc0207b06:	7402                	ld	s0,32(sp)
ffffffffc0207b08:	64e2                	ld	s1,24(sp)
ffffffffc0207b0a:	6145                	addi	sp,sp,48
ffffffffc0207b0c:	8082                	ret
ffffffffc0207b0e:	5475                	li	s0,-3
ffffffffc0207b10:	b775                	j	ffffffffc0207abc <vfs_set_bootfs+0x28>

ffffffffc0207b12 <vfs_get_bootfs>:
ffffffffc0207b12:	1101                	addi	sp,sp,-32
ffffffffc0207b14:	e426                	sd	s1,8(sp)
ffffffffc0207b16:	0008f497          	auipc	s1,0x8f
ffffffffc0207b1a:	dda48493          	addi	s1,s1,-550 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207b1e:	609c                	ld	a5,0(s1)
ffffffffc0207b20:	ec06                	sd	ra,24(sp)
ffffffffc0207b22:	e822                	sd	s0,16(sp)
ffffffffc0207b24:	c3a1                	beqz	a5,ffffffffc0207b64 <vfs_get_bootfs+0x52>
ffffffffc0207b26:	842a                	mv	s0,a0
ffffffffc0207b28:	0008e517          	auipc	a0,0x8e
ffffffffc0207b2c:	cd850513          	addi	a0,a0,-808 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b30:	a35fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207b34:	6084                	ld	s1,0(s1)
ffffffffc0207b36:	c08d                	beqz	s1,ffffffffc0207b58 <vfs_get_bootfs+0x46>
ffffffffc0207b38:	8526                	mv	a0,s1
ffffffffc0207b3a:	d0dff0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc0207b3e:	0008e517          	auipc	a0,0x8e
ffffffffc0207b42:	cc250513          	addi	a0,a0,-830 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b46:	a1bfc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207b4a:	4501                	li	a0,0
ffffffffc0207b4c:	e004                	sd	s1,0(s0)
ffffffffc0207b4e:	60e2                	ld	ra,24(sp)
ffffffffc0207b50:	6442                	ld	s0,16(sp)
ffffffffc0207b52:	64a2                	ld	s1,8(sp)
ffffffffc0207b54:	6105                	addi	sp,sp,32
ffffffffc0207b56:	8082                	ret
ffffffffc0207b58:	0008e517          	auipc	a0,0x8e
ffffffffc0207b5c:	ca850513          	addi	a0,a0,-856 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207b60:	a01fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207b64:	5541                	li	a0,-16
ffffffffc0207b66:	b7e5                	j	ffffffffc0207b4e <vfs_get_bootfs+0x3c>

ffffffffc0207b68 <vfs_do_add>:
ffffffffc0207b68:	7139                	addi	sp,sp,-64
ffffffffc0207b6a:	fc06                	sd	ra,56(sp)
ffffffffc0207b6c:	f822                	sd	s0,48(sp)
ffffffffc0207b6e:	f426                	sd	s1,40(sp)
ffffffffc0207b70:	f04a                	sd	s2,32(sp)
ffffffffc0207b72:	ec4e                	sd	s3,24(sp)
ffffffffc0207b74:	e852                	sd	s4,16(sp)
ffffffffc0207b76:	e456                	sd	s5,8(sp)
ffffffffc0207b78:	e05a                	sd	s6,0(sp)
ffffffffc0207b7a:	0e050b63          	beqz	a0,ffffffffc0207c70 <vfs_do_add+0x108>
ffffffffc0207b7e:	842a                	mv	s0,a0
ffffffffc0207b80:	8a2e                	mv	s4,a1
ffffffffc0207b82:	8b32                	mv	s6,a2
ffffffffc0207b84:	8ab6                	mv	s5,a3
ffffffffc0207b86:	c5cd                	beqz	a1,ffffffffc0207c30 <vfs_do_add+0xc8>
ffffffffc0207b88:	4db8                	lw	a4,88(a1)
ffffffffc0207b8a:	6785                	lui	a5,0x1
ffffffffc0207b8c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207b90:	0af71163          	bne	a4,a5,ffffffffc0207c32 <vfs_do_add+0xca>
ffffffffc0207b94:	8522                	mv	a0,s0
ffffffffc0207b96:	063030ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc0207b9a:	47fd                	li	a5,31
ffffffffc0207b9c:	0ca7e663          	bltu	a5,a0,ffffffffc0207c68 <vfs_do_add+0x100>
ffffffffc0207ba0:	8522                	mv	a0,s0
ffffffffc0207ba2:	e52f80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207ba6:	84aa                	mv	s1,a0
ffffffffc0207ba8:	c171                	beqz	a0,ffffffffc0207c6c <vfs_do_add+0x104>
ffffffffc0207baa:	03000513          	li	a0,48
ffffffffc0207bae:	be0fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207bb2:	89aa                	mv	s3,a0
ffffffffc0207bb4:	c92d                	beqz	a0,ffffffffc0207c26 <vfs_do_add+0xbe>
ffffffffc0207bb6:	0008e517          	auipc	a0,0x8e
ffffffffc0207bba:	c7250513          	addi	a0,a0,-910 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207bbe:	0008e917          	auipc	s2,0x8e
ffffffffc0207bc2:	c5a90913          	addi	s2,s2,-934 # ffffffffc0295818 <vdev_list>
ffffffffc0207bc6:	99ffc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207bca:	844a                	mv	s0,s2
ffffffffc0207bcc:	a039                	j	ffffffffc0207bda <vfs_do_add+0x72>
ffffffffc0207bce:	fe043503          	ld	a0,-32(s0)
ffffffffc0207bd2:	85a6                	mv	a1,s1
ffffffffc0207bd4:	06d030ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc0207bd8:	cd2d                	beqz	a0,ffffffffc0207c52 <vfs_do_add+0xea>
ffffffffc0207bda:	6400                	ld	s0,8(s0)
ffffffffc0207bdc:	ff2419e3          	bne	s0,s2,ffffffffc0207bce <vfs_do_add+0x66>
ffffffffc0207be0:	6418                	ld	a4,8(s0)
ffffffffc0207be2:	02098793          	addi	a5,s3,32
ffffffffc0207be6:	0099b023          	sd	s1,0(s3)
ffffffffc0207bea:	0149b423          	sd	s4,8(s3)
ffffffffc0207bee:	0159bc23          	sd	s5,24(s3)
ffffffffc0207bf2:	0169b823          	sd	s6,16(s3)
ffffffffc0207bf6:	e31c                	sd	a5,0(a4)
ffffffffc0207bf8:	0289b023          	sd	s0,32(s3)
ffffffffc0207bfc:	02e9b423          	sd	a4,40(s3)
ffffffffc0207c00:	0008e517          	auipc	a0,0x8e
ffffffffc0207c04:	c2850513          	addi	a0,a0,-984 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c08:	e41c                	sd	a5,8(s0)
ffffffffc0207c0a:	4401                	li	s0,0
ffffffffc0207c0c:	955fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207c10:	70e2                	ld	ra,56(sp)
ffffffffc0207c12:	8522                	mv	a0,s0
ffffffffc0207c14:	7442                	ld	s0,48(sp)
ffffffffc0207c16:	74a2                	ld	s1,40(sp)
ffffffffc0207c18:	7902                	ld	s2,32(sp)
ffffffffc0207c1a:	69e2                	ld	s3,24(sp)
ffffffffc0207c1c:	6a42                	ld	s4,16(sp)
ffffffffc0207c1e:	6aa2                	ld	s5,8(sp)
ffffffffc0207c20:	6b02                	ld	s6,0(sp)
ffffffffc0207c22:	6121                	addi	sp,sp,64
ffffffffc0207c24:	8082                	ret
ffffffffc0207c26:	5471                	li	s0,-4
ffffffffc0207c28:	8526                	mv	a0,s1
ffffffffc0207c2a:	c14fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207c2e:	b7cd                	j	ffffffffc0207c10 <vfs_do_add+0xa8>
ffffffffc0207c30:	d2b5                	beqz	a3,ffffffffc0207b94 <vfs_do_add+0x2c>
ffffffffc0207c32:	00007697          	auipc	a3,0x7
ffffffffc0207c36:	93668693          	addi	a3,a3,-1738 # ffffffffc020e568 <syscalls+0xa70>
ffffffffc0207c3a:	00004617          	auipc	a2,0x4
ffffffffc0207c3e:	d4660613          	addi	a2,a2,-698 # ffffffffc020b980 <commands+0x210>
ffffffffc0207c42:	08f00593          	li	a1,143
ffffffffc0207c46:	00007517          	auipc	a0,0x7
ffffffffc0207c4a:	90a50513          	addi	a0,a0,-1782 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207c4e:	851f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207c52:	0008e517          	auipc	a0,0x8e
ffffffffc0207c56:	bd650513          	addi	a0,a0,-1066 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c5a:	907fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207c5e:	854e                	mv	a0,s3
ffffffffc0207c60:	bdefa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207c64:	5425                	li	s0,-23
ffffffffc0207c66:	b7c9                	j	ffffffffc0207c28 <vfs_do_add+0xc0>
ffffffffc0207c68:	5451                	li	s0,-12
ffffffffc0207c6a:	b75d                	j	ffffffffc0207c10 <vfs_do_add+0xa8>
ffffffffc0207c6c:	5471                	li	s0,-4
ffffffffc0207c6e:	b74d                	j	ffffffffc0207c10 <vfs_do_add+0xa8>
ffffffffc0207c70:	00007697          	auipc	a3,0x7
ffffffffc0207c74:	8d068693          	addi	a3,a3,-1840 # ffffffffc020e540 <syscalls+0xa48>
ffffffffc0207c78:	00004617          	auipc	a2,0x4
ffffffffc0207c7c:	d0860613          	addi	a2,a2,-760 # ffffffffc020b980 <commands+0x210>
ffffffffc0207c80:	08e00593          	li	a1,142
ffffffffc0207c84:	00007517          	auipc	a0,0x7
ffffffffc0207c88:	8cc50513          	addi	a0,a0,-1844 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207c8c:	813f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c90 <find_mount.part.0>:
ffffffffc0207c90:	1141                	addi	sp,sp,-16
ffffffffc0207c92:	00007697          	auipc	a3,0x7
ffffffffc0207c96:	8ae68693          	addi	a3,a3,-1874 # ffffffffc020e540 <syscalls+0xa48>
ffffffffc0207c9a:	00004617          	auipc	a2,0x4
ffffffffc0207c9e:	ce660613          	addi	a2,a2,-794 # ffffffffc020b980 <commands+0x210>
ffffffffc0207ca2:	0cd00593          	li	a1,205
ffffffffc0207ca6:	00007517          	auipc	a0,0x7
ffffffffc0207caa:	8aa50513          	addi	a0,a0,-1878 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207cae:	e406                	sd	ra,8(sp)
ffffffffc0207cb0:	feef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207cb4 <vfs_devlist_init>:
ffffffffc0207cb4:	0008e797          	auipc	a5,0x8e
ffffffffc0207cb8:	b6478793          	addi	a5,a5,-1180 # ffffffffc0295818 <vdev_list>
ffffffffc0207cbc:	4585                	li	a1,1
ffffffffc0207cbe:	0008e517          	auipc	a0,0x8e
ffffffffc0207cc2:	b6a50513          	addi	a0,a0,-1174 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cc6:	e79c                	sd	a5,8(a5)
ffffffffc0207cc8:	e39c                	sd	a5,0(a5)
ffffffffc0207cca:	891fc06f          	j	ffffffffc020455a <sem_init>

ffffffffc0207cce <vfs_cleanup>:
ffffffffc0207cce:	1101                	addi	sp,sp,-32
ffffffffc0207cd0:	e426                	sd	s1,8(sp)
ffffffffc0207cd2:	0008e497          	auipc	s1,0x8e
ffffffffc0207cd6:	b4648493          	addi	s1,s1,-1210 # ffffffffc0295818 <vdev_list>
ffffffffc0207cda:	649c                	ld	a5,8(s1)
ffffffffc0207cdc:	ec06                	sd	ra,24(sp)
ffffffffc0207cde:	e822                	sd	s0,16(sp)
ffffffffc0207ce0:	02978e63          	beq	a5,s1,ffffffffc0207d1c <vfs_cleanup+0x4e>
ffffffffc0207ce4:	0008e517          	auipc	a0,0x8e
ffffffffc0207ce8:	b4450513          	addi	a0,a0,-1212 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207cec:	879fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207cf0:	6480                	ld	s0,8(s1)
ffffffffc0207cf2:	00940b63          	beq	s0,s1,ffffffffc0207d08 <vfs_cleanup+0x3a>
ffffffffc0207cf6:	ff043783          	ld	a5,-16(s0)
ffffffffc0207cfa:	853e                	mv	a0,a5
ffffffffc0207cfc:	c399                	beqz	a5,ffffffffc0207d02 <vfs_cleanup+0x34>
ffffffffc0207cfe:	6bfc                	ld	a5,208(a5)
ffffffffc0207d00:	9782                	jalr	a5
ffffffffc0207d02:	6400                	ld	s0,8(s0)
ffffffffc0207d04:	fe9419e3          	bne	s0,s1,ffffffffc0207cf6 <vfs_cleanup+0x28>
ffffffffc0207d08:	6442                	ld	s0,16(sp)
ffffffffc0207d0a:	60e2                	ld	ra,24(sp)
ffffffffc0207d0c:	64a2                	ld	s1,8(sp)
ffffffffc0207d0e:	0008e517          	auipc	a0,0x8e
ffffffffc0207d12:	b1a50513          	addi	a0,a0,-1254 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d16:	6105                	addi	sp,sp,32
ffffffffc0207d18:	849fc06f          	j	ffffffffc0204560 <up>
ffffffffc0207d1c:	60e2                	ld	ra,24(sp)
ffffffffc0207d1e:	6442                	ld	s0,16(sp)
ffffffffc0207d20:	64a2                	ld	s1,8(sp)
ffffffffc0207d22:	6105                	addi	sp,sp,32
ffffffffc0207d24:	8082                	ret

ffffffffc0207d26 <vfs_get_root>:
ffffffffc0207d26:	7179                	addi	sp,sp,-48
ffffffffc0207d28:	f406                	sd	ra,40(sp)
ffffffffc0207d2a:	f022                	sd	s0,32(sp)
ffffffffc0207d2c:	ec26                	sd	s1,24(sp)
ffffffffc0207d2e:	e84a                	sd	s2,16(sp)
ffffffffc0207d30:	e44e                	sd	s3,8(sp)
ffffffffc0207d32:	e052                	sd	s4,0(sp)
ffffffffc0207d34:	c541                	beqz	a0,ffffffffc0207dbc <vfs_get_root+0x96>
ffffffffc0207d36:	0008e917          	auipc	s2,0x8e
ffffffffc0207d3a:	ae290913          	addi	s2,s2,-1310 # ffffffffc0295818 <vdev_list>
ffffffffc0207d3e:	00893783          	ld	a5,8(s2)
ffffffffc0207d42:	07278b63          	beq	a5,s2,ffffffffc0207db8 <vfs_get_root+0x92>
ffffffffc0207d46:	89aa                	mv	s3,a0
ffffffffc0207d48:	0008e517          	auipc	a0,0x8e
ffffffffc0207d4c:	ae050513          	addi	a0,a0,-1312 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d50:	8a2e                	mv	s4,a1
ffffffffc0207d52:	844a                	mv	s0,s2
ffffffffc0207d54:	811fc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207d58:	a801                	j	ffffffffc0207d68 <vfs_get_root+0x42>
ffffffffc0207d5a:	fe043583          	ld	a1,-32(s0)
ffffffffc0207d5e:	854e                	mv	a0,s3
ffffffffc0207d60:	6e0030ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc0207d64:	84aa                	mv	s1,a0
ffffffffc0207d66:	c505                	beqz	a0,ffffffffc0207d8e <vfs_get_root+0x68>
ffffffffc0207d68:	6400                	ld	s0,8(s0)
ffffffffc0207d6a:	ff2418e3          	bne	s0,s2,ffffffffc0207d5a <vfs_get_root+0x34>
ffffffffc0207d6e:	54cd                	li	s1,-13
ffffffffc0207d70:	0008e517          	auipc	a0,0x8e
ffffffffc0207d74:	ab850513          	addi	a0,a0,-1352 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d78:	fe8fc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207d7c:	70a2                	ld	ra,40(sp)
ffffffffc0207d7e:	7402                	ld	s0,32(sp)
ffffffffc0207d80:	6942                	ld	s2,16(sp)
ffffffffc0207d82:	69a2                	ld	s3,8(sp)
ffffffffc0207d84:	6a02                	ld	s4,0(sp)
ffffffffc0207d86:	8526                	mv	a0,s1
ffffffffc0207d88:	64e2                	ld	s1,24(sp)
ffffffffc0207d8a:	6145                	addi	sp,sp,48
ffffffffc0207d8c:	8082                	ret
ffffffffc0207d8e:	ff043503          	ld	a0,-16(s0)
ffffffffc0207d92:	c519                	beqz	a0,ffffffffc0207da0 <vfs_get_root+0x7a>
ffffffffc0207d94:	617c                	ld	a5,192(a0)
ffffffffc0207d96:	9782                	jalr	a5
ffffffffc0207d98:	c519                	beqz	a0,ffffffffc0207da6 <vfs_get_root+0x80>
ffffffffc0207d9a:	00aa3023          	sd	a0,0(s4)
ffffffffc0207d9e:	bfc9                	j	ffffffffc0207d70 <vfs_get_root+0x4a>
ffffffffc0207da0:	ff843783          	ld	a5,-8(s0)
ffffffffc0207da4:	c399                	beqz	a5,ffffffffc0207daa <vfs_get_root+0x84>
ffffffffc0207da6:	54c9                	li	s1,-14
ffffffffc0207da8:	b7e1                	j	ffffffffc0207d70 <vfs_get_root+0x4a>
ffffffffc0207daa:	fe843503          	ld	a0,-24(s0)
ffffffffc0207dae:	a99ff0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc0207db2:	fe843503          	ld	a0,-24(s0)
ffffffffc0207db6:	b7cd                	j	ffffffffc0207d98 <vfs_get_root+0x72>
ffffffffc0207db8:	54cd                	li	s1,-13
ffffffffc0207dba:	b7c9                	j	ffffffffc0207d7c <vfs_get_root+0x56>
ffffffffc0207dbc:	00006697          	auipc	a3,0x6
ffffffffc0207dc0:	78468693          	addi	a3,a3,1924 # ffffffffc020e540 <syscalls+0xa48>
ffffffffc0207dc4:	00004617          	auipc	a2,0x4
ffffffffc0207dc8:	bbc60613          	addi	a2,a2,-1092 # ffffffffc020b980 <commands+0x210>
ffffffffc0207dcc:	04500593          	li	a1,69
ffffffffc0207dd0:	00006517          	auipc	a0,0x6
ffffffffc0207dd4:	78050513          	addi	a0,a0,1920 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207dd8:	ec6f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207ddc <vfs_get_devname>:
ffffffffc0207ddc:	0008e697          	auipc	a3,0x8e
ffffffffc0207de0:	a3c68693          	addi	a3,a3,-1476 # ffffffffc0295818 <vdev_list>
ffffffffc0207de4:	87b6                	mv	a5,a3
ffffffffc0207de6:	e511                	bnez	a0,ffffffffc0207df2 <vfs_get_devname+0x16>
ffffffffc0207de8:	a829                	j	ffffffffc0207e02 <vfs_get_devname+0x26>
ffffffffc0207dea:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207dee:	00a70763          	beq	a4,a0,ffffffffc0207dfc <vfs_get_devname+0x20>
ffffffffc0207df2:	679c                	ld	a5,8(a5)
ffffffffc0207df4:	fed79be3          	bne	a5,a3,ffffffffc0207dea <vfs_get_devname+0xe>
ffffffffc0207df8:	4501                	li	a0,0
ffffffffc0207dfa:	8082                	ret
ffffffffc0207dfc:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207e00:	8082                	ret
ffffffffc0207e02:	1141                	addi	sp,sp,-16
ffffffffc0207e04:	00006697          	auipc	a3,0x6
ffffffffc0207e08:	7c468693          	addi	a3,a3,1988 # ffffffffc020e5c8 <syscalls+0xad0>
ffffffffc0207e0c:	00004617          	auipc	a2,0x4
ffffffffc0207e10:	b7460613          	addi	a2,a2,-1164 # ffffffffc020b980 <commands+0x210>
ffffffffc0207e14:	06a00593          	li	a1,106
ffffffffc0207e18:	00006517          	auipc	a0,0x6
ffffffffc0207e1c:	73850513          	addi	a0,a0,1848 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207e20:	e406                	sd	ra,8(sp)
ffffffffc0207e22:	e7cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207e26 <vfs_add_dev>:
ffffffffc0207e26:	86b2                	mv	a3,a2
ffffffffc0207e28:	4601                	li	a2,0
ffffffffc0207e2a:	d3fff06f          	j	ffffffffc0207b68 <vfs_do_add>

ffffffffc0207e2e <vfs_mount>:
ffffffffc0207e2e:	7179                	addi	sp,sp,-48
ffffffffc0207e30:	e84a                	sd	s2,16(sp)
ffffffffc0207e32:	892a                	mv	s2,a0
ffffffffc0207e34:	0008e517          	auipc	a0,0x8e
ffffffffc0207e38:	9f450513          	addi	a0,a0,-1548 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207e3c:	e44e                	sd	s3,8(sp)
ffffffffc0207e3e:	f406                	sd	ra,40(sp)
ffffffffc0207e40:	f022                	sd	s0,32(sp)
ffffffffc0207e42:	ec26                	sd	s1,24(sp)
ffffffffc0207e44:	89ae                	mv	s3,a1
ffffffffc0207e46:	f1efc0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc0207e4a:	08090a63          	beqz	s2,ffffffffc0207ede <vfs_mount+0xb0>
ffffffffc0207e4e:	0008e497          	auipc	s1,0x8e
ffffffffc0207e52:	9ca48493          	addi	s1,s1,-1590 # ffffffffc0295818 <vdev_list>
ffffffffc0207e56:	6480                	ld	s0,8(s1)
ffffffffc0207e58:	00941663          	bne	s0,s1,ffffffffc0207e64 <vfs_mount+0x36>
ffffffffc0207e5c:	a8ad                	j	ffffffffc0207ed6 <vfs_mount+0xa8>
ffffffffc0207e5e:	6400                	ld	s0,8(s0)
ffffffffc0207e60:	06940b63          	beq	s0,s1,ffffffffc0207ed6 <vfs_mount+0xa8>
ffffffffc0207e64:	ff843783          	ld	a5,-8(s0)
ffffffffc0207e68:	dbfd                	beqz	a5,ffffffffc0207e5e <vfs_mount+0x30>
ffffffffc0207e6a:	fe043503          	ld	a0,-32(s0)
ffffffffc0207e6e:	85ca                	mv	a1,s2
ffffffffc0207e70:	5d0030ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc0207e74:	f56d                	bnez	a0,ffffffffc0207e5e <vfs_mount+0x30>
ffffffffc0207e76:	ff043783          	ld	a5,-16(s0)
ffffffffc0207e7a:	e3a5                	bnez	a5,ffffffffc0207eda <vfs_mount+0xac>
ffffffffc0207e7c:	fe043783          	ld	a5,-32(s0)
ffffffffc0207e80:	c3c9                	beqz	a5,ffffffffc0207f02 <vfs_mount+0xd4>
ffffffffc0207e82:	ff843783          	ld	a5,-8(s0)
ffffffffc0207e86:	cfb5                	beqz	a5,ffffffffc0207f02 <vfs_mount+0xd4>
ffffffffc0207e88:	fe843503          	ld	a0,-24(s0)
ffffffffc0207e8c:	c939                	beqz	a0,ffffffffc0207ee2 <vfs_mount+0xb4>
ffffffffc0207e8e:	4d38                	lw	a4,88(a0)
ffffffffc0207e90:	6785                	lui	a5,0x1
ffffffffc0207e92:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207e96:	04f71663          	bne	a4,a5,ffffffffc0207ee2 <vfs_mount+0xb4>
ffffffffc0207e9a:	ff040593          	addi	a1,s0,-16
ffffffffc0207e9e:	9982                	jalr	s3
ffffffffc0207ea0:	84aa                	mv	s1,a0
ffffffffc0207ea2:	ed01                	bnez	a0,ffffffffc0207eba <vfs_mount+0x8c>
ffffffffc0207ea4:	ff043783          	ld	a5,-16(s0)
ffffffffc0207ea8:	cfad                	beqz	a5,ffffffffc0207f22 <vfs_mount+0xf4>
ffffffffc0207eaa:	fe043583          	ld	a1,-32(s0)
ffffffffc0207eae:	00006517          	auipc	a0,0x6
ffffffffc0207eb2:	7aa50513          	addi	a0,a0,1962 # ffffffffc020e658 <syscalls+0xb60>
ffffffffc0207eb6:	af0f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207eba:	0008e517          	auipc	a0,0x8e
ffffffffc0207ebe:	96e50513          	addi	a0,a0,-1682 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207ec2:	e9efc0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc0207ec6:	70a2                	ld	ra,40(sp)
ffffffffc0207ec8:	7402                	ld	s0,32(sp)
ffffffffc0207eca:	6942                	ld	s2,16(sp)
ffffffffc0207ecc:	69a2                	ld	s3,8(sp)
ffffffffc0207ece:	8526                	mv	a0,s1
ffffffffc0207ed0:	64e2                	ld	s1,24(sp)
ffffffffc0207ed2:	6145                	addi	sp,sp,48
ffffffffc0207ed4:	8082                	ret
ffffffffc0207ed6:	54cd                	li	s1,-13
ffffffffc0207ed8:	b7cd                	j	ffffffffc0207eba <vfs_mount+0x8c>
ffffffffc0207eda:	54c5                	li	s1,-15
ffffffffc0207edc:	bff9                	j	ffffffffc0207eba <vfs_mount+0x8c>
ffffffffc0207ede:	db3ff0ef          	jal	ra,ffffffffc0207c90 <find_mount.part.0>
ffffffffc0207ee2:	00006697          	auipc	a3,0x6
ffffffffc0207ee6:	72668693          	addi	a3,a3,1830 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0207eea:	00004617          	auipc	a2,0x4
ffffffffc0207eee:	a9660613          	addi	a2,a2,-1386 # ffffffffc020b980 <commands+0x210>
ffffffffc0207ef2:	0ed00593          	li	a1,237
ffffffffc0207ef6:	00006517          	auipc	a0,0x6
ffffffffc0207efa:	65a50513          	addi	a0,a0,1626 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207efe:	da0f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f02:	00006697          	auipc	a3,0x6
ffffffffc0207f06:	6d668693          	addi	a3,a3,1750 # ffffffffc020e5d8 <syscalls+0xae0>
ffffffffc0207f0a:	00004617          	auipc	a2,0x4
ffffffffc0207f0e:	a7660613          	addi	a2,a2,-1418 # ffffffffc020b980 <commands+0x210>
ffffffffc0207f12:	0eb00593          	li	a1,235
ffffffffc0207f16:	00006517          	auipc	a0,0x6
ffffffffc0207f1a:	63a50513          	addi	a0,a0,1594 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207f1e:	d80f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f22:	00006697          	auipc	a3,0x6
ffffffffc0207f26:	71e68693          	addi	a3,a3,1822 # ffffffffc020e640 <syscalls+0xb48>
ffffffffc0207f2a:	00004617          	auipc	a2,0x4
ffffffffc0207f2e:	a5660613          	addi	a2,a2,-1450 # ffffffffc020b980 <commands+0x210>
ffffffffc0207f32:	0ef00593          	li	a1,239
ffffffffc0207f36:	00006517          	auipc	a0,0x6
ffffffffc0207f3a:	61a50513          	addi	a0,a0,1562 # ffffffffc020e550 <syscalls+0xa58>
ffffffffc0207f3e:	d60f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207f42 <vfs_open>:
ffffffffc0207f42:	711d                	addi	sp,sp,-96
ffffffffc0207f44:	e4a6                	sd	s1,72(sp)
ffffffffc0207f46:	e0ca                	sd	s2,64(sp)
ffffffffc0207f48:	fc4e                	sd	s3,56(sp)
ffffffffc0207f4a:	ec86                	sd	ra,88(sp)
ffffffffc0207f4c:	e8a2                	sd	s0,80(sp)
ffffffffc0207f4e:	f852                	sd	s4,48(sp)
ffffffffc0207f50:	f456                	sd	s5,40(sp)
ffffffffc0207f52:	0035f793          	andi	a5,a1,3
ffffffffc0207f56:	84ae                	mv	s1,a1
ffffffffc0207f58:	892a                	mv	s2,a0
ffffffffc0207f5a:	89b2                	mv	s3,a2
ffffffffc0207f5c:	0e078663          	beqz	a5,ffffffffc0208048 <vfs_open+0x106>
ffffffffc0207f60:	470d                	li	a4,3
ffffffffc0207f62:	0105fa93          	andi	s5,a1,16
ffffffffc0207f66:	0ce78f63          	beq	a5,a4,ffffffffc0208044 <vfs_open+0x102>
ffffffffc0207f6a:	002c                	addi	a1,sp,8
ffffffffc0207f6c:	854a                	mv	a0,s2
ffffffffc0207f6e:	2ae000ef          	jal	ra,ffffffffc020821c <vfs_lookup>
ffffffffc0207f72:	842a                	mv	s0,a0
ffffffffc0207f74:	0044fa13          	andi	s4,s1,4
ffffffffc0207f78:	e159                	bnez	a0,ffffffffc0207ffe <vfs_open+0xbc>
ffffffffc0207f7a:	00c4f793          	andi	a5,s1,12
ffffffffc0207f7e:	4731                	li	a4,12
ffffffffc0207f80:	0ee78263          	beq	a5,a4,ffffffffc0208064 <vfs_open+0x122>
ffffffffc0207f84:	6422                	ld	s0,8(sp)
ffffffffc0207f86:	12040163          	beqz	s0,ffffffffc02080a8 <vfs_open+0x166>
ffffffffc0207f8a:	783c                	ld	a5,112(s0)
ffffffffc0207f8c:	cff1                	beqz	a5,ffffffffc0208068 <vfs_open+0x126>
ffffffffc0207f8e:	679c                	ld	a5,8(a5)
ffffffffc0207f90:	cfe1                	beqz	a5,ffffffffc0208068 <vfs_open+0x126>
ffffffffc0207f92:	8522                	mv	a0,s0
ffffffffc0207f94:	00006597          	auipc	a1,0x6
ffffffffc0207f98:	7a458593          	addi	a1,a1,1956 # ffffffffc020e738 <syscalls+0xc40>
ffffffffc0207f9c:	8c3ff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0207fa0:	783c                	ld	a5,112(s0)
ffffffffc0207fa2:	6522                	ld	a0,8(sp)
ffffffffc0207fa4:	85a6                	mv	a1,s1
ffffffffc0207fa6:	679c                	ld	a5,8(a5)
ffffffffc0207fa8:	9782                	jalr	a5
ffffffffc0207faa:	842a                	mv	s0,a0
ffffffffc0207fac:	6522                	ld	a0,8(sp)
ffffffffc0207fae:	e845                	bnez	s0,ffffffffc020805e <vfs_open+0x11c>
ffffffffc0207fb0:	015a6a33          	or	s4,s4,s5
ffffffffc0207fb4:	89fff0ef          	jal	ra,ffffffffc0207852 <inode_open_inc>
ffffffffc0207fb8:	020a0663          	beqz	s4,ffffffffc0207fe4 <vfs_open+0xa2>
ffffffffc0207fbc:	64a2                	ld	s1,8(sp)
ffffffffc0207fbe:	c4e9                	beqz	s1,ffffffffc0208088 <vfs_open+0x146>
ffffffffc0207fc0:	78bc                	ld	a5,112(s1)
ffffffffc0207fc2:	c3f9                	beqz	a5,ffffffffc0208088 <vfs_open+0x146>
ffffffffc0207fc4:	73bc                	ld	a5,96(a5)
ffffffffc0207fc6:	c3e9                	beqz	a5,ffffffffc0208088 <vfs_open+0x146>
ffffffffc0207fc8:	00006597          	auipc	a1,0x6
ffffffffc0207fcc:	7d058593          	addi	a1,a1,2000 # ffffffffc020e798 <syscalls+0xca0>
ffffffffc0207fd0:	8526                	mv	a0,s1
ffffffffc0207fd2:	88dff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0207fd6:	78bc                	ld	a5,112(s1)
ffffffffc0207fd8:	6522                	ld	a0,8(sp)
ffffffffc0207fda:	4581                	li	a1,0
ffffffffc0207fdc:	73bc                	ld	a5,96(a5)
ffffffffc0207fde:	9782                	jalr	a5
ffffffffc0207fe0:	87aa                	mv	a5,a0
ffffffffc0207fe2:	e92d                	bnez	a0,ffffffffc0208054 <vfs_open+0x112>
ffffffffc0207fe4:	67a2                	ld	a5,8(sp)
ffffffffc0207fe6:	00f9b023          	sd	a5,0(s3)
ffffffffc0207fea:	60e6                	ld	ra,88(sp)
ffffffffc0207fec:	8522                	mv	a0,s0
ffffffffc0207fee:	6446                	ld	s0,80(sp)
ffffffffc0207ff0:	64a6                	ld	s1,72(sp)
ffffffffc0207ff2:	6906                	ld	s2,64(sp)
ffffffffc0207ff4:	79e2                	ld	s3,56(sp)
ffffffffc0207ff6:	7a42                	ld	s4,48(sp)
ffffffffc0207ff8:	7aa2                	ld	s5,40(sp)
ffffffffc0207ffa:	6125                	addi	sp,sp,96
ffffffffc0207ffc:	8082                	ret
ffffffffc0207ffe:	57c1                	li	a5,-16
ffffffffc0208000:	fef515e3          	bne	a0,a5,ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208004:	fe0a03e3          	beqz	s4,ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208008:	0810                	addi	a2,sp,16
ffffffffc020800a:	082c                	addi	a1,sp,24
ffffffffc020800c:	854a                	mv	a0,s2
ffffffffc020800e:	2a4000ef          	jal	ra,ffffffffc02082b2 <vfs_lookup_parent>
ffffffffc0208012:	842a                	mv	s0,a0
ffffffffc0208014:	f979                	bnez	a0,ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208016:	6462                	ld	s0,24(sp)
ffffffffc0208018:	c845                	beqz	s0,ffffffffc02080c8 <vfs_open+0x186>
ffffffffc020801a:	783c                	ld	a5,112(s0)
ffffffffc020801c:	c7d5                	beqz	a5,ffffffffc02080c8 <vfs_open+0x186>
ffffffffc020801e:	77bc                	ld	a5,104(a5)
ffffffffc0208020:	c7c5                	beqz	a5,ffffffffc02080c8 <vfs_open+0x186>
ffffffffc0208022:	8522                	mv	a0,s0
ffffffffc0208024:	00006597          	auipc	a1,0x6
ffffffffc0208028:	6ac58593          	addi	a1,a1,1708 # ffffffffc020e6d0 <syscalls+0xbd8>
ffffffffc020802c:	833ff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0208030:	783c                	ld	a5,112(s0)
ffffffffc0208032:	65c2                	ld	a1,16(sp)
ffffffffc0208034:	6562                	ld	a0,24(sp)
ffffffffc0208036:	77bc                	ld	a5,104(a5)
ffffffffc0208038:	4034d613          	srai	a2,s1,0x3
ffffffffc020803c:	0034                	addi	a3,sp,8
ffffffffc020803e:	8a05                	andi	a2,a2,1
ffffffffc0208040:	9782                	jalr	a5
ffffffffc0208042:	b789                	j	ffffffffc0207f84 <vfs_open+0x42>
ffffffffc0208044:	5475                	li	s0,-3
ffffffffc0208046:	b755                	j	ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208048:	0105fa93          	andi	s5,a1,16
ffffffffc020804c:	5475                	li	s0,-3
ffffffffc020804e:	f80a9ee3          	bnez	s5,ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208052:	bf21                	j	ffffffffc0207f6a <vfs_open+0x28>
ffffffffc0208054:	6522                	ld	a0,8(sp)
ffffffffc0208056:	843e                	mv	s0,a5
ffffffffc0208058:	965ff0ef          	jal	ra,ffffffffc02079bc <inode_open_dec>
ffffffffc020805c:	6522                	ld	a0,8(sp)
ffffffffc020805e:	8b7ff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc0208062:	b761                	j	ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208064:	5425                	li	s0,-23
ffffffffc0208066:	b751                	j	ffffffffc0207fea <vfs_open+0xa8>
ffffffffc0208068:	00006697          	auipc	a3,0x6
ffffffffc020806c:	68068693          	addi	a3,a3,1664 # ffffffffc020e6e8 <syscalls+0xbf0>
ffffffffc0208070:	00004617          	auipc	a2,0x4
ffffffffc0208074:	91060613          	addi	a2,a2,-1776 # ffffffffc020b980 <commands+0x210>
ffffffffc0208078:	03300593          	li	a1,51
ffffffffc020807c:	00006517          	auipc	a0,0x6
ffffffffc0208080:	63c50513          	addi	a0,a0,1596 # ffffffffc020e6b8 <syscalls+0xbc0>
ffffffffc0208084:	c1af80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208088:	00006697          	auipc	a3,0x6
ffffffffc020808c:	6b868693          	addi	a3,a3,1720 # ffffffffc020e740 <syscalls+0xc48>
ffffffffc0208090:	00004617          	auipc	a2,0x4
ffffffffc0208094:	8f060613          	addi	a2,a2,-1808 # ffffffffc020b980 <commands+0x210>
ffffffffc0208098:	03a00593          	li	a1,58
ffffffffc020809c:	00006517          	auipc	a0,0x6
ffffffffc02080a0:	61c50513          	addi	a0,a0,1564 # ffffffffc020e6b8 <syscalls+0xbc0>
ffffffffc02080a4:	bfaf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02080a8:	00006697          	auipc	a3,0x6
ffffffffc02080ac:	63068693          	addi	a3,a3,1584 # ffffffffc020e6d8 <syscalls+0xbe0>
ffffffffc02080b0:	00004617          	auipc	a2,0x4
ffffffffc02080b4:	8d060613          	addi	a2,a2,-1840 # ffffffffc020b980 <commands+0x210>
ffffffffc02080b8:	03100593          	li	a1,49
ffffffffc02080bc:	00006517          	auipc	a0,0x6
ffffffffc02080c0:	5fc50513          	addi	a0,a0,1532 # ffffffffc020e6b8 <syscalls+0xbc0>
ffffffffc02080c4:	bdaf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02080c8:	00006697          	auipc	a3,0x6
ffffffffc02080cc:	5a068693          	addi	a3,a3,1440 # ffffffffc020e668 <syscalls+0xb70>
ffffffffc02080d0:	00004617          	auipc	a2,0x4
ffffffffc02080d4:	8b060613          	addi	a2,a2,-1872 # ffffffffc020b980 <commands+0x210>
ffffffffc02080d8:	02c00593          	li	a1,44
ffffffffc02080dc:	00006517          	auipc	a0,0x6
ffffffffc02080e0:	5dc50513          	addi	a0,a0,1500 # ffffffffc020e6b8 <syscalls+0xbc0>
ffffffffc02080e4:	bbaf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02080e8 <vfs_close>:
ffffffffc02080e8:	1141                	addi	sp,sp,-16
ffffffffc02080ea:	e406                	sd	ra,8(sp)
ffffffffc02080ec:	e022                	sd	s0,0(sp)
ffffffffc02080ee:	842a                	mv	s0,a0
ffffffffc02080f0:	8cdff0ef          	jal	ra,ffffffffc02079bc <inode_open_dec>
ffffffffc02080f4:	8522                	mv	a0,s0
ffffffffc02080f6:	81fff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc02080fa:	60a2                	ld	ra,8(sp)
ffffffffc02080fc:	6402                	ld	s0,0(sp)
ffffffffc02080fe:	4501                	li	a0,0
ffffffffc0208100:	0141                	addi	sp,sp,16
ffffffffc0208102:	8082                	ret

ffffffffc0208104 <get_device>:
ffffffffc0208104:	7179                	addi	sp,sp,-48
ffffffffc0208106:	ec26                	sd	s1,24(sp)
ffffffffc0208108:	e84a                	sd	s2,16(sp)
ffffffffc020810a:	f406                	sd	ra,40(sp)
ffffffffc020810c:	f022                	sd	s0,32(sp)
ffffffffc020810e:	00054303          	lbu	t1,0(a0)
ffffffffc0208112:	892e                	mv	s2,a1
ffffffffc0208114:	84b2                	mv	s1,a2
ffffffffc0208116:	02030463          	beqz	t1,ffffffffc020813e <get_device+0x3a>
ffffffffc020811a:	00150413          	addi	s0,a0,1
ffffffffc020811e:	86a2                	mv	a3,s0
ffffffffc0208120:	879a                	mv	a5,t1
ffffffffc0208122:	4701                	li	a4,0
ffffffffc0208124:	03a00813          	li	a6,58
ffffffffc0208128:	02f00893          	li	a7,47
ffffffffc020812c:	03078263          	beq	a5,a6,ffffffffc0208150 <get_device+0x4c>
ffffffffc0208130:	05178963          	beq	a5,a7,ffffffffc0208182 <get_device+0x7e>
ffffffffc0208134:	0006c783          	lbu	a5,0(a3)
ffffffffc0208138:	2705                	addiw	a4,a4,1
ffffffffc020813a:	0685                	addi	a3,a3,1
ffffffffc020813c:	fbe5                	bnez	a5,ffffffffc020812c <get_device+0x28>
ffffffffc020813e:	7402                	ld	s0,32(sp)
ffffffffc0208140:	00a93023          	sd	a0,0(s2)
ffffffffc0208144:	70a2                	ld	ra,40(sp)
ffffffffc0208146:	6942                	ld	s2,16(sp)
ffffffffc0208148:	8526                	mv	a0,s1
ffffffffc020814a:	64e2                	ld	s1,24(sp)
ffffffffc020814c:	6145                	addi	sp,sp,48
ffffffffc020814e:	a279                	j	ffffffffc02082dc <vfs_get_curdir>
ffffffffc0208150:	cb15                	beqz	a4,ffffffffc0208184 <get_device+0x80>
ffffffffc0208152:	00e507b3          	add	a5,a0,a4
ffffffffc0208156:	0705                	addi	a4,a4,1
ffffffffc0208158:	00078023          	sb	zero,0(a5)
ffffffffc020815c:	972a                	add	a4,a4,a0
ffffffffc020815e:	02f00613          	li	a2,47
ffffffffc0208162:	00074783          	lbu	a5,0(a4)
ffffffffc0208166:	86ba                	mv	a3,a4
ffffffffc0208168:	0705                	addi	a4,a4,1
ffffffffc020816a:	fec78ce3          	beq	a5,a2,ffffffffc0208162 <get_device+0x5e>
ffffffffc020816e:	7402                	ld	s0,32(sp)
ffffffffc0208170:	70a2                	ld	ra,40(sp)
ffffffffc0208172:	00d93023          	sd	a3,0(s2)
ffffffffc0208176:	85a6                	mv	a1,s1
ffffffffc0208178:	6942                	ld	s2,16(sp)
ffffffffc020817a:	64e2                	ld	s1,24(sp)
ffffffffc020817c:	6145                	addi	sp,sp,48
ffffffffc020817e:	ba9ff06f          	j	ffffffffc0207d26 <vfs_get_root>
ffffffffc0208182:	ff55                	bnez	a4,ffffffffc020813e <get_device+0x3a>
ffffffffc0208184:	02f00793          	li	a5,47
ffffffffc0208188:	04f30563          	beq	t1,a5,ffffffffc02081d2 <get_device+0xce>
ffffffffc020818c:	03a00793          	li	a5,58
ffffffffc0208190:	06f31663          	bne	t1,a5,ffffffffc02081fc <get_device+0xf8>
ffffffffc0208194:	0028                	addi	a0,sp,8
ffffffffc0208196:	146000ef          	jal	ra,ffffffffc02082dc <vfs_get_curdir>
ffffffffc020819a:	e515                	bnez	a0,ffffffffc02081c6 <get_device+0xc2>
ffffffffc020819c:	67a2                	ld	a5,8(sp)
ffffffffc020819e:	77a8                	ld	a0,104(a5)
ffffffffc02081a0:	cd15                	beqz	a0,ffffffffc02081dc <get_device+0xd8>
ffffffffc02081a2:	617c                	ld	a5,192(a0)
ffffffffc02081a4:	9782                	jalr	a5
ffffffffc02081a6:	87aa                	mv	a5,a0
ffffffffc02081a8:	6522                	ld	a0,8(sp)
ffffffffc02081aa:	e09c                	sd	a5,0(s1)
ffffffffc02081ac:	f68ff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc02081b0:	02f00713          	li	a4,47
ffffffffc02081b4:	a011                	j	ffffffffc02081b8 <get_device+0xb4>
ffffffffc02081b6:	0405                	addi	s0,s0,1
ffffffffc02081b8:	00044783          	lbu	a5,0(s0)
ffffffffc02081bc:	fee78de3          	beq	a5,a4,ffffffffc02081b6 <get_device+0xb2>
ffffffffc02081c0:	00893023          	sd	s0,0(s2)
ffffffffc02081c4:	4501                	li	a0,0
ffffffffc02081c6:	70a2                	ld	ra,40(sp)
ffffffffc02081c8:	7402                	ld	s0,32(sp)
ffffffffc02081ca:	64e2                	ld	s1,24(sp)
ffffffffc02081cc:	6942                	ld	s2,16(sp)
ffffffffc02081ce:	6145                	addi	sp,sp,48
ffffffffc02081d0:	8082                	ret
ffffffffc02081d2:	8526                	mv	a0,s1
ffffffffc02081d4:	93fff0ef          	jal	ra,ffffffffc0207b12 <vfs_get_bootfs>
ffffffffc02081d8:	dd61                	beqz	a0,ffffffffc02081b0 <get_device+0xac>
ffffffffc02081da:	b7f5                	j	ffffffffc02081c6 <get_device+0xc2>
ffffffffc02081dc:	00006697          	auipc	a3,0x6
ffffffffc02081e0:	5f468693          	addi	a3,a3,1524 # ffffffffc020e7d0 <syscalls+0xcd8>
ffffffffc02081e4:	00003617          	auipc	a2,0x3
ffffffffc02081e8:	79c60613          	addi	a2,a2,1948 # ffffffffc020b980 <commands+0x210>
ffffffffc02081ec:	03900593          	li	a1,57
ffffffffc02081f0:	00006517          	auipc	a0,0x6
ffffffffc02081f4:	5c850513          	addi	a0,a0,1480 # ffffffffc020e7b8 <syscalls+0xcc0>
ffffffffc02081f8:	aa6f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02081fc:	00006697          	auipc	a3,0x6
ffffffffc0208200:	5ac68693          	addi	a3,a3,1452 # ffffffffc020e7a8 <syscalls+0xcb0>
ffffffffc0208204:	00003617          	auipc	a2,0x3
ffffffffc0208208:	77c60613          	addi	a2,a2,1916 # ffffffffc020b980 <commands+0x210>
ffffffffc020820c:	03300593          	li	a1,51
ffffffffc0208210:	00006517          	auipc	a0,0x6
ffffffffc0208214:	5a850513          	addi	a0,a0,1448 # ffffffffc020e7b8 <syscalls+0xcc0>
ffffffffc0208218:	a86f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020821c <vfs_lookup>:
ffffffffc020821c:	7139                	addi	sp,sp,-64
ffffffffc020821e:	f426                	sd	s1,40(sp)
ffffffffc0208220:	0830                	addi	a2,sp,24
ffffffffc0208222:	84ae                	mv	s1,a1
ffffffffc0208224:	002c                	addi	a1,sp,8
ffffffffc0208226:	f822                	sd	s0,48(sp)
ffffffffc0208228:	fc06                	sd	ra,56(sp)
ffffffffc020822a:	f04a                	sd	s2,32(sp)
ffffffffc020822c:	e42a                	sd	a0,8(sp)
ffffffffc020822e:	ed7ff0ef          	jal	ra,ffffffffc0208104 <get_device>
ffffffffc0208232:	842a                	mv	s0,a0
ffffffffc0208234:	ed1d                	bnez	a0,ffffffffc0208272 <vfs_lookup+0x56>
ffffffffc0208236:	67a2                	ld	a5,8(sp)
ffffffffc0208238:	6962                	ld	s2,24(sp)
ffffffffc020823a:	0007c783          	lbu	a5,0(a5)
ffffffffc020823e:	c3a9                	beqz	a5,ffffffffc0208280 <vfs_lookup+0x64>
ffffffffc0208240:	04090963          	beqz	s2,ffffffffc0208292 <vfs_lookup+0x76>
ffffffffc0208244:	07093783          	ld	a5,112(s2)
ffffffffc0208248:	c7a9                	beqz	a5,ffffffffc0208292 <vfs_lookup+0x76>
ffffffffc020824a:	7bbc                	ld	a5,112(a5)
ffffffffc020824c:	c3b9                	beqz	a5,ffffffffc0208292 <vfs_lookup+0x76>
ffffffffc020824e:	854a                	mv	a0,s2
ffffffffc0208250:	00006597          	auipc	a1,0x6
ffffffffc0208254:	5e858593          	addi	a1,a1,1512 # ffffffffc020e838 <syscalls+0xd40>
ffffffffc0208258:	e06ff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc020825c:	07093783          	ld	a5,112(s2)
ffffffffc0208260:	65a2                	ld	a1,8(sp)
ffffffffc0208262:	6562                	ld	a0,24(sp)
ffffffffc0208264:	7bbc                	ld	a5,112(a5)
ffffffffc0208266:	8626                	mv	a2,s1
ffffffffc0208268:	9782                	jalr	a5
ffffffffc020826a:	842a                	mv	s0,a0
ffffffffc020826c:	6562                	ld	a0,24(sp)
ffffffffc020826e:	ea6ff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc0208272:	70e2                	ld	ra,56(sp)
ffffffffc0208274:	8522                	mv	a0,s0
ffffffffc0208276:	7442                	ld	s0,48(sp)
ffffffffc0208278:	74a2                	ld	s1,40(sp)
ffffffffc020827a:	7902                	ld	s2,32(sp)
ffffffffc020827c:	6121                	addi	sp,sp,64
ffffffffc020827e:	8082                	ret
ffffffffc0208280:	70e2                	ld	ra,56(sp)
ffffffffc0208282:	8522                	mv	a0,s0
ffffffffc0208284:	7442                	ld	s0,48(sp)
ffffffffc0208286:	0124b023          	sd	s2,0(s1)
ffffffffc020828a:	74a2                	ld	s1,40(sp)
ffffffffc020828c:	7902                	ld	s2,32(sp)
ffffffffc020828e:	6121                	addi	sp,sp,64
ffffffffc0208290:	8082                	ret
ffffffffc0208292:	00006697          	auipc	a3,0x6
ffffffffc0208296:	55668693          	addi	a3,a3,1366 # ffffffffc020e7e8 <syscalls+0xcf0>
ffffffffc020829a:	00003617          	auipc	a2,0x3
ffffffffc020829e:	6e660613          	addi	a2,a2,1766 # ffffffffc020b980 <commands+0x210>
ffffffffc02082a2:	04f00593          	li	a1,79
ffffffffc02082a6:	00006517          	auipc	a0,0x6
ffffffffc02082aa:	51250513          	addi	a0,a0,1298 # ffffffffc020e7b8 <syscalls+0xcc0>
ffffffffc02082ae:	9f0f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02082b2 <vfs_lookup_parent>:
ffffffffc02082b2:	7139                	addi	sp,sp,-64
ffffffffc02082b4:	f822                	sd	s0,48(sp)
ffffffffc02082b6:	f426                	sd	s1,40(sp)
ffffffffc02082b8:	842e                	mv	s0,a1
ffffffffc02082ba:	84b2                	mv	s1,a2
ffffffffc02082bc:	002c                	addi	a1,sp,8
ffffffffc02082be:	0830                	addi	a2,sp,24
ffffffffc02082c0:	fc06                	sd	ra,56(sp)
ffffffffc02082c2:	e42a                	sd	a0,8(sp)
ffffffffc02082c4:	e41ff0ef          	jal	ra,ffffffffc0208104 <get_device>
ffffffffc02082c8:	e509                	bnez	a0,ffffffffc02082d2 <vfs_lookup_parent+0x20>
ffffffffc02082ca:	67a2                	ld	a5,8(sp)
ffffffffc02082cc:	e09c                	sd	a5,0(s1)
ffffffffc02082ce:	67e2                	ld	a5,24(sp)
ffffffffc02082d0:	e01c                	sd	a5,0(s0)
ffffffffc02082d2:	70e2                	ld	ra,56(sp)
ffffffffc02082d4:	7442                	ld	s0,48(sp)
ffffffffc02082d6:	74a2                	ld	s1,40(sp)
ffffffffc02082d8:	6121                	addi	sp,sp,64
ffffffffc02082da:	8082                	ret

ffffffffc02082dc <vfs_get_curdir>:
ffffffffc02082dc:	0008e797          	auipc	a5,0x8e
ffffffffc02082e0:	5e47b783          	ld	a5,1508(a5) # ffffffffc02968c0 <current>
ffffffffc02082e4:	1487b783          	ld	a5,328(a5)
ffffffffc02082e8:	1101                	addi	sp,sp,-32
ffffffffc02082ea:	e426                	sd	s1,8(sp)
ffffffffc02082ec:	6384                	ld	s1,0(a5)
ffffffffc02082ee:	ec06                	sd	ra,24(sp)
ffffffffc02082f0:	e822                	sd	s0,16(sp)
ffffffffc02082f2:	cc81                	beqz	s1,ffffffffc020830a <vfs_get_curdir+0x2e>
ffffffffc02082f4:	842a                	mv	s0,a0
ffffffffc02082f6:	8526                	mv	a0,s1
ffffffffc02082f8:	d4eff0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc02082fc:	4501                	li	a0,0
ffffffffc02082fe:	e004                	sd	s1,0(s0)
ffffffffc0208300:	60e2                	ld	ra,24(sp)
ffffffffc0208302:	6442                	ld	s0,16(sp)
ffffffffc0208304:	64a2                	ld	s1,8(sp)
ffffffffc0208306:	6105                	addi	sp,sp,32
ffffffffc0208308:	8082                	ret
ffffffffc020830a:	5541                	li	a0,-16
ffffffffc020830c:	bfd5                	j	ffffffffc0208300 <vfs_get_curdir+0x24>

ffffffffc020830e <vfs_set_curdir>:
ffffffffc020830e:	7139                	addi	sp,sp,-64
ffffffffc0208310:	f04a                	sd	s2,32(sp)
ffffffffc0208312:	0008e917          	auipc	s2,0x8e
ffffffffc0208316:	5ae90913          	addi	s2,s2,1454 # ffffffffc02968c0 <current>
ffffffffc020831a:	00093783          	ld	a5,0(s2)
ffffffffc020831e:	f822                	sd	s0,48(sp)
ffffffffc0208320:	842a                	mv	s0,a0
ffffffffc0208322:	1487b503          	ld	a0,328(a5)
ffffffffc0208326:	ec4e                	sd	s3,24(sp)
ffffffffc0208328:	fc06                	sd	ra,56(sp)
ffffffffc020832a:	f426                	sd	s1,40(sp)
ffffffffc020832c:	e97fc0ef          	jal	ra,ffffffffc02051c2 <lock_files>
ffffffffc0208330:	00093783          	ld	a5,0(s2)
ffffffffc0208334:	1487b503          	ld	a0,328(a5)
ffffffffc0208338:	00053983          	ld	s3,0(a0)
ffffffffc020833c:	07340963          	beq	s0,s3,ffffffffc02083ae <vfs_set_curdir+0xa0>
ffffffffc0208340:	cc39                	beqz	s0,ffffffffc020839e <vfs_set_curdir+0x90>
ffffffffc0208342:	783c                	ld	a5,112(s0)
ffffffffc0208344:	c7bd                	beqz	a5,ffffffffc02083b2 <vfs_set_curdir+0xa4>
ffffffffc0208346:	6bbc                	ld	a5,80(a5)
ffffffffc0208348:	c7ad                	beqz	a5,ffffffffc02083b2 <vfs_set_curdir+0xa4>
ffffffffc020834a:	00006597          	auipc	a1,0x6
ffffffffc020834e:	55e58593          	addi	a1,a1,1374 # ffffffffc020e8a8 <syscalls+0xdb0>
ffffffffc0208352:	8522                	mv	a0,s0
ffffffffc0208354:	d0aff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0208358:	783c                	ld	a5,112(s0)
ffffffffc020835a:	006c                	addi	a1,sp,12
ffffffffc020835c:	8522                	mv	a0,s0
ffffffffc020835e:	6bbc                	ld	a5,80(a5)
ffffffffc0208360:	9782                	jalr	a5
ffffffffc0208362:	84aa                	mv	s1,a0
ffffffffc0208364:	e901                	bnez	a0,ffffffffc0208374 <vfs_set_curdir+0x66>
ffffffffc0208366:	47b2                	lw	a5,12(sp)
ffffffffc0208368:	669d                	lui	a3,0x7
ffffffffc020836a:	6709                	lui	a4,0x2
ffffffffc020836c:	8ff5                	and	a5,a5,a3
ffffffffc020836e:	54b9                	li	s1,-18
ffffffffc0208370:	02e78063          	beq	a5,a4,ffffffffc0208390 <vfs_set_curdir+0x82>
ffffffffc0208374:	00093783          	ld	a5,0(s2)
ffffffffc0208378:	1487b503          	ld	a0,328(a5)
ffffffffc020837c:	e4dfc0ef          	jal	ra,ffffffffc02051c8 <unlock_files>
ffffffffc0208380:	70e2                	ld	ra,56(sp)
ffffffffc0208382:	7442                	ld	s0,48(sp)
ffffffffc0208384:	7902                	ld	s2,32(sp)
ffffffffc0208386:	69e2                	ld	s3,24(sp)
ffffffffc0208388:	8526                	mv	a0,s1
ffffffffc020838a:	74a2                	ld	s1,40(sp)
ffffffffc020838c:	6121                	addi	sp,sp,64
ffffffffc020838e:	8082                	ret
ffffffffc0208390:	8522                	mv	a0,s0
ffffffffc0208392:	cb4ff0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc0208396:	00093783          	ld	a5,0(s2)
ffffffffc020839a:	1487b503          	ld	a0,328(a5)
ffffffffc020839e:	e100                	sd	s0,0(a0)
ffffffffc02083a0:	4481                	li	s1,0
ffffffffc02083a2:	fc098de3          	beqz	s3,ffffffffc020837c <vfs_set_curdir+0x6e>
ffffffffc02083a6:	854e                	mv	a0,s3
ffffffffc02083a8:	d6cff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc02083ac:	b7e1                	j	ffffffffc0208374 <vfs_set_curdir+0x66>
ffffffffc02083ae:	4481                	li	s1,0
ffffffffc02083b0:	b7f1                	j	ffffffffc020837c <vfs_set_curdir+0x6e>
ffffffffc02083b2:	00006697          	auipc	a3,0x6
ffffffffc02083b6:	48e68693          	addi	a3,a3,1166 # ffffffffc020e840 <syscalls+0xd48>
ffffffffc02083ba:	00003617          	auipc	a2,0x3
ffffffffc02083be:	5c660613          	addi	a2,a2,1478 # ffffffffc020b980 <commands+0x210>
ffffffffc02083c2:	04300593          	li	a1,67
ffffffffc02083c6:	00006517          	auipc	a0,0x6
ffffffffc02083ca:	4ca50513          	addi	a0,a0,1226 # ffffffffc020e890 <syscalls+0xd98>
ffffffffc02083ce:	8d0f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02083d2 <vfs_chdir>:
ffffffffc02083d2:	1101                	addi	sp,sp,-32
ffffffffc02083d4:	002c                	addi	a1,sp,8
ffffffffc02083d6:	e822                	sd	s0,16(sp)
ffffffffc02083d8:	ec06                	sd	ra,24(sp)
ffffffffc02083da:	e43ff0ef          	jal	ra,ffffffffc020821c <vfs_lookup>
ffffffffc02083de:	842a                	mv	s0,a0
ffffffffc02083e0:	c511                	beqz	a0,ffffffffc02083ec <vfs_chdir+0x1a>
ffffffffc02083e2:	60e2                	ld	ra,24(sp)
ffffffffc02083e4:	8522                	mv	a0,s0
ffffffffc02083e6:	6442                	ld	s0,16(sp)
ffffffffc02083e8:	6105                	addi	sp,sp,32
ffffffffc02083ea:	8082                	ret
ffffffffc02083ec:	6522                	ld	a0,8(sp)
ffffffffc02083ee:	f21ff0ef          	jal	ra,ffffffffc020830e <vfs_set_curdir>
ffffffffc02083f2:	842a                	mv	s0,a0
ffffffffc02083f4:	6522                	ld	a0,8(sp)
ffffffffc02083f6:	d1eff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc02083fa:	60e2                	ld	ra,24(sp)
ffffffffc02083fc:	8522                	mv	a0,s0
ffffffffc02083fe:	6442                	ld	s0,16(sp)
ffffffffc0208400:	6105                	addi	sp,sp,32
ffffffffc0208402:	8082                	ret

ffffffffc0208404 <vfs_getcwd>:
ffffffffc0208404:	0008e797          	auipc	a5,0x8e
ffffffffc0208408:	4bc7b783          	ld	a5,1212(a5) # ffffffffc02968c0 <current>
ffffffffc020840c:	1487b783          	ld	a5,328(a5)
ffffffffc0208410:	7179                	addi	sp,sp,-48
ffffffffc0208412:	ec26                	sd	s1,24(sp)
ffffffffc0208414:	6384                	ld	s1,0(a5)
ffffffffc0208416:	f406                	sd	ra,40(sp)
ffffffffc0208418:	f022                	sd	s0,32(sp)
ffffffffc020841a:	e84a                	sd	s2,16(sp)
ffffffffc020841c:	ccbd                	beqz	s1,ffffffffc020849a <vfs_getcwd+0x96>
ffffffffc020841e:	892a                	mv	s2,a0
ffffffffc0208420:	8526                	mv	a0,s1
ffffffffc0208422:	c24ff0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc0208426:	74a8                	ld	a0,104(s1)
ffffffffc0208428:	c93d                	beqz	a0,ffffffffc020849e <vfs_getcwd+0x9a>
ffffffffc020842a:	9b3ff0ef          	jal	ra,ffffffffc0207ddc <vfs_get_devname>
ffffffffc020842e:	842a                	mv	s0,a0
ffffffffc0208430:	7c9020ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc0208434:	862a                	mv	a2,a0
ffffffffc0208436:	85a2                	mv	a1,s0
ffffffffc0208438:	4701                	li	a4,0
ffffffffc020843a:	4685                	li	a3,1
ffffffffc020843c:	854a                	mv	a0,s2
ffffffffc020843e:	faffc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc0208442:	842a                	mv	s0,a0
ffffffffc0208444:	c919                	beqz	a0,ffffffffc020845a <vfs_getcwd+0x56>
ffffffffc0208446:	8526                	mv	a0,s1
ffffffffc0208448:	cccff0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020844c:	70a2                	ld	ra,40(sp)
ffffffffc020844e:	8522                	mv	a0,s0
ffffffffc0208450:	7402                	ld	s0,32(sp)
ffffffffc0208452:	64e2                	ld	s1,24(sp)
ffffffffc0208454:	6942                	ld	s2,16(sp)
ffffffffc0208456:	6145                	addi	sp,sp,48
ffffffffc0208458:	8082                	ret
ffffffffc020845a:	03a00793          	li	a5,58
ffffffffc020845e:	4701                	li	a4,0
ffffffffc0208460:	4685                	li	a3,1
ffffffffc0208462:	4605                	li	a2,1
ffffffffc0208464:	00f10593          	addi	a1,sp,15
ffffffffc0208468:	854a                	mv	a0,s2
ffffffffc020846a:	00f107a3          	sb	a5,15(sp)
ffffffffc020846e:	f7ffc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc0208472:	842a                	mv	s0,a0
ffffffffc0208474:	f969                	bnez	a0,ffffffffc0208446 <vfs_getcwd+0x42>
ffffffffc0208476:	78bc                	ld	a5,112(s1)
ffffffffc0208478:	c3b9                	beqz	a5,ffffffffc02084be <vfs_getcwd+0xba>
ffffffffc020847a:	7f9c                	ld	a5,56(a5)
ffffffffc020847c:	c3a9                	beqz	a5,ffffffffc02084be <vfs_getcwd+0xba>
ffffffffc020847e:	00006597          	auipc	a1,0x6
ffffffffc0208482:	48a58593          	addi	a1,a1,1162 # ffffffffc020e908 <syscalls+0xe10>
ffffffffc0208486:	8526                	mv	a0,s1
ffffffffc0208488:	bd6ff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc020848c:	78bc                	ld	a5,112(s1)
ffffffffc020848e:	85ca                	mv	a1,s2
ffffffffc0208490:	8526                	mv	a0,s1
ffffffffc0208492:	7f9c                	ld	a5,56(a5)
ffffffffc0208494:	9782                	jalr	a5
ffffffffc0208496:	842a                	mv	s0,a0
ffffffffc0208498:	b77d                	j	ffffffffc0208446 <vfs_getcwd+0x42>
ffffffffc020849a:	5441                	li	s0,-16
ffffffffc020849c:	bf45                	j	ffffffffc020844c <vfs_getcwd+0x48>
ffffffffc020849e:	00006697          	auipc	a3,0x6
ffffffffc02084a2:	33268693          	addi	a3,a3,818 # ffffffffc020e7d0 <syscalls+0xcd8>
ffffffffc02084a6:	00003617          	auipc	a2,0x3
ffffffffc02084aa:	4da60613          	addi	a2,a2,1242 # ffffffffc020b980 <commands+0x210>
ffffffffc02084ae:	06e00593          	li	a1,110
ffffffffc02084b2:	00006517          	auipc	a0,0x6
ffffffffc02084b6:	3de50513          	addi	a0,a0,990 # ffffffffc020e890 <syscalls+0xd98>
ffffffffc02084ba:	fe5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02084be:	00006697          	auipc	a3,0x6
ffffffffc02084c2:	3f268693          	addi	a3,a3,1010 # ffffffffc020e8b0 <syscalls+0xdb8>
ffffffffc02084c6:	00003617          	auipc	a2,0x3
ffffffffc02084ca:	4ba60613          	addi	a2,a2,1210 # ffffffffc020b980 <commands+0x210>
ffffffffc02084ce:	07800593          	li	a1,120
ffffffffc02084d2:	00006517          	auipc	a0,0x6
ffffffffc02084d6:	3be50513          	addi	a0,a0,958 # ffffffffc020e890 <syscalls+0xd98>
ffffffffc02084da:	fc5f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02084de <dev_lookup>:
ffffffffc02084de:	0005c783          	lbu	a5,0(a1)
ffffffffc02084e2:	e385                	bnez	a5,ffffffffc0208502 <dev_lookup+0x24>
ffffffffc02084e4:	1101                	addi	sp,sp,-32
ffffffffc02084e6:	e822                	sd	s0,16(sp)
ffffffffc02084e8:	e426                	sd	s1,8(sp)
ffffffffc02084ea:	ec06                	sd	ra,24(sp)
ffffffffc02084ec:	84aa                	mv	s1,a0
ffffffffc02084ee:	8432                	mv	s0,a2
ffffffffc02084f0:	b56ff0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc02084f4:	60e2                	ld	ra,24(sp)
ffffffffc02084f6:	e004                	sd	s1,0(s0)
ffffffffc02084f8:	6442                	ld	s0,16(sp)
ffffffffc02084fa:	64a2                	ld	s1,8(sp)
ffffffffc02084fc:	4501                	li	a0,0
ffffffffc02084fe:	6105                	addi	sp,sp,32
ffffffffc0208500:	8082                	ret
ffffffffc0208502:	5541                	li	a0,-16
ffffffffc0208504:	8082                	ret

ffffffffc0208506 <dev_fstat>:
ffffffffc0208506:	1101                	addi	sp,sp,-32
ffffffffc0208508:	e426                	sd	s1,8(sp)
ffffffffc020850a:	84ae                	mv	s1,a1
ffffffffc020850c:	e822                	sd	s0,16(sp)
ffffffffc020850e:	02000613          	li	a2,32
ffffffffc0208512:	842a                	mv	s0,a0
ffffffffc0208514:	4581                	li	a1,0
ffffffffc0208516:	8526                	mv	a0,s1
ffffffffc0208518:	ec06                	sd	ra,24(sp)
ffffffffc020851a:	781020ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc020851e:	c429                	beqz	s0,ffffffffc0208568 <dev_fstat+0x62>
ffffffffc0208520:	783c                	ld	a5,112(s0)
ffffffffc0208522:	c3b9                	beqz	a5,ffffffffc0208568 <dev_fstat+0x62>
ffffffffc0208524:	6bbc                	ld	a5,80(a5)
ffffffffc0208526:	c3a9                	beqz	a5,ffffffffc0208568 <dev_fstat+0x62>
ffffffffc0208528:	00006597          	auipc	a1,0x6
ffffffffc020852c:	38058593          	addi	a1,a1,896 # ffffffffc020e8a8 <syscalls+0xdb0>
ffffffffc0208530:	8522                	mv	a0,s0
ffffffffc0208532:	b2cff0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0208536:	783c                	ld	a5,112(s0)
ffffffffc0208538:	85a6                	mv	a1,s1
ffffffffc020853a:	8522                	mv	a0,s0
ffffffffc020853c:	6bbc                	ld	a5,80(a5)
ffffffffc020853e:	9782                	jalr	a5
ffffffffc0208540:	ed19                	bnez	a0,ffffffffc020855e <dev_fstat+0x58>
ffffffffc0208542:	4c38                	lw	a4,88(s0)
ffffffffc0208544:	6785                	lui	a5,0x1
ffffffffc0208546:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020854a:	02f71f63          	bne	a4,a5,ffffffffc0208588 <dev_fstat+0x82>
ffffffffc020854e:	6018                	ld	a4,0(s0)
ffffffffc0208550:	641c                	ld	a5,8(s0)
ffffffffc0208552:	4685                	li	a3,1
ffffffffc0208554:	e494                	sd	a3,8(s1)
ffffffffc0208556:	02e787b3          	mul	a5,a5,a4
ffffffffc020855a:	e898                	sd	a4,16(s1)
ffffffffc020855c:	ec9c                	sd	a5,24(s1)
ffffffffc020855e:	60e2                	ld	ra,24(sp)
ffffffffc0208560:	6442                	ld	s0,16(sp)
ffffffffc0208562:	64a2                	ld	s1,8(sp)
ffffffffc0208564:	6105                	addi	sp,sp,32
ffffffffc0208566:	8082                	ret
ffffffffc0208568:	00006697          	auipc	a3,0x6
ffffffffc020856c:	2d868693          	addi	a3,a3,728 # ffffffffc020e840 <syscalls+0xd48>
ffffffffc0208570:	00003617          	auipc	a2,0x3
ffffffffc0208574:	41060613          	addi	a2,a2,1040 # ffffffffc020b980 <commands+0x210>
ffffffffc0208578:	04200593          	li	a1,66
ffffffffc020857c:	00006517          	auipc	a0,0x6
ffffffffc0208580:	39c50513          	addi	a0,a0,924 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc0208584:	f1bf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208588:	00006697          	auipc	a3,0x6
ffffffffc020858c:	08068693          	addi	a3,a3,128 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208590:	00003617          	auipc	a2,0x3
ffffffffc0208594:	3f060613          	addi	a2,a2,1008 # ffffffffc020b980 <commands+0x210>
ffffffffc0208598:	04500593          	li	a1,69
ffffffffc020859c:	00006517          	auipc	a0,0x6
ffffffffc02085a0:	37c50513          	addi	a0,a0,892 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc02085a4:	efbf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085a8 <dev_ioctl>:
ffffffffc02085a8:	c909                	beqz	a0,ffffffffc02085ba <dev_ioctl+0x12>
ffffffffc02085aa:	4d34                	lw	a3,88(a0)
ffffffffc02085ac:	6705                	lui	a4,0x1
ffffffffc02085ae:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085b2:	00e69463          	bne	a3,a4,ffffffffc02085ba <dev_ioctl+0x12>
ffffffffc02085b6:	751c                	ld	a5,40(a0)
ffffffffc02085b8:	8782                	jr	a5
ffffffffc02085ba:	1141                	addi	sp,sp,-16
ffffffffc02085bc:	00006697          	auipc	a3,0x6
ffffffffc02085c0:	04c68693          	addi	a3,a3,76 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc02085c4:	00003617          	auipc	a2,0x3
ffffffffc02085c8:	3bc60613          	addi	a2,a2,956 # ffffffffc020b980 <commands+0x210>
ffffffffc02085cc:	03500593          	li	a1,53
ffffffffc02085d0:	00006517          	auipc	a0,0x6
ffffffffc02085d4:	34850513          	addi	a0,a0,840 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc02085d8:	e406                	sd	ra,8(sp)
ffffffffc02085da:	ec5f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085de <dev_tryseek>:
ffffffffc02085de:	c51d                	beqz	a0,ffffffffc020860c <dev_tryseek+0x2e>
ffffffffc02085e0:	4d38                	lw	a4,88(a0)
ffffffffc02085e2:	6785                	lui	a5,0x1
ffffffffc02085e4:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085e8:	02f71263          	bne	a4,a5,ffffffffc020860c <dev_tryseek+0x2e>
ffffffffc02085ec:	611c                	ld	a5,0(a0)
ffffffffc02085ee:	cf89                	beqz	a5,ffffffffc0208608 <dev_tryseek+0x2a>
ffffffffc02085f0:	6518                	ld	a4,8(a0)
ffffffffc02085f2:	02e5f6b3          	remu	a3,a1,a4
ffffffffc02085f6:	ea89                	bnez	a3,ffffffffc0208608 <dev_tryseek+0x2a>
ffffffffc02085f8:	0005c863          	bltz	a1,ffffffffc0208608 <dev_tryseek+0x2a>
ffffffffc02085fc:	02e787b3          	mul	a5,a5,a4
ffffffffc0208600:	00f5f463          	bgeu	a1,a5,ffffffffc0208608 <dev_tryseek+0x2a>
ffffffffc0208604:	4501                	li	a0,0
ffffffffc0208606:	8082                	ret
ffffffffc0208608:	5575                	li	a0,-3
ffffffffc020860a:	8082                	ret
ffffffffc020860c:	1141                	addi	sp,sp,-16
ffffffffc020860e:	00006697          	auipc	a3,0x6
ffffffffc0208612:	ffa68693          	addi	a3,a3,-6 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208616:	00003617          	auipc	a2,0x3
ffffffffc020861a:	36a60613          	addi	a2,a2,874 # ffffffffc020b980 <commands+0x210>
ffffffffc020861e:	05f00593          	li	a1,95
ffffffffc0208622:	00006517          	auipc	a0,0x6
ffffffffc0208626:	2f650513          	addi	a0,a0,758 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc020862a:	e406                	sd	ra,8(sp)
ffffffffc020862c:	e73f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208630 <dev_gettype>:
ffffffffc0208630:	c10d                	beqz	a0,ffffffffc0208652 <dev_gettype+0x22>
ffffffffc0208632:	4d38                	lw	a4,88(a0)
ffffffffc0208634:	6785                	lui	a5,0x1
ffffffffc0208636:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020863a:	00f71c63          	bne	a4,a5,ffffffffc0208652 <dev_gettype+0x22>
ffffffffc020863e:	6118                	ld	a4,0(a0)
ffffffffc0208640:	6795                	lui	a5,0x5
ffffffffc0208642:	c701                	beqz	a4,ffffffffc020864a <dev_gettype+0x1a>
ffffffffc0208644:	c19c                	sw	a5,0(a1)
ffffffffc0208646:	4501                	li	a0,0
ffffffffc0208648:	8082                	ret
ffffffffc020864a:	6791                	lui	a5,0x4
ffffffffc020864c:	c19c                	sw	a5,0(a1)
ffffffffc020864e:	4501                	li	a0,0
ffffffffc0208650:	8082                	ret
ffffffffc0208652:	1141                	addi	sp,sp,-16
ffffffffc0208654:	00006697          	auipc	a3,0x6
ffffffffc0208658:	fb468693          	addi	a3,a3,-76 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc020865c:	00003617          	auipc	a2,0x3
ffffffffc0208660:	32460613          	addi	a2,a2,804 # ffffffffc020b980 <commands+0x210>
ffffffffc0208664:	05300593          	li	a1,83
ffffffffc0208668:	00006517          	auipc	a0,0x6
ffffffffc020866c:	2b050513          	addi	a0,a0,688 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc0208670:	e406                	sd	ra,8(sp)
ffffffffc0208672:	e2df70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208676 <dev_write>:
ffffffffc0208676:	c911                	beqz	a0,ffffffffc020868a <dev_write+0x14>
ffffffffc0208678:	4d34                	lw	a3,88(a0)
ffffffffc020867a:	6705                	lui	a4,0x1
ffffffffc020867c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208680:	00e69563          	bne	a3,a4,ffffffffc020868a <dev_write+0x14>
ffffffffc0208684:	711c                	ld	a5,32(a0)
ffffffffc0208686:	4605                	li	a2,1
ffffffffc0208688:	8782                	jr	a5
ffffffffc020868a:	1141                	addi	sp,sp,-16
ffffffffc020868c:	00006697          	auipc	a3,0x6
ffffffffc0208690:	f7c68693          	addi	a3,a3,-132 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208694:	00003617          	auipc	a2,0x3
ffffffffc0208698:	2ec60613          	addi	a2,a2,748 # ffffffffc020b980 <commands+0x210>
ffffffffc020869c:	02c00593          	li	a1,44
ffffffffc02086a0:	00006517          	auipc	a0,0x6
ffffffffc02086a4:	27850513          	addi	a0,a0,632 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc02086a8:	e406                	sd	ra,8(sp)
ffffffffc02086aa:	df5f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02086ae <dev_read>:
ffffffffc02086ae:	c911                	beqz	a0,ffffffffc02086c2 <dev_read+0x14>
ffffffffc02086b0:	4d34                	lw	a3,88(a0)
ffffffffc02086b2:	6705                	lui	a4,0x1
ffffffffc02086b4:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086b8:	00e69563          	bne	a3,a4,ffffffffc02086c2 <dev_read+0x14>
ffffffffc02086bc:	711c                	ld	a5,32(a0)
ffffffffc02086be:	4601                	li	a2,0
ffffffffc02086c0:	8782                	jr	a5
ffffffffc02086c2:	1141                	addi	sp,sp,-16
ffffffffc02086c4:	00006697          	auipc	a3,0x6
ffffffffc02086c8:	f4468693          	addi	a3,a3,-188 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc02086cc:	00003617          	auipc	a2,0x3
ffffffffc02086d0:	2b460613          	addi	a2,a2,692 # ffffffffc020b980 <commands+0x210>
ffffffffc02086d4:	02300593          	li	a1,35
ffffffffc02086d8:	00006517          	auipc	a0,0x6
ffffffffc02086dc:	24050513          	addi	a0,a0,576 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc02086e0:	e406                	sd	ra,8(sp)
ffffffffc02086e2:	dbdf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02086e6 <dev_close>:
ffffffffc02086e6:	c909                	beqz	a0,ffffffffc02086f8 <dev_close+0x12>
ffffffffc02086e8:	4d34                	lw	a3,88(a0)
ffffffffc02086ea:	6705                	lui	a4,0x1
ffffffffc02086ec:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02086f0:	00e69463          	bne	a3,a4,ffffffffc02086f8 <dev_close+0x12>
ffffffffc02086f4:	6d1c                	ld	a5,24(a0)
ffffffffc02086f6:	8782                	jr	a5
ffffffffc02086f8:	1141                	addi	sp,sp,-16
ffffffffc02086fa:	00006697          	auipc	a3,0x6
ffffffffc02086fe:	f0e68693          	addi	a3,a3,-242 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208702:	00003617          	auipc	a2,0x3
ffffffffc0208706:	27e60613          	addi	a2,a2,638 # ffffffffc020b980 <commands+0x210>
ffffffffc020870a:	45e9                	li	a1,26
ffffffffc020870c:	00006517          	auipc	a0,0x6
ffffffffc0208710:	20c50513          	addi	a0,a0,524 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc0208714:	e406                	sd	ra,8(sp)
ffffffffc0208716:	d89f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020871a <dev_open>:
ffffffffc020871a:	03c5f713          	andi	a4,a1,60
ffffffffc020871e:	eb11                	bnez	a4,ffffffffc0208732 <dev_open+0x18>
ffffffffc0208720:	c919                	beqz	a0,ffffffffc0208736 <dev_open+0x1c>
ffffffffc0208722:	4d34                	lw	a3,88(a0)
ffffffffc0208724:	6705                	lui	a4,0x1
ffffffffc0208726:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020872a:	00e69663          	bne	a3,a4,ffffffffc0208736 <dev_open+0x1c>
ffffffffc020872e:	691c                	ld	a5,16(a0)
ffffffffc0208730:	8782                	jr	a5
ffffffffc0208732:	5575                	li	a0,-3
ffffffffc0208734:	8082                	ret
ffffffffc0208736:	1141                	addi	sp,sp,-16
ffffffffc0208738:	00006697          	auipc	a3,0x6
ffffffffc020873c:	ed068693          	addi	a3,a3,-304 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208740:	00003617          	auipc	a2,0x3
ffffffffc0208744:	24060613          	addi	a2,a2,576 # ffffffffc020b980 <commands+0x210>
ffffffffc0208748:	45c5                	li	a1,17
ffffffffc020874a:	00006517          	auipc	a0,0x6
ffffffffc020874e:	1ce50513          	addi	a0,a0,462 # ffffffffc020e918 <syscalls+0xe20>
ffffffffc0208752:	e406                	sd	ra,8(sp)
ffffffffc0208754:	d4bf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208758 <dev_init>:
ffffffffc0208758:	1141                	addi	sp,sp,-16
ffffffffc020875a:	e406                	sd	ra,8(sp)
ffffffffc020875c:	542000ef          	jal	ra,ffffffffc0208c9e <dev_init_stdin>
ffffffffc0208760:	65a000ef          	jal	ra,ffffffffc0208dba <dev_init_stdout>
ffffffffc0208764:	60a2                	ld	ra,8(sp)
ffffffffc0208766:	0141                	addi	sp,sp,16
ffffffffc0208768:	a439                	j	ffffffffc0208976 <dev_init_disk0>

ffffffffc020876a <dev_create_inode>:
ffffffffc020876a:	6505                	lui	a0,0x1
ffffffffc020876c:	1141                	addi	sp,sp,-16
ffffffffc020876e:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208772:	e022                	sd	s0,0(sp)
ffffffffc0208774:	e406                	sd	ra,8(sp)
ffffffffc0208776:	852ff0ef          	jal	ra,ffffffffc02077c8 <__alloc_inode>
ffffffffc020877a:	842a                	mv	s0,a0
ffffffffc020877c:	c901                	beqz	a0,ffffffffc020878c <dev_create_inode+0x22>
ffffffffc020877e:	4601                	li	a2,0
ffffffffc0208780:	00006597          	auipc	a1,0x6
ffffffffc0208784:	1b058593          	addi	a1,a1,432 # ffffffffc020e930 <dev_node_ops>
ffffffffc0208788:	85cff0ef          	jal	ra,ffffffffc02077e4 <inode_init>
ffffffffc020878c:	60a2                	ld	ra,8(sp)
ffffffffc020878e:	8522                	mv	a0,s0
ffffffffc0208790:	6402                	ld	s0,0(sp)
ffffffffc0208792:	0141                	addi	sp,sp,16
ffffffffc0208794:	8082                	ret

ffffffffc0208796 <disk0_open>:
ffffffffc0208796:	4501                	li	a0,0
ffffffffc0208798:	8082                	ret

ffffffffc020879a <disk0_close>:
ffffffffc020879a:	4501                	li	a0,0
ffffffffc020879c:	8082                	ret

ffffffffc020879e <disk0_ioctl>:
ffffffffc020879e:	5531                	li	a0,-20
ffffffffc02087a0:	8082                	ret

ffffffffc02087a2 <disk0_io>:
ffffffffc02087a2:	659c                	ld	a5,8(a1)
ffffffffc02087a4:	7159                	addi	sp,sp,-112
ffffffffc02087a6:	eca6                	sd	s1,88(sp)
ffffffffc02087a8:	f45e                	sd	s7,40(sp)
ffffffffc02087aa:	6d84                	ld	s1,24(a1)
ffffffffc02087ac:	6b85                	lui	s7,0x1
ffffffffc02087ae:	1bfd                	addi	s7,s7,-1
ffffffffc02087b0:	e4ce                	sd	s3,72(sp)
ffffffffc02087b2:	43f7d993          	srai	s3,a5,0x3f
ffffffffc02087b6:	0179f9b3          	and	s3,s3,s7
ffffffffc02087ba:	99be                	add	s3,s3,a5
ffffffffc02087bc:	8fc5                	or	a5,a5,s1
ffffffffc02087be:	f486                	sd	ra,104(sp)
ffffffffc02087c0:	f0a2                	sd	s0,96(sp)
ffffffffc02087c2:	e8ca                	sd	s2,80(sp)
ffffffffc02087c4:	e0d2                	sd	s4,64(sp)
ffffffffc02087c6:	fc56                	sd	s5,56(sp)
ffffffffc02087c8:	f85a                	sd	s6,48(sp)
ffffffffc02087ca:	f062                	sd	s8,32(sp)
ffffffffc02087cc:	ec66                	sd	s9,24(sp)
ffffffffc02087ce:	e86a                	sd	s10,16(sp)
ffffffffc02087d0:	0177f7b3          	and	a5,a5,s7
ffffffffc02087d4:	10079d63          	bnez	a5,ffffffffc02088ee <disk0_io+0x14c>
ffffffffc02087d8:	40c9d993          	srai	s3,s3,0xc
ffffffffc02087dc:	00c4d713          	srli	a4,s1,0xc
ffffffffc02087e0:	2981                	sext.w	s3,s3
ffffffffc02087e2:	2701                	sext.w	a4,a4
ffffffffc02087e4:	00e987bb          	addw	a5,s3,a4
ffffffffc02087e8:	6114                	ld	a3,0(a0)
ffffffffc02087ea:	1782                	slli	a5,a5,0x20
ffffffffc02087ec:	9381                	srli	a5,a5,0x20
ffffffffc02087ee:	10f6e063          	bltu	a3,a5,ffffffffc02088ee <disk0_io+0x14c>
ffffffffc02087f2:	4501                	li	a0,0
ffffffffc02087f4:	ef19                	bnez	a4,ffffffffc0208812 <disk0_io+0x70>
ffffffffc02087f6:	70a6                	ld	ra,104(sp)
ffffffffc02087f8:	7406                	ld	s0,96(sp)
ffffffffc02087fa:	64e6                	ld	s1,88(sp)
ffffffffc02087fc:	6946                	ld	s2,80(sp)
ffffffffc02087fe:	69a6                	ld	s3,72(sp)
ffffffffc0208800:	6a06                	ld	s4,64(sp)
ffffffffc0208802:	7ae2                	ld	s5,56(sp)
ffffffffc0208804:	7b42                	ld	s6,48(sp)
ffffffffc0208806:	7ba2                	ld	s7,40(sp)
ffffffffc0208808:	7c02                	ld	s8,32(sp)
ffffffffc020880a:	6ce2                	ld	s9,24(sp)
ffffffffc020880c:	6d42                	ld	s10,16(sp)
ffffffffc020880e:	6165                	addi	sp,sp,112
ffffffffc0208810:	8082                	ret
ffffffffc0208812:	0008d517          	auipc	a0,0x8d
ffffffffc0208816:	02e50513          	addi	a0,a0,46 # ffffffffc0295840 <disk0_sem>
ffffffffc020881a:	8b2e                	mv	s6,a1
ffffffffc020881c:	8c32                	mv	s8,a2
ffffffffc020881e:	0008ea97          	auipc	s5,0x8e
ffffffffc0208822:	0daa8a93          	addi	s5,s5,218 # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208826:	d3ffb0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020882a:	6c91                	lui	s9,0x4
ffffffffc020882c:	e4b9                	bnez	s1,ffffffffc020887a <disk0_io+0xd8>
ffffffffc020882e:	a845                	j	ffffffffc02088de <disk0_io+0x13c>
ffffffffc0208830:	00c4d413          	srli	s0,s1,0xc
ffffffffc0208834:	0034169b          	slliw	a3,s0,0x3
ffffffffc0208838:	00068d1b          	sext.w	s10,a3
ffffffffc020883c:	1682                	slli	a3,a3,0x20
ffffffffc020883e:	2401                	sext.w	s0,s0
ffffffffc0208840:	9281                	srli	a3,a3,0x20
ffffffffc0208842:	8926                	mv	s2,s1
ffffffffc0208844:	00399a1b          	slliw	s4,s3,0x3
ffffffffc0208848:	862e                	mv	a2,a1
ffffffffc020884a:	4509                	li	a0,2
ffffffffc020884c:	85d2                	mv	a1,s4
ffffffffc020884e:	af2f80ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc0208852:	e165                	bnez	a0,ffffffffc0208932 <disk0_io+0x190>
ffffffffc0208854:	000ab583          	ld	a1,0(s5)
ffffffffc0208858:	0038                	addi	a4,sp,8
ffffffffc020885a:	4685                	li	a3,1
ffffffffc020885c:	864a                	mv	a2,s2
ffffffffc020885e:	855a                	mv	a0,s6
ffffffffc0208860:	b8dfc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc0208864:	67a2                	ld	a5,8(sp)
ffffffffc0208866:	09279663          	bne	a5,s2,ffffffffc02088f2 <disk0_io+0x150>
ffffffffc020886a:	017977b3          	and	a5,s2,s7
ffffffffc020886e:	e3d1                	bnez	a5,ffffffffc02088f2 <disk0_io+0x150>
ffffffffc0208870:	412484b3          	sub	s1,s1,s2
ffffffffc0208874:	013409bb          	addw	s3,s0,s3
ffffffffc0208878:	c0bd                	beqz	s1,ffffffffc02088de <disk0_io+0x13c>
ffffffffc020887a:	000ab583          	ld	a1,0(s5)
ffffffffc020887e:	000c1b63          	bnez	s8,ffffffffc0208894 <disk0_io+0xf2>
ffffffffc0208882:	fb94e7e3          	bltu	s1,s9,ffffffffc0208830 <disk0_io+0x8e>
ffffffffc0208886:	02000693          	li	a3,32
ffffffffc020888a:	02000d13          	li	s10,32
ffffffffc020888e:	4411                	li	s0,4
ffffffffc0208890:	6911                	lui	s2,0x4
ffffffffc0208892:	bf4d                	j	ffffffffc0208844 <disk0_io+0xa2>
ffffffffc0208894:	0038                	addi	a4,sp,8
ffffffffc0208896:	4681                	li	a3,0
ffffffffc0208898:	6611                	lui	a2,0x4
ffffffffc020889a:	855a                	mv	a0,s6
ffffffffc020889c:	b51fc0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc02088a0:	6422                	ld	s0,8(sp)
ffffffffc02088a2:	c825                	beqz	s0,ffffffffc0208912 <disk0_io+0x170>
ffffffffc02088a4:	0684e763          	bltu	s1,s0,ffffffffc0208912 <disk0_io+0x170>
ffffffffc02088a8:	017477b3          	and	a5,s0,s7
ffffffffc02088ac:	e3bd                	bnez	a5,ffffffffc0208912 <disk0_io+0x170>
ffffffffc02088ae:	8031                	srli	s0,s0,0xc
ffffffffc02088b0:	0034179b          	slliw	a5,s0,0x3
ffffffffc02088b4:	000ab603          	ld	a2,0(s5)
ffffffffc02088b8:	0039991b          	slliw	s2,s3,0x3
ffffffffc02088bc:	02079693          	slli	a3,a5,0x20
ffffffffc02088c0:	9281                	srli	a3,a3,0x20
ffffffffc02088c2:	85ca                	mv	a1,s2
ffffffffc02088c4:	4509                	li	a0,2
ffffffffc02088c6:	2401                	sext.w	s0,s0
ffffffffc02088c8:	00078a1b          	sext.w	s4,a5
ffffffffc02088cc:	b0af80ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc02088d0:	e151                	bnez	a0,ffffffffc0208954 <disk0_io+0x1b2>
ffffffffc02088d2:	6922                	ld	s2,8(sp)
ffffffffc02088d4:	013409bb          	addw	s3,s0,s3
ffffffffc02088d8:	412484b3          	sub	s1,s1,s2
ffffffffc02088dc:	fcd9                	bnez	s1,ffffffffc020887a <disk0_io+0xd8>
ffffffffc02088de:	0008d517          	auipc	a0,0x8d
ffffffffc02088e2:	f6250513          	addi	a0,a0,-158 # ffffffffc0295840 <disk0_sem>
ffffffffc02088e6:	c7bfb0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02088ea:	4501                	li	a0,0
ffffffffc02088ec:	b729                	j	ffffffffc02087f6 <disk0_io+0x54>
ffffffffc02088ee:	5575                	li	a0,-3
ffffffffc02088f0:	b719                	j	ffffffffc02087f6 <disk0_io+0x54>
ffffffffc02088f2:	00006697          	auipc	a3,0x6
ffffffffc02088f6:	1b668693          	addi	a3,a3,438 # ffffffffc020eaa8 <dev_node_ops+0x178>
ffffffffc02088fa:	00003617          	auipc	a2,0x3
ffffffffc02088fe:	08660613          	addi	a2,a2,134 # ffffffffc020b980 <commands+0x210>
ffffffffc0208902:	06200593          	li	a1,98
ffffffffc0208906:	00006517          	auipc	a0,0x6
ffffffffc020890a:	0ea50513          	addi	a0,a0,234 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc020890e:	b91f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208912:	00006697          	auipc	a3,0x6
ffffffffc0208916:	09e68693          	addi	a3,a3,158 # ffffffffc020e9b0 <dev_node_ops+0x80>
ffffffffc020891a:	00003617          	auipc	a2,0x3
ffffffffc020891e:	06660613          	addi	a2,a2,102 # ffffffffc020b980 <commands+0x210>
ffffffffc0208922:	05700593          	li	a1,87
ffffffffc0208926:	00006517          	auipc	a0,0x6
ffffffffc020892a:	0ca50513          	addi	a0,a0,202 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc020892e:	b71f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208932:	88aa                	mv	a7,a0
ffffffffc0208934:	886a                	mv	a6,s10
ffffffffc0208936:	87a2                	mv	a5,s0
ffffffffc0208938:	8752                	mv	a4,s4
ffffffffc020893a:	86ce                	mv	a3,s3
ffffffffc020893c:	00006617          	auipc	a2,0x6
ffffffffc0208940:	12460613          	addi	a2,a2,292 # ffffffffc020ea60 <dev_node_ops+0x130>
ffffffffc0208944:	02d00593          	li	a1,45
ffffffffc0208948:	00006517          	auipc	a0,0x6
ffffffffc020894c:	0a850513          	addi	a0,a0,168 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208950:	b4ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208954:	88aa                	mv	a7,a0
ffffffffc0208956:	8852                	mv	a6,s4
ffffffffc0208958:	87a2                	mv	a5,s0
ffffffffc020895a:	874a                	mv	a4,s2
ffffffffc020895c:	86ce                	mv	a3,s3
ffffffffc020895e:	00006617          	auipc	a2,0x6
ffffffffc0208962:	0b260613          	addi	a2,a2,178 # ffffffffc020ea10 <dev_node_ops+0xe0>
ffffffffc0208966:	03700593          	li	a1,55
ffffffffc020896a:	00006517          	auipc	a0,0x6
ffffffffc020896e:	08650513          	addi	a0,a0,134 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208972:	b2df70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208976 <dev_init_disk0>:
ffffffffc0208976:	1101                	addi	sp,sp,-32
ffffffffc0208978:	ec06                	sd	ra,24(sp)
ffffffffc020897a:	e822                	sd	s0,16(sp)
ffffffffc020897c:	e426                	sd	s1,8(sp)
ffffffffc020897e:	dedff0ef          	jal	ra,ffffffffc020876a <dev_create_inode>
ffffffffc0208982:	c541                	beqz	a0,ffffffffc0208a0a <dev_init_disk0+0x94>
ffffffffc0208984:	4d38                	lw	a4,88(a0)
ffffffffc0208986:	6485                	lui	s1,0x1
ffffffffc0208988:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020898c:	842a                	mv	s0,a0
ffffffffc020898e:	0cf71f63          	bne	a4,a5,ffffffffc0208a6c <dev_init_disk0+0xf6>
ffffffffc0208992:	4509                	li	a0,2
ffffffffc0208994:	960f80ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc0208998:	cd55                	beqz	a0,ffffffffc0208a54 <dev_init_disk0+0xde>
ffffffffc020899a:	4509                	li	a0,2
ffffffffc020899c:	97cf80ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc02089a0:	00355793          	srli	a5,a0,0x3
ffffffffc02089a4:	e01c                	sd	a5,0(s0)
ffffffffc02089a6:	00000797          	auipc	a5,0x0
ffffffffc02089aa:	df078793          	addi	a5,a5,-528 # ffffffffc0208796 <disk0_open>
ffffffffc02089ae:	e81c                	sd	a5,16(s0)
ffffffffc02089b0:	00000797          	auipc	a5,0x0
ffffffffc02089b4:	dea78793          	addi	a5,a5,-534 # ffffffffc020879a <disk0_close>
ffffffffc02089b8:	ec1c                	sd	a5,24(s0)
ffffffffc02089ba:	00000797          	auipc	a5,0x0
ffffffffc02089be:	de878793          	addi	a5,a5,-536 # ffffffffc02087a2 <disk0_io>
ffffffffc02089c2:	f01c                	sd	a5,32(s0)
ffffffffc02089c4:	00000797          	auipc	a5,0x0
ffffffffc02089c8:	dda78793          	addi	a5,a5,-550 # ffffffffc020879e <disk0_ioctl>
ffffffffc02089cc:	f41c                	sd	a5,40(s0)
ffffffffc02089ce:	4585                	li	a1,1
ffffffffc02089d0:	0008d517          	auipc	a0,0x8d
ffffffffc02089d4:	e7050513          	addi	a0,a0,-400 # ffffffffc0295840 <disk0_sem>
ffffffffc02089d8:	e404                	sd	s1,8(s0)
ffffffffc02089da:	b81fb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc02089de:	6511                	lui	a0,0x4
ffffffffc02089e0:	daef90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02089e4:	0008e797          	auipc	a5,0x8e
ffffffffc02089e8:	f0a7ba23          	sd	a0,-236(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc02089ec:	c921                	beqz	a0,ffffffffc0208a3c <dev_init_disk0+0xc6>
ffffffffc02089ee:	4605                	li	a2,1
ffffffffc02089f0:	85a2                	mv	a1,s0
ffffffffc02089f2:	00006517          	auipc	a0,0x6
ffffffffc02089f6:	14650513          	addi	a0,a0,326 # ffffffffc020eb38 <dev_node_ops+0x208>
ffffffffc02089fa:	c2cff0ef          	jal	ra,ffffffffc0207e26 <vfs_add_dev>
ffffffffc02089fe:	e115                	bnez	a0,ffffffffc0208a22 <dev_init_disk0+0xac>
ffffffffc0208a00:	60e2                	ld	ra,24(sp)
ffffffffc0208a02:	6442                	ld	s0,16(sp)
ffffffffc0208a04:	64a2                	ld	s1,8(sp)
ffffffffc0208a06:	6105                	addi	sp,sp,32
ffffffffc0208a08:	8082                	ret
ffffffffc0208a0a:	00006617          	auipc	a2,0x6
ffffffffc0208a0e:	0ce60613          	addi	a2,a2,206 # ffffffffc020ead8 <dev_node_ops+0x1a8>
ffffffffc0208a12:	08700593          	li	a1,135
ffffffffc0208a16:	00006517          	auipc	a0,0x6
ffffffffc0208a1a:	fda50513          	addi	a0,a0,-38 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208a1e:	a81f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a22:	86aa                	mv	a3,a0
ffffffffc0208a24:	00006617          	auipc	a2,0x6
ffffffffc0208a28:	11c60613          	addi	a2,a2,284 # ffffffffc020eb40 <dev_node_ops+0x210>
ffffffffc0208a2c:	08d00593          	li	a1,141
ffffffffc0208a30:	00006517          	auipc	a0,0x6
ffffffffc0208a34:	fc050513          	addi	a0,a0,-64 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208a38:	a67f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a3c:	00006617          	auipc	a2,0x6
ffffffffc0208a40:	0dc60613          	addi	a2,a2,220 # ffffffffc020eb18 <dev_node_ops+0x1e8>
ffffffffc0208a44:	07f00593          	li	a1,127
ffffffffc0208a48:	00006517          	auipc	a0,0x6
ffffffffc0208a4c:	fa850513          	addi	a0,a0,-88 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208a50:	a4ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a54:	00006617          	auipc	a2,0x6
ffffffffc0208a58:	0a460613          	addi	a2,a2,164 # ffffffffc020eaf8 <dev_node_ops+0x1c8>
ffffffffc0208a5c:	07300593          	li	a1,115
ffffffffc0208a60:	00006517          	auipc	a0,0x6
ffffffffc0208a64:	f9050513          	addi	a0,a0,-112 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208a68:	a37f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208a6c:	00006697          	auipc	a3,0x6
ffffffffc0208a70:	b9c68693          	addi	a3,a3,-1124 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208a74:	00003617          	auipc	a2,0x3
ffffffffc0208a78:	f0c60613          	addi	a2,a2,-244 # ffffffffc020b980 <commands+0x210>
ffffffffc0208a7c:	08900593          	li	a1,137
ffffffffc0208a80:	00006517          	auipc	a0,0x6
ffffffffc0208a84:	f7050513          	addi	a0,a0,-144 # ffffffffc020e9f0 <dev_node_ops+0xc0>
ffffffffc0208a88:	a17f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208a8c <stdin_open>:
ffffffffc0208a8c:	4501                	li	a0,0
ffffffffc0208a8e:	e191                	bnez	a1,ffffffffc0208a92 <stdin_open+0x6>
ffffffffc0208a90:	8082                	ret
ffffffffc0208a92:	5575                	li	a0,-3
ffffffffc0208a94:	8082                	ret

ffffffffc0208a96 <stdin_close>:
ffffffffc0208a96:	4501                	li	a0,0
ffffffffc0208a98:	8082                	ret

ffffffffc0208a9a <stdin_ioctl>:
ffffffffc0208a9a:	5575                	li	a0,-3
ffffffffc0208a9c:	8082                	ret

ffffffffc0208a9e <stdin_io>:
ffffffffc0208a9e:	7135                	addi	sp,sp,-160
ffffffffc0208aa0:	ed06                	sd	ra,152(sp)
ffffffffc0208aa2:	e922                	sd	s0,144(sp)
ffffffffc0208aa4:	e526                	sd	s1,136(sp)
ffffffffc0208aa6:	e14a                	sd	s2,128(sp)
ffffffffc0208aa8:	fcce                	sd	s3,120(sp)
ffffffffc0208aaa:	f8d2                	sd	s4,112(sp)
ffffffffc0208aac:	f4d6                	sd	s5,104(sp)
ffffffffc0208aae:	f0da                	sd	s6,96(sp)
ffffffffc0208ab0:	ecde                	sd	s7,88(sp)
ffffffffc0208ab2:	e8e2                	sd	s8,80(sp)
ffffffffc0208ab4:	e4e6                	sd	s9,72(sp)
ffffffffc0208ab6:	e0ea                	sd	s10,64(sp)
ffffffffc0208ab8:	fc6e                	sd	s11,56(sp)
ffffffffc0208aba:	14061163          	bnez	a2,ffffffffc0208bfc <stdin_io+0x15e>
ffffffffc0208abe:	0005bd83          	ld	s11,0(a1)
ffffffffc0208ac2:	0185bd03          	ld	s10,24(a1)
ffffffffc0208ac6:	8b2e                	mv	s6,a1
ffffffffc0208ac8:	100027f3          	csrr	a5,sstatus
ffffffffc0208acc:	8b89                	andi	a5,a5,2
ffffffffc0208ace:	10079e63          	bnez	a5,ffffffffc0208bea <stdin_io+0x14c>
ffffffffc0208ad2:	4401                	li	s0,0
ffffffffc0208ad4:	100d0963          	beqz	s10,ffffffffc0208be6 <stdin_io+0x148>
ffffffffc0208ad8:	0008e997          	auipc	s3,0x8e
ffffffffc0208adc:	e2898993          	addi	s3,s3,-472 # ffffffffc0296900 <p_rpos>
ffffffffc0208ae0:	0009b783          	ld	a5,0(s3)
ffffffffc0208ae4:	800004b7          	lui	s1,0x80000
ffffffffc0208ae8:	6c85                	lui	s9,0x1
ffffffffc0208aea:	4a81                	li	s5,0
ffffffffc0208aec:	0008ea17          	auipc	s4,0x8e
ffffffffc0208af0:	e1ca0a13          	addi	s4,s4,-484 # ffffffffc0296908 <p_wpos>
ffffffffc0208af4:	0491                	addi	s1,s1,4
ffffffffc0208af6:	0008d917          	auipc	s2,0x8d
ffffffffc0208afa:	d6290913          	addi	s2,s2,-670 # ffffffffc0295858 <__wait_queue>
ffffffffc0208afe:	1cfd                	addi	s9,s9,-1
ffffffffc0208b00:	000a3703          	ld	a4,0(s4)
ffffffffc0208b04:	000a8c1b          	sext.w	s8,s5
ffffffffc0208b08:	8be2                	mv	s7,s8
ffffffffc0208b0a:	02e7d763          	bge	a5,a4,ffffffffc0208b38 <stdin_io+0x9a>
ffffffffc0208b0e:	a859                	j	ffffffffc0208ba4 <stdin_io+0x106>
ffffffffc0208b10:	815fe0ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc0208b14:	100027f3          	csrr	a5,sstatus
ffffffffc0208b18:	8b89                	andi	a5,a5,2
ffffffffc0208b1a:	4401                	li	s0,0
ffffffffc0208b1c:	ef8d                	bnez	a5,ffffffffc0208b56 <stdin_io+0xb8>
ffffffffc0208b1e:	0028                	addi	a0,sp,8
ffffffffc0208b20:	ad7fb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208b24:	e121                	bnez	a0,ffffffffc0208b64 <stdin_io+0xc6>
ffffffffc0208b26:	47c2                	lw	a5,16(sp)
ffffffffc0208b28:	04979563          	bne	a5,s1,ffffffffc0208b72 <stdin_io+0xd4>
ffffffffc0208b2c:	0009b783          	ld	a5,0(s3)
ffffffffc0208b30:	000a3703          	ld	a4,0(s4)
ffffffffc0208b34:	06e7c863          	blt	a5,a4,ffffffffc0208ba4 <stdin_io+0x106>
ffffffffc0208b38:	8626                	mv	a2,s1
ffffffffc0208b3a:	002c                	addi	a1,sp,8
ffffffffc0208b3c:	854a                	mv	a0,s2
ffffffffc0208b3e:	be3fb0ef          	jal	ra,ffffffffc0204720 <wait_current_set>
ffffffffc0208b42:	d479                	beqz	s0,ffffffffc0208b10 <stdin_io+0x72>
ffffffffc0208b44:	928f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208b48:	fdcfe0ef          	jal	ra,ffffffffc0207324 <schedule>
ffffffffc0208b4c:	100027f3          	csrr	a5,sstatus
ffffffffc0208b50:	8b89                	andi	a5,a5,2
ffffffffc0208b52:	4401                	li	s0,0
ffffffffc0208b54:	d7e9                	beqz	a5,ffffffffc0208b1e <stdin_io+0x80>
ffffffffc0208b56:	91cf80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b5a:	0028                	addi	a0,sp,8
ffffffffc0208b5c:	4405                	li	s0,1
ffffffffc0208b5e:	a99fb0ef          	jal	ra,ffffffffc02045f6 <wait_in_queue>
ffffffffc0208b62:	d171                	beqz	a0,ffffffffc0208b26 <stdin_io+0x88>
ffffffffc0208b64:	002c                	addi	a1,sp,8
ffffffffc0208b66:	854a                	mv	a0,s2
ffffffffc0208b68:	a35fb0ef          	jal	ra,ffffffffc020459c <wait_queue_del>
ffffffffc0208b6c:	47c2                	lw	a5,16(sp)
ffffffffc0208b6e:	fa978fe3          	beq	a5,s1,ffffffffc0208b2c <stdin_io+0x8e>
ffffffffc0208b72:	e435                	bnez	s0,ffffffffc0208bde <stdin_io+0x140>
ffffffffc0208b74:	060b8963          	beqz	s7,ffffffffc0208be6 <stdin_io+0x148>
ffffffffc0208b78:	018b3783          	ld	a5,24(s6)
ffffffffc0208b7c:	41578ab3          	sub	s5,a5,s5
ffffffffc0208b80:	015b3c23          	sd	s5,24(s6)
ffffffffc0208b84:	60ea                	ld	ra,152(sp)
ffffffffc0208b86:	644a                	ld	s0,144(sp)
ffffffffc0208b88:	64aa                	ld	s1,136(sp)
ffffffffc0208b8a:	690a                	ld	s2,128(sp)
ffffffffc0208b8c:	79e6                	ld	s3,120(sp)
ffffffffc0208b8e:	7a46                	ld	s4,112(sp)
ffffffffc0208b90:	7aa6                	ld	s5,104(sp)
ffffffffc0208b92:	7b06                	ld	s6,96(sp)
ffffffffc0208b94:	6c46                	ld	s8,80(sp)
ffffffffc0208b96:	6ca6                	ld	s9,72(sp)
ffffffffc0208b98:	6d06                	ld	s10,64(sp)
ffffffffc0208b9a:	7de2                	ld	s11,56(sp)
ffffffffc0208b9c:	855e                	mv	a0,s7
ffffffffc0208b9e:	6be6                	ld	s7,88(sp)
ffffffffc0208ba0:	610d                	addi	sp,sp,160
ffffffffc0208ba2:	8082                	ret
ffffffffc0208ba4:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208ba8:	03475693          	srli	a3,a4,0x34
ffffffffc0208bac:	00d78733          	add	a4,a5,a3
ffffffffc0208bb0:	01977733          	and	a4,a4,s9
ffffffffc0208bb4:	8f15                	sub	a4,a4,a3
ffffffffc0208bb6:	0008d697          	auipc	a3,0x8d
ffffffffc0208bba:	cb268693          	addi	a3,a3,-846 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208bbe:	9736                	add	a4,a4,a3
ffffffffc0208bc0:	00074683          	lbu	a3,0(a4)
ffffffffc0208bc4:	0785                	addi	a5,a5,1
ffffffffc0208bc6:	015d8733          	add	a4,s11,s5
ffffffffc0208bca:	00d70023          	sb	a3,0(a4)
ffffffffc0208bce:	00f9b023          	sd	a5,0(s3)
ffffffffc0208bd2:	0a85                	addi	s5,s5,1
ffffffffc0208bd4:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208bd8:	f3aae4e3          	bltu	s5,s10,ffffffffc0208b00 <stdin_io+0x62>
ffffffffc0208bdc:	dc51                	beqz	s0,ffffffffc0208b78 <stdin_io+0xda>
ffffffffc0208bde:	88ef80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208be2:	f80b9be3          	bnez	s7,ffffffffc0208b78 <stdin_io+0xda>
ffffffffc0208be6:	4b81                	li	s7,0
ffffffffc0208be8:	bf71                	j	ffffffffc0208b84 <stdin_io+0xe6>
ffffffffc0208bea:	888f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208bee:	4405                	li	s0,1
ffffffffc0208bf0:	ee0d14e3          	bnez	s10,ffffffffc0208ad8 <stdin_io+0x3a>
ffffffffc0208bf4:	878f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208bf8:	4b81                	li	s7,0
ffffffffc0208bfa:	b769                	j	ffffffffc0208b84 <stdin_io+0xe6>
ffffffffc0208bfc:	5bf5                	li	s7,-3
ffffffffc0208bfe:	b759                	j	ffffffffc0208b84 <stdin_io+0xe6>

ffffffffc0208c00 <dev_stdin_write>:
ffffffffc0208c00:	e111                	bnez	a0,ffffffffc0208c04 <dev_stdin_write+0x4>
ffffffffc0208c02:	8082                	ret
ffffffffc0208c04:	1101                	addi	sp,sp,-32
ffffffffc0208c06:	e822                	sd	s0,16(sp)
ffffffffc0208c08:	ec06                	sd	ra,24(sp)
ffffffffc0208c0a:	e426                	sd	s1,8(sp)
ffffffffc0208c0c:	842a                	mv	s0,a0
ffffffffc0208c0e:	100027f3          	csrr	a5,sstatus
ffffffffc0208c12:	8b89                	andi	a5,a5,2
ffffffffc0208c14:	4481                	li	s1,0
ffffffffc0208c16:	e3c1                	bnez	a5,ffffffffc0208c96 <dev_stdin_write+0x96>
ffffffffc0208c18:	0008e597          	auipc	a1,0x8e
ffffffffc0208c1c:	cf058593          	addi	a1,a1,-784 # ffffffffc0296908 <p_wpos>
ffffffffc0208c20:	6198                	ld	a4,0(a1)
ffffffffc0208c22:	6605                	lui	a2,0x1
ffffffffc0208c24:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208c28:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208c2c:	92d1                	srli	a3,a3,0x34
ffffffffc0208c2e:	00d707b3          	add	a5,a4,a3
ffffffffc0208c32:	8fe9                	and	a5,a5,a0
ffffffffc0208c34:	8f95                	sub	a5,a5,a3
ffffffffc0208c36:	0008d697          	auipc	a3,0x8d
ffffffffc0208c3a:	c3268693          	addi	a3,a3,-974 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208c3e:	97b6                	add	a5,a5,a3
ffffffffc0208c40:	00878023          	sb	s0,0(a5)
ffffffffc0208c44:	0008e797          	auipc	a5,0x8e
ffffffffc0208c48:	cbc7b783          	ld	a5,-836(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208c4c:	40f707b3          	sub	a5,a4,a5
ffffffffc0208c50:	00c7d463          	bge	a5,a2,ffffffffc0208c58 <dev_stdin_write+0x58>
ffffffffc0208c54:	0705                	addi	a4,a4,1
ffffffffc0208c56:	e198                	sd	a4,0(a1)
ffffffffc0208c58:	0008d517          	auipc	a0,0x8d
ffffffffc0208c5c:	c0050513          	addi	a0,a0,-1024 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c60:	98bfb0ef          	jal	ra,ffffffffc02045ea <wait_queue_empty>
ffffffffc0208c64:	cd09                	beqz	a0,ffffffffc0208c7e <dev_stdin_write+0x7e>
ffffffffc0208c66:	e491                	bnez	s1,ffffffffc0208c72 <dev_stdin_write+0x72>
ffffffffc0208c68:	60e2                	ld	ra,24(sp)
ffffffffc0208c6a:	6442                	ld	s0,16(sp)
ffffffffc0208c6c:	64a2                	ld	s1,8(sp)
ffffffffc0208c6e:	6105                	addi	sp,sp,32
ffffffffc0208c70:	8082                	ret
ffffffffc0208c72:	6442                	ld	s0,16(sp)
ffffffffc0208c74:	60e2                	ld	ra,24(sp)
ffffffffc0208c76:	64a2                	ld	s1,8(sp)
ffffffffc0208c78:	6105                	addi	sp,sp,32
ffffffffc0208c7a:	ff3f706f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208c7e:	800005b7          	lui	a1,0x80000
ffffffffc0208c82:	4605                	li	a2,1
ffffffffc0208c84:	0591                	addi	a1,a1,4
ffffffffc0208c86:	0008d517          	auipc	a0,0x8d
ffffffffc0208c8a:	bd250513          	addi	a0,a0,-1070 # ffffffffc0295858 <__wait_queue>
ffffffffc0208c8e:	9c5fb0ef          	jal	ra,ffffffffc0204652 <wakeup_queue>
ffffffffc0208c92:	d8f9                	beqz	s1,ffffffffc0208c68 <dev_stdin_write+0x68>
ffffffffc0208c94:	bff9                	j	ffffffffc0208c72 <dev_stdin_write+0x72>
ffffffffc0208c96:	fddf70ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208c9a:	4485                	li	s1,1
ffffffffc0208c9c:	bfb5                	j	ffffffffc0208c18 <dev_stdin_write+0x18>

ffffffffc0208c9e <dev_init_stdin>:
ffffffffc0208c9e:	1141                	addi	sp,sp,-16
ffffffffc0208ca0:	e406                	sd	ra,8(sp)
ffffffffc0208ca2:	e022                	sd	s0,0(sp)
ffffffffc0208ca4:	ac7ff0ef          	jal	ra,ffffffffc020876a <dev_create_inode>
ffffffffc0208ca8:	c93d                	beqz	a0,ffffffffc0208d1e <dev_init_stdin+0x80>
ffffffffc0208caa:	4d38                	lw	a4,88(a0)
ffffffffc0208cac:	6785                	lui	a5,0x1
ffffffffc0208cae:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208cb2:	842a                	mv	s0,a0
ffffffffc0208cb4:	08f71e63          	bne	a4,a5,ffffffffc0208d50 <dev_init_stdin+0xb2>
ffffffffc0208cb8:	4785                	li	a5,1
ffffffffc0208cba:	e41c                	sd	a5,8(s0)
ffffffffc0208cbc:	00000797          	auipc	a5,0x0
ffffffffc0208cc0:	dd078793          	addi	a5,a5,-560 # ffffffffc0208a8c <stdin_open>
ffffffffc0208cc4:	e81c                	sd	a5,16(s0)
ffffffffc0208cc6:	00000797          	auipc	a5,0x0
ffffffffc0208cca:	dd078793          	addi	a5,a5,-560 # ffffffffc0208a96 <stdin_close>
ffffffffc0208cce:	ec1c                	sd	a5,24(s0)
ffffffffc0208cd0:	00000797          	auipc	a5,0x0
ffffffffc0208cd4:	dce78793          	addi	a5,a5,-562 # ffffffffc0208a9e <stdin_io>
ffffffffc0208cd8:	f01c                	sd	a5,32(s0)
ffffffffc0208cda:	00000797          	auipc	a5,0x0
ffffffffc0208cde:	dc078793          	addi	a5,a5,-576 # ffffffffc0208a9a <stdin_ioctl>
ffffffffc0208ce2:	f41c                	sd	a5,40(s0)
ffffffffc0208ce4:	0008d517          	auipc	a0,0x8d
ffffffffc0208ce8:	b7450513          	addi	a0,a0,-1164 # ffffffffc0295858 <__wait_queue>
ffffffffc0208cec:	00043023          	sd	zero,0(s0)
ffffffffc0208cf0:	0008e797          	auipc	a5,0x8e
ffffffffc0208cf4:	c007bc23          	sd	zero,-1000(a5) # ffffffffc0296908 <p_wpos>
ffffffffc0208cf8:	0008e797          	auipc	a5,0x8e
ffffffffc0208cfc:	c007b423          	sd	zero,-1016(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208d00:	897fb0ef          	jal	ra,ffffffffc0204596 <wait_queue_init>
ffffffffc0208d04:	4601                	li	a2,0
ffffffffc0208d06:	85a2                	mv	a1,s0
ffffffffc0208d08:	00006517          	auipc	a0,0x6
ffffffffc0208d0c:	e9850513          	addi	a0,a0,-360 # ffffffffc020eba0 <dev_node_ops+0x270>
ffffffffc0208d10:	916ff0ef          	jal	ra,ffffffffc0207e26 <vfs_add_dev>
ffffffffc0208d14:	e10d                	bnez	a0,ffffffffc0208d36 <dev_init_stdin+0x98>
ffffffffc0208d16:	60a2                	ld	ra,8(sp)
ffffffffc0208d18:	6402                	ld	s0,0(sp)
ffffffffc0208d1a:	0141                	addi	sp,sp,16
ffffffffc0208d1c:	8082                	ret
ffffffffc0208d1e:	00006617          	auipc	a2,0x6
ffffffffc0208d22:	e4260613          	addi	a2,a2,-446 # ffffffffc020eb60 <dev_node_ops+0x230>
ffffffffc0208d26:	07500593          	li	a1,117
ffffffffc0208d2a:	00006517          	auipc	a0,0x6
ffffffffc0208d2e:	e5650513          	addi	a0,a0,-426 # ffffffffc020eb80 <dev_node_ops+0x250>
ffffffffc0208d32:	f6cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d36:	86aa                	mv	a3,a0
ffffffffc0208d38:	00006617          	auipc	a2,0x6
ffffffffc0208d3c:	e7060613          	addi	a2,a2,-400 # ffffffffc020eba8 <dev_node_ops+0x278>
ffffffffc0208d40:	07b00593          	li	a1,123
ffffffffc0208d44:	00006517          	auipc	a0,0x6
ffffffffc0208d48:	e3c50513          	addi	a0,a0,-452 # ffffffffc020eb80 <dev_node_ops+0x250>
ffffffffc0208d4c:	f52f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208d50:	00006697          	auipc	a3,0x6
ffffffffc0208d54:	8b868693          	addi	a3,a3,-1864 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208d58:	00003617          	auipc	a2,0x3
ffffffffc0208d5c:	c2860613          	addi	a2,a2,-984 # ffffffffc020b980 <commands+0x210>
ffffffffc0208d60:	07700593          	li	a1,119
ffffffffc0208d64:	00006517          	auipc	a0,0x6
ffffffffc0208d68:	e1c50513          	addi	a0,a0,-484 # ffffffffc020eb80 <dev_node_ops+0x250>
ffffffffc0208d6c:	f32f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d70 <stdout_open>:
ffffffffc0208d70:	4785                	li	a5,1
ffffffffc0208d72:	4501                	li	a0,0
ffffffffc0208d74:	00f59363          	bne	a1,a5,ffffffffc0208d7a <stdout_open+0xa>
ffffffffc0208d78:	8082                	ret
ffffffffc0208d7a:	5575                	li	a0,-3
ffffffffc0208d7c:	8082                	ret

ffffffffc0208d7e <stdout_close>:
ffffffffc0208d7e:	4501                	li	a0,0
ffffffffc0208d80:	8082                	ret

ffffffffc0208d82 <stdout_ioctl>:
ffffffffc0208d82:	5575                	li	a0,-3
ffffffffc0208d84:	8082                	ret

ffffffffc0208d86 <stdout_io>:
ffffffffc0208d86:	ca05                	beqz	a2,ffffffffc0208db6 <stdout_io+0x30>
ffffffffc0208d88:	6d9c                	ld	a5,24(a1)
ffffffffc0208d8a:	1101                	addi	sp,sp,-32
ffffffffc0208d8c:	e822                	sd	s0,16(sp)
ffffffffc0208d8e:	e426                	sd	s1,8(sp)
ffffffffc0208d90:	ec06                	sd	ra,24(sp)
ffffffffc0208d92:	6180                	ld	s0,0(a1)
ffffffffc0208d94:	84ae                	mv	s1,a1
ffffffffc0208d96:	cb91                	beqz	a5,ffffffffc0208daa <stdout_io+0x24>
ffffffffc0208d98:	00044503          	lbu	a0,0(s0)
ffffffffc0208d9c:	0405                	addi	s0,s0,1
ffffffffc0208d9e:	c44f70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0208da2:	6c9c                	ld	a5,24(s1)
ffffffffc0208da4:	17fd                	addi	a5,a5,-1
ffffffffc0208da6:	ec9c                	sd	a5,24(s1)
ffffffffc0208da8:	fbe5                	bnez	a5,ffffffffc0208d98 <stdout_io+0x12>
ffffffffc0208daa:	60e2                	ld	ra,24(sp)
ffffffffc0208dac:	6442                	ld	s0,16(sp)
ffffffffc0208dae:	64a2                	ld	s1,8(sp)
ffffffffc0208db0:	4501                	li	a0,0
ffffffffc0208db2:	6105                	addi	sp,sp,32
ffffffffc0208db4:	8082                	ret
ffffffffc0208db6:	5575                	li	a0,-3
ffffffffc0208db8:	8082                	ret

ffffffffc0208dba <dev_init_stdout>:
ffffffffc0208dba:	1141                	addi	sp,sp,-16
ffffffffc0208dbc:	e406                	sd	ra,8(sp)
ffffffffc0208dbe:	9adff0ef          	jal	ra,ffffffffc020876a <dev_create_inode>
ffffffffc0208dc2:	c939                	beqz	a0,ffffffffc0208e18 <dev_init_stdout+0x5e>
ffffffffc0208dc4:	4d38                	lw	a4,88(a0)
ffffffffc0208dc6:	6785                	lui	a5,0x1
ffffffffc0208dc8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208dcc:	85aa                	mv	a1,a0
ffffffffc0208dce:	06f71e63          	bne	a4,a5,ffffffffc0208e4a <dev_init_stdout+0x90>
ffffffffc0208dd2:	4785                	li	a5,1
ffffffffc0208dd4:	e51c                	sd	a5,8(a0)
ffffffffc0208dd6:	00000797          	auipc	a5,0x0
ffffffffc0208dda:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208d70 <stdout_open>
ffffffffc0208dde:	e91c                	sd	a5,16(a0)
ffffffffc0208de0:	00000797          	auipc	a5,0x0
ffffffffc0208de4:	f9e78793          	addi	a5,a5,-98 # ffffffffc0208d7e <stdout_close>
ffffffffc0208de8:	ed1c                	sd	a5,24(a0)
ffffffffc0208dea:	00000797          	auipc	a5,0x0
ffffffffc0208dee:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208d86 <stdout_io>
ffffffffc0208df2:	f11c                	sd	a5,32(a0)
ffffffffc0208df4:	00000797          	auipc	a5,0x0
ffffffffc0208df8:	f8e78793          	addi	a5,a5,-114 # ffffffffc0208d82 <stdout_ioctl>
ffffffffc0208dfc:	00053023          	sd	zero,0(a0)
ffffffffc0208e00:	f51c                	sd	a5,40(a0)
ffffffffc0208e02:	4601                	li	a2,0
ffffffffc0208e04:	00006517          	auipc	a0,0x6
ffffffffc0208e08:	e0450513          	addi	a0,a0,-508 # ffffffffc020ec08 <dev_node_ops+0x2d8>
ffffffffc0208e0c:	81aff0ef          	jal	ra,ffffffffc0207e26 <vfs_add_dev>
ffffffffc0208e10:	e105                	bnez	a0,ffffffffc0208e30 <dev_init_stdout+0x76>
ffffffffc0208e12:	60a2                	ld	ra,8(sp)
ffffffffc0208e14:	0141                	addi	sp,sp,16
ffffffffc0208e16:	8082                	ret
ffffffffc0208e18:	00006617          	auipc	a2,0x6
ffffffffc0208e1c:	db060613          	addi	a2,a2,-592 # ffffffffc020ebc8 <dev_node_ops+0x298>
ffffffffc0208e20:	03700593          	li	a1,55
ffffffffc0208e24:	00006517          	auipc	a0,0x6
ffffffffc0208e28:	dc450513          	addi	a0,a0,-572 # ffffffffc020ebe8 <dev_node_ops+0x2b8>
ffffffffc0208e2c:	e72f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e30:	86aa                	mv	a3,a0
ffffffffc0208e32:	00006617          	auipc	a2,0x6
ffffffffc0208e36:	dde60613          	addi	a2,a2,-546 # ffffffffc020ec10 <dev_node_ops+0x2e0>
ffffffffc0208e3a:	03d00593          	li	a1,61
ffffffffc0208e3e:	00006517          	auipc	a0,0x6
ffffffffc0208e42:	daa50513          	addi	a0,a0,-598 # ffffffffc020ebe8 <dev_node_ops+0x2b8>
ffffffffc0208e46:	e58f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e4a:	00005697          	auipc	a3,0x5
ffffffffc0208e4e:	7be68693          	addi	a3,a3,1982 # ffffffffc020e608 <syscalls+0xb10>
ffffffffc0208e52:	00003617          	auipc	a2,0x3
ffffffffc0208e56:	b2e60613          	addi	a2,a2,-1234 # ffffffffc020b980 <commands+0x210>
ffffffffc0208e5a:	03900593          	li	a1,57
ffffffffc0208e5e:	00006517          	auipc	a0,0x6
ffffffffc0208e62:	d8a50513          	addi	a0,a0,-630 # ffffffffc020ebe8 <dev_node_ops+0x2b8>
ffffffffc0208e66:	e38f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e6a <bitmap_translate.part.0>:
ffffffffc0208e6a:	1141                	addi	sp,sp,-16
ffffffffc0208e6c:	00006697          	auipc	a3,0x6
ffffffffc0208e70:	dc468693          	addi	a3,a3,-572 # ffffffffc020ec30 <dev_node_ops+0x300>
ffffffffc0208e74:	00003617          	auipc	a2,0x3
ffffffffc0208e78:	b0c60613          	addi	a2,a2,-1268 # ffffffffc020b980 <commands+0x210>
ffffffffc0208e7c:	04c00593          	li	a1,76
ffffffffc0208e80:	00006517          	auipc	a0,0x6
ffffffffc0208e84:	dc850513          	addi	a0,a0,-568 # ffffffffc020ec48 <dev_node_ops+0x318>
ffffffffc0208e88:	e406                	sd	ra,8(sp)
ffffffffc0208e8a:	e14f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e8e <bitmap_create>:
ffffffffc0208e8e:	7139                	addi	sp,sp,-64
ffffffffc0208e90:	fc06                	sd	ra,56(sp)
ffffffffc0208e92:	f822                	sd	s0,48(sp)
ffffffffc0208e94:	f426                	sd	s1,40(sp)
ffffffffc0208e96:	f04a                	sd	s2,32(sp)
ffffffffc0208e98:	ec4e                	sd	s3,24(sp)
ffffffffc0208e9a:	e852                	sd	s4,16(sp)
ffffffffc0208e9c:	e456                	sd	s5,8(sp)
ffffffffc0208e9e:	c14d                	beqz	a0,ffffffffc0208f40 <bitmap_create+0xb2>
ffffffffc0208ea0:	842a                	mv	s0,a0
ffffffffc0208ea2:	4541                	li	a0,16
ffffffffc0208ea4:	8eaf90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208ea8:	84aa                	mv	s1,a0
ffffffffc0208eaa:	cd25                	beqz	a0,ffffffffc0208f22 <bitmap_create+0x94>
ffffffffc0208eac:	02041a13          	slli	s4,s0,0x20
ffffffffc0208eb0:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208eb4:	01fa0793          	addi	a5,s4,31
ffffffffc0208eb8:	0057d993          	srli	s3,a5,0x5
ffffffffc0208ebc:	00299a93          	slli	s5,s3,0x2
ffffffffc0208ec0:	8556                	mv	a0,s5
ffffffffc0208ec2:	894e                	mv	s2,s3
ffffffffc0208ec4:	8caf90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208ec8:	c53d                	beqz	a0,ffffffffc0208f36 <bitmap_create+0xa8>
ffffffffc0208eca:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208ece:	c080                	sw	s0,0(s1)
ffffffffc0208ed0:	8656                	mv	a2,s5
ffffffffc0208ed2:	0ff00593          	li	a1,255
ffffffffc0208ed6:	5c4020ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc0208eda:	e488                	sd	a0,8(s1)
ffffffffc0208edc:	0996                	slli	s3,s3,0x5
ffffffffc0208ede:	053a0263          	beq	s4,s3,ffffffffc0208f22 <bitmap_create+0x94>
ffffffffc0208ee2:	fff9079b          	addiw	a5,s2,-1
ffffffffc0208ee6:	0057969b          	slliw	a3,a5,0x5
ffffffffc0208eea:	0054561b          	srliw	a2,s0,0x5
ffffffffc0208eee:	40d4073b          	subw	a4,s0,a3
ffffffffc0208ef2:	0054541b          	srliw	s0,s0,0x5
ffffffffc0208ef6:	08f61463          	bne	a2,a5,ffffffffc0208f7e <bitmap_create+0xf0>
ffffffffc0208efa:	fff7069b          	addiw	a3,a4,-1
ffffffffc0208efe:	47f9                	li	a5,30
ffffffffc0208f00:	04d7ef63          	bltu	a5,a3,ffffffffc0208f5e <bitmap_create+0xd0>
ffffffffc0208f04:	1402                	slli	s0,s0,0x20
ffffffffc0208f06:	8079                	srli	s0,s0,0x1e
ffffffffc0208f08:	9522                	add	a0,a0,s0
ffffffffc0208f0a:	411c                	lw	a5,0(a0)
ffffffffc0208f0c:	4585                	li	a1,1
ffffffffc0208f0e:	02000613          	li	a2,32
ffffffffc0208f12:	00e596bb          	sllw	a3,a1,a4
ffffffffc0208f16:	8fb5                	xor	a5,a5,a3
ffffffffc0208f18:	2705                	addiw	a4,a4,1
ffffffffc0208f1a:	2781                	sext.w	a5,a5
ffffffffc0208f1c:	fec71be3          	bne	a4,a2,ffffffffc0208f12 <bitmap_create+0x84>
ffffffffc0208f20:	c11c                	sw	a5,0(a0)
ffffffffc0208f22:	70e2                	ld	ra,56(sp)
ffffffffc0208f24:	7442                	ld	s0,48(sp)
ffffffffc0208f26:	7902                	ld	s2,32(sp)
ffffffffc0208f28:	69e2                	ld	s3,24(sp)
ffffffffc0208f2a:	6a42                	ld	s4,16(sp)
ffffffffc0208f2c:	6aa2                	ld	s5,8(sp)
ffffffffc0208f2e:	8526                	mv	a0,s1
ffffffffc0208f30:	74a2                	ld	s1,40(sp)
ffffffffc0208f32:	6121                	addi	sp,sp,64
ffffffffc0208f34:	8082                	ret
ffffffffc0208f36:	8526                	mv	a0,s1
ffffffffc0208f38:	906f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208f3c:	4481                	li	s1,0
ffffffffc0208f3e:	b7d5                	j	ffffffffc0208f22 <bitmap_create+0x94>
ffffffffc0208f40:	00006697          	auipc	a3,0x6
ffffffffc0208f44:	d2068693          	addi	a3,a3,-736 # ffffffffc020ec60 <dev_node_ops+0x330>
ffffffffc0208f48:	00003617          	auipc	a2,0x3
ffffffffc0208f4c:	a3860613          	addi	a2,a2,-1480 # ffffffffc020b980 <commands+0x210>
ffffffffc0208f50:	45d5                	li	a1,21
ffffffffc0208f52:	00006517          	auipc	a0,0x6
ffffffffc0208f56:	cf650513          	addi	a0,a0,-778 # ffffffffc020ec48 <dev_node_ops+0x318>
ffffffffc0208f5a:	d44f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208f5e:	00006697          	auipc	a3,0x6
ffffffffc0208f62:	d4268693          	addi	a3,a3,-702 # ffffffffc020eca0 <dev_node_ops+0x370>
ffffffffc0208f66:	00003617          	auipc	a2,0x3
ffffffffc0208f6a:	a1a60613          	addi	a2,a2,-1510 # ffffffffc020b980 <commands+0x210>
ffffffffc0208f6e:	02b00593          	li	a1,43
ffffffffc0208f72:	00006517          	auipc	a0,0x6
ffffffffc0208f76:	cd650513          	addi	a0,a0,-810 # ffffffffc020ec48 <dev_node_ops+0x318>
ffffffffc0208f7a:	d24f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208f7e:	00006697          	auipc	a3,0x6
ffffffffc0208f82:	d0a68693          	addi	a3,a3,-758 # ffffffffc020ec88 <dev_node_ops+0x358>
ffffffffc0208f86:	00003617          	auipc	a2,0x3
ffffffffc0208f8a:	9fa60613          	addi	a2,a2,-1542 # ffffffffc020b980 <commands+0x210>
ffffffffc0208f8e:	02a00593          	li	a1,42
ffffffffc0208f92:	00006517          	auipc	a0,0x6
ffffffffc0208f96:	cb650513          	addi	a0,a0,-842 # ffffffffc020ec48 <dev_node_ops+0x318>
ffffffffc0208f9a:	d04f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f9e <bitmap_alloc>:
ffffffffc0208f9e:	4150                	lw	a2,4(a0)
ffffffffc0208fa0:	651c                	ld	a5,8(a0)
ffffffffc0208fa2:	c231                	beqz	a2,ffffffffc0208fe6 <bitmap_alloc+0x48>
ffffffffc0208fa4:	4701                	li	a4,0
ffffffffc0208fa6:	a029                	j	ffffffffc0208fb0 <bitmap_alloc+0x12>
ffffffffc0208fa8:	2705                	addiw	a4,a4,1
ffffffffc0208faa:	0791                	addi	a5,a5,4
ffffffffc0208fac:	02e60d63          	beq	a2,a4,ffffffffc0208fe6 <bitmap_alloc+0x48>
ffffffffc0208fb0:	4394                	lw	a3,0(a5)
ffffffffc0208fb2:	dafd                	beqz	a3,ffffffffc0208fa8 <bitmap_alloc+0xa>
ffffffffc0208fb4:	4501                	li	a0,0
ffffffffc0208fb6:	4885                	li	a7,1
ffffffffc0208fb8:	8e36                	mv	t3,a3
ffffffffc0208fba:	02000313          	li	t1,32
ffffffffc0208fbe:	a021                	j	ffffffffc0208fc6 <bitmap_alloc+0x28>
ffffffffc0208fc0:	2505                	addiw	a0,a0,1
ffffffffc0208fc2:	02650463          	beq	a0,t1,ffffffffc0208fea <bitmap_alloc+0x4c>
ffffffffc0208fc6:	00a8983b          	sllw	a6,a7,a0
ffffffffc0208fca:	0106f633          	and	a2,a3,a6
ffffffffc0208fce:	2601                	sext.w	a2,a2
ffffffffc0208fd0:	da65                	beqz	a2,ffffffffc0208fc0 <bitmap_alloc+0x22>
ffffffffc0208fd2:	010e4833          	xor	a6,t3,a6
ffffffffc0208fd6:	0057171b          	slliw	a4,a4,0x5
ffffffffc0208fda:	9f29                	addw	a4,a4,a0
ffffffffc0208fdc:	0107a023          	sw	a6,0(a5)
ffffffffc0208fe0:	c198                	sw	a4,0(a1)
ffffffffc0208fe2:	4501                	li	a0,0
ffffffffc0208fe4:	8082                	ret
ffffffffc0208fe6:	5571                	li	a0,-4
ffffffffc0208fe8:	8082                	ret
ffffffffc0208fea:	1141                	addi	sp,sp,-16
ffffffffc0208fec:	00004697          	auipc	a3,0x4
ffffffffc0208ff0:	a1468693          	addi	a3,a3,-1516 # ffffffffc020ca00 <default_pmm_manager+0x598>
ffffffffc0208ff4:	00003617          	auipc	a2,0x3
ffffffffc0208ff8:	98c60613          	addi	a2,a2,-1652 # ffffffffc020b980 <commands+0x210>
ffffffffc0208ffc:	04300593          	li	a1,67
ffffffffc0209000:	00006517          	auipc	a0,0x6
ffffffffc0209004:	c4850513          	addi	a0,a0,-952 # ffffffffc020ec48 <dev_node_ops+0x318>
ffffffffc0209008:	e406                	sd	ra,8(sp)
ffffffffc020900a:	c94f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020900e <bitmap_test>:
ffffffffc020900e:	411c                	lw	a5,0(a0)
ffffffffc0209010:	00f5ff63          	bgeu	a1,a5,ffffffffc020902e <bitmap_test+0x20>
ffffffffc0209014:	651c                	ld	a5,8(a0)
ffffffffc0209016:	0055d71b          	srliw	a4,a1,0x5
ffffffffc020901a:	070a                	slli	a4,a4,0x2
ffffffffc020901c:	97ba                	add	a5,a5,a4
ffffffffc020901e:	4388                	lw	a0,0(a5)
ffffffffc0209020:	4785                	li	a5,1
ffffffffc0209022:	00b795bb          	sllw	a1,a5,a1
ffffffffc0209026:	8d6d                	and	a0,a0,a1
ffffffffc0209028:	1502                	slli	a0,a0,0x20
ffffffffc020902a:	9101                	srli	a0,a0,0x20
ffffffffc020902c:	8082                	ret
ffffffffc020902e:	1141                	addi	sp,sp,-16
ffffffffc0209030:	e406                	sd	ra,8(sp)
ffffffffc0209032:	e39ff0ef          	jal	ra,ffffffffc0208e6a <bitmap_translate.part.0>

ffffffffc0209036 <bitmap_free>:
ffffffffc0209036:	411c                	lw	a5,0(a0)
ffffffffc0209038:	1141                	addi	sp,sp,-16
ffffffffc020903a:	e406                	sd	ra,8(sp)
ffffffffc020903c:	02f5f463          	bgeu	a1,a5,ffffffffc0209064 <bitmap_free+0x2e>
ffffffffc0209040:	651c                	ld	a5,8(a0)
ffffffffc0209042:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0209046:	070a                	slli	a4,a4,0x2
ffffffffc0209048:	97ba                	add	a5,a5,a4
ffffffffc020904a:	4398                	lw	a4,0(a5)
ffffffffc020904c:	4685                	li	a3,1
ffffffffc020904e:	00b695bb          	sllw	a1,a3,a1
ffffffffc0209052:	00b776b3          	and	a3,a4,a1
ffffffffc0209056:	2681                	sext.w	a3,a3
ffffffffc0209058:	ea81                	bnez	a3,ffffffffc0209068 <bitmap_free+0x32>
ffffffffc020905a:	60a2                	ld	ra,8(sp)
ffffffffc020905c:	8f4d                	or	a4,a4,a1
ffffffffc020905e:	c398                	sw	a4,0(a5)
ffffffffc0209060:	0141                	addi	sp,sp,16
ffffffffc0209062:	8082                	ret
ffffffffc0209064:	e07ff0ef          	jal	ra,ffffffffc0208e6a <bitmap_translate.part.0>
ffffffffc0209068:	00006697          	auipc	a3,0x6
ffffffffc020906c:	c6068693          	addi	a3,a3,-928 # ffffffffc020ecc8 <dev_node_ops+0x398>
ffffffffc0209070:	00003617          	auipc	a2,0x3
ffffffffc0209074:	91060613          	addi	a2,a2,-1776 # ffffffffc020b980 <commands+0x210>
ffffffffc0209078:	05f00593          	li	a1,95
ffffffffc020907c:	00006517          	auipc	a0,0x6
ffffffffc0209080:	bcc50513          	addi	a0,a0,-1076 # ffffffffc020ec48 <dev_node_ops+0x318>
ffffffffc0209084:	c1af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209088 <bitmap_destroy>:
ffffffffc0209088:	1141                	addi	sp,sp,-16
ffffffffc020908a:	e022                	sd	s0,0(sp)
ffffffffc020908c:	842a                	mv	s0,a0
ffffffffc020908e:	6508                	ld	a0,8(a0)
ffffffffc0209090:	e406                	sd	ra,8(sp)
ffffffffc0209092:	fadf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209096:	8522                	mv	a0,s0
ffffffffc0209098:	6402                	ld	s0,0(sp)
ffffffffc020909a:	60a2                	ld	ra,8(sp)
ffffffffc020909c:	0141                	addi	sp,sp,16
ffffffffc020909e:	fa1f806f          	j	ffffffffc020203e <kfree>

ffffffffc02090a2 <bitmap_getdata>:
ffffffffc02090a2:	c589                	beqz	a1,ffffffffc02090ac <bitmap_getdata+0xa>
ffffffffc02090a4:	00456783          	lwu	a5,4(a0)
ffffffffc02090a8:	078a                	slli	a5,a5,0x2
ffffffffc02090aa:	e19c                	sd	a5,0(a1)
ffffffffc02090ac:	6508                	ld	a0,8(a0)
ffffffffc02090ae:	8082                	ret

ffffffffc02090b0 <sfs_init>:
ffffffffc02090b0:	1141                	addi	sp,sp,-16
ffffffffc02090b2:	00006517          	auipc	a0,0x6
ffffffffc02090b6:	a8650513          	addi	a0,a0,-1402 # ffffffffc020eb38 <dev_node_ops+0x208>
ffffffffc02090ba:	e406                	sd	ra,8(sp)
ffffffffc02090bc:	554000ef          	jal	ra,ffffffffc0209610 <sfs_mount>
ffffffffc02090c0:	e501                	bnez	a0,ffffffffc02090c8 <sfs_init+0x18>
ffffffffc02090c2:	60a2                	ld	ra,8(sp)
ffffffffc02090c4:	0141                	addi	sp,sp,16
ffffffffc02090c6:	8082                	ret
ffffffffc02090c8:	86aa                	mv	a3,a0
ffffffffc02090ca:	00006617          	auipc	a2,0x6
ffffffffc02090ce:	c0e60613          	addi	a2,a2,-1010 # ffffffffc020ecd8 <dev_node_ops+0x3a8>
ffffffffc02090d2:	45c1                	li	a1,16
ffffffffc02090d4:	00006517          	auipc	a0,0x6
ffffffffc02090d8:	c2450513          	addi	a0,a0,-988 # ffffffffc020ecf8 <dev_node_ops+0x3c8>
ffffffffc02090dc:	bc2f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02090e0 <sfs_unmount>:
ffffffffc02090e0:	1141                	addi	sp,sp,-16
ffffffffc02090e2:	e406                	sd	ra,8(sp)
ffffffffc02090e4:	e022                	sd	s0,0(sp)
ffffffffc02090e6:	cd1d                	beqz	a0,ffffffffc0209124 <sfs_unmount+0x44>
ffffffffc02090e8:	0b052783          	lw	a5,176(a0)
ffffffffc02090ec:	842a                	mv	s0,a0
ffffffffc02090ee:	eb9d                	bnez	a5,ffffffffc0209124 <sfs_unmount+0x44>
ffffffffc02090f0:	7158                	ld	a4,160(a0)
ffffffffc02090f2:	09850793          	addi	a5,a0,152
ffffffffc02090f6:	02f71563          	bne	a4,a5,ffffffffc0209120 <sfs_unmount+0x40>
ffffffffc02090fa:	613c                	ld	a5,64(a0)
ffffffffc02090fc:	e7a1                	bnez	a5,ffffffffc0209144 <sfs_unmount+0x64>
ffffffffc02090fe:	7d08                	ld	a0,56(a0)
ffffffffc0209100:	f89ff0ef          	jal	ra,ffffffffc0209088 <bitmap_destroy>
ffffffffc0209104:	6428                	ld	a0,72(s0)
ffffffffc0209106:	f39f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020910a:	7448                	ld	a0,168(s0)
ffffffffc020910c:	f33f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209110:	8522                	mv	a0,s0
ffffffffc0209112:	f2df80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209116:	4501                	li	a0,0
ffffffffc0209118:	60a2                	ld	ra,8(sp)
ffffffffc020911a:	6402                	ld	s0,0(sp)
ffffffffc020911c:	0141                	addi	sp,sp,16
ffffffffc020911e:	8082                	ret
ffffffffc0209120:	5545                	li	a0,-15
ffffffffc0209122:	bfdd                	j	ffffffffc0209118 <sfs_unmount+0x38>
ffffffffc0209124:	00006697          	auipc	a3,0x6
ffffffffc0209128:	bec68693          	addi	a3,a3,-1044 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020912c:	00003617          	auipc	a2,0x3
ffffffffc0209130:	85460613          	addi	a2,a2,-1964 # ffffffffc020b980 <commands+0x210>
ffffffffc0209134:	04100593          	li	a1,65
ffffffffc0209138:	00006517          	auipc	a0,0x6
ffffffffc020913c:	c0850513          	addi	a0,a0,-1016 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc0209140:	b5ef70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209144:	00006697          	auipc	a3,0x6
ffffffffc0209148:	c1468693          	addi	a3,a3,-1004 # ffffffffc020ed58 <dev_node_ops+0x428>
ffffffffc020914c:	00003617          	auipc	a2,0x3
ffffffffc0209150:	83460613          	addi	a2,a2,-1996 # ffffffffc020b980 <commands+0x210>
ffffffffc0209154:	04500593          	li	a1,69
ffffffffc0209158:	00006517          	auipc	a0,0x6
ffffffffc020915c:	be850513          	addi	a0,a0,-1048 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc0209160:	b3ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209164 <sfs_cleanup>:
ffffffffc0209164:	1101                	addi	sp,sp,-32
ffffffffc0209166:	ec06                	sd	ra,24(sp)
ffffffffc0209168:	e822                	sd	s0,16(sp)
ffffffffc020916a:	e426                	sd	s1,8(sp)
ffffffffc020916c:	e04a                	sd	s2,0(sp)
ffffffffc020916e:	c525                	beqz	a0,ffffffffc02091d6 <sfs_cleanup+0x72>
ffffffffc0209170:	0b052783          	lw	a5,176(a0)
ffffffffc0209174:	84aa                	mv	s1,a0
ffffffffc0209176:	e3a5                	bnez	a5,ffffffffc02091d6 <sfs_cleanup+0x72>
ffffffffc0209178:	4158                	lw	a4,4(a0)
ffffffffc020917a:	4514                	lw	a3,8(a0)
ffffffffc020917c:	00c50913          	addi	s2,a0,12
ffffffffc0209180:	85ca                	mv	a1,s2
ffffffffc0209182:	40d7063b          	subw	a2,a4,a3
ffffffffc0209186:	00006517          	auipc	a0,0x6
ffffffffc020918a:	bea50513          	addi	a0,a0,-1046 # ffffffffc020ed70 <dev_node_ops+0x440>
ffffffffc020918e:	818f70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209192:	02000413          	li	s0,32
ffffffffc0209196:	a019                	j	ffffffffc020919c <sfs_cleanup+0x38>
ffffffffc0209198:	347d                	addiw	s0,s0,-1
ffffffffc020919a:	c819                	beqz	s0,ffffffffc02091b0 <sfs_cleanup+0x4c>
ffffffffc020919c:	7cdc                	ld	a5,184(s1)
ffffffffc020919e:	8526                	mv	a0,s1
ffffffffc02091a0:	9782                	jalr	a5
ffffffffc02091a2:	f97d                	bnez	a0,ffffffffc0209198 <sfs_cleanup+0x34>
ffffffffc02091a4:	60e2                	ld	ra,24(sp)
ffffffffc02091a6:	6442                	ld	s0,16(sp)
ffffffffc02091a8:	64a2                	ld	s1,8(sp)
ffffffffc02091aa:	6902                	ld	s2,0(sp)
ffffffffc02091ac:	6105                	addi	sp,sp,32
ffffffffc02091ae:	8082                	ret
ffffffffc02091b0:	6442                	ld	s0,16(sp)
ffffffffc02091b2:	60e2                	ld	ra,24(sp)
ffffffffc02091b4:	64a2                	ld	s1,8(sp)
ffffffffc02091b6:	86ca                	mv	a3,s2
ffffffffc02091b8:	6902                	ld	s2,0(sp)
ffffffffc02091ba:	872a                	mv	a4,a0
ffffffffc02091bc:	00006617          	auipc	a2,0x6
ffffffffc02091c0:	bd460613          	addi	a2,a2,-1068 # ffffffffc020ed90 <dev_node_ops+0x460>
ffffffffc02091c4:	05f00593          	li	a1,95
ffffffffc02091c8:	00006517          	auipc	a0,0x6
ffffffffc02091cc:	b7850513          	addi	a0,a0,-1160 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc02091d0:	6105                	addi	sp,sp,32
ffffffffc02091d2:	b34f706f          	j	ffffffffc0200506 <__warn>
ffffffffc02091d6:	00006697          	auipc	a3,0x6
ffffffffc02091da:	b3a68693          	addi	a3,a3,-1222 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc02091de:	00002617          	auipc	a2,0x2
ffffffffc02091e2:	7a260613          	addi	a2,a2,1954 # ffffffffc020b980 <commands+0x210>
ffffffffc02091e6:	05400593          	li	a1,84
ffffffffc02091ea:	00006517          	auipc	a0,0x6
ffffffffc02091ee:	b5650513          	addi	a0,a0,-1194 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc02091f2:	aacf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02091f6 <sfs_sync>:
ffffffffc02091f6:	7179                	addi	sp,sp,-48
ffffffffc02091f8:	f406                	sd	ra,40(sp)
ffffffffc02091fa:	f022                	sd	s0,32(sp)
ffffffffc02091fc:	ec26                	sd	s1,24(sp)
ffffffffc02091fe:	e84a                	sd	s2,16(sp)
ffffffffc0209200:	e44e                	sd	s3,8(sp)
ffffffffc0209202:	e052                	sd	s4,0(sp)
ffffffffc0209204:	cd4d                	beqz	a0,ffffffffc02092be <sfs_sync+0xc8>
ffffffffc0209206:	0b052783          	lw	a5,176(a0)
ffffffffc020920a:	8a2a                	mv	s4,a0
ffffffffc020920c:	ebcd                	bnez	a5,ffffffffc02092be <sfs_sync+0xc8>
ffffffffc020920e:	539010ef          	jal	ra,ffffffffc020af46 <lock_sfs_fs>
ffffffffc0209212:	0a0a3403          	ld	s0,160(s4)
ffffffffc0209216:	098a0913          	addi	s2,s4,152
ffffffffc020921a:	02890763          	beq	s2,s0,ffffffffc0209248 <sfs_sync+0x52>
ffffffffc020921e:	00004997          	auipc	s3,0x4
ffffffffc0209222:	0ea98993          	addi	s3,s3,234 # ffffffffc020d308 <default_pmm_manager+0xea0>
ffffffffc0209226:	7c1c                	ld	a5,56(s0)
ffffffffc0209228:	fc840493          	addi	s1,s0,-56
ffffffffc020922c:	cbb5                	beqz	a5,ffffffffc02092a0 <sfs_sync+0xaa>
ffffffffc020922e:	7b9c                	ld	a5,48(a5)
ffffffffc0209230:	cba5                	beqz	a5,ffffffffc02092a0 <sfs_sync+0xaa>
ffffffffc0209232:	85ce                	mv	a1,s3
ffffffffc0209234:	8526                	mv	a0,s1
ffffffffc0209236:	e28fe0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc020923a:	7c1c                	ld	a5,56(s0)
ffffffffc020923c:	8526                	mv	a0,s1
ffffffffc020923e:	7b9c                	ld	a5,48(a5)
ffffffffc0209240:	9782                	jalr	a5
ffffffffc0209242:	6400                	ld	s0,8(s0)
ffffffffc0209244:	fe8911e3          	bne	s2,s0,ffffffffc0209226 <sfs_sync+0x30>
ffffffffc0209248:	8552                	mv	a0,s4
ffffffffc020924a:	50d010ef          	jal	ra,ffffffffc020af56 <unlock_sfs_fs>
ffffffffc020924e:	040a3783          	ld	a5,64(s4)
ffffffffc0209252:	4501                	li	a0,0
ffffffffc0209254:	eb89                	bnez	a5,ffffffffc0209266 <sfs_sync+0x70>
ffffffffc0209256:	70a2                	ld	ra,40(sp)
ffffffffc0209258:	7402                	ld	s0,32(sp)
ffffffffc020925a:	64e2                	ld	s1,24(sp)
ffffffffc020925c:	6942                	ld	s2,16(sp)
ffffffffc020925e:	69a2                	ld	s3,8(sp)
ffffffffc0209260:	6a02                	ld	s4,0(sp)
ffffffffc0209262:	6145                	addi	sp,sp,48
ffffffffc0209264:	8082                	ret
ffffffffc0209266:	040a3023          	sd	zero,64(s4)
ffffffffc020926a:	8552                	mv	a0,s4
ffffffffc020926c:	3bf010ef          	jal	ra,ffffffffc020ae2a <sfs_sync_super>
ffffffffc0209270:	cd01                	beqz	a0,ffffffffc0209288 <sfs_sync+0x92>
ffffffffc0209272:	70a2                	ld	ra,40(sp)
ffffffffc0209274:	7402                	ld	s0,32(sp)
ffffffffc0209276:	4785                	li	a5,1
ffffffffc0209278:	04fa3023          	sd	a5,64(s4)
ffffffffc020927c:	64e2                	ld	s1,24(sp)
ffffffffc020927e:	6942                	ld	s2,16(sp)
ffffffffc0209280:	69a2                	ld	s3,8(sp)
ffffffffc0209282:	6a02                	ld	s4,0(sp)
ffffffffc0209284:	6145                	addi	sp,sp,48
ffffffffc0209286:	8082                	ret
ffffffffc0209288:	8552                	mv	a0,s4
ffffffffc020928a:	3e7010ef          	jal	ra,ffffffffc020ae70 <sfs_sync_freemap>
ffffffffc020928e:	f175                	bnez	a0,ffffffffc0209272 <sfs_sync+0x7c>
ffffffffc0209290:	70a2                	ld	ra,40(sp)
ffffffffc0209292:	7402                	ld	s0,32(sp)
ffffffffc0209294:	64e2                	ld	s1,24(sp)
ffffffffc0209296:	6942                	ld	s2,16(sp)
ffffffffc0209298:	69a2                	ld	s3,8(sp)
ffffffffc020929a:	6a02                	ld	s4,0(sp)
ffffffffc020929c:	6145                	addi	sp,sp,48
ffffffffc020929e:	8082                	ret
ffffffffc02092a0:	00004697          	auipc	a3,0x4
ffffffffc02092a4:	01868693          	addi	a3,a3,24 # ffffffffc020d2b8 <default_pmm_manager+0xe50>
ffffffffc02092a8:	00002617          	auipc	a2,0x2
ffffffffc02092ac:	6d860613          	addi	a2,a2,1752 # ffffffffc020b980 <commands+0x210>
ffffffffc02092b0:	45ed                	li	a1,27
ffffffffc02092b2:	00006517          	auipc	a0,0x6
ffffffffc02092b6:	a8e50513          	addi	a0,a0,-1394 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc02092ba:	9e4f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02092be:	00006697          	auipc	a3,0x6
ffffffffc02092c2:	a5268693          	addi	a3,a3,-1454 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc02092c6:	00002617          	auipc	a2,0x2
ffffffffc02092ca:	6ba60613          	addi	a2,a2,1722 # ffffffffc020b980 <commands+0x210>
ffffffffc02092ce:	45d5                	li	a1,21
ffffffffc02092d0:	00006517          	auipc	a0,0x6
ffffffffc02092d4:	a7050513          	addi	a0,a0,-1424 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc02092d8:	9c6f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02092dc <sfs_get_root>:
ffffffffc02092dc:	1101                	addi	sp,sp,-32
ffffffffc02092de:	ec06                	sd	ra,24(sp)
ffffffffc02092e0:	cd09                	beqz	a0,ffffffffc02092fa <sfs_get_root+0x1e>
ffffffffc02092e2:	0b052783          	lw	a5,176(a0)
ffffffffc02092e6:	eb91                	bnez	a5,ffffffffc02092fa <sfs_get_root+0x1e>
ffffffffc02092e8:	4605                	li	a2,1
ffffffffc02092ea:	002c                	addi	a1,sp,8
ffffffffc02092ec:	370010ef          	jal	ra,ffffffffc020a65c <sfs_load_inode>
ffffffffc02092f0:	e50d                	bnez	a0,ffffffffc020931a <sfs_get_root+0x3e>
ffffffffc02092f2:	60e2                	ld	ra,24(sp)
ffffffffc02092f4:	6522                	ld	a0,8(sp)
ffffffffc02092f6:	6105                	addi	sp,sp,32
ffffffffc02092f8:	8082                	ret
ffffffffc02092fa:	00006697          	auipc	a3,0x6
ffffffffc02092fe:	a1668693          	addi	a3,a3,-1514 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc0209302:	00002617          	auipc	a2,0x2
ffffffffc0209306:	67e60613          	addi	a2,a2,1662 # ffffffffc020b980 <commands+0x210>
ffffffffc020930a:	03600593          	li	a1,54
ffffffffc020930e:	00006517          	auipc	a0,0x6
ffffffffc0209312:	a3250513          	addi	a0,a0,-1486 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc0209316:	988f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020931a:	86aa                	mv	a3,a0
ffffffffc020931c:	00006617          	auipc	a2,0x6
ffffffffc0209320:	a9460613          	addi	a2,a2,-1388 # ffffffffc020edb0 <dev_node_ops+0x480>
ffffffffc0209324:	03700593          	li	a1,55
ffffffffc0209328:	00006517          	auipc	a0,0x6
ffffffffc020932c:	a1850513          	addi	a0,a0,-1512 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc0209330:	96ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209334 <sfs_do_mount>:
ffffffffc0209334:	6518                	ld	a4,8(a0)
ffffffffc0209336:	7171                	addi	sp,sp,-176
ffffffffc0209338:	f506                	sd	ra,168(sp)
ffffffffc020933a:	f122                	sd	s0,160(sp)
ffffffffc020933c:	ed26                	sd	s1,152(sp)
ffffffffc020933e:	e94a                	sd	s2,144(sp)
ffffffffc0209340:	e54e                	sd	s3,136(sp)
ffffffffc0209342:	e152                	sd	s4,128(sp)
ffffffffc0209344:	fcd6                	sd	s5,120(sp)
ffffffffc0209346:	f8da                	sd	s6,112(sp)
ffffffffc0209348:	f4de                	sd	s7,104(sp)
ffffffffc020934a:	f0e2                	sd	s8,96(sp)
ffffffffc020934c:	ece6                	sd	s9,88(sp)
ffffffffc020934e:	e8ea                	sd	s10,80(sp)
ffffffffc0209350:	e4ee                	sd	s11,72(sp)
ffffffffc0209352:	6785                	lui	a5,0x1
ffffffffc0209354:	24f71663          	bne	a4,a5,ffffffffc02095a0 <sfs_do_mount+0x26c>
ffffffffc0209358:	892a                	mv	s2,a0
ffffffffc020935a:	4501                	li	a0,0
ffffffffc020935c:	8aae                	mv	s5,a1
ffffffffc020935e:	f00fe0ef          	jal	ra,ffffffffc0207a5e <__alloc_fs>
ffffffffc0209362:	842a                	mv	s0,a0
ffffffffc0209364:	24050463          	beqz	a0,ffffffffc02095ac <sfs_do_mount+0x278>
ffffffffc0209368:	0b052b03          	lw	s6,176(a0)
ffffffffc020936c:	260b1263          	bnez	s6,ffffffffc02095d0 <sfs_do_mount+0x29c>
ffffffffc0209370:	03253823          	sd	s2,48(a0)
ffffffffc0209374:	6505                	lui	a0,0x1
ffffffffc0209376:	c19f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020937a:	e428                	sd	a0,72(s0)
ffffffffc020937c:	84aa                	mv	s1,a0
ffffffffc020937e:	16050363          	beqz	a0,ffffffffc02094e4 <sfs_do_mount+0x1b0>
ffffffffc0209382:	85aa                	mv	a1,a0
ffffffffc0209384:	4681                	li	a3,0
ffffffffc0209386:	6605                	lui	a2,0x1
ffffffffc0209388:	1008                	addi	a0,sp,32
ffffffffc020938a:	858fc0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc020938e:	02093783          	ld	a5,32(s2)
ffffffffc0209392:	85aa                	mv	a1,a0
ffffffffc0209394:	4601                	li	a2,0
ffffffffc0209396:	854a                	mv	a0,s2
ffffffffc0209398:	9782                	jalr	a5
ffffffffc020939a:	8a2a                	mv	s4,a0
ffffffffc020939c:	10051e63          	bnez	a0,ffffffffc02094b8 <sfs_do_mount+0x184>
ffffffffc02093a0:	408c                	lw	a1,0(s1)
ffffffffc02093a2:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc02093a6:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc02093aa:	14c59863          	bne	a1,a2,ffffffffc02094fa <sfs_do_mount+0x1c6>
ffffffffc02093ae:	40dc                	lw	a5,4(s1)
ffffffffc02093b0:	00093603          	ld	a2,0(s2)
ffffffffc02093b4:	02079713          	slli	a4,a5,0x20
ffffffffc02093b8:	9301                	srli	a4,a4,0x20
ffffffffc02093ba:	12e66763          	bltu	a2,a4,ffffffffc02094e8 <sfs_do_mount+0x1b4>
ffffffffc02093be:	020485a3          	sb	zero,43(s1)
ffffffffc02093c2:	0084af03          	lw	t5,8(s1)
ffffffffc02093c6:	00c4ae83          	lw	t4,12(s1)
ffffffffc02093ca:	0104ae03          	lw	t3,16(s1)
ffffffffc02093ce:	0144a303          	lw	t1,20(s1)
ffffffffc02093d2:	0184a883          	lw	a7,24(s1)
ffffffffc02093d6:	01c4a803          	lw	a6,28(s1)
ffffffffc02093da:	5090                	lw	a2,32(s1)
ffffffffc02093dc:	50d4                	lw	a3,36(s1)
ffffffffc02093de:	5498                	lw	a4,40(s1)
ffffffffc02093e0:	6511                	lui	a0,0x4
ffffffffc02093e2:	c00c                	sw	a1,0(s0)
ffffffffc02093e4:	c05c                	sw	a5,4(s0)
ffffffffc02093e6:	01e42423          	sw	t5,8(s0)
ffffffffc02093ea:	01d42623          	sw	t4,12(s0)
ffffffffc02093ee:	01c42823          	sw	t3,16(s0)
ffffffffc02093f2:	00642a23          	sw	t1,20(s0)
ffffffffc02093f6:	01142c23          	sw	a7,24(s0)
ffffffffc02093fa:	01042e23          	sw	a6,28(s0)
ffffffffc02093fe:	d010                	sw	a2,32(s0)
ffffffffc0209400:	d054                	sw	a3,36(s0)
ffffffffc0209402:	d418                	sw	a4,40(s0)
ffffffffc0209404:	b8bf80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0209408:	f448                	sd	a0,168(s0)
ffffffffc020940a:	8c2a                	mv	s8,a0
ffffffffc020940c:	18050c63          	beqz	a0,ffffffffc02095a4 <sfs_do_mount+0x270>
ffffffffc0209410:	6711                	lui	a4,0x4
ffffffffc0209412:	87aa                	mv	a5,a0
ffffffffc0209414:	972a                	add	a4,a4,a0
ffffffffc0209416:	e79c                	sd	a5,8(a5)
ffffffffc0209418:	e39c                	sd	a5,0(a5)
ffffffffc020941a:	07c1                	addi	a5,a5,16
ffffffffc020941c:	fee79de3          	bne	a5,a4,ffffffffc0209416 <sfs_do_mount+0xe2>
ffffffffc0209420:	0044eb83          	lwu	s7,4(s1)
ffffffffc0209424:	67a1                	lui	a5,0x8
ffffffffc0209426:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc020942a:	9bce                	add	s7,s7,s3
ffffffffc020942c:	77e1                	lui	a5,0xffff8
ffffffffc020942e:	00fbfbb3          	and	s7,s7,a5
ffffffffc0209432:	2b81                	sext.w	s7,s7
ffffffffc0209434:	855e                	mv	a0,s7
ffffffffc0209436:	a59ff0ef          	jal	ra,ffffffffc0208e8e <bitmap_create>
ffffffffc020943a:	fc08                	sd	a0,56(s0)
ffffffffc020943c:	8d2a                	mv	s10,a0
ffffffffc020943e:	14050f63          	beqz	a0,ffffffffc020959c <sfs_do_mount+0x268>
ffffffffc0209442:	0044e783          	lwu	a5,4(s1)
ffffffffc0209446:	082c                	addi	a1,sp,24
ffffffffc0209448:	97ce                	add	a5,a5,s3
ffffffffc020944a:	00f7d713          	srli	a4,a5,0xf
ffffffffc020944e:	e43a                	sd	a4,8(sp)
ffffffffc0209450:	40f7d993          	srai	s3,a5,0xf
ffffffffc0209454:	c4fff0ef          	jal	ra,ffffffffc02090a2 <bitmap_getdata>
ffffffffc0209458:	14050c63          	beqz	a0,ffffffffc02095b0 <sfs_do_mount+0x27c>
ffffffffc020945c:	00c9979b          	slliw	a5,s3,0xc
ffffffffc0209460:	66e2                	ld	a3,24(sp)
ffffffffc0209462:	1782                	slli	a5,a5,0x20
ffffffffc0209464:	9381                	srli	a5,a5,0x20
ffffffffc0209466:	14d79563          	bne	a5,a3,ffffffffc02095b0 <sfs_do_mount+0x27c>
ffffffffc020946a:	6722                	ld	a4,8(sp)
ffffffffc020946c:	6d89                	lui	s11,0x2
ffffffffc020946e:	89aa                	mv	s3,a0
ffffffffc0209470:	00c71c93          	slli	s9,a4,0xc
ffffffffc0209474:	9caa                	add	s9,s9,a0
ffffffffc0209476:	40ad8dbb          	subw	s11,s11,a0
ffffffffc020947a:	e711                	bnez	a4,ffffffffc0209486 <sfs_do_mount+0x152>
ffffffffc020947c:	a079                	j	ffffffffc020950a <sfs_do_mount+0x1d6>
ffffffffc020947e:	6785                	lui	a5,0x1
ffffffffc0209480:	99be                	add	s3,s3,a5
ffffffffc0209482:	093c8463          	beq	s9,s3,ffffffffc020950a <sfs_do_mount+0x1d6>
ffffffffc0209486:	013d86bb          	addw	a3,s11,s3
ffffffffc020948a:	1682                	slli	a3,a3,0x20
ffffffffc020948c:	6605                	lui	a2,0x1
ffffffffc020948e:	85ce                	mv	a1,s3
ffffffffc0209490:	9281                	srli	a3,a3,0x20
ffffffffc0209492:	1008                	addi	a0,sp,32
ffffffffc0209494:	f4ffb0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc0209498:	02093783          	ld	a5,32(s2)
ffffffffc020949c:	85aa                	mv	a1,a0
ffffffffc020949e:	4601                	li	a2,0
ffffffffc02094a0:	854a                	mv	a0,s2
ffffffffc02094a2:	9782                	jalr	a5
ffffffffc02094a4:	dd69                	beqz	a0,ffffffffc020947e <sfs_do_mount+0x14a>
ffffffffc02094a6:	e42a                	sd	a0,8(sp)
ffffffffc02094a8:	856a                	mv	a0,s10
ffffffffc02094aa:	bdfff0ef          	jal	ra,ffffffffc0209088 <bitmap_destroy>
ffffffffc02094ae:	67a2                	ld	a5,8(sp)
ffffffffc02094b0:	8a3e                	mv	s4,a5
ffffffffc02094b2:	8562                	mv	a0,s8
ffffffffc02094b4:	b8bf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02094b8:	8526                	mv	a0,s1
ffffffffc02094ba:	b85f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02094be:	8522                	mv	a0,s0
ffffffffc02094c0:	b7ff80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02094c4:	70aa                	ld	ra,168(sp)
ffffffffc02094c6:	740a                	ld	s0,160(sp)
ffffffffc02094c8:	64ea                	ld	s1,152(sp)
ffffffffc02094ca:	694a                	ld	s2,144(sp)
ffffffffc02094cc:	69aa                	ld	s3,136(sp)
ffffffffc02094ce:	7ae6                	ld	s5,120(sp)
ffffffffc02094d0:	7b46                	ld	s6,112(sp)
ffffffffc02094d2:	7ba6                	ld	s7,104(sp)
ffffffffc02094d4:	7c06                	ld	s8,96(sp)
ffffffffc02094d6:	6ce6                	ld	s9,88(sp)
ffffffffc02094d8:	6d46                	ld	s10,80(sp)
ffffffffc02094da:	6da6                	ld	s11,72(sp)
ffffffffc02094dc:	8552                	mv	a0,s4
ffffffffc02094de:	6a0a                	ld	s4,128(sp)
ffffffffc02094e0:	614d                	addi	sp,sp,176
ffffffffc02094e2:	8082                	ret
ffffffffc02094e4:	5a71                	li	s4,-4
ffffffffc02094e6:	bfe1                	j	ffffffffc02094be <sfs_do_mount+0x18a>
ffffffffc02094e8:	85be                	mv	a1,a5
ffffffffc02094ea:	00006517          	auipc	a0,0x6
ffffffffc02094ee:	91e50513          	addi	a0,a0,-1762 # ffffffffc020ee08 <dev_node_ops+0x4d8>
ffffffffc02094f2:	cb5f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02094f6:	5a75                	li	s4,-3
ffffffffc02094f8:	b7c1                	j	ffffffffc02094b8 <sfs_do_mount+0x184>
ffffffffc02094fa:	00006517          	auipc	a0,0x6
ffffffffc02094fe:	8d650513          	addi	a0,a0,-1834 # ffffffffc020edd0 <dev_node_ops+0x4a0>
ffffffffc0209502:	ca5f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209506:	5a75                	li	s4,-3
ffffffffc0209508:	bf45                	j	ffffffffc02094b8 <sfs_do_mount+0x184>
ffffffffc020950a:	00442903          	lw	s2,4(s0)
ffffffffc020950e:	4481                	li	s1,0
ffffffffc0209510:	080b8c63          	beqz	s7,ffffffffc02095a8 <sfs_do_mount+0x274>
ffffffffc0209514:	85a6                	mv	a1,s1
ffffffffc0209516:	856a                	mv	a0,s10
ffffffffc0209518:	af7ff0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc020951c:	c111                	beqz	a0,ffffffffc0209520 <sfs_do_mount+0x1ec>
ffffffffc020951e:	2b05                	addiw	s6,s6,1
ffffffffc0209520:	2485                	addiw	s1,s1,1
ffffffffc0209522:	fe9b99e3          	bne	s7,s1,ffffffffc0209514 <sfs_do_mount+0x1e0>
ffffffffc0209526:	441c                	lw	a5,8(s0)
ffffffffc0209528:	0d679463          	bne	a5,s6,ffffffffc02095f0 <sfs_do_mount+0x2bc>
ffffffffc020952c:	4585                	li	a1,1
ffffffffc020952e:	05040513          	addi	a0,s0,80
ffffffffc0209532:	04043023          	sd	zero,64(s0)
ffffffffc0209536:	824fb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020953a:	4585                	li	a1,1
ffffffffc020953c:	06840513          	addi	a0,s0,104
ffffffffc0209540:	81afb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc0209544:	4585                	li	a1,1
ffffffffc0209546:	08040513          	addi	a0,s0,128
ffffffffc020954a:	810fb0ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020954e:	09840793          	addi	a5,s0,152
ffffffffc0209552:	f05c                	sd	a5,160(s0)
ffffffffc0209554:	ec5c                	sd	a5,152(s0)
ffffffffc0209556:	874a                	mv	a4,s2
ffffffffc0209558:	86da                	mv	a3,s6
ffffffffc020955a:	4169063b          	subw	a2,s2,s6
ffffffffc020955e:	00c40593          	addi	a1,s0,12
ffffffffc0209562:	00006517          	auipc	a0,0x6
ffffffffc0209566:	93650513          	addi	a0,a0,-1738 # ffffffffc020ee98 <dev_node_ops+0x568>
ffffffffc020956a:	c3df60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020956e:	00000797          	auipc	a5,0x0
ffffffffc0209572:	c8878793          	addi	a5,a5,-888 # ffffffffc02091f6 <sfs_sync>
ffffffffc0209576:	fc5c                	sd	a5,184(s0)
ffffffffc0209578:	00000797          	auipc	a5,0x0
ffffffffc020957c:	d6478793          	addi	a5,a5,-668 # ffffffffc02092dc <sfs_get_root>
ffffffffc0209580:	e07c                	sd	a5,192(s0)
ffffffffc0209582:	00000797          	auipc	a5,0x0
ffffffffc0209586:	b5e78793          	addi	a5,a5,-1186 # ffffffffc02090e0 <sfs_unmount>
ffffffffc020958a:	e47c                	sd	a5,200(s0)
ffffffffc020958c:	00000797          	auipc	a5,0x0
ffffffffc0209590:	bd878793          	addi	a5,a5,-1064 # ffffffffc0209164 <sfs_cleanup>
ffffffffc0209594:	e87c                	sd	a5,208(s0)
ffffffffc0209596:	008ab023          	sd	s0,0(s5)
ffffffffc020959a:	b72d                	j	ffffffffc02094c4 <sfs_do_mount+0x190>
ffffffffc020959c:	5a71                	li	s4,-4
ffffffffc020959e:	bf11                	j	ffffffffc02094b2 <sfs_do_mount+0x17e>
ffffffffc02095a0:	5a49                	li	s4,-14
ffffffffc02095a2:	b70d                	j	ffffffffc02094c4 <sfs_do_mount+0x190>
ffffffffc02095a4:	5a71                	li	s4,-4
ffffffffc02095a6:	bf09                	j	ffffffffc02094b8 <sfs_do_mount+0x184>
ffffffffc02095a8:	4b01                	li	s6,0
ffffffffc02095aa:	bfb5                	j	ffffffffc0209526 <sfs_do_mount+0x1f2>
ffffffffc02095ac:	5a71                	li	s4,-4
ffffffffc02095ae:	bf19                	j	ffffffffc02094c4 <sfs_do_mount+0x190>
ffffffffc02095b0:	00006697          	auipc	a3,0x6
ffffffffc02095b4:	88868693          	addi	a3,a3,-1912 # ffffffffc020ee38 <dev_node_ops+0x508>
ffffffffc02095b8:	00002617          	auipc	a2,0x2
ffffffffc02095bc:	3c860613          	addi	a2,a2,968 # ffffffffc020b980 <commands+0x210>
ffffffffc02095c0:	08300593          	li	a1,131
ffffffffc02095c4:	00005517          	auipc	a0,0x5
ffffffffc02095c8:	77c50513          	addi	a0,a0,1916 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc02095cc:	ed3f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02095d0:	00005697          	auipc	a3,0x5
ffffffffc02095d4:	74068693          	addi	a3,a3,1856 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc02095d8:	00002617          	auipc	a2,0x2
ffffffffc02095dc:	3a860613          	addi	a2,a2,936 # ffffffffc020b980 <commands+0x210>
ffffffffc02095e0:	0a300593          	li	a1,163
ffffffffc02095e4:	00005517          	auipc	a0,0x5
ffffffffc02095e8:	75c50513          	addi	a0,a0,1884 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc02095ec:	eb3f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02095f0:	00006697          	auipc	a3,0x6
ffffffffc02095f4:	87868693          	addi	a3,a3,-1928 # ffffffffc020ee68 <dev_node_ops+0x538>
ffffffffc02095f8:	00002617          	auipc	a2,0x2
ffffffffc02095fc:	38860613          	addi	a2,a2,904 # ffffffffc020b980 <commands+0x210>
ffffffffc0209600:	0e000593          	li	a1,224
ffffffffc0209604:	00005517          	auipc	a0,0x5
ffffffffc0209608:	73c50513          	addi	a0,a0,1852 # ffffffffc020ed40 <dev_node_ops+0x410>
ffffffffc020960c:	e93f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209610 <sfs_mount>:
ffffffffc0209610:	00000597          	auipc	a1,0x0
ffffffffc0209614:	d2458593          	addi	a1,a1,-732 # ffffffffc0209334 <sfs_do_mount>
ffffffffc0209618:	817fe06f          	j	ffffffffc0207e2e <vfs_mount>

ffffffffc020961c <sfs_opendir>:
ffffffffc020961c:	0235f593          	andi	a1,a1,35
ffffffffc0209620:	4501                	li	a0,0
ffffffffc0209622:	e191                	bnez	a1,ffffffffc0209626 <sfs_opendir+0xa>
ffffffffc0209624:	8082                	ret
ffffffffc0209626:	553d                	li	a0,-17
ffffffffc0209628:	8082                	ret

ffffffffc020962a <sfs_openfile>:
ffffffffc020962a:	4501                	li	a0,0
ffffffffc020962c:	8082                	ret

ffffffffc020962e <sfs_gettype>:
ffffffffc020962e:	1141                	addi	sp,sp,-16
ffffffffc0209630:	e406                	sd	ra,8(sp)
ffffffffc0209632:	c939                	beqz	a0,ffffffffc0209688 <sfs_gettype+0x5a>
ffffffffc0209634:	4d34                	lw	a3,88(a0)
ffffffffc0209636:	6785                	lui	a5,0x1
ffffffffc0209638:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020963c:	04e69663          	bne	a3,a4,ffffffffc0209688 <sfs_gettype+0x5a>
ffffffffc0209640:	6114                	ld	a3,0(a0)
ffffffffc0209642:	4709                	li	a4,2
ffffffffc0209644:	0046d683          	lhu	a3,4(a3)
ffffffffc0209648:	02e68a63          	beq	a3,a4,ffffffffc020967c <sfs_gettype+0x4e>
ffffffffc020964c:	470d                	li	a4,3
ffffffffc020964e:	02e68163          	beq	a3,a4,ffffffffc0209670 <sfs_gettype+0x42>
ffffffffc0209652:	4705                	li	a4,1
ffffffffc0209654:	00e68f63          	beq	a3,a4,ffffffffc0209672 <sfs_gettype+0x44>
ffffffffc0209658:	00006617          	auipc	a2,0x6
ffffffffc020965c:	8b060613          	addi	a2,a2,-1872 # ffffffffc020ef08 <dev_node_ops+0x5d8>
ffffffffc0209660:	38e00593          	li	a1,910
ffffffffc0209664:	00006517          	auipc	a0,0x6
ffffffffc0209668:	88c50513          	addi	a0,a0,-1908 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020966c:	e33f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209670:	678d                	lui	a5,0x3
ffffffffc0209672:	60a2                	ld	ra,8(sp)
ffffffffc0209674:	c19c                	sw	a5,0(a1)
ffffffffc0209676:	4501                	li	a0,0
ffffffffc0209678:	0141                	addi	sp,sp,16
ffffffffc020967a:	8082                	ret
ffffffffc020967c:	60a2                	ld	ra,8(sp)
ffffffffc020967e:	6789                	lui	a5,0x2
ffffffffc0209680:	c19c                	sw	a5,0(a1)
ffffffffc0209682:	4501                	li	a0,0
ffffffffc0209684:	0141                	addi	sp,sp,16
ffffffffc0209686:	8082                	ret
ffffffffc0209688:	00006697          	auipc	a3,0x6
ffffffffc020968c:	83068693          	addi	a3,a3,-2000 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc0209690:	00002617          	auipc	a2,0x2
ffffffffc0209694:	2f060613          	addi	a2,a2,752 # ffffffffc020b980 <commands+0x210>
ffffffffc0209698:	38200593          	li	a1,898
ffffffffc020969c:	00006517          	auipc	a0,0x6
ffffffffc02096a0:	85450513          	addi	a0,a0,-1964 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc02096a4:	dfbf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096a8 <sfs_fsync>:
ffffffffc02096a8:	7179                	addi	sp,sp,-48
ffffffffc02096aa:	ec26                	sd	s1,24(sp)
ffffffffc02096ac:	7524                	ld	s1,104(a0)
ffffffffc02096ae:	f406                	sd	ra,40(sp)
ffffffffc02096b0:	f022                	sd	s0,32(sp)
ffffffffc02096b2:	e84a                	sd	s2,16(sp)
ffffffffc02096b4:	e44e                	sd	s3,8(sp)
ffffffffc02096b6:	c4bd                	beqz	s1,ffffffffc0209724 <sfs_fsync+0x7c>
ffffffffc02096b8:	0b04a783          	lw	a5,176(s1)
ffffffffc02096bc:	e7a5                	bnez	a5,ffffffffc0209724 <sfs_fsync+0x7c>
ffffffffc02096be:	4d38                	lw	a4,88(a0)
ffffffffc02096c0:	6785                	lui	a5,0x1
ffffffffc02096c2:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02096c6:	842a                	mv	s0,a0
ffffffffc02096c8:	06f71e63          	bne	a4,a5,ffffffffc0209744 <sfs_fsync+0x9c>
ffffffffc02096cc:	691c                	ld	a5,16(a0)
ffffffffc02096ce:	4901                	li	s2,0
ffffffffc02096d0:	eb89                	bnez	a5,ffffffffc02096e2 <sfs_fsync+0x3a>
ffffffffc02096d2:	70a2                	ld	ra,40(sp)
ffffffffc02096d4:	7402                	ld	s0,32(sp)
ffffffffc02096d6:	64e2                	ld	s1,24(sp)
ffffffffc02096d8:	69a2                	ld	s3,8(sp)
ffffffffc02096da:	854a                	mv	a0,s2
ffffffffc02096dc:	6942                	ld	s2,16(sp)
ffffffffc02096de:	6145                	addi	sp,sp,48
ffffffffc02096e0:	8082                	ret
ffffffffc02096e2:	02050993          	addi	s3,a0,32
ffffffffc02096e6:	854e                	mv	a0,s3
ffffffffc02096e8:	e7dfa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc02096ec:	681c                	ld	a5,16(s0)
ffffffffc02096ee:	ef81                	bnez	a5,ffffffffc0209706 <sfs_fsync+0x5e>
ffffffffc02096f0:	854e                	mv	a0,s3
ffffffffc02096f2:	e6ffa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc02096f6:	70a2                	ld	ra,40(sp)
ffffffffc02096f8:	7402                	ld	s0,32(sp)
ffffffffc02096fa:	64e2                	ld	s1,24(sp)
ffffffffc02096fc:	69a2                	ld	s3,8(sp)
ffffffffc02096fe:	854a                	mv	a0,s2
ffffffffc0209700:	6942                	ld	s2,16(sp)
ffffffffc0209702:	6145                	addi	sp,sp,48
ffffffffc0209704:	8082                	ret
ffffffffc0209706:	4414                	lw	a3,8(s0)
ffffffffc0209708:	600c                	ld	a1,0(s0)
ffffffffc020970a:	00043823          	sd	zero,16(s0)
ffffffffc020970e:	4701                	li	a4,0
ffffffffc0209710:	04000613          	li	a2,64
ffffffffc0209714:	8526                	mv	a0,s1
ffffffffc0209716:	680010ef          	jal	ra,ffffffffc020ad96 <sfs_wbuf>
ffffffffc020971a:	892a                	mv	s2,a0
ffffffffc020971c:	d971                	beqz	a0,ffffffffc02096f0 <sfs_fsync+0x48>
ffffffffc020971e:	4785                	li	a5,1
ffffffffc0209720:	e81c                	sd	a5,16(s0)
ffffffffc0209722:	b7f9                	j	ffffffffc02096f0 <sfs_fsync+0x48>
ffffffffc0209724:	00005697          	auipc	a3,0x5
ffffffffc0209728:	5ec68693          	addi	a3,a3,1516 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020972c:	00002617          	auipc	a2,0x2
ffffffffc0209730:	25460613          	addi	a2,a2,596 # ffffffffc020b980 <commands+0x210>
ffffffffc0209734:	2c600593          	li	a1,710
ffffffffc0209738:	00005517          	auipc	a0,0x5
ffffffffc020973c:	7b850513          	addi	a0,a0,1976 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209740:	d5ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209744:	00005697          	auipc	a3,0x5
ffffffffc0209748:	77468693          	addi	a3,a3,1908 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020974c:	00002617          	auipc	a2,0x2
ffffffffc0209750:	23460613          	addi	a2,a2,564 # ffffffffc020b980 <commands+0x210>
ffffffffc0209754:	2c700593          	li	a1,711
ffffffffc0209758:	00005517          	auipc	a0,0x5
ffffffffc020975c:	79850513          	addi	a0,a0,1944 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209760:	d3ff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209764 <sfs_fstat>:
ffffffffc0209764:	1101                	addi	sp,sp,-32
ffffffffc0209766:	e426                	sd	s1,8(sp)
ffffffffc0209768:	84ae                	mv	s1,a1
ffffffffc020976a:	e822                	sd	s0,16(sp)
ffffffffc020976c:	02000613          	li	a2,32
ffffffffc0209770:	842a                	mv	s0,a0
ffffffffc0209772:	4581                	li	a1,0
ffffffffc0209774:	8526                	mv	a0,s1
ffffffffc0209776:	ec06                	sd	ra,24(sp)
ffffffffc0209778:	523010ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc020977c:	c439                	beqz	s0,ffffffffc02097ca <sfs_fstat+0x66>
ffffffffc020977e:	783c                	ld	a5,112(s0)
ffffffffc0209780:	c7a9                	beqz	a5,ffffffffc02097ca <sfs_fstat+0x66>
ffffffffc0209782:	6bbc                	ld	a5,80(a5)
ffffffffc0209784:	c3b9                	beqz	a5,ffffffffc02097ca <sfs_fstat+0x66>
ffffffffc0209786:	00005597          	auipc	a1,0x5
ffffffffc020978a:	12258593          	addi	a1,a1,290 # ffffffffc020e8a8 <syscalls+0xdb0>
ffffffffc020978e:	8522                	mv	a0,s0
ffffffffc0209790:	8cefe0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0209794:	783c                	ld	a5,112(s0)
ffffffffc0209796:	85a6                	mv	a1,s1
ffffffffc0209798:	8522                	mv	a0,s0
ffffffffc020979a:	6bbc                	ld	a5,80(a5)
ffffffffc020979c:	9782                	jalr	a5
ffffffffc020979e:	e10d                	bnez	a0,ffffffffc02097c0 <sfs_fstat+0x5c>
ffffffffc02097a0:	4c38                	lw	a4,88(s0)
ffffffffc02097a2:	6785                	lui	a5,0x1
ffffffffc02097a4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02097a8:	04f71163          	bne	a4,a5,ffffffffc02097ea <sfs_fstat+0x86>
ffffffffc02097ac:	601c                	ld	a5,0(s0)
ffffffffc02097ae:	0067d683          	lhu	a3,6(a5)
ffffffffc02097b2:	0087e703          	lwu	a4,8(a5)
ffffffffc02097b6:	0007e783          	lwu	a5,0(a5)
ffffffffc02097ba:	e494                	sd	a3,8(s1)
ffffffffc02097bc:	e898                	sd	a4,16(s1)
ffffffffc02097be:	ec9c                	sd	a5,24(s1)
ffffffffc02097c0:	60e2                	ld	ra,24(sp)
ffffffffc02097c2:	6442                	ld	s0,16(sp)
ffffffffc02097c4:	64a2                	ld	s1,8(sp)
ffffffffc02097c6:	6105                	addi	sp,sp,32
ffffffffc02097c8:	8082                	ret
ffffffffc02097ca:	00005697          	auipc	a3,0x5
ffffffffc02097ce:	07668693          	addi	a3,a3,118 # ffffffffc020e840 <syscalls+0xd48>
ffffffffc02097d2:	00002617          	auipc	a2,0x2
ffffffffc02097d6:	1ae60613          	addi	a2,a2,430 # ffffffffc020b980 <commands+0x210>
ffffffffc02097da:	2b700593          	li	a1,695
ffffffffc02097de:	00005517          	auipc	a0,0x5
ffffffffc02097e2:	71250513          	addi	a0,a0,1810 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc02097e6:	cb9f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02097ea:	00005697          	auipc	a3,0x5
ffffffffc02097ee:	6ce68693          	addi	a3,a3,1742 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc02097f2:	00002617          	auipc	a2,0x2
ffffffffc02097f6:	18e60613          	addi	a2,a2,398 # ffffffffc020b980 <commands+0x210>
ffffffffc02097fa:	2ba00593          	li	a1,698
ffffffffc02097fe:	00005517          	auipc	a0,0x5
ffffffffc0209802:	6f250513          	addi	a0,a0,1778 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209806:	c99f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020980a <sfs_tryseek>:
ffffffffc020980a:	080007b7          	lui	a5,0x8000
ffffffffc020980e:	04f5fd63          	bgeu	a1,a5,ffffffffc0209868 <sfs_tryseek+0x5e>
ffffffffc0209812:	1101                	addi	sp,sp,-32
ffffffffc0209814:	e822                	sd	s0,16(sp)
ffffffffc0209816:	ec06                	sd	ra,24(sp)
ffffffffc0209818:	e426                	sd	s1,8(sp)
ffffffffc020981a:	842a                	mv	s0,a0
ffffffffc020981c:	c921                	beqz	a0,ffffffffc020986c <sfs_tryseek+0x62>
ffffffffc020981e:	4d38                	lw	a4,88(a0)
ffffffffc0209820:	6785                	lui	a5,0x1
ffffffffc0209822:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209826:	04f71363          	bne	a4,a5,ffffffffc020986c <sfs_tryseek+0x62>
ffffffffc020982a:	611c                	ld	a5,0(a0)
ffffffffc020982c:	84ae                	mv	s1,a1
ffffffffc020982e:	0007e783          	lwu	a5,0(a5)
ffffffffc0209832:	02b7d563          	bge	a5,a1,ffffffffc020985c <sfs_tryseek+0x52>
ffffffffc0209836:	793c                	ld	a5,112(a0)
ffffffffc0209838:	cbb1                	beqz	a5,ffffffffc020988c <sfs_tryseek+0x82>
ffffffffc020983a:	73bc                	ld	a5,96(a5)
ffffffffc020983c:	cba1                	beqz	a5,ffffffffc020988c <sfs_tryseek+0x82>
ffffffffc020983e:	00005597          	auipc	a1,0x5
ffffffffc0209842:	f5a58593          	addi	a1,a1,-166 # ffffffffc020e798 <syscalls+0xca0>
ffffffffc0209846:	818fe0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc020984a:	783c                	ld	a5,112(s0)
ffffffffc020984c:	8522                	mv	a0,s0
ffffffffc020984e:	6442                	ld	s0,16(sp)
ffffffffc0209850:	60e2                	ld	ra,24(sp)
ffffffffc0209852:	73bc                	ld	a5,96(a5)
ffffffffc0209854:	85a6                	mv	a1,s1
ffffffffc0209856:	64a2                	ld	s1,8(sp)
ffffffffc0209858:	6105                	addi	sp,sp,32
ffffffffc020985a:	8782                	jr	a5
ffffffffc020985c:	60e2                	ld	ra,24(sp)
ffffffffc020985e:	6442                	ld	s0,16(sp)
ffffffffc0209860:	64a2                	ld	s1,8(sp)
ffffffffc0209862:	4501                	li	a0,0
ffffffffc0209864:	6105                	addi	sp,sp,32
ffffffffc0209866:	8082                	ret
ffffffffc0209868:	5575                	li	a0,-3
ffffffffc020986a:	8082                	ret
ffffffffc020986c:	00005697          	auipc	a3,0x5
ffffffffc0209870:	64c68693          	addi	a3,a3,1612 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc0209874:	00002617          	auipc	a2,0x2
ffffffffc0209878:	10c60613          	addi	a2,a2,268 # ffffffffc020b980 <commands+0x210>
ffffffffc020987c:	39900593          	li	a1,921
ffffffffc0209880:	00005517          	auipc	a0,0x5
ffffffffc0209884:	67050513          	addi	a0,a0,1648 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209888:	c17f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020988c:	00005697          	auipc	a3,0x5
ffffffffc0209890:	eb468693          	addi	a3,a3,-332 # ffffffffc020e740 <syscalls+0xc48>
ffffffffc0209894:	00002617          	auipc	a2,0x2
ffffffffc0209898:	0ec60613          	addi	a2,a2,236 # ffffffffc020b980 <commands+0x210>
ffffffffc020989c:	39b00593          	li	a1,923
ffffffffc02098a0:	00005517          	auipc	a0,0x5
ffffffffc02098a4:	65050513          	addi	a0,a0,1616 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc02098a8:	bf7f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098ac <sfs_close>:
ffffffffc02098ac:	1141                	addi	sp,sp,-16
ffffffffc02098ae:	e406                	sd	ra,8(sp)
ffffffffc02098b0:	e022                	sd	s0,0(sp)
ffffffffc02098b2:	c11d                	beqz	a0,ffffffffc02098d8 <sfs_close+0x2c>
ffffffffc02098b4:	793c                	ld	a5,112(a0)
ffffffffc02098b6:	842a                	mv	s0,a0
ffffffffc02098b8:	c385                	beqz	a5,ffffffffc02098d8 <sfs_close+0x2c>
ffffffffc02098ba:	7b9c                	ld	a5,48(a5)
ffffffffc02098bc:	cf91                	beqz	a5,ffffffffc02098d8 <sfs_close+0x2c>
ffffffffc02098be:	00004597          	auipc	a1,0x4
ffffffffc02098c2:	a4a58593          	addi	a1,a1,-1462 # ffffffffc020d308 <default_pmm_manager+0xea0>
ffffffffc02098c6:	f99fd0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc02098ca:	783c                	ld	a5,112(s0)
ffffffffc02098cc:	8522                	mv	a0,s0
ffffffffc02098ce:	6402                	ld	s0,0(sp)
ffffffffc02098d0:	60a2                	ld	ra,8(sp)
ffffffffc02098d2:	7b9c                	ld	a5,48(a5)
ffffffffc02098d4:	0141                	addi	sp,sp,16
ffffffffc02098d6:	8782                	jr	a5
ffffffffc02098d8:	00004697          	auipc	a3,0x4
ffffffffc02098dc:	9e068693          	addi	a3,a3,-1568 # ffffffffc020d2b8 <default_pmm_manager+0xe50>
ffffffffc02098e0:	00002617          	auipc	a2,0x2
ffffffffc02098e4:	0a060613          	addi	a2,a2,160 # ffffffffc020b980 <commands+0x210>
ffffffffc02098e8:	21c00593          	li	a1,540
ffffffffc02098ec:	00005517          	auipc	a0,0x5
ffffffffc02098f0:	60450513          	addi	a0,a0,1540 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc02098f4:	babf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02098f8 <sfs_io.part.0>:
ffffffffc02098f8:	1141                	addi	sp,sp,-16
ffffffffc02098fa:	00005697          	auipc	a3,0x5
ffffffffc02098fe:	5be68693          	addi	a3,a3,1470 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc0209902:	00002617          	auipc	a2,0x2
ffffffffc0209906:	07e60613          	addi	a2,a2,126 # ffffffffc020b980 <commands+0x210>
ffffffffc020990a:	29600593          	li	a1,662
ffffffffc020990e:	00005517          	auipc	a0,0x5
ffffffffc0209912:	5e250513          	addi	a0,a0,1506 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209916:	e406                	sd	ra,8(sp)
ffffffffc0209918:	b87f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020991c <sfs_block_free>:
ffffffffc020991c:	1101                	addi	sp,sp,-32
ffffffffc020991e:	e426                	sd	s1,8(sp)
ffffffffc0209920:	ec06                	sd	ra,24(sp)
ffffffffc0209922:	e822                	sd	s0,16(sp)
ffffffffc0209924:	4154                	lw	a3,4(a0)
ffffffffc0209926:	84ae                	mv	s1,a1
ffffffffc0209928:	c595                	beqz	a1,ffffffffc0209954 <sfs_block_free+0x38>
ffffffffc020992a:	02d5f563          	bgeu	a1,a3,ffffffffc0209954 <sfs_block_free+0x38>
ffffffffc020992e:	842a                	mv	s0,a0
ffffffffc0209930:	7d08                	ld	a0,56(a0)
ffffffffc0209932:	edcff0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc0209936:	ed05                	bnez	a0,ffffffffc020996e <sfs_block_free+0x52>
ffffffffc0209938:	7c08                	ld	a0,56(s0)
ffffffffc020993a:	85a6                	mv	a1,s1
ffffffffc020993c:	efaff0ef          	jal	ra,ffffffffc0209036 <bitmap_free>
ffffffffc0209940:	441c                	lw	a5,8(s0)
ffffffffc0209942:	4705                	li	a4,1
ffffffffc0209944:	60e2                	ld	ra,24(sp)
ffffffffc0209946:	2785                	addiw	a5,a5,1
ffffffffc0209948:	e038                	sd	a4,64(s0)
ffffffffc020994a:	c41c                	sw	a5,8(s0)
ffffffffc020994c:	6442                	ld	s0,16(sp)
ffffffffc020994e:	64a2                	ld	s1,8(sp)
ffffffffc0209950:	6105                	addi	sp,sp,32
ffffffffc0209952:	8082                	ret
ffffffffc0209954:	8726                	mv	a4,s1
ffffffffc0209956:	00005617          	auipc	a2,0x5
ffffffffc020995a:	5ca60613          	addi	a2,a2,1482 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc020995e:	05300593          	li	a1,83
ffffffffc0209962:	00005517          	auipc	a0,0x5
ffffffffc0209966:	58e50513          	addi	a0,a0,1422 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020996a:	b35f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020996e:	00005697          	auipc	a3,0x5
ffffffffc0209972:	5ea68693          	addi	a3,a3,1514 # ffffffffc020ef58 <dev_node_ops+0x628>
ffffffffc0209976:	00002617          	auipc	a2,0x2
ffffffffc020997a:	00a60613          	addi	a2,a2,10 # ffffffffc020b980 <commands+0x210>
ffffffffc020997e:	06a00593          	li	a1,106
ffffffffc0209982:	00005517          	auipc	a0,0x5
ffffffffc0209986:	56e50513          	addi	a0,a0,1390 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020998a:	b15f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020998e <sfs_reclaim>:
ffffffffc020998e:	1101                	addi	sp,sp,-32
ffffffffc0209990:	e426                	sd	s1,8(sp)
ffffffffc0209992:	7524                	ld	s1,104(a0)
ffffffffc0209994:	ec06                	sd	ra,24(sp)
ffffffffc0209996:	e822                	sd	s0,16(sp)
ffffffffc0209998:	e04a                	sd	s2,0(sp)
ffffffffc020999a:	0e048a63          	beqz	s1,ffffffffc0209a8e <sfs_reclaim+0x100>
ffffffffc020999e:	0b04a783          	lw	a5,176(s1)
ffffffffc02099a2:	0e079663          	bnez	a5,ffffffffc0209a8e <sfs_reclaim+0x100>
ffffffffc02099a6:	4d38                	lw	a4,88(a0)
ffffffffc02099a8:	6785                	lui	a5,0x1
ffffffffc02099aa:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02099ae:	842a                	mv	s0,a0
ffffffffc02099b0:	10f71f63          	bne	a4,a5,ffffffffc0209ace <sfs_reclaim+0x140>
ffffffffc02099b4:	8526                	mv	a0,s1
ffffffffc02099b6:	590010ef          	jal	ra,ffffffffc020af46 <lock_sfs_fs>
ffffffffc02099ba:	4c1c                	lw	a5,24(s0)
ffffffffc02099bc:	0ef05963          	blez	a5,ffffffffc0209aae <sfs_reclaim+0x120>
ffffffffc02099c0:	fff7871b          	addiw	a4,a5,-1
ffffffffc02099c4:	cc18                	sw	a4,24(s0)
ffffffffc02099c6:	eb59                	bnez	a4,ffffffffc0209a5c <sfs_reclaim+0xce>
ffffffffc02099c8:	05c42903          	lw	s2,92(s0)
ffffffffc02099cc:	08091863          	bnez	s2,ffffffffc0209a5c <sfs_reclaim+0xce>
ffffffffc02099d0:	601c                	ld	a5,0(s0)
ffffffffc02099d2:	0067d783          	lhu	a5,6(a5)
ffffffffc02099d6:	e785                	bnez	a5,ffffffffc02099fe <sfs_reclaim+0x70>
ffffffffc02099d8:	783c                	ld	a5,112(s0)
ffffffffc02099da:	10078a63          	beqz	a5,ffffffffc0209aee <sfs_reclaim+0x160>
ffffffffc02099de:	73bc                	ld	a5,96(a5)
ffffffffc02099e0:	10078763          	beqz	a5,ffffffffc0209aee <sfs_reclaim+0x160>
ffffffffc02099e4:	00005597          	auipc	a1,0x5
ffffffffc02099e8:	db458593          	addi	a1,a1,-588 # ffffffffc020e798 <syscalls+0xca0>
ffffffffc02099ec:	8522                	mv	a0,s0
ffffffffc02099ee:	e71fd0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc02099f2:	783c                	ld	a5,112(s0)
ffffffffc02099f4:	4581                	li	a1,0
ffffffffc02099f6:	8522                	mv	a0,s0
ffffffffc02099f8:	73bc                	ld	a5,96(a5)
ffffffffc02099fa:	9782                	jalr	a5
ffffffffc02099fc:	e559                	bnez	a0,ffffffffc0209a8a <sfs_reclaim+0xfc>
ffffffffc02099fe:	681c                	ld	a5,16(s0)
ffffffffc0209a00:	c39d                	beqz	a5,ffffffffc0209a26 <sfs_reclaim+0x98>
ffffffffc0209a02:	783c                	ld	a5,112(s0)
ffffffffc0209a04:	10078563          	beqz	a5,ffffffffc0209b0e <sfs_reclaim+0x180>
ffffffffc0209a08:	7b9c                	ld	a5,48(a5)
ffffffffc0209a0a:	10078263          	beqz	a5,ffffffffc0209b0e <sfs_reclaim+0x180>
ffffffffc0209a0e:	8522                	mv	a0,s0
ffffffffc0209a10:	00004597          	auipc	a1,0x4
ffffffffc0209a14:	8f858593          	addi	a1,a1,-1800 # ffffffffc020d308 <default_pmm_manager+0xea0>
ffffffffc0209a18:	e47fd0ef          	jal	ra,ffffffffc020785e <inode_check>
ffffffffc0209a1c:	783c                	ld	a5,112(s0)
ffffffffc0209a1e:	8522                	mv	a0,s0
ffffffffc0209a20:	7b9c                	ld	a5,48(a5)
ffffffffc0209a22:	9782                	jalr	a5
ffffffffc0209a24:	e13d                	bnez	a0,ffffffffc0209a8a <sfs_reclaim+0xfc>
ffffffffc0209a26:	7c18                	ld	a4,56(s0)
ffffffffc0209a28:	603c                	ld	a5,64(s0)
ffffffffc0209a2a:	8526                	mv	a0,s1
ffffffffc0209a2c:	e71c                	sd	a5,8(a4)
ffffffffc0209a2e:	e398                	sd	a4,0(a5)
ffffffffc0209a30:	6438                	ld	a4,72(s0)
ffffffffc0209a32:	683c                	ld	a5,80(s0)
ffffffffc0209a34:	e71c                	sd	a5,8(a4)
ffffffffc0209a36:	e398                	sd	a4,0(a5)
ffffffffc0209a38:	51e010ef          	jal	ra,ffffffffc020af56 <unlock_sfs_fs>
ffffffffc0209a3c:	6008                	ld	a0,0(s0)
ffffffffc0209a3e:	00655783          	lhu	a5,6(a0)
ffffffffc0209a42:	cb85                	beqz	a5,ffffffffc0209a72 <sfs_reclaim+0xe4>
ffffffffc0209a44:	dfaf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209a48:	8522                	mv	a0,s0
ffffffffc0209a4a:	da9fd0ef          	jal	ra,ffffffffc02077f2 <inode_kill>
ffffffffc0209a4e:	60e2                	ld	ra,24(sp)
ffffffffc0209a50:	6442                	ld	s0,16(sp)
ffffffffc0209a52:	64a2                	ld	s1,8(sp)
ffffffffc0209a54:	854a                	mv	a0,s2
ffffffffc0209a56:	6902                	ld	s2,0(sp)
ffffffffc0209a58:	6105                	addi	sp,sp,32
ffffffffc0209a5a:	8082                	ret
ffffffffc0209a5c:	5945                	li	s2,-15
ffffffffc0209a5e:	8526                	mv	a0,s1
ffffffffc0209a60:	4f6010ef          	jal	ra,ffffffffc020af56 <unlock_sfs_fs>
ffffffffc0209a64:	60e2                	ld	ra,24(sp)
ffffffffc0209a66:	6442                	ld	s0,16(sp)
ffffffffc0209a68:	64a2                	ld	s1,8(sp)
ffffffffc0209a6a:	854a                	mv	a0,s2
ffffffffc0209a6c:	6902                	ld	s2,0(sp)
ffffffffc0209a6e:	6105                	addi	sp,sp,32
ffffffffc0209a70:	8082                	ret
ffffffffc0209a72:	440c                	lw	a1,8(s0)
ffffffffc0209a74:	8526                	mv	a0,s1
ffffffffc0209a76:	ea7ff0ef          	jal	ra,ffffffffc020991c <sfs_block_free>
ffffffffc0209a7a:	6008                	ld	a0,0(s0)
ffffffffc0209a7c:	5d4c                	lw	a1,60(a0)
ffffffffc0209a7e:	d1f9                	beqz	a1,ffffffffc0209a44 <sfs_reclaim+0xb6>
ffffffffc0209a80:	8526                	mv	a0,s1
ffffffffc0209a82:	e9bff0ef          	jal	ra,ffffffffc020991c <sfs_block_free>
ffffffffc0209a86:	6008                	ld	a0,0(s0)
ffffffffc0209a88:	bf75                	j	ffffffffc0209a44 <sfs_reclaim+0xb6>
ffffffffc0209a8a:	892a                	mv	s2,a0
ffffffffc0209a8c:	bfc9                	j	ffffffffc0209a5e <sfs_reclaim+0xd0>
ffffffffc0209a8e:	00005697          	auipc	a3,0x5
ffffffffc0209a92:	28268693          	addi	a3,a3,642 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc0209a96:	00002617          	auipc	a2,0x2
ffffffffc0209a9a:	eea60613          	addi	a2,a2,-278 # ffffffffc020b980 <commands+0x210>
ffffffffc0209a9e:	35700593          	li	a1,855
ffffffffc0209aa2:	00005517          	auipc	a0,0x5
ffffffffc0209aa6:	44e50513          	addi	a0,a0,1102 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209aaa:	9f5f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209aae:	00005697          	auipc	a3,0x5
ffffffffc0209ab2:	4ca68693          	addi	a3,a3,1226 # ffffffffc020ef78 <dev_node_ops+0x648>
ffffffffc0209ab6:	00002617          	auipc	a2,0x2
ffffffffc0209aba:	eca60613          	addi	a2,a2,-310 # ffffffffc020b980 <commands+0x210>
ffffffffc0209abe:	35d00593          	li	a1,861
ffffffffc0209ac2:	00005517          	auipc	a0,0x5
ffffffffc0209ac6:	42e50513          	addi	a0,a0,1070 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209aca:	9d5f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209ace:	00005697          	auipc	a3,0x5
ffffffffc0209ad2:	3ea68693          	addi	a3,a3,1002 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc0209ad6:	00002617          	auipc	a2,0x2
ffffffffc0209ada:	eaa60613          	addi	a2,a2,-342 # ffffffffc020b980 <commands+0x210>
ffffffffc0209ade:	35800593          	li	a1,856
ffffffffc0209ae2:	00005517          	auipc	a0,0x5
ffffffffc0209ae6:	40e50513          	addi	a0,a0,1038 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209aea:	9b5f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209aee:	00005697          	auipc	a3,0x5
ffffffffc0209af2:	c5268693          	addi	a3,a3,-942 # ffffffffc020e740 <syscalls+0xc48>
ffffffffc0209af6:	00002617          	auipc	a2,0x2
ffffffffc0209afa:	e8a60613          	addi	a2,a2,-374 # ffffffffc020b980 <commands+0x210>
ffffffffc0209afe:	36200593          	li	a1,866
ffffffffc0209b02:	00005517          	auipc	a0,0x5
ffffffffc0209b06:	3ee50513          	addi	a0,a0,1006 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209b0a:	995f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b0e:	00003697          	auipc	a3,0x3
ffffffffc0209b12:	7aa68693          	addi	a3,a3,1962 # ffffffffc020d2b8 <default_pmm_manager+0xe50>
ffffffffc0209b16:	00002617          	auipc	a2,0x2
ffffffffc0209b1a:	e6a60613          	addi	a2,a2,-406 # ffffffffc020b980 <commands+0x210>
ffffffffc0209b1e:	36700593          	li	a1,871
ffffffffc0209b22:	00005517          	auipc	a0,0x5
ffffffffc0209b26:	3ce50513          	addi	a0,a0,974 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209b2a:	975f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209b2e <sfs_block_alloc>:
ffffffffc0209b2e:	1101                	addi	sp,sp,-32
ffffffffc0209b30:	e822                	sd	s0,16(sp)
ffffffffc0209b32:	842a                	mv	s0,a0
ffffffffc0209b34:	7d08                	ld	a0,56(a0)
ffffffffc0209b36:	e426                	sd	s1,8(sp)
ffffffffc0209b38:	ec06                	sd	ra,24(sp)
ffffffffc0209b3a:	84ae                	mv	s1,a1
ffffffffc0209b3c:	c62ff0ef          	jal	ra,ffffffffc0208f9e <bitmap_alloc>
ffffffffc0209b40:	e90d                	bnez	a0,ffffffffc0209b72 <sfs_block_alloc+0x44>
ffffffffc0209b42:	441c                	lw	a5,8(s0)
ffffffffc0209b44:	cbad                	beqz	a5,ffffffffc0209bb6 <sfs_block_alloc+0x88>
ffffffffc0209b46:	37fd                	addiw	a5,a5,-1
ffffffffc0209b48:	c41c                	sw	a5,8(s0)
ffffffffc0209b4a:	408c                	lw	a1,0(s1)
ffffffffc0209b4c:	4785                	li	a5,1
ffffffffc0209b4e:	e03c                	sd	a5,64(s0)
ffffffffc0209b50:	4054                	lw	a3,4(s0)
ffffffffc0209b52:	c58d                	beqz	a1,ffffffffc0209b7c <sfs_block_alloc+0x4e>
ffffffffc0209b54:	02d5f463          	bgeu	a1,a3,ffffffffc0209b7c <sfs_block_alloc+0x4e>
ffffffffc0209b58:	7c08                	ld	a0,56(s0)
ffffffffc0209b5a:	cb4ff0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc0209b5e:	ed05                	bnez	a0,ffffffffc0209b96 <sfs_block_alloc+0x68>
ffffffffc0209b60:	8522                	mv	a0,s0
ffffffffc0209b62:	6442                	ld	s0,16(sp)
ffffffffc0209b64:	408c                	lw	a1,0(s1)
ffffffffc0209b66:	60e2                	ld	ra,24(sp)
ffffffffc0209b68:	64a2                	ld	s1,8(sp)
ffffffffc0209b6a:	4605                	li	a2,1
ffffffffc0209b6c:	6105                	addi	sp,sp,32
ffffffffc0209b6e:	3780106f          	j	ffffffffc020aee6 <sfs_clear_block>
ffffffffc0209b72:	60e2                	ld	ra,24(sp)
ffffffffc0209b74:	6442                	ld	s0,16(sp)
ffffffffc0209b76:	64a2                	ld	s1,8(sp)
ffffffffc0209b78:	6105                	addi	sp,sp,32
ffffffffc0209b7a:	8082                	ret
ffffffffc0209b7c:	872e                	mv	a4,a1
ffffffffc0209b7e:	00005617          	auipc	a2,0x5
ffffffffc0209b82:	3a260613          	addi	a2,a2,930 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc0209b86:	05300593          	li	a1,83
ffffffffc0209b8a:	00005517          	auipc	a0,0x5
ffffffffc0209b8e:	36650513          	addi	a0,a0,870 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209b92:	90df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209b96:	00005697          	auipc	a3,0x5
ffffffffc0209b9a:	41a68693          	addi	a3,a3,1050 # ffffffffc020efb0 <dev_node_ops+0x680>
ffffffffc0209b9e:	00002617          	auipc	a2,0x2
ffffffffc0209ba2:	de260613          	addi	a2,a2,-542 # ffffffffc020b980 <commands+0x210>
ffffffffc0209ba6:	06100593          	li	a1,97
ffffffffc0209baa:	00005517          	auipc	a0,0x5
ffffffffc0209bae:	34650513          	addi	a0,a0,838 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209bb2:	8edf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209bb6:	00005697          	auipc	a3,0x5
ffffffffc0209bba:	3da68693          	addi	a3,a3,986 # ffffffffc020ef90 <dev_node_ops+0x660>
ffffffffc0209bbe:	00002617          	auipc	a2,0x2
ffffffffc0209bc2:	dc260613          	addi	a2,a2,-574 # ffffffffc020b980 <commands+0x210>
ffffffffc0209bc6:	05f00593          	li	a1,95
ffffffffc0209bca:	00005517          	auipc	a0,0x5
ffffffffc0209bce:	32650513          	addi	a0,a0,806 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209bd2:	8cdf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209bd6 <sfs_bmap_load_nolock>:
ffffffffc0209bd6:	7159                	addi	sp,sp,-112
ffffffffc0209bd8:	f85a                	sd	s6,48(sp)
ffffffffc0209bda:	0005bb03          	ld	s6,0(a1)
ffffffffc0209bde:	f45e                	sd	s7,40(sp)
ffffffffc0209be0:	f486                	sd	ra,104(sp)
ffffffffc0209be2:	008b2b83          	lw	s7,8(s6)
ffffffffc0209be6:	f0a2                	sd	s0,96(sp)
ffffffffc0209be8:	eca6                	sd	s1,88(sp)
ffffffffc0209bea:	e8ca                	sd	s2,80(sp)
ffffffffc0209bec:	e4ce                	sd	s3,72(sp)
ffffffffc0209bee:	e0d2                	sd	s4,64(sp)
ffffffffc0209bf0:	fc56                	sd	s5,56(sp)
ffffffffc0209bf2:	f062                	sd	s8,32(sp)
ffffffffc0209bf4:	ec66                	sd	s9,24(sp)
ffffffffc0209bf6:	18cbe363          	bltu	s7,a2,ffffffffc0209d7c <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209bfa:	47ad                	li	a5,11
ffffffffc0209bfc:	8aae                	mv	s5,a1
ffffffffc0209bfe:	8432                	mv	s0,a2
ffffffffc0209c00:	84aa                	mv	s1,a0
ffffffffc0209c02:	89b6                	mv	s3,a3
ffffffffc0209c04:	04c7f563          	bgeu	a5,a2,ffffffffc0209c4e <sfs_bmap_load_nolock+0x78>
ffffffffc0209c08:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209c0c:	0007069b          	sext.w	a3,a4
ffffffffc0209c10:	3ff00793          	li	a5,1023
ffffffffc0209c14:	1ad7e163          	bltu	a5,a3,ffffffffc0209db6 <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209c18:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209c1c:	02071793          	slli	a5,a4,0x20
ffffffffc0209c20:	c602                	sw	zero,12(sp)
ffffffffc0209c22:	c452                	sw	s4,8(sp)
ffffffffc0209c24:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209c28:	0e0a1e63          	bnez	s4,ffffffffc0209d24 <sfs_bmap_load_nolock+0x14e>
ffffffffc0209c2c:	0acb8663          	beq	s7,a2,ffffffffc0209cd8 <sfs_bmap_load_nolock+0x102>
ffffffffc0209c30:	4a01                	li	s4,0
ffffffffc0209c32:	40d4                	lw	a3,4(s1)
ffffffffc0209c34:	8752                	mv	a4,s4
ffffffffc0209c36:	00005617          	auipc	a2,0x5
ffffffffc0209c3a:	2ea60613          	addi	a2,a2,746 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc0209c3e:	05300593          	li	a1,83
ffffffffc0209c42:	00005517          	auipc	a0,0x5
ffffffffc0209c46:	2ae50513          	addi	a0,a0,686 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209c4a:	855f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c4e:	02061793          	slli	a5,a2,0x20
ffffffffc0209c52:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209c56:	9a5a                	add	s4,s4,s6
ffffffffc0209c58:	00ca2583          	lw	a1,12(s4)
ffffffffc0209c5c:	c22e                	sw	a1,4(sp)
ffffffffc0209c5e:	ed99                	bnez	a1,ffffffffc0209c7c <sfs_bmap_load_nolock+0xa6>
ffffffffc0209c60:	fccb98e3          	bne	s7,a2,ffffffffc0209c30 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c64:	004c                	addi	a1,sp,4
ffffffffc0209c66:	ec9ff0ef          	jal	ra,ffffffffc0209b2e <sfs_block_alloc>
ffffffffc0209c6a:	892a                	mv	s2,a0
ffffffffc0209c6c:	e921                	bnez	a0,ffffffffc0209cbc <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c6e:	4592                	lw	a1,4(sp)
ffffffffc0209c70:	4705                	li	a4,1
ffffffffc0209c72:	00ba2623          	sw	a1,12(s4)
ffffffffc0209c76:	00eab823          	sd	a4,16(s5)
ffffffffc0209c7a:	d9dd                	beqz	a1,ffffffffc0209c30 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c7c:	40d4                	lw	a3,4(s1)
ffffffffc0209c7e:	10d5ff63          	bgeu	a1,a3,ffffffffc0209d9c <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209c82:	7c88                	ld	a0,56(s1)
ffffffffc0209c84:	b8aff0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc0209c88:	18051363          	bnez	a0,ffffffffc0209e0e <sfs_bmap_load_nolock+0x238>
ffffffffc0209c8c:	4a12                	lw	s4,4(sp)
ffffffffc0209c8e:	fa0a02e3          	beqz	s4,ffffffffc0209c32 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209c92:	40dc                	lw	a5,4(s1)
ffffffffc0209c94:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209c32 <sfs_bmap_load_nolock+0x5c>
ffffffffc0209c98:	7c88                	ld	a0,56(s1)
ffffffffc0209c9a:	85d2                	mv	a1,s4
ffffffffc0209c9c:	b72ff0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc0209ca0:	12051763          	bnez	a0,ffffffffc0209dce <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209ca4:	008b9763          	bne	s7,s0,ffffffffc0209cb2 <sfs_bmap_load_nolock+0xdc>
ffffffffc0209ca8:	008b2783          	lw	a5,8(s6)
ffffffffc0209cac:	2785                	addiw	a5,a5,1
ffffffffc0209cae:	00fb2423          	sw	a5,8(s6)
ffffffffc0209cb2:	4901                	li	s2,0
ffffffffc0209cb4:	00098463          	beqz	s3,ffffffffc0209cbc <sfs_bmap_load_nolock+0xe6>
ffffffffc0209cb8:	0149a023          	sw	s4,0(s3)
ffffffffc0209cbc:	70a6                	ld	ra,104(sp)
ffffffffc0209cbe:	7406                	ld	s0,96(sp)
ffffffffc0209cc0:	64e6                	ld	s1,88(sp)
ffffffffc0209cc2:	69a6                	ld	s3,72(sp)
ffffffffc0209cc4:	6a06                	ld	s4,64(sp)
ffffffffc0209cc6:	7ae2                	ld	s5,56(sp)
ffffffffc0209cc8:	7b42                	ld	s6,48(sp)
ffffffffc0209cca:	7ba2                	ld	s7,40(sp)
ffffffffc0209ccc:	7c02                	ld	s8,32(sp)
ffffffffc0209cce:	6ce2                	ld	s9,24(sp)
ffffffffc0209cd0:	854a                	mv	a0,s2
ffffffffc0209cd2:	6946                	ld	s2,80(sp)
ffffffffc0209cd4:	6165                	addi	sp,sp,112
ffffffffc0209cd6:	8082                	ret
ffffffffc0209cd8:	002c                	addi	a1,sp,8
ffffffffc0209cda:	e55ff0ef          	jal	ra,ffffffffc0209b2e <sfs_block_alloc>
ffffffffc0209cde:	892a                	mv	s2,a0
ffffffffc0209ce0:	00c10c93          	addi	s9,sp,12
ffffffffc0209ce4:	fd61                	bnez	a0,ffffffffc0209cbc <sfs_bmap_load_nolock+0xe6>
ffffffffc0209ce6:	85e6                	mv	a1,s9
ffffffffc0209ce8:	8526                	mv	a0,s1
ffffffffc0209cea:	e45ff0ef          	jal	ra,ffffffffc0209b2e <sfs_block_alloc>
ffffffffc0209cee:	892a                	mv	s2,a0
ffffffffc0209cf0:	e925                	bnez	a0,ffffffffc0209d60 <sfs_bmap_load_nolock+0x18a>
ffffffffc0209cf2:	46a2                	lw	a3,8(sp)
ffffffffc0209cf4:	85e6                	mv	a1,s9
ffffffffc0209cf6:	8762                	mv	a4,s8
ffffffffc0209cf8:	4611                	li	a2,4
ffffffffc0209cfa:	8526                	mv	a0,s1
ffffffffc0209cfc:	09a010ef          	jal	ra,ffffffffc020ad96 <sfs_wbuf>
ffffffffc0209d00:	45b2                	lw	a1,12(sp)
ffffffffc0209d02:	892a                	mv	s2,a0
ffffffffc0209d04:	e939                	bnez	a0,ffffffffc0209d5a <sfs_bmap_load_nolock+0x184>
ffffffffc0209d06:	03cb2683          	lw	a3,60(s6)
ffffffffc0209d0a:	4722                	lw	a4,8(sp)
ffffffffc0209d0c:	c22e                	sw	a1,4(sp)
ffffffffc0209d0e:	f6d706e3          	beq	a4,a3,ffffffffc0209c7a <sfs_bmap_load_nolock+0xa4>
ffffffffc0209d12:	eef1                	bnez	a3,ffffffffc0209dee <sfs_bmap_load_nolock+0x218>
ffffffffc0209d14:	02eb2e23          	sw	a4,60(s6)
ffffffffc0209d18:	4705                	li	a4,1
ffffffffc0209d1a:	00eab823          	sd	a4,16(s5)
ffffffffc0209d1e:	f00589e3          	beqz	a1,ffffffffc0209c30 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d22:	bfa9                	j	ffffffffc0209c7c <sfs_bmap_load_nolock+0xa6>
ffffffffc0209d24:	00c10c93          	addi	s9,sp,12
ffffffffc0209d28:	8762                	mv	a4,s8
ffffffffc0209d2a:	86d2                	mv	a3,s4
ffffffffc0209d2c:	4611                	li	a2,4
ffffffffc0209d2e:	85e6                	mv	a1,s9
ffffffffc0209d30:	7e7000ef          	jal	ra,ffffffffc020ad16 <sfs_rbuf>
ffffffffc0209d34:	892a                	mv	s2,a0
ffffffffc0209d36:	f159                	bnez	a0,ffffffffc0209cbc <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d38:	45b2                	lw	a1,12(sp)
ffffffffc0209d3a:	e995                	bnez	a1,ffffffffc0209d6e <sfs_bmap_load_nolock+0x198>
ffffffffc0209d3c:	fa8b85e3          	beq	s7,s0,ffffffffc0209ce6 <sfs_bmap_load_nolock+0x110>
ffffffffc0209d40:	03cb2703          	lw	a4,60(s6)
ffffffffc0209d44:	47a2                	lw	a5,8(sp)
ffffffffc0209d46:	c202                	sw	zero,4(sp)
ffffffffc0209d48:	eee784e3          	beq	a5,a4,ffffffffc0209c30 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d4c:	e34d                	bnez	a4,ffffffffc0209dee <sfs_bmap_load_nolock+0x218>
ffffffffc0209d4e:	02fb2e23          	sw	a5,60(s6)
ffffffffc0209d52:	4785                	li	a5,1
ffffffffc0209d54:	00fab823          	sd	a5,16(s5)
ffffffffc0209d58:	bde1                	j	ffffffffc0209c30 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209d5a:	8526                	mv	a0,s1
ffffffffc0209d5c:	bc1ff0ef          	jal	ra,ffffffffc020991c <sfs_block_free>
ffffffffc0209d60:	45a2                	lw	a1,8(sp)
ffffffffc0209d62:	f4ba0de3          	beq	s4,a1,ffffffffc0209cbc <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d66:	8526                	mv	a0,s1
ffffffffc0209d68:	bb5ff0ef          	jal	ra,ffffffffc020991c <sfs_block_free>
ffffffffc0209d6c:	bf81                	j	ffffffffc0209cbc <sfs_bmap_load_nolock+0xe6>
ffffffffc0209d6e:	03cb2683          	lw	a3,60(s6)
ffffffffc0209d72:	4722                	lw	a4,8(sp)
ffffffffc0209d74:	c22e                	sw	a1,4(sp)
ffffffffc0209d76:	f8e69ee3          	bne	a3,a4,ffffffffc0209d12 <sfs_bmap_load_nolock+0x13c>
ffffffffc0209d7a:	b709                	j	ffffffffc0209c7c <sfs_bmap_load_nolock+0xa6>
ffffffffc0209d7c:	00005697          	auipc	a3,0x5
ffffffffc0209d80:	25c68693          	addi	a3,a3,604 # ffffffffc020efd8 <dev_node_ops+0x6a8>
ffffffffc0209d84:	00002617          	auipc	a2,0x2
ffffffffc0209d88:	bfc60613          	addi	a2,a2,-1028 # ffffffffc020b980 <commands+0x210>
ffffffffc0209d8c:	16400593          	li	a1,356
ffffffffc0209d90:	00005517          	auipc	a0,0x5
ffffffffc0209d94:	16050513          	addi	a0,a0,352 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209d98:	f06f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209d9c:	872e                	mv	a4,a1
ffffffffc0209d9e:	00005617          	auipc	a2,0x5
ffffffffc0209da2:	18260613          	addi	a2,a2,386 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc0209da6:	05300593          	li	a1,83
ffffffffc0209daa:	00005517          	auipc	a0,0x5
ffffffffc0209dae:	14650513          	addi	a0,a0,326 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209db2:	eecf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209db6:	00005617          	auipc	a2,0x5
ffffffffc0209dba:	25260613          	addi	a2,a2,594 # ffffffffc020f008 <dev_node_ops+0x6d8>
ffffffffc0209dbe:	11e00593          	li	a1,286
ffffffffc0209dc2:	00005517          	auipc	a0,0x5
ffffffffc0209dc6:	12e50513          	addi	a0,a0,302 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209dca:	ed4f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209dce:	00005697          	auipc	a3,0x5
ffffffffc0209dd2:	18a68693          	addi	a3,a3,394 # ffffffffc020ef58 <dev_node_ops+0x628>
ffffffffc0209dd6:	00002617          	auipc	a2,0x2
ffffffffc0209dda:	baa60613          	addi	a2,a2,-1110 # ffffffffc020b980 <commands+0x210>
ffffffffc0209dde:	16b00593          	li	a1,363
ffffffffc0209de2:	00005517          	auipc	a0,0x5
ffffffffc0209de6:	10e50513          	addi	a0,a0,270 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209dea:	eb4f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209dee:	00005697          	auipc	a3,0x5
ffffffffc0209df2:	20268693          	addi	a3,a3,514 # ffffffffc020eff0 <dev_node_ops+0x6c0>
ffffffffc0209df6:	00002617          	auipc	a2,0x2
ffffffffc0209dfa:	b8a60613          	addi	a2,a2,-1142 # ffffffffc020b980 <commands+0x210>
ffffffffc0209dfe:	11800593          	li	a1,280
ffffffffc0209e02:	00005517          	auipc	a0,0x5
ffffffffc0209e06:	0ee50513          	addi	a0,a0,238 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209e0a:	e94f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209e0e:	00005697          	auipc	a3,0x5
ffffffffc0209e12:	22a68693          	addi	a3,a3,554 # ffffffffc020f038 <dev_node_ops+0x708>
ffffffffc0209e16:	00002617          	auipc	a2,0x2
ffffffffc0209e1a:	b6a60613          	addi	a2,a2,-1174 # ffffffffc020b980 <commands+0x210>
ffffffffc0209e1e:	12100593          	li	a1,289
ffffffffc0209e22:	00005517          	auipc	a0,0x5
ffffffffc0209e26:	0ce50513          	addi	a0,a0,206 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc0209e2a:	e74f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209e2e <sfs_io_nolock>:
ffffffffc0209e2e:	7175                	addi	sp,sp,-144
ffffffffc0209e30:	f0d2                	sd	s4,96(sp)
ffffffffc0209e32:	8a2e                	mv	s4,a1
ffffffffc0209e34:	618c                	ld	a1,0(a1)
ffffffffc0209e36:	e506                	sd	ra,136(sp)
ffffffffc0209e38:	e122                	sd	s0,128(sp)
ffffffffc0209e3a:	0045d883          	lhu	a7,4(a1)
ffffffffc0209e3e:	fca6                	sd	s1,120(sp)
ffffffffc0209e40:	f8ca                	sd	s2,112(sp)
ffffffffc0209e42:	f4ce                	sd	s3,104(sp)
ffffffffc0209e44:	ecd6                	sd	s5,88(sp)
ffffffffc0209e46:	e8da                	sd	s6,80(sp)
ffffffffc0209e48:	e4de                	sd	s7,72(sp)
ffffffffc0209e4a:	e0e2                	sd	s8,64(sp)
ffffffffc0209e4c:	fc66                	sd	s9,56(sp)
ffffffffc0209e4e:	f86a                	sd	s10,48(sp)
ffffffffc0209e50:	f46e                	sd	s11,40(sp)
ffffffffc0209e52:	4809                	li	a6,2
ffffffffc0209e54:	19088c63          	beq	a7,a6,ffffffffc0209fec <sfs_io_nolock+0x1be>
ffffffffc0209e58:	00073a83          	ld	s5,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc0209e5c:	8cbe                	mv	s9,a5
ffffffffc0209e5e:	00073023          	sd	zero,0(a4)
ffffffffc0209e62:	080007b7          	lui	a5,0x8000
ffffffffc0209e66:	8936                	mv	s2,a3
ffffffffc0209e68:	8c3a                	mv	s8,a4
ffffffffc0209e6a:	9ab6                	add	s5,s5,a3
ffffffffc0209e6c:	16f6fe63          	bgeu	a3,a5,ffffffffc0209fe8 <sfs_io_nolock+0x1ba>
ffffffffc0209e70:	16dacc63          	blt	s5,a3,ffffffffc0209fe8 <sfs_io_nolock+0x1ba>
ffffffffc0209e74:	84aa                	mv	s1,a0
ffffffffc0209e76:	4501                	li	a0,0
ffffffffc0209e78:	0d568963          	beq	a3,s5,ffffffffc0209f4a <sfs_io_nolock+0x11c>
ffffffffc0209e7c:	8432                	mv	s0,a2
ffffffffc0209e7e:	0157f463          	bgeu	a5,s5,ffffffffc0209e86 <sfs_io_nolock+0x58>
ffffffffc0209e82:	08000ab7          	lui	s5,0x8000
ffffffffc0209e86:	0e0c8163          	beqz	s9,ffffffffc0209f68 <sfs_io_nolock+0x13a>
ffffffffc0209e8a:	00001797          	auipc	a5,0x1
ffffffffc0209e8e:	f0c78793          	addi	a5,a5,-244 # ffffffffc020ad96 <sfs_wbuf>
ffffffffc0209e92:	00001d17          	auipc	s10,0x1
ffffffffc0209e96:	e24d0d13          	addi	s10,s10,-476 # ffffffffc020acb6 <sfs_wblock>
ffffffffc0209e9a:	e03e                	sd	a5,0(sp)
ffffffffc0209e9c:	6705                	lui	a4,0x1
ffffffffc0209e9e:	40c95793          	srai	a5,s2,0xc
ffffffffc0209ea2:	40cadb13          	srai	s6,s5,0xc
ffffffffc0209ea6:	fff70b93          	addi	s7,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209eaa:	40fb083b          	subw	a6,s6,a5
ffffffffc0209eae:	01797bb3          	and	s7,s2,s7
ffffffffc0209eb2:	8b42                	mv	s6,a6
ffffffffc0209eb4:	00078d9b          	sext.w	s11,a5
ffffffffc0209eb8:	89de                	mv	s3,s7
ffffffffc0209eba:	020b8d63          	beqz	s7,ffffffffc0209ef4 <sfs_io_nolock+0xc6>
ffffffffc0209ebe:	412a89b3          	sub	s3,s5,s2
ffffffffc0209ec2:	0c081463          	bnez	a6,ffffffffc0209f8a <sfs_io_nolock+0x15c>
ffffffffc0209ec6:	0874                	addi	a3,sp,28
ffffffffc0209ec8:	866e                	mv	a2,s11
ffffffffc0209eca:	85d2                	mv	a1,s4
ffffffffc0209ecc:	8526                	mv	a0,s1
ffffffffc0209ece:	e442                	sd	a6,8(sp)
ffffffffc0209ed0:	d07ff0ef          	jal	ra,ffffffffc0209bd6 <sfs_bmap_load_nolock>
ffffffffc0209ed4:	e569                	bnez	a0,ffffffffc0209f9e <sfs_io_nolock+0x170>
ffffffffc0209ed6:	46f2                	lw	a3,28(sp)
ffffffffc0209ed8:	6782                	ld	a5,0(sp)
ffffffffc0209eda:	875e                	mv	a4,s7
ffffffffc0209edc:	864e                	mv	a2,s3
ffffffffc0209ede:	85a2                	mv	a1,s0
ffffffffc0209ee0:	8526                	mv	a0,s1
ffffffffc0209ee2:	9782                	jalr	a5
ffffffffc0209ee4:	ed4d                	bnez	a0,ffffffffc0209f9e <sfs_io_nolock+0x170>
ffffffffc0209ee6:	6822                	ld	a6,8(sp)
ffffffffc0209ee8:	02080e63          	beqz	a6,ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209eec:	944e                	add	s0,s0,s3
ffffffffc0209eee:	2d85                	addiw	s11,s11,1
ffffffffc0209ef0:	fffb081b          	addiw	a6,s6,-1
ffffffffc0209ef4:	0c080263          	beqz	a6,ffffffffc0209fb8 <sfs_io_nolock+0x18a>
ffffffffc0209ef8:	01b80bbb          	addw	s7,a6,s11
ffffffffc0209efc:	6b05                	lui	s6,0x1
ffffffffc0209efe:	a821                	j	ffffffffc0209f16 <sfs_io_nolock+0xe8>
ffffffffc0209f00:	4672                	lw	a2,28(sp)
ffffffffc0209f02:	4685                	li	a3,1
ffffffffc0209f04:	85a2                	mv	a1,s0
ffffffffc0209f06:	8526                	mv	a0,s1
ffffffffc0209f08:	9d02                	jalr	s10
ffffffffc0209f0a:	ed09                	bnez	a0,ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209f0c:	2d85                	addiw	s11,s11,1
ffffffffc0209f0e:	99da                	add	s3,s3,s6
ffffffffc0209f10:	945a                	add	s0,s0,s6
ffffffffc0209f12:	0bbb8463          	beq	s7,s11,ffffffffc0209fba <sfs_io_nolock+0x18c>
ffffffffc0209f16:	0874                	addi	a3,sp,28
ffffffffc0209f18:	866e                	mv	a2,s11
ffffffffc0209f1a:	85d2                	mv	a1,s4
ffffffffc0209f1c:	8526                	mv	a0,s1
ffffffffc0209f1e:	cb9ff0ef          	jal	ra,ffffffffc0209bd6 <sfs_bmap_load_nolock>
ffffffffc0209f22:	dd79                	beqz	a0,ffffffffc0209f00 <sfs_io_nolock+0xd2>
ffffffffc0209f24:	013c3023          	sd	s3,0(s8)
ffffffffc0209f28:	020c8163          	beqz	s9,ffffffffc0209f4a <sfs_io_nolock+0x11c>
ffffffffc0209f2c:	000a3703          	ld	a4,0(s4)
ffffffffc0209f30:	013907b3          	add	a5,s2,s3
ffffffffc0209f34:	00076683          	lwu	a3,0(a4)
ffffffffc0209f38:	00f6f963          	bgeu	a3,a5,ffffffffc0209f4a <sfs_io_nolock+0x11c>
ffffffffc0209f3c:	0139093b          	addw	s2,s2,s3
ffffffffc0209f40:	01272023          	sw	s2,0(a4)
ffffffffc0209f44:	4785                	li	a5,1
ffffffffc0209f46:	00fa3823          	sd	a5,16(s4)
ffffffffc0209f4a:	60aa                	ld	ra,136(sp)
ffffffffc0209f4c:	640a                	ld	s0,128(sp)
ffffffffc0209f4e:	74e6                	ld	s1,120(sp)
ffffffffc0209f50:	7946                	ld	s2,112(sp)
ffffffffc0209f52:	79a6                	ld	s3,104(sp)
ffffffffc0209f54:	7a06                	ld	s4,96(sp)
ffffffffc0209f56:	6ae6                	ld	s5,88(sp)
ffffffffc0209f58:	6b46                	ld	s6,80(sp)
ffffffffc0209f5a:	6ba6                	ld	s7,72(sp)
ffffffffc0209f5c:	6c06                	ld	s8,64(sp)
ffffffffc0209f5e:	7ce2                	ld	s9,56(sp)
ffffffffc0209f60:	7d42                	ld	s10,48(sp)
ffffffffc0209f62:	7da2                	ld	s11,40(sp)
ffffffffc0209f64:	6149                	addi	sp,sp,144
ffffffffc0209f66:	8082                	ret
ffffffffc0209f68:	0005e783          	lwu	a5,0(a1)
ffffffffc0209f6c:	4501                	li	a0,0
ffffffffc0209f6e:	fcf95ee3          	bge	s2,a5,ffffffffc0209f4a <sfs_io_nolock+0x11c>
ffffffffc0209f72:	0357c863          	blt	a5,s5,ffffffffc0209fa2 <sfs_io_nolock+0x174>
ffffffffc0209f76:	00001797          	auipc	a5,0x1
ffffffffc0209f7a:	da078793          	addi	a5,a5,-608 # ffffffffc020ad16 <sfs_rbuf>
ffffffffc0209f7e:	00001d17          	auipc	s10,0x1
ffffffffc0209f82:	cd8d0d13          	addi	s10,s10,-808 # ffffffffc020ac56 <sfs_rblock>
ffffffffc0209f86:	e03e                	sd	a5,0(sp)
ffffffffc0209f88:	bf11                	j	ffffffffc0209e9c <sfs_io_nolock+0x6e>
ffffffffc0209f8a:	0874                	addi	a3,sp,28
ffffffffc0209f8c:	866e                	mv	a2,s11
ffffffffc0209f8e:	85d2                	mv	a1,s4
ffffffffc0209f90:	8526                	mv	a0,s1
ffffffffc0209f92:	417709b3          	sub	s3,a4,s7
ffffffffc0209f96:	e442                	sd	a6,8(sp)
ffffffffc0209f98:	c3fff0ef          	jal	ra,ffffffffc0209bd6 <sfs_bmap_load_nolock>
ffffffffc0209f9c:	dd0d                	beqz	a0,ffffffffc0209ed6 <sfs_io_nolock+0xa8>
ffffffffc0209f9e:	4981                	li	s3,0
ffffffffc0209fa0:	b751                	j	ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209fa2:	8abe                	mv	s5,a5
ffffffffc0209fa4:	00001797          	auipc	a5,0x1
ffffffffc0209fa8:	d7278793          	addi	a5,a5,-654 # ffffffffc020ad16 <sfs_rbuf>
ffffffffc0209fac:	00001d17          	auipc	s10,0x1
ffffffffc0209fb0:	caad0d13          	addi	s10,s10,-854 # ffffffffc020ac56 <sfs_rblock>
ffffffffc0209fb4:	e03e                	sd	a5,0(sp)
ffffffffc0209fb6:	b5dd                	j	ffffffffc0209e9c <sfs_io_nolock+0x6e>
ffffffffc0209fb8:	8bee                	mv	s7,s11
ffffffffc0209fba:	1ad2                	slli	s5,s5,0x34
ffffffffc0209fbc:	034adb13          	srli	s6,s5,0x34
ffffffffc0209fc0:	4501                	li	a0,0
ffffffffc0209fc2:	f60a81e3          	beqz	s5,ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209fc6:	0874                	addi	a3,sp,28
ffffffffc0209fc8:	865e                	mv	a2,s7
ffffffffc0209fca:	85d2                	mv	a1,s4
ffffffffc0209fcc:	8526                	mv	a0,s1
ffffffffc0209fce:	c09ff0ef          	jal	ra,ffffffffc0209bd6 <sfs_bmap_load_nolock>
ffffffffc0209fd2:	f929                	bnez	a0,ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209fd4:	46f2                	lw	a3,28(sp)
ffffffffc0209fd6:	6782                	ld	a5,0(sp)
ffffffffc0209fd8:	4701                	li	a4,0
ffffffffc0209fda:	865a                	mv	a2,s6
ffffffffc0209fdc:	85a2                	mv	a1,s0
ffffffffc0209fde:	8526                	mv	a0,s1
ffffffffc0209fe0:	9782                	jalr	a5
ffffffffc0209fe2:	f129                	bnez	a0,ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209fe4:	99da                	add	s3,s3,s6
ffffffffc0209fe6:	bf3d                	j	ffffffffc0209f24 <sfs_io_nolock+0xf6>
ffffffffc0209fe8:	5575                	li	a0,-3
ffffffffc0209fea:	b785                	j	ffffffffc0209f4a <sfs_io_nolock+0x11c>
ffffffffc0209fec:	00005697          	auipc	a3,0x5
ffffffffc0209ff0:	07468693          	addi	a3,a3,116 # ffffffffc020f060 <dev_node_ops+0x730>
ffffffffc0209ff4:	00002617          	auipc	a2,0x2
ffffffffc0209ff8:	98c60613          	addi	a2,a2,-1652 # ffffffffc020b980 <commands+0x210>
ffffffffc0209ffc:	22b00593          	li	a1,555
ffffffffc020a000:	00005517          	auipc	a0,0x5
ffffffffc020a004:	ef050513          	addi	a0,a0,-272 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a008:	c96f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a00c <sfs_read>:
ffffffffc020a00c:	7139                	addi	sp,sp,-64
ffffffffc020a00e:	f04a                	sd	s2,32(sp)
ffffffffc020a010:	06853903          	ld	s2,104(a0)
ffffffffc020a014:	fc06                	sd	ra,56(sp)
ffffffffc020a016:	f822                	sd	s0,48(sp)
ffffffffc020a018:	f426                	sd	s1,40(sp)
ffffffffc020a01a:	ec4e                	sd	s3,24(sp)
ffffffffc020a01c:	04090f63          	beqz	s2,ffffffffc020a07a <sfs_read+0x6e>
ffffffffc020a020:	0b092783          	lw	a5,176(s2)
ffffffffc020a024:	ebb9                	bnez	a5,ffffffffc020a07a <sfs_read+0x6e>
ffffffffc020a026:	4d38                	lw	a4,88(a0)
ffffffffc020a028:	6785                	lui	a5,0x1
ffffffffc020a02a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a02e:	842a                	mv	s0,a0
ffffffffc020a030:	06f71563          	bne	a4,a5,ffffffffc020a09a <sfs_read+0x8e>
ffffffffc020a034:	02050993          	addi	s3,a0,32
ffffffffc020a038:	854e                	mv	a0,s3
ffffffffc020a03a:	84ae                	mv	s1,a1
ffffffffc020a03c:	d28fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a040:	0184b803          	ld	a6,24(s1)
ffffffffc020a044:	6494                	ld	a3,8(s1)
ffffffffc020a046:	6090                	ld	a2,0(s1)
ffffffffc020a048:	85a2                	mv	a1,s0
ffffffffc020a04a:	4781                	li	a5,0
ffffffffc020a04c:	0038                	addi	a4,sp,8
ffffffffc020a04e:	854a                	mv	a0,s2
ffffffffc020a050:	e442                	sd	a6,8(sp)
ffffffffc020a052:	dddff0ef          	jal	ra,ffffffffc0209e2e <sfs_io_nolock>
ffffffffc020a056:	65a2                	ld	a1,8(sp)
ffffffffc020a058:	842a                	mv	s0,a0
ffffffffc020a05a:	ed81                	bnez	a1,ffffffffc020a072 <sfs_read+0x66>
ffffffffc020a05c:	854e                	mv	a0,s3
ffffffffc020a05e:	d02fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a062:	70e2                	ld	ra,56(sp)
ffffffffc020a064:	8522                	mv	a0,s0
ffffffffc020a066:	7442                	ld	s0,48(sp)
ffffffffc020a068:	74a2                	ld	s1,40(sp)
ffffffffc020a06a:	7902                	ld	s2,32(sp)
ffffffffc020a06c:	69e2                	ld	s3,24(sp)
ffffffffc020a06e:	6121                	addi	sp,sp,64
ffffffffc020a070:	8082                	ret
ffffffffc020a072:	8526                	mv	a0,s1
ffffffffc020a074:	be4fb0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020a078:	b7d5                	j	ffffffffc020a05c <sfs_read+0x50>
ffffffffc020a07a:	00005697          	auipc	a3,0x5
ffffffffc020a07e:	c9668693          	addi	a3,a3,-874 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020a082:	00002617          	auipc	a2,0x2
ffffffffc020a086:	8fe60613          	addi	a2,a2,-1794 # ffffffffc020b980 <commands+0x210>
ffffffffc020a08a:	29500593          	li	a1,661
ffffffffc020a08e:	00005517          	auipc	a0,0x5
ffffffffc020a092:	e6250513          	addi	a0,a0,-414 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a096:	c08f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a09a:	85fff0ef          	jal	ra,ffffffffc02098f8 <sfs_io.part.0>

ffffffffc020a09e <sfs_write>:
ffffffffc020a09e:	7139                	addi	sp,sp,-64
ffffffffc020a0a0:	f04a                	sd	s2,32(sp)
ffffffffc020a0a2:	06853903          	ld	s2,104(a0)
ffffffffc020a0a6:	fc06                	sd	ra,56(sp)
ffffffffc020a0a8:	f822                	sd	s0,48(sp)
ffffffffc020a0aa:	f426                	sd	s1,40(sp)
ffffffffc020a0ac:	ec4e                	sd	s3,24(sp)
ffffffffc020a0ae:	04090f63          	beqz	s2,ffffffffc020a10c <sfs_write+0x6e>
ffffffffc020a0b2:	0b092783          	lw	a5,176(s2)
ffffffffc020a0b6:	ebb9                	bnez	a5,ffffffffc020a10c <sfs_write+0x6e>
ffffffffc020a0b8:	4d38                	lw	a4,88(a0)
ffffffffc020a0ba:	6785                	lui	a5,0x1
ffffffffc020a0bc:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a0c0:	842a                	mv	s0,a0
ffffffffc020a0c2:	06f71563          	bne	a4,a5,ffffffffc020a12c <sfs_write+0x8e>
ffffffffc020a0c6:	02050993          	addi	s3,a0,32
ffffffffc020a0ca:	854e                	mv	a0,s3
ffffffffc020a0cc:	84ae                	mv	s1,a1
ffffffffc020a0ce:	c96fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a0d2:	0184b803          	ld	a6,24(s1)
ffffffffc020a0d6:	6494                	ld	a3,8(s1)
ffffffffc020a0d8:	6090                	ld	a2,0(s1)
ffffffffc020a0da:	85a2                	mv	a1,s0
ffffffffc020a0dc:	4785                	li	a5,1
ffffffffc020a0de:	0038                	addi	a4,sp,8
ffffffffc020a0e0:	854a                	mv	a0,s2
ffffffffc020a0e2:	e442                	sd	a6,8(sp)
ffffffffc020a0e4:	d4bff0ef          	jal	ra,ffffffffc0209e2e <sfs_io_nolock>
ffffffffc020a0e8:	65a2                	ld	a1,8(sp)
ffffffffc020a0ea:	842a                	mv	s0,a0
ffffffffc020a0ec:	ed81                	bnez	a1,ffffffffc020a104 <sfs_write+0x66>
ffffffffc020a0ee:	854e                	mv	a0,s3
ffffffffc020a0f0:	c70fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a0f4:	70e2                	ld	ra,56(sp)
ffffffffc020a0f6:	8522                	mv	a0,s0
ffffffffc020a0f8:	7442                	ld	s0,48(sp)
ffffffffc020a0fa:	74a2                	ld	s1,40(sp)
ffffffffc020a0fc:	7902                	ld	s2,32(sp)
ffffffffc020a0fe:	69e2                	ld	s3,24(sp)
ffffffffc020a100:	6121                	addi	sp,sp,64
ffffffffc020a102:	8082                	ret
ffffffffc020a104:	8526                	mv	a0,s1
ffffffffc020a106:	b52fb0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020a10a:	b7d5                	j	ffffffffc020a0ee <sfs_write+0x50>
ffffffffc020a10c:	00005697          	auipc	a3,0x5
ffffffffc020a110:	c0468693          	addi	a3,a3,-1020 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020a114:	00002617          	auipc	a2,0x2
ffffffffc020a118:	86c60613          	addi	a2,a2,-1940 # ffffffffc020b980 <commands+0x210>
ffffffffc020a11c:	29500593          	li	a1,661
ffffffffc020a120:	00005517          	auipc	a0,0x5
ffffffffc020a124:	dd050513          	addi	a0,a0,-560 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a128:	b76f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a12c:	fccff0ef          	jal	ra,ffffffffc02098f8 <sfs_io.part.0>

ffffffffc020a130 <sfs_dirent_read_nolock>:
ffffffffc020a130:	6198                	ld	a4,0(a1)
ffffffffc020a132:	7179                	addi	sp,sp,-48
ffffffffc020a134:	f406                	sd	ra,40(sp)
ffffffffc020a136:	00475883          	lhu	a7,4(a4)
ffffffffc020a13a:	f022                	sd	s0,32(sp)
ffffffffc020a13c:	ec26                	sd	s1,24(sp)
ffffffffc020a13e:	4809                	li	a6,2
ffffffffc020a140:	05089b63          	bne	a7,a6,ffffffffc020a196 <sfs_dirent_read_nolock+0x66>
ffffffffc020a144:	4718                	lw	a4,8(a4)
ffffffffc020a146:	87b2                	mv	a5,a2
ffffffffc020a148:	2601                	sext.w	a2,a2
ffffffffc020a14a:	04e7f663          	bgeu	a5,a4,ffffffffc020a196 <sfs_dirent_read_nolock+0x66>
ffffffffc020a14e:	84b6                	mv	s1,a3
ffffffffc020a150:	0074                	addi	a3,sp,12
ffffffffc020a152:	842a                	mv	s0,a0
ffffffffc020a154:	a83ff0ef          	jal	ra,ffffffffc0209bd6 <sfs_bmap_load_nolock>
ffffffffc020a158:	c511                	beqz	a0,ffffffffc020a164 <sfs_dirent_read_nolock+0x34>
ffffffffc020a15a:	70a2                	ld	ra,40(sp)
ffffffffc020a15c:	7402                	ld	s0,32(sp)
ffffffffc020a15e:	64e2                	ld	s1,24(sp)
ffffffffc020a160:	6145                	addi	sp,sp,48
ffffffffc020a162:	8082                	ret
ffffffffc020a164:	45b2                	lw	a1,12(sp)
ffffffffc020a166:	4054                	lw	a3,4(s0)
ffffffffc020a168:	c5b9                	beqz	a1,ffffffffc020a1b6 <sfs_dirent_read_nolock+0x86>
ffffffffc020a16a:	04d5f663          	bgeu	a1,a3,ffffffffc020a1b6 <sfs_dirent_read_nolock+0x86>
ffffffffc020a16e:	7c08                	ld	a0,56(s0)
ffffffffc020a170:	e9ffe0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc020a174:	ed31                	bnez	a0,ffffffffc020a1d0 <sfs_dirent_read_nolock+0xa0>
ffffffffc020a176:	46b2                	lw	a3,12(sp)
ffffffffc020a178:	4701                	li	a4,0
ffffffffc020a17a:	10400613          	li	a2,260
ffffffffc020a17e:	85a6                	mv	a1,s1
ffffffffc020a180:	8522                	mv	a0,s0
ffffffffc020a182:	395000ef          	jal	ra,ffffffffc020ad16 <sfs_rbuf>
ffffffffc020a186:	f971                	bnez	a0,ffffffffc020a15a <sfs_dirent_read_nolock+0x2a>
ffffffffc020a188:	100481a3          	sb	zero,259(s1)
ffffffffc020a18c:	70a2                	ld	ra,40(sp)
ffffffffc020a18e:	7402                	ld	s0,32(sp)
ffffffffc020a190:	64e2                	ld	s1,24(sp)
ffffffffc020a192:	6145                	addi	sp,sp,48
ffffffffc020a194:	8082                	ret
ffffffffc020a196:	00005697          	auipc	a3,0x5
ffffffffc020a19a:	eea68693          	addi	a3,a3,-278 # ffffffffc020f080 <dev_node_ops+0x750>
ffffffffc020a19e:	00001617          	auipc	a2,0x1
ffffffffc020a1a2:	7e260613          	addi	a2,a2,2018 # ffffffffc020b980 <commands+0x210>
ffffffffc020a1a6:	18e00593          	li	a1,398
ffffffffc020a1aa:	00005517          	auipc	a0,0x5
ffffffffc020a1ae:	d4650513          	addi	a0,a0,-698 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a1b2:	aecf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1b6:	872e                	mv	a4,a1
ffffffffc020a1b8:	00005617          	auipc	a2,0x5
ffffffffc020a1bc:	d6860613          	addi	a2,a2,-664 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc020a1c0:	05300593          	li	a1,83
ffffffffc020a1c4:	00005517          	auipc	a0,0x5
ffffffffc020a1c8:	d2c50513          	addi	a0,a0,-724 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a1cc:	ad2f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1d0:	00005697          	auipc	a3,0x5
ffffffffc020a1d4:	d8868693          	addi	a3,a3,-632 # ffffffffc020ef58 <dev_node_ops+0x628>
ffffffffc020a1d8:	00001617          	auipc	a2,0x1
ffffffffc020a1dc:	7a860613          	addi	a2,a2,1960 # ffffffffc020b980 <commands+0x210>
ffffffffc020a1e0:	19500593          	li	a1,405
ffffffffc020a1e4:	00005517          	auipc	a0,0x5
ffffffffc020a1e8:	d0c50513          	addi	a0,a0,-756 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a1ec:	ab2f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a1f0 <sfs_getdirentry>:
ffffffffc020a1f0:	715d                	addi	sp,sp,-80
ffffffffc020a1f2:	ec56                	sd	s5,24(sp)
ffffffffc020a1f4:	8aaa                	mv	s5,a0
ffffffffc020a1f6:	10400513          	li	a0,260
ffffffffc020a1fa:	e85a                	sd	s6,16(sp)
ffffffffc020a1fc:	e486                	sd	ra,72(sp)
ffffffffc020a1fe:	e0a2                	sd	s0,64(sp)
ffffffffc020a200:	fc26                	sd	s1,56(sp)
ffffffffc020a202:	f84a                	sd	s2,48(sp)
ffffffffc020a204:	f44e                	sd	s3,40(sp)
ffffffffc020a206:	f052                	sd	s4,32(sp)
ffffffffc020a208:	e45e                	sd	s7,8(sp)
ffffffffc020a20a:	e062                	sd	s8,0(sp)
ffffffffc020a20c:	8b2e                	mv	s6,a1
ffffffffc020a20e:	d81f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a212:	cd61                	beqz	a0,ffffffffc020a2ea <sfs_getdirentry+0xfa>
ffffffffc020a214:	068abb83          	ld	s7,104(s5) # 8000068 <_binary_bin_sfs_img_size+0x7f8ad68>
ffffffffc020a218:	0c0b8b63          	beqz	s7,ffffffffc020a2ee <sfs_getdirentry+0xfe>
ffffffffc020a21c:	0b0ba783          	lw	a5,176(s7) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a220:	e7f9                	bnez	a5,ffffffffc020a2ee <sfs_getdirentry+0xfe>
ffffffffc020a222:	058aa703          	lw	a4,88(s5)
ffffffffc020a226:	6785                	lui	a5,0x1
ffffffffc020a228:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a22c:	0ef71163          	bne	a4,a5,ffffffffc020a30e <sfs_getdirentry+0x11e>
ffffffffc020a230:	008b3983          	ld	s3,8(s6) # 1008 <_binary_bin_swap_img_size-0x6cf8>
ffffffffc020a234:	892a                	mv	s2,a0
ffffffffc020a236:	0a09c163          	bltz	s3,ffffffffc020a2d8 <sfs_getdirentry+0xe8>
ffffffffc020a23a:	0ff9f793          	zext.b	a5,s3
ffffffffc020a23e:	efc9                	bnez	a5,ffffffffc020a2d8 <sfs_getdirentry+0xe8>
ffffffffc020a240:	000ab783          	ld	a5,0(s5)
ffffffffc020a244:	0089d993          	srli	s3,s3,0x8
ffffffffc020a248:	2981                	sext.w	s3,s3
ffffffffc020a24a:	479c                	lw	a5,8(a5)
ffffffffc020a24c:	0937eb63          	bltu	a5,s3,ffffffffc020a2e2 <sfs_getdirentry+0xf2>
ffffffffc020a250:	020a8c13          	addi	s8,s5,32
ffffffffc020a254:	8562                	mv	a0,s8
ffffffffc020a256:	b0efa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a25a:	000ab783          	ld	a5,0(s5)
ffffffffc020a25e:	0087aa03          	lw	s4,8(a5)
ffffffffc020a262:	07405663          	blez	s4,ffffffffc020a2ce <sfs_getdirentry+0xde>
ffffffffc020a266:	4481                	li	s1,0
ffffffffc020a268:	a811                	j	ffffffffc020a27c <sfs_getdirentry+0x8c>
ffffffffc020a26a:	00092783          	lw	a5,0(s2)
ffffffffc020a26e:	c781                	beqz	a5,ffffffffc020a276 <sfs_getdirentry+0x86>
ffffffffc020a270:	02098263          	beqz	s3,ffffffffc020a294 <sfs_getdirentry+0xa4>
ffffffffc020a274:	39fd                	addiw	s3,s3,-1
ffffffffc020a276:	2485                	addiw	s1,s1,1
ffffffffc020a278:	049a0b63          	beq	s4,s1,ffffffffc020a2ce <sfs_getdirentry+0xde>
ffffffffc020a27c:	86ca                	mv	a3,s2
ffffffffc020a27e:	8626                	mv	a2,s1
ffffffffc020a280:	85d6                	mv	a1,s5
ffffffffc020a282:	855e                	mv	a0,s7
ffffffffc020a284:	eadff0ef          	jal	ra,ffffffffc020a130 <sfs_dirent_read_nolock>
ffffffffc020a288:	842a                	mv	s0,a0
ffffffffc020a28a:	d165                	beqz	a0,ffffffffc020a26a <sfs_getdirentry+0x7a>
ffffffffc020a28c:	8562                	mv	a0,s8
ffffffffc020a28e:	ad2fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a292:	a831                	j	ffffffffc020a2ae <sfs_getdirentry+0xbe>
ffffffffc020a294:	8562                	mv	a0,s8
ffffffffc020a296:	acafa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a29a:	4701                	li	a4,0
ffffffffc020a29c:	4685                	li	a3,1
ffffffffc020a29e:	10000613          	li	a2,256
ffffffffc020a2a2:	00490593          	addi	a1,s2,4
ffffffffc020a2a6:	855a                	mv	a0,s6
ffffffffc020a2a8:	944fb0ef          	jal	ra,ffffffffc02053ec <iobuf_move>
ffffffffc020a2ac:	842a                	mv	s0,a0
ffffffffc020a2ae:	854a                	mv	a0,s2
ffffffffc020a2b0:	d8ff70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a2b4:	60a6                	ld	ra,72(sp)
ffffffffc020a2b6:	8522                	mv	a0,s0
ffffffffc020a2b8:	6406                	ld	s0,64(sp)
ffffffffc020a2ba:	74e2                	ld	s1,56(sp)
ffffffffc020a2bc:	7942                	ld	s2,48(sp)
ffffffffc020a2be:	79a2                	ld	s3,40(sp)
ffffffffc020a2c0:	7a02                	ld	s4,32(sp)
ffffffffc020a2c2:	6ae2                	ld	s5,24(sp)
ffffffffc020a2c4:	6b42                	ld	s6,16(sp)
ffffffffc020a2c6:	6ba2                	ld	s7,8(sp)
ffffffffc020a2c8:	6c02                	ld	s8,0(sp)
ffffffffc020a2ca:	6161                	addi	sp,sp,80
ffffffffc020a2cc:	8082                	ret
ffffffffc020a2ce:	8562                	mv	a0,s8
ffffffffc020a2d0:	5441                	li	s0,-16
ffffffffc020a2d2:	a8efa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a2d6:	bfe1                	j	ffffffffc020a2ae <sfs_getdirentry+0xbe>
ffffffffc020a2d8:	854a                	mv	a0,s2
ffffffffc020a2da:	d65f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a2de:	5475                	li	s0,-3
ffffffffc020a2e0:	bfd1                	j	ffffffffc020a2b4 <sfs_getdirentry+0xc4>
ffffffffc020a2e2:	d5df70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a2e6:	5441                	li	s0,-16
ffffffffc020a2e8:	b7f1                	j	ffffffffc020a2b4 <sfs_getdirentry+0xc4>
ffffffffc020a2ea:	5471                	li	s0,-4
ffffffffc020a2ec:	b7e1                	j	ffffffffc020a2b4 <sfs_getdirentry+0xc4>
ffffffffc020a2ee:	00005697          	auipc	a3,0x5
ffffffffc020a2f2:	a2268693          	addi	a3,a3,-1502 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020a2f6:	00001617          	auipc	a2,0x1
ffffffffc020a2fa:	68a60613          	addi	a2,a2,1674 # ffffffffc020b980 <commands+0x210>
ffffffffc020a2fe:	33900593          	li	a1,825
ffffffffc020a302:	00005517          	auipc	a0,0x5
ffffffffc020a306:	bee50513          	addi	a0,a0,-1042 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a30a:	994f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a30e:	00005697          	auipc	a3,0x5
ffffffffc020a312:	baa68693          	addi	a3,a3,-1110 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020a316:	00001617          	auipc	a2,0x1
ffffffffc020a31a:	66a60613          	addi	a2,a2,1642 # ffffffffc020b980 <commands+0x210>
ffffffffc020a31e:	33a00593          	li	a1,826
ffffffffc020a322:	00005517          	auipc	a0,0x5
ffffffffc020a326:	bce50513          	addi	a0,a0,-1074 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a32a:	974f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a32e <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a32e:	715d                	addi	sp,sp,-80
ffffffffc020a330:	f052                	sd	s4,32(sp)
ffffffffc020a332:	8a2a                	mv	s4,a0
ffffffffc020a334:	8532                	mv	a0,a2
ffffffffc020a336:	f44e                	sd	s3,40(sp)
ffffffffc020a338:	e85a                	sd	s6,16(sp)
ffffffffc020a33a:	e45e                	sd	s7,8(sp)
ffffffffc020a33c:	e486                	sd	ra,72(sp)
ffffffffc020a33e:	e0a2                	sd	s0,64(sp)
ffffffffc020a340:	fc26                	sd	s1,56(sp)
ffffffffc020a342:	f84a                	sd	s2,48(sp)
ffffffffc020a344:	ec56                	sd	s5,24(sp)
ffffffffc020a346:	e062                	sd	s8,0(sp)
ffffffffc020a348:	8b32                	mv	s6,a2
ffffffffc020a34a:	89ae                	mv	s3,a1
ffffffffc020a34c:	8bb6                	mv	s7,a3
ffffffffc020a34e:	0aa010ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc020a352:	0ff00793          	li	a5,255
ffffffffc020a356:	06a7ef63          	bltu	a5,a0,ffffffffc020a3d4 <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a35a:	10400513          	li	a0,260
ffffffffc020a35e:	c31f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a362:	892a                	mv	s2,a0
ffffffffc020a364:	c535                	beqz	a0,ffffffffc020a3d0 <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a366:	0009b783          	ld	a5,0(s3)
ffffffffc020a36a:	0087aa83          	lw	s5,8(a5)
ffffffffc020a36e:	05505a63          	blez	s5,ffffffffc020a3c2 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a372:	4481                	li	s1,0
ffffffffc020a374:	00450c13          	addi	s8,a0,4
ffffffffc020a378:	a829                	j	ffffffffc020a392 <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a37a:	00092783          	lw	a5,0(s2)
ffffffffc020a37e:	c799                	beqz	a5,ffffffffc020a38c <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a380:	85e2                	mv	a1,s8
ffffffffc020a382:	855a                	mv	a0,s6
ffffffffc020a384:	0bc010ef          	jal	ra,ffffffffc020b440 <strcmp>
ffffffffc020a388:	842a                	mv	s0,a0
ffffffffc020a38a:	cd15                	beqz	a0,ffffffffc020a3c6 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a38c:	2485                	addiw	s1,s1,1
ffffffffc020a38e:	029a8a63          	beq	s5,s1,ffffffffc020a3c2 <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a392:	86ca                	mv	a3,s2
ffffffffc020a394:	8626                	mv	a2,s1
ffffffffc020a396:	85ce                	mv	a1,s3
ffffffffc020a398:	8552                	mv	a0,s4
ffffffffc020a39a:	d97ff0ef          	jal	ra,ffffffffc020a130 <sfs_dirent_read_nolock>
ffffffffc020a39e:	842a                	mv	s0,a0
ffffffffc020a3a0:	dd69                	beqz	a0,ffffffffc020a37a <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a3a2:	854a                	mv	a0,s2
ffffffffc020a3a4:	c9bf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a3a8:	60a6                	ld	ra,72(sp)
ffffffffc020a3aa:	8522                	mv	a0,s0
ffffffffc020a3ac:	6406                	ld	s0,64(sp)
ffffffffc020a3ae:	74e2                	ld	s1,56(sp)
ffffffffc020a3b0:	7942                	ld	s2,48(sp)
ffffffffc020a3b2:	79a2                	ld	s3,40(sp)
ffffffffc020a3b4:	7a02                	ld	s4,32(sp)
ffffffffc020a3b6:	6ae2                	ld	s5,24(sp)
ffffffffc020a3b8:	6b42                	ld	s6,16(sp)
ffffffffc020a3ba:	6ba2                	ld	s7,8(sp)
ffffffffc020a3bc:	6c02                	ld	s8,0(sp)
ffffffffc020a3be:	6161                	addi	sp,sp,80
ffffffffc020a3c0:	8082                	ret
ffffffffc020a3c2:	5441                	li	s0,-16
ffffffffc020a3c4:	bff9                	j	ffffffffc020a3a2 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a3c6:	00092783          	lw	a5,0(s2)
ffffffffc020a3ca:	00fba023          	sw	a5,0(s7)
ffffffffc020a3ce:	bfd1                	j	ffffffffc020a3a2 <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a3d0:	5471                	li	s0,-4
ffffffffc020a3d2:	bfd9                	j	ffffffffc020a3a8 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a3d4:	00005697          	auipc	a3,0x5
ffffffffc020a3d8:	cfc68693          	addi	a3,a3,-772 # ffffffffc020f0d0 <dev_node_ops+0x7a0>
ffffffffc020a3dc:	00001617          	auipc	a2,0x1
ffffffffc020a3e0:	5a460613          	addi	a2,a2,1444 # ffffffffc020b980 <commands+0x210>
ffffffffc020a3e4:	1ba00593          	li	a1,442
ffffffffc020a3e8:	00005517          	auipc	a0,0x5
ffffffffc020a3ec:	b0850513          	addi	a0,a0,-1272 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a3f0:	8aef60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a3f4 <sfs_truncfile>:
ffffffffc020a3f4:	7175                	addi	sp,sp,-144
ffffffffc020a3f6:	e506                	sd	ra,136(sp)
ffffffffc020a3f8:	e122                	sd	s0,128(sp)
ffffffffc020a3fa:	fca6                	sd	s1,120(sp)
ffffffffc020a3fc:	f8ca                	sd	s2,112(sp)
ffffffffc020a3fe:	f4ce                	sd	s3,104(sp)
ffffffffc020a400:	f0d2                	sd	s4,96(sp)
ffffffffc020a402:	ecd6                	sd	s5,88(sp)
ffffffffc020a404:	e8da                	sd	s6,80(sp)
ffffffffc020a406:	e4de                	sd	s7,72(sp)
ffffffffc020a408:	e0e2                	sd	s8,64(sp)
ffffffffc020a40a:	fc66                	sd	s9,56(sp)
ffffffffc020a40c:	f86a                	sd	s10,48(sp)
ffffffffc020a40e:	f46e                	sd	s11,40(sp)
ffffffffc020a410:	080007b7          	lui	a5,0x8000
ffffffffc020a414:	16b7e463          	bltu	a5,a1,ffffffffc020a57c <sfs_truncfile+0x188>
ffffffffc020a418:	06853c83          	ld	s9,104(a0)
ffffffffc020a41c:	89aa                	mv	s3,a0
ffffffffc020a41e:	160c8163          	beqz	s9,ffffffffc020a580 <sfs_truncfile+0x18c>
ffffffffc020a422:	0b0ca783          	lw	a5,176(s9) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a426:	14079d63          	bnez	a5,ffffffffc020a580 <sfs_truncfile+0x18c>
ffffffffc020a42a:	4d38                	lw	a4,88(a0)
ffffffffc020a42c:	6405                	lui	s0,0x1
ffffffffc020a42e:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a432:	16f71763          	bne	a4,a5,ffffffffc020a5a0 <sfs_truncfile+0x1ac>
ffffffffc020a436:	00053a83          	ld	s5,0(a0)
ffffffffc020a43a:	147d                	addi	s0,s0,-1
ffffffffc020a43c:	942e                	add	s0,s0,a1
ffffffffc020a43e:	000ae783          	lwu	a5,0(s5)
ffffffffc020a442:	8031                	srli	s0,s0,0xc
ffffffffc020a444:	8a2e                	mv	s4,a1
ffffffffc020a446:	2401                	sext.w	s0,s0
ffffffffc020a448:	02b79763          	bne	a5,a1,ffffffffc020a476 <sfs_truncfile+0x82>
ffffffffc020a44c:	008aa783          	lw	a5,8(s5)
ffffffffc020a450:	4901                	li	s2,0
ffffffffc020a452:	18879763          	bne	a5,s0,ffffffffc020a5e0 <sfs_truncfile+0x1ec>
ffffffffc020a456:	60aa                	ld	ra,136(sp)
ffffffffc020a458:	640a                	ld	s0,128(sp)
ffffffffc020a45a:	74e6                	ld	s1,120(sp)
ffffffffc020a45c:	79a6                	ld	s3,104(sp)
ffffffffc020a45e:	7a06                	ld	s4,96(sp)
ffffffffc020a460:	6ae6                	ld	s5,88(sp)
ffffffffc020a462:	6b46                	ld	s6,80(sp)
ffffffffc020a464:	6ba6                	ld	s7,72(sp)
ffffffffc020a466:	6c06                	ld	s8,64(sp)
ffffffffc020a468:	7ce2                	ld	s9,56(sp)
ffffffffc020a46a:	7d42                	ld	s10,48(sp)
ffffffffc020a46c:	7da2                	ld	s11,40(sp)
ffffffffc020a46e:	854a                	mv	a0,s2
ffffffffc020a470:	7946                	ld	s2,112(sp)
ffffffffc020a472:	6149                	addi	sp,sp,144
ffffffffc020a474:	8082                	ret
ffffffffc020a476:	02050b13          	addi	s6,a0,32
ffffffffc020a47a:	855a                	mv	a0,s6
ffffffffc020a47c:	8e8fa0ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a480:	008aa483          	lw	s1,8(s5)
ffffffffc020a484:	0a84e663          	bltu	s1,s0,ffffffffc020a530 <sfs_truncfile+0x13c>
ffffffffc020a488:	0c947163          	bgeu	s0,s1,ffffffffc020a54a <sfs_truncfile+0x156>
ffffffffc020a48c:	4dad                	li	s11,11
ffffffffc020a48e:	4b85                	li	s7,1
ffffffffc020a490:	a09d                	j	ffffffffc020a4f6 <sfs_truncfile+0x102>
ffffffffc020a492:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a496:	0009079b          	sext.w	a5,s2
ffffffffc020a49a:	3ff00713          	li	a4,1023
ffffffffc020a49e:	04f76563          	bltu	a4,a5,ffffffffc020a4e8 <sfs_truncfile+0xf4>
ffffffffc020a4a2:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a4a6:	040c0163          	beqz	s8,ffffffffc020a4e8 <sfs_truncfile+0xf4>
ffffffffc020a4aa:	004ca783          	lw	a5,4(s9)
ffffffffc020a4ae:	18fc7963          	bgeu	s8,a5,ffffffffc020a640 <sfs_truncfile+0x24c>
ffffffffc020a4b2:	038cb503          	ld	a0,56(s9)
ffffffffc020a4b6:	85e2                	mv	a1,s8
ffffffffc020a4b8:	b57fe0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc020a4bc:	16051263          	bnez	a0,ffffffffc020a620 <sfs_truncfile+0x22c>
ffffffffc020a4c0:	02091793          	slli	a5,s2,0x20
ffffffffc020a4c4:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a4c8:	86e2                	mv	a3,s8
ffffffffc020a4ca:	4611                	li	a2,4
ffffffffc020a4cc:	082c                	addi	a1,sp,24
ffffffffc020a4ce:	8566                	mv	a0,s9
ffffffffc020a4d0:	e43a                	sd	a4,8(sp)
ffffffffc020a4d2:	ce02                	sw	zero,28(sp)
ffffffffc020a4d4:	043000ef          	jal	ra,ffffffffc020ad16 <sfs_rbuf>
ffffffffc020a4d8:	892a                	mv	s2,a0
ffffffffc020a4da:	e141                	bnez	a0,ffffffffc020a55a <sfs_truncfile+0x166>
ffffffffc020a4dc:	47e2                	lw	a5,24(sp)
ffffffffc020a4de:	6722                	ld	a4,8(sp)
ffffffffc020a4e0:	e3c9                	bnez	a5,ffffffffc020a562 <sfs_truncfile+0x16e>
ffffffffc020a4e2:	008d2603          	lw	a2,8(s10)
ffffffffc020a4e6:	367d                	addiw	a2,a2,-1
ffffffffc020a4e8:	00cd2423          	sw	a2,8(s10)
ffffffffc020a4ec:	0179b823          	sd	s7,16(s3)
ffffffffc020a4f0:	34fd                	addiw	s1,s1,-1
ffffffffc020a4f2:	04940a63          	beq	s0,s1,ffffffffc020a546 <sfs_truncfile+0x152>
ffffffffc020a4f6:	0009bd03          	ld	s10,0(s3)
ffffffffc020a4fa:	008d2703          	lw	a4,8(s10)
ffffffffc020a4fe:	c369                	beqz	a4,ffffffffc020a5c0 <sfs_truncfile+0x1cc>
ffffffffc020a500:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a504:	0007861b          	sext.w	a2,a5
ffffffffc020a508:	f8cde5e3          	bltu	s11,a2,ffffffffc020a492 <sfs_truncfile+0x9e>
ffffffffc020a50c:	02079713          	slli	a4,a5,0x20
ffffffffc020a510:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a514:	00fd0933          	add	s2,s10,a5
ffffffffc020a518:	00c92583          	lw	a1,12(s2)
ffffffffc020a51c:	d5f1                	beqz	a1,ffffffffc020a4e8 <sfs_truncfile+0xf4>
ffffffffc020a51e:	8566                	mv	a0,s9
ffffffffc020a520:	bfcff0ef          	jal	ra,ffffffffc020991c <sfs_block_free>
ffffffffc020a524:	00092623          	sw	zero,12(s2)
ffffffffc020a528:	008d2603          	lw	a2,8(s10)
ffffffffc020a52c:	367d                	addiw	a2,a2,-1
ffffffffc020a52e:	bf6d                	j	ffffffffc020a4e8 <sfs_truncfile+0xf4>
ffffffffc020a530:	4681                	li	a3,0
ffffffffc020a532:	8626                	mv	a2,s1
ffffffffc020a534:	85ce                	mv	a1,s3
ffffffffc020a536:	8566                	mv	a0,s9
ffffffffc020a538:	e9eff0ef          	jal	ra,ffffffffc0209bd6 <sfs_bmap_load_nolock>
ffffffffc020a53c:	892a                	mv	s2,a0
ffffffffc020a53e:	ed11                	bnez	a0,ffffffffc020a55a <sfs_truncfile+0x166>
ffffffffc020a540:	2485                	addiw	s1,s1,1
ffffffffc020a542:	fe9417e3          	bne	s0,s1,ffffffffc020a530 <sfs_truncfile+0x13c>
ffffffffc020a546:	008aa483          	lw	s1,8(s5)
ffffffffc020a54a:	0a941b63          	bne	s0,s1,ffffffffc020a600 <sfs_truncfile+0x20c>
ffffffffc020a54e:	014aa023          	sw	s4,0(s5)
ffffffffc020a552:	4785                	li	a5,1
ffffffffc020a554:	00f9b823          	sd	a5,16(s3)
ffffffffc020a558:	4901                	li	s2,0
ffffffffc020a55a:	855a                	mv	a0,s6
ffffffffc020a55c:	804fa0ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a560:	bddd                	j	ffffffffc020a456 <sfs_truncfile+0x62>
ffffffffc020a562:	86e2                	mv	a3,s8
ffffffffc020a564:	4611                	li	a2,4
ffffffffc020a566:	086c                	addi	a1,sp,28
ffffffffc020a568:	8566                	mv	a0,s9
ffffffffc020a56a:	02d000ef          	jal	ra,ffffffffc020ad96 <sfs_wbuf>
ffffffffc020a56e:	892a                	mv	s2,a0
ffffffffc020a570:	f56d                	bnez	a0,ffffffffc020a55a <sfs_truncfile+0x166>
ffffffffc020a572:	45e2                	lw	a1,24(sp)
ffffffffc020a574:	8566                	mv	a0,s9
ffffffffc020a576:	ba6ff0ef          	jal	ra,ffffffffc020991c <sfs_block_free>
ffffffffc020a57a:	b7a5                	j	ffffffffc020a4e2 <sfs_truncfile+0xee>
ffffffffc020a57c:	5975                	li	s2,-3
ffffffffc020a57e:	bde1                	j	ffffffffc020a456 <sfs_truncfile+0x62>
ffffffffc020a580:	00004697          	auipc	a3,0x4
ffffffffc020a584:	79068693          	addi	a3,a3,1936 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020a588:	00001617          	auipc	a2,0x1
ffffffffc020a58c:	3f860613          	addi	a2,a2,1016 # ffffffffc020b980 <commands+0x210>
ffffffffc020a590:	3a800593          	li	a1,936
ffffffffc020a594:	00005517          	auipc	a0,0x5
ffffffffc020a598:	95c50513          	addi	a0,a0,-1700 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a59c:	f03f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5a0:	00005697          	auipc	a3,0x5
ffffffffc020a5a4:	91868693          	addi	a3,a3,-1768 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020a5a8:	00001617          	auipc	a2,0x1
ffffffffc020a5ac:	3d860613          	addi	a2,a2,984 # ffffffffc020b980 <commands+0x210>
ffffffffc020a5b0:	3a900593          	li	a1,937
ffffffffc020a5b4:	00005517          	auipc	a0,0x5
ffffffffc020a5b8:	93c50513          	addi	a0,a0,-1732 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a5bc:	ee3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5c0:	00005697          	auipc	a3,0x5
ffffffffc020a5c4:	b5068693          	addi	a3,a3,-1200 # ffffffffc020f110 <dev_node_ops+0x7e0>
ffffffffc020a5c8:	00001617          	auipc	a2,0x1
ffffffffc020a5cc:	3b860613          	addi	a2,a2,952 # ffffffffc020b980 <commands+0x210>
ffffffffc020a5d0:	17b00593          	li	a1,379
ffffffffc020a5d4:	00005517          	auipc	a0,0x5
ffffffffc020a5d8:	91c50513          	addi	a0,a0,-1764 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a5dc:	ec3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a5e0:	00005697          	auipc	a3,0x5
ffffffffc020a5e4:	b1868693          	addi	a3,a3,-1256 # ffffffffc020f0f8 <dev_node_ops+0x7c8>
ffffffffc020a5e8:	00001617          	auipc	a2,0x1
ffffffffc020a5ec:	39860613          	addi	a2,a2,920 # ffffffffc020b980 <commands+0x210>
ffffffffc020a5f0:	3b000593          	li	a1,944
ffffffffc020a5f4:	00005517          	auipc	a0,0x5
ffffffffc020a5f8:	8fc50513          	addi	a0,a0,-1796 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a5fc:	ea3f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a600:	00005697          	auipc	a3,0x5
ffffffffc020a604:	b6068693          	addi	a3,a3,-1184 # ffffffffc020f160 <dev_node_ops+0x830>
ffffffffc020a608:	00001617          	auipc	a2,0x1
ffffffffc020a60c:	37860613          	addi	a2,a2,888 # ffffffffc020b980 <commands+0x210>
ffffffffc020a610:	3c900593          	li	a1,969
ffffffffc020a614:	00005517          	auipc	a0,0x5
ffffffffc020a618:	8dc50513          	addi	a0,a0,-1828 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a61c:	e83f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a620:	00005697          	auipc	a3,0x5
ffffffffc020a624:	b0868693          	addi	a3,a3,-1272 # ffffffffc020f128 <dev_node_ops+0x7f8>
ffffffffc020a628:	00001617          	auipc	a2,0x1
ffffffffc020a62c:	35860613          	addi	a2,a2,856 # ffffffffc020b980 <commands+0x210>
ffffffffc020a630:	12b00593          	li	a1,299
ffffffffc020a634:	00005517          	auipc	a0,0x5
ffffffffc020a638:	8bc50513          	addi	a0,a0,-1860 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a63c:	e63f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a640:	8762                	mv	a4,s8
ffffffffc020a642:	86be                	mv	a3,a5
ffffffffc020a644:	00005617          	auipc	a2,0x5
ffffffffc020a648:	8dc60613          	addi	a2,a2,-1828 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc020a64c:	05300593          	li	a1,83
ffffffffc020a650:	00005517          	auipc	a0,0x5
ffffffffc020a654:	8a050513          	addi	a0,a0,-1888 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a658:	e47f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a65c <sfs_load_inode>:
ffffffffc020a65c:	7139                	addi	sp,sp,-64
ffffffffc020a65e:	fc06                	sd	ra,56(sp)
ffffffffc020a660:	f822                	sd	s0,48(sp)
ffffffffc020a662:	f426                	sd	s1,40(sp)
ffffffffc020a664:	f04a                	sd	s2,32(sp)
ffffffffc020a666:	84b2                	mv	s1,a2
ffffffffc020a668:	892a                	mv	s2,a0
ffffffffc020a66a:	ec4e                	sd	s3,24(sp)
ffffffffc020a66c:	e852                	sd	s4,16(sp)
ffffffffc020a66e:	89ae                	mv	s3,a1
ffffffffc020a670:	e456                	sd	s5,8(sp)
ffffffffc020a672:	0d5000ef          	jal	ra,ffffffffc020af46 <lock_sfs_fs>
ffffffffc020a676:	45a9                	li	a1,10
ffffffffc020a678:	8526                	mv	a0,s1
ffffffffc020a67a:	0a893403          	ld	s0,168(s2)
ffffffffc020a67e:	0e9000ef          	jal	ra,ffffffffc020af66 <hash32>
ffffffffc020a682:	02051793          	slli	a5,a0,0x20
ffffffffc020a686:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a68a:	9722                	add	a4,a4,s0
ffffffffc020a68c:	843a                	mv	s0,a4
ffffffffc020a68e:	a029                	j	ffffffffc020a698 <sfs_load_inode+0x3c>
ffffffffc020a690:	fc042783          	lw	a5,-64(s0)
ffffffffc020a694:	10978863          	beq	a5,s1,ffffffffc020a7a4 <sfs_load_inode+0x148>
ffffffffc020a698:	6400                	ld	s0,8(s0)
ffffffffc020a69a:	fe871be3          	bne	a4,s0,ffffffffc020a690 <sfs_load_inode+0x34>
ffffffffc020a69e:	04000513          	li	a0,64
ffffffffc020a6a2:	8edf70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a6a6:	8aaa                	mv	s5,a0
ffffffffc020a6a8:	16050563          	beqz	a0,ffffffffc020a812 <sfs_load_inode+0x1b6>
ffffffffc020a6ac:	00492683          	lw	a3,4(s2)
ffffffffc020a6b0:	18048363          	beqz	s1,ffffffffc020a836 <sfs_load_inode+0x1da>
ffffffffc020a6b4:	18d4f163          	bgeu	s1,a3,ffffffffc020a836 <sfs_load_inode+0x1da>
ffffffffc020a6b8:	03893503          	ld	a0,56(s2)
ffffffffc020a6bc:	85a6                	mv	a1,s1
ffffffffc020a6be:	951fe0ef          	jal	ra,ffffffffc020900e <bitmap_test>
ffffffffc020a6c2:	18051763          	bnez	a0,ffffffffc020a850 <sfs_load_inode+0x1f4>
ffffffffc020a6c6:	4701                	li	a4,0
ffffffffc020a6c8:	86a6                	mv	a3,s1
ffffffffc020a6ca:	04000613          	li	a2,64
ffffffffc020a6ce:	85d6                	mv	a1,s5
ffffffffc020a6d0:	854a                	mv	a0,s2
ffffffffc020a6d2:	644000ef          	jal	ra,ffffffffc020ad16 <sfs_rbuf>
ffffffffc020a6d6:	842a                	mv	s0,a0
ffffffffc020a6d8:	0e051563          	bnez	a0,ffffffffc020a7c2 <sfs_load_inode+0x166>
ffffffffc020a6dc:	006ad783          	lhu	a5,6(s5)
ffffffffc020a6e0:	12078b63          	beqz	a5,ffffffffc020a816 <sfs_load_inode+0x1ba>
ffffffffc020a6e4:	6405                	lui	s0,0x1
ffffffffc020a6e6:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a6ea:	8defd0ef          	jal	ra,ffffffffc02077c8 <__alloc_inode>
ffffffffc020a6ee:	8a2a                	mv	s4,a0
ffffffffc020a6f0:	c961                	beqz	a0,ffffffffc020a7c0 <sfs_load_inode+0x164>
ffffffffc020a6f2:	004ad683          	lhu	a3,4(s5)
ffffffffc020a6f6:	4785                	li	a5,1
ffffffffc020a6f8:	0cf69c63          	bne	a3,a5,ffffffffc020a7d0 <sfs_load_inode+0x174>
ffffffffc020a6fc:	864a                	mv	a2,s2
ffffffffc020a6fe:	00005597          	auipc	a1,0x5
ffffffffc020a702:	b7258593          	addi	a1,a1,-1166 # ffffffffc020f270 <sfs_node_fileops>
ffffffffc020a706:	8defd0ef          	jal	ra,ffffffffc02077e4 <inode_init>
ffffffffc020a70a:	058a2783          	lw	a5,88(s4)
ffffffffc020a70e:	23540413          	addi	s0,s0,565
ffffffffc020a712:	0e879063          	bne	a5,s0,ffffffffc020a7f2 <sfs_load_inode+0x196>
ffffffffc020a716:	4785                	li	a5,1
ffffffffc020a718:	00fa2c23          	sw	a5,24(s4)
ffffffffc020a71c:	015a3023          	sd	s5,0(s4)
ffffffffc020a720:	009a2423          	sw	s1,8(s4)
ffffffffc020a724:	000a3823          	sd	zero,16(s4)
ffffffffc020a728:	4585                	li	a1,1
ffffffffc020a72a:	020a0513          	addi	a0,s4,32
ffffffffc020a72e:	e2df90ef          	jal	ra,ffffffffc020455a <sem_init>
ffffffffc020a732:	058a2703          	lw	a4,88(s4)
ffffffffc020a736:	6785                	lui	a5,0x1
ffffffffc020a738:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a73c:	14f71663          	bne	a4,a5,ffffffffc020a888 <sfs_load_inode+0x22c>
ffffffffc020a740:	0a093703          	ld	a4,160(s2)
ffffffffc020a744:	038a0793          	addi	a5,s4,56
ffffffffc020a748:	008a2503          	lw	a0,8(s4)
ffffffffc020a74c:	e31c                	sd	a5,0(a4)
ffffffffc020a74e:	0af93023          	sd	a5,160(s2)
ffffffffc020a752:	09890793          	addi	a5,s2,152
ffffffffc020a756:	0a893403          	ld	s0,168(s2)
ffffffffc020a75a:	45a9                	li	a1,10
ffffffffc020a75c:	04ea3023          	sd	a4,64(s4)
ffffffffc020a760:	02fa3c23          	sd	a5,56(s4)
ffffffffc020a764:	003000ef          	jal	ra,ffffffffc020af66 <hash32>
ffffffffc020a768:	02051713          	slli	a4,a0,0x20
ffffffffc020a76c:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a770:	97a2                	add	a5,a5,s0
ffffffffc020a772:	6798                	ld	a4,8(a5)
ffffffffc020a774:	048a0693          	addi	a3,s4,72
ffffffffc020a778:	e314                	sd	a3,0(a4)
ffffffffc020a77a:	e794                	sd	a3,8(a5)
ffffffffc020a77c:	04ea3823          	sd	a4,80(s4)
ffffffffc020a780:	04fa3423          	sd	a5,72(s4)
ffffffffc020a784:	854a                	mv	a0,s2
ffffffffc020a786:	7d0000ef          	jal	ra,ffffffffc020af56 <unlock_sfs_fs>
ffffffffc020a78a:	4401                	li	s0,0
ffffffffc020a78c:	0149b023          	sd	s4,0(s3)
ffffffffc020a790:	70e2                	ld	ra,56(sp)
ffffffffc020a792:	8522                	mv	a0,s0
ffffffffc020a794:	7442                	ld	s0,48(sp)
ffffffffc020a796:	74a2                	ld	s1,40(sp)
ffffffffc020a798:	7902                	ld	s2,32(sp)
ffffffffc020a79a:	69e2                	ld	s3,24(sp)
ffffffffc020a79c:	6a42                	ld	s4,16(sp)
ffffffffc020a79e:	6aa2                	ld	s5,8(sp)
ffffffffc020a7a0:	6121                	addi	sp,sp,64
ffffffffc020a7a2:	8082                	ret
ffffffffc020a7a4:	fb840a13          	addi	s4,s0,-72
ffffffffc020a7a8:	8552                	mv	a0,s4
ffffffffc020a7aa:	89cfd0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc020a7ae:	4785                	li	a5,1
ffffffffc020a7b0:	fcf51ae3          	bne	a0,a5,ffffffffc020a784 <sfs_load_inode+0x128>
ffffffffc020a7b4:	fd042783          	lw	a5,-48(s0)
ffffffffc020a7b8:	2785                	addiw	a5,a5,1
ffffffffc020a7ba:	fcf42823          	sw	a5,-48(s0)
ffffffffc020a7be:	b7d9                	j	ffffffffc020a784 <sfs_load_inode+0x128>
ffffffffc020a7c0:	5471                	li	s0,-4
ffffffffc020a7c2:	8556                	mv	a0,s5
ffffffffc020a7c4:	87bf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a7c8:	854a                	mv	a0,s2
ffffffffc020a7ca:	78c000ef          	jal	ra,ffffffffc020af56 <unlock_sfs_fs>
ffffffffc020a7ce:	b7c9                	j	ffffffffc020a790 <sfs_load_inode+0x134>
ffffffffc020a7d0:	4789                	li	a5,2
ffffffffc020a7d2:	08f69f63          	bne	a3,a5,ffffffffc020a870 <sfs_load_inode+0x214>
ffffffffc020a7d6:	864a                	mv	a2,s2
ffffffffc020a7d8:	00005597          	auipc	a1,0x5
ffffffffc020a7dc:	a1858593          	addi	a1,a1,-1512 # ffffffffc020f1f0 <sfs_node_dirops>
ffffffffc020a7e0:	804fd0ef          	jal	ra,ffffffffc02077e4 <inode_init>
ffffffffc020a7e4:	058a2703          	lw	a4,88(s4)
ffffffffc020a7e8:	6785                	lui	a5,0x1
ffffffffc020a7ea:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a7ee:	f2f704e3          	beq	a4,a5,ffffffffc020a716 <sfs_load_inode+0xba>
ffffffffc020a7f2:	00004697          	auipc	a3,0x4
ffffffffc020a7f6:	6c668693          	addi	a3,a3,1734 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020a7fa:	00001617          	auipc	a2,0x1
ffffffffc020a7fe:	18660613          	addi	a2,a2,390 # ffffffffc020b980 <commands+0x210>
ffffffffc020a802:	07700593          	li	a1,119
ffffffffc020a806:	00004517          	auipc	a0,0x4
ffffffffc020a80a:	6ea50513          	addi	a0,a0,1770 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a80e:	c91f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a812:	5471                	li	s0,-4
ffffffffc020a814:	bf55                	j	ffffffffc020a7c8 <sfs_load_inode+0x16c>
ffffffffc020a816:	00005697          	auipc	a3,0x5
ffffffffc020a81a:	96268693          	addi	a3,a3,-1694 # ffffffffc020f178 <dev_node_ops+0x848>
ffffffffc020a81e:	00001617          	auipc	a2,0x1
ffffffffc020a822:	16260613          	addi	a2,a2,354 # ffffffffc020b980 <commands+0x210>
ffffffffc020a826:	0ad00593          	li	a1,173
ffffffffc020a82a:	00004517          	auipc	a0,0x4
ffffffffc020a82e:	6c650513          	addi	a0,a0,1734 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a832:	c6df50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a836:	8726                	mv	a4,s1
ffffffffc020a838:	00004617          	auipc	a2,0x4
ffffffffc020a83c:	6e860613          	addi	a2,a2,1768 # ffffffffc020ef20 <dev_node_ops+0x5f0>
ffffffffc020a840:	05300593          	li	a1,83
ffffffffc020a844:	00004517          	auipc	a0,0x4
ffffffffc020a848:	6ac50513          	addi	a0,a0,1708 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a84c:	c53f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a850:	00004697          	auipc	a3,0x4
ffffffffc020a854:	70868693          	addi	a3,a3,1800 # ffffffffc020ef58 <dev_node_ops+0x628>
ffffffffc020a858:	00001617          	auipc	a2,0x1
ffffffffc020a85c:	12860613          	addi	a2,a2,296 # ffffffffc020b980 <commands+0x210>
ffffffffc020a860:	0a800593          	li	a1,168
ffffffffc020a864:	00004517          	auipc	a0,0x4
ffffffffc020a868:	68c50513          	addi	a0,a0,1676 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a86c:	c33f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a870:	00004617          	auipc	a2,0x4
ffffffffc020a874:	69860613          	addi	a2,a2,1688 # ffffffffc020ef08 <dev_node_ops+0x5d8>
ffffffffc020a878:	02e00593          	li	a1,46
ffffffffc020a87c:	00004517          	auipc	a0,0x4
ffffffffc020a880:	67450513          	addi	a0,a0,1652 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a884:	c1bf50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a888:	00004697          	auipc	a3,0x4
ffffffffc020a88c:	63068693          	addi	a3,a3,1584 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020a890:	00001617          	auipc	a2,0x1
ffffffffc020a894:	0f060613          	addi	a2,a2,240 # ffffffffc020b980 <commands+0x210>
ffffffffc020a898:	0b100593          	li	a1,177
ffffffffc020a89c:	00004517          	auipc	a0,0x4
ffffffffc020a8a0:	65450513          	addi	a0,a0,1620 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a8a4:	bfbf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a8a8 <sfs_lookup>:
ffffffffc020a8a8:	7139                	addi	sp,sp,-64
ffffffffc020a8aa:	ec4e                	sd	s3,24(sp)
ffffffffc020a8ac:	06853983          	ld	s3,104(a0)
ffffffffc020a8b0:	fc06                	sd	ra,56(sp)
ffffffffc020a8b2:	f822                	sd	s0,48(sp)
ffffffffc020a8b4:	f426                	sd	s1,40(sp)
ffffffffc020a8b6:	f04a                	sd	s2,32(sp)
ffffffffc020a8b8:	e852                	sd	s4,16(sp)
ffffffffc020a8ba:	0a098c63          	beqz	s3,ffffffffc020a972 <sfs_lookup+0xca>
ffffffffc020a8be:	0b09a783          	lw	a5,176(s3)
ffffffffc020a8c2:	ebc5                	bnez	a5,ffffffffc020a972 <sfs_lookup+0xca>
ffffffffc020a8c4:	0005c783          	lbu	a5,0(a1)
ffffffffc020a8c8:	84ae                	mv	s1,a1
ffffffffc020a8ca:	c7c1                	beqz	a5,ffffffffc020a952 <sfs_lookup+0xaa>
ffffffffc020a8cc:	02f00713          	li	a4,47
ffffffffc020a8d0:	08e78163          	beq	a5,a4,ffffffffc020a952 <sfs_lookup+0xaa>
ffffffffc020a8d4:	842a                	mv	s0,a0
ffffffffc020a8d6:	8a32                	mv	s4,a2
ffffffffc020a8d8:	f6ffc0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc020a8dc:	4c38                	lw	a4,88(s0)
ffffffffc020a8de:	6785                	lui	a5,0x1
ffffffffc020a8e0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a8e4:	0af71763          	bne	a4,a5,ffffffffc020a992 <sfs_lookup+0xea>
ffffffffc020a8e8:	6018                	ld	a4,0(s0)
ffffffffc020a8ea:	4789                	li	a5,2
ffffffffc020a8ec:	00475703          	lhu	a4,4(a4)
ffffffffc020a8f0:	04f71c63          	bne	a4,a5,ffffffffc020a948 <sfs_lookup+0xa0>
ffffffffc020a8f4:	02040913          	addi	s2,s0,32
ffffffffc020a8f8:	854a                	mv	a0,s2
ffffffffc020a8fa:	c6bf90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020a8fe:	8626                	mv	a2,s1
ffffffffc020a900:	0054                	addi	a3,sp,4
ffffffffc020a902:	85a2                	mv	a1,s0
ffffffffc020a904:	854e                	mv	a0,s3
ffffffffc020a906:	a29ff0ef          	jal	ra,ffffffffc020a32e <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a90a:	84aa                	mv	s1,a0
ffffffffc020a90c:	854a                	mv	a0,s2
ffffffffc020a90e:	c53f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020a912:	cc89                	beqz	s1,ffffffffc020a92c <sfs_lookup+0x84>
ffffffffc020a914:	8522                	mv	a0,s0
ffffffffc020a916:	ffffc0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020a91a:	70e2                	ld	ra,56(sp)
ffffffffc020a91c:	7442                	ld	s0,48(sp)
ffffffffc020a91e:	7902                	ld	s2,32(sp)
ffffffffc020a920:	69e2                	ld	s3,24(sp)
ffffffffc020a922:	6a42                	ld	s4,16(sp)
ffffffffc020a924:	8526                	mv	a0,s1
ffffffffc020a926:	74a2                	ld	s1,40(sp)
ffffffffc020a928:	6121                	addi	sp,sp,64
ffffffffc020a92a:	8082                	ret
ffffffffc020a92c:	4612                	lw	a2,4(sp)
ffffffffc020a92e:	002c                	addi	a1,sp,8
ffffffffc020a930:	854e                	mv	a0,s3
ffffffffc020a932:	d2bff0ef          	jal	ra,ffffffffc020a65c <sfs_load_inode>
ffffffffc020a936:	84aa                	mv	s1,a0
ffffffffc020a938:	8522                	mv	a0,s0
ffffffffc020a93a:	fdbfc0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020a93e:	fcf1                	bnez	s1,ffffffffc020a91a <sfs_lookup+0x72>
ffffffffc020a940:	67a2                	ld	a5,8(sp)
ffffffffc020a942:	00fa3023          	sd	a5,0(s4)
ffffffffc020a946:	bfd1                	j	ffffffffc020a91a <sfs_lookup+0x72>
ffffffffc020a948:	8522                	mv	a0,s0
ffffffffc020a94a:	fcbfc0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020a94e:	54b9                	li	s1,-18
ffffffffc020a950:	b7e9                	j	ffffffffc020a91a <sfs_lookup+0x72>
ffffffffc020a952:	00005697          	auipc	a3,0x5
ffffffffc020a956:	83e68693          	addi	a3,a3,-1986 # ffffffffc020f190 <dev_node_ops+0x860>
ffffffffc020a95a:	00001617          	auipc	a2,0x1
ffffffffc020a95e:	02660613          	addi	a2,a2,38 # ffffffffc020b980 <commands+0x210>
ffffffffc020a962:	3da00593          	li	a1,986
ffffffffc020a966:	00004517          	auipc	a0,0x4
ffffffffc020a96a:	58a50513          	addi	a0,a0,1418 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a96e:	b31f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a972:	00004697          	auipc	a3,0x4
ffffffffc020a976:	39e68693          	addi	a3,a3,926 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020a97a:	00001617          	auipc	a2,0x1
ffffffffc020a97e:	00660613          	addi	a2,a2,6 # ffffffffc020b980 <commands+0x210>
ffffffffc020a982:	3d900593          	li	a1,985
ffffffffc020a986:	00004517          	auipc	a0,0x4
ffffffffc020a98a:	56a50513          	addi	a0,a0,1386 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a98e:	b11f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a992:	00004697          	auipc	a3,0x4
ffffffffc020a996:	52668693          	addi	a3,a3,1318 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020a99a:	00001617          	auipc	a2,0x1
ffffffffc020a99e:	fe660613          	addi	a2,a2,-26 # ffffffffc020b980 <commands+0x210>
ffffffffc020a9a2:	3dc00593          	li	a1,988
ffffffffc020a9a6:	00004517          	auipc	a0,0x4
ffffffffc020a9aa:	54a50513          	addi	a0,a0,1354 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020a9ae:	af1f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a9b2 <sfs_namefile>:
ffffffffc020a9b2:	6d98                	ld	a4,24(a1)
ffffffffc020a9b4:	7175                	addi	sp,sp,-144
ffffffffc020a9b6:	e506                	sd	ra,136(sp)
ffffffffc020a9b8:	e122                	sd	s0,128(sp)
ffffffffc020a9ba:	fca6                	sd	s1,120(sp)
ffffffffc020a9bc:	f8ca                	sd	s2,112(sp)
ffffffffc020a9be:	f4ce                	sd	s3,104(sp)
ffffffffc020a9c0:	f0d2                	sd	s4,96(sp)
ffffffffc020a9c2:	ecd6                	sd	s5,88(sp)
ffffffffc020a9c4:	e8da                	sd	s6,80(sp)
ffffffffc020a9c6:	e4de                	sd	s7,72(sp)
ffffffffc020a9c8:	e0e2                	sd	s8,64(sp)
ffffffffc020a9ca:	fc66                	sd	s9,56(sp)
ffffffffc020a9cc:	f86a                	sd	s10,48(sp)
ffffffffc020a9ce:	f46e                	sd	s11,40(sp)
ffffffffc020a9d0:	e42e                	sd	a1,8(sp)
ffffffffc020a9d2:	4789                	li	a5,2
ffffffffc020a9d4:	1ae7f363          	bgeu	a5,a4,ffffffffc020ab7a <sfs_namefile+0x1c8>
ffffffffc020a9d8:	89aa                	mv	s3,a0
ffffffffc020a9da:	10400513          	li	a0,260
ffffffffc020a9de:	db0f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a9e2:	842a                	mv	s0,a0
ffffffffc020a9e4:	18050b63          	beqz	a0,ffffffffc020ab7a <sfs_namefile+0x1c8>
ffffffffc020a9e8:	0689b483          	ld	s1,104(s3)
ffffffffc020a9ec:	1e048963          	beqz	s1,ffffffffc020abde <sfs_namefile+0x22c>
ffffffffc020a9f0:	0b04a783          	lw	a5,176(s1)
ffffffffc020a9f4:	1e079563          	bnez	a5,ffffffffc020abde <sfs_namefile+0x22c>
ffffffffc020a9f8:	0589ac83          	lw	s9,88(s3)
ffffffffc020a9fc:	6785                	lui	a5,0x1
ffffffffc020a9fe:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020aa02:	1afc9e63          	bne	s9,a5,ffffffffc020abbe <sfs_namefile+0x20c>
ffffffffc020aa06:	6722                	ld	a4,8(sp)
ffffffffc020aa08:	854e                	mv	a0,s3
ffffffffc020aa0a:	8ace                	mv	s5,s3
ffffffffc020aa0c:	6f1c                	ld	a5,24(a4)
ffffffffc020aa0e:	00073b03          	ld	s6,0(a4)
ffffffffc020aa12:	02098a13          	addi	s4,s3,32
ffffffffc020aa16:	ffe78b93          	addi	s7,a5,-2
ffffffffc020aa1a:	9b3e                	add	s6,s6,a5
ffffffffc020aa1c:	00004d17          	auipc	s10,0x4
ffffffffc020aa20:	794d0d13          	addi	s10,s10,1940 # ffffffffc020f1b0 <dev_node_ops+0x880>
ffffffffc020aa24:	e23fc0ef          	jal	ra,ffffffffc0207846 <inode_ref_inc>
ffffffffc020aa28:	00440c13          	addi	s8,s0,4
ffffffffc020aa2c:	e066                	sd	s9,0(sp)
ffffffffc020aa2e:	8552                	mv	a0,s4
ffffffffc020aa30:	b35f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020aa34:	0854                	addi	a3,sp,20
ffffffffc020aa36:	866a                	mv	a2,s10
ffffffffc020aa38:	85d6                	mv	a1,s5
ffffffffc020aa3a:	8526                	mv	a0,s1
ffffffffc020aa3c:	8f3ff0ef          	jal	ra,ffffffffc020a32e <sfs_dirent_search_nolock.constprop.0>
ffffffffc020aa40:	8daa                	mv	s11,a0
ffffffffc020aa42:	8552                	mv	a0,s4
ffffffffc020aa44:	b1df90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020aa48:	020d8863          	beqz	s11,ffffffffc020aa78 <sfs_namefile+0xc6>
ffffffffc020aa4c:	854e                	mv	a0,s3
ffffffffc020aa4e:	ec7fc0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020aa52:	8522                	mv	a0,s0
ffffffffc020aa54:	deaf70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020aa58:	60aa                	ld	ra,136(sp)
ffffffffc020aa5a:	640a                	ld	s0,128(sp)
ffffffffc020aa5c:	74e6                	ld	s1,120(sp)
ffffffffc020aa5e:	7946                	ld	s2,112(sp)
ffffffffc020aa60:	79a6                	ld	s3,104(sp)
ffffffffc020aa62:	7a06                	ld	s4,96(sp)
ffffffffc020aa64:	6ae6                	ld	s5,88(sp)
ffffffffc020aa66:	6b46                	ld	s6,80(sp)
ffffffffc020aa68:	6ba6                	ld	s7,72(sp)
ffffffffc020aa6a:	6c06                	ld	s8,64(sp)
ffffffffc020aa6c:	7ce2                	ld	s9,56(sp)
ffffffffc020aa6e:	7d42                	ld	s10,48(sp)
ffffffffc020aa70:	856e                	mv	a0,s11
ffffffffc020aa72:	7da2                	ld	s11,40(sp)
ffffffffc020aa74:	6149                	addi	sp,sp,144
ffffffffc020aa76:	8082                	ret
ffffffffc020aa78:	4652                	lw	a2,20(sp)
ffffffffc020aa7a:	082c                	addi	a1,sp,24
ffffffffc020aa7c:	8526                	mv	a0,s1
ffffffffc020aa7e:	bdfff0ef          	jal	ra,ffffffffc020a65c <sfs_load_inode>
ffffffffc020aa82:	8daa                	mv	s11,a0
ffffffffc020aa84:	f561                	bnez	a0,ffffffffc020aa4c <sfs_namefile+0x9a>
ffffffffc020aa86:	854e                	mv	a0,s3
ffffffffc020aa88:	008aa903          	lw	s2,8(s5)
ffffffffc020aa8c:	e89fc0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020aa90:	6ce2                	ld	s9,24(sp)
ffffffffc020aa92:	0b3c8463          	beq	s9,s3,ffffffffc020ab3a <sfs_namefile+0x188>
ffffffffc020aa96:	100c8463          	beqz	s9,ffffffffc020ab9e <sfs_namefile+0x1ec>
ffffffffc020aa9a:	058ca703          	lw	a4,88(s9)
ffffffffc020aa9e:	6782                	ld	a5,0(sp)
ffffffffc020aaa0:	0ef71f63          	bne	a4,a5,ffffffffc020ab9e <sfs_namefile+0x1ec>
ffffffffc020aaa4:	008ca703          	lw	a4,8(s9)
ffffffffc020aaa8:	8ae6                	mv	s5,s9
ffffffffc020aaaa:	0d270a63          	beq	a4,s2,ffffffffc020ab7e <sfs_namefile+0x1cc>
ffffffffc020aaae:	000cb703          	ld	a4,0(s9)
ffffffffc020aab2:	4789                	li	a5,2
ffffffffc020aab4:	00475703          	lhu	a4,4(a4)
ffffffffc020aab8:	0cf71363          	bne	a4,a5,ffffffffc020ab7e <sfs_namefile+0x1cc>
ffffffffc020aabc:	020c8a13          	addi	s4,s9,32
ffffffffc020aac0:	8552                	mv	a0,s4
ffffffffc020aac2:	aa3f90ef          	jal	ra,ffffffffc0204564 <down>
ffffffffc020aac6:	000cb703          	ld	a4,0(s9)
ffffffffc020aaca:	00872983          	lw	s3,8(a4)
ffffffffc020aace:	01304963          	bgtz	s3,ffffffffc020aae0 <sfs_namefile+0x12e>
ffffffffc020aad2:	a899                	j	ffffffffc020ab28 <sfs_namefile+0x176>
ffffffffc020aad4:	4018                	lw	a4,0(s0)
ffffffffc020aad6:	01270e63          	beq	a4,s2,ffffffffc020aaf2 <sfs_namefile+0x140>
ffffffffc020aada:	2d85                	addiw	s11,s11,1
ffffffffc020aadc:	05b98663          	beq	s3,s11,ffffffffc020ab28 <sfs_namefile+0x176>
ffffffffc020aae0:	86a2                	mv	a3,s0
ffffffffc020aae2:	866e                	mv	a2,s11
ffffffffc020aae4:	85e6                	mv	a1,s9
ffffffffc020aae6:	8526                	mv	a0,s1
ffffffffc020aae8:	e48ff0ef          	jal	ra,ffffffffc020a130 <sfs_dirent_read_nolock>
ffffffffc020aaec:	872a                	mv	a4,a0
ffffffffc020aaee:	d17d                	beqz	a0,ffffffffc020aad4 <sfs_namefile+0x122>
ffffffffc020aaf0:	a82d                	j	ffffffffc020ab2a <sfs_namefile+0x178>
ffffffffc020aaf2:	8552                	mv	a0,s4
ffffffffc020aaf4:	a6df90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020aaf8:	8562                	mv	a0,s8
ffffffffc020aafa:	0ff000ef          	jal	ra,ffffffffc020b3f8 <strlen>
ffffffffc020aafe:	00150793          	addi	a5,a0,1
ffffffffc020ab02:	862a                	mv	a2,a0
ffffffffc020ab04:	06fbe863          	bltu	s7,a5,ffffffffc020ab74 <sfs_namefile+0x1c2>
ffffffffc020ab08:	fff64913          	not	s2,a2
ffffffffc020ab0c:	995a                	add	s2,s2,s6
ffffffffc020ab0e:	85e2                	mv	a1,s8
ffffffffc020ab10:	854a                	mv	a0,s2
ffffffffc020ab12:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020ab16:	1d7000ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020ab1a:	02f00793          	li	a5,47
ffffffffc020ab1e:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020ab22:	89e6                	mv	s3,s9
ffffffffc020ab24:	8b4a                	mv	s6,s2
ffffffffc020ab26:	b721                	j	ffffffffc020aa2e <sfs_namefile+0x7c>
ffffffffc020ab28:	5741                	li	a4,-16
ffffffffc020ab2a:	8552                	mv	a0,s4
ffffffffc020ab2c:	e03a                	sd	a4,0(sp)
ffffffffc020ab2e:	a33f90ef          	jal	ra,ffffffffc0204560 <up>
ffffffffc020ab32:	6702                	ld	a4,0(sp)
ffffffffc020ab34:	89e6                	mv	s3,s9
ffffffffc020ab36:	8dba                	mv	s11,a4
ffffffffc020ab38:	bf11                	j	ffffffffc020aa4c <sfs_namefile+0x9a>
ffffffffc020ab3a:	854e                	mv	a0,s3
ffffffffc020ab3c:	dd9fc0ef          	jal	ra,ffffffffc0207914 <inode_ref_dec>
ffffffffc020ab40:	64a2                	ld	s1,8(sp)
ffffffffc020ab42:	85da                	mv	a1,s6
ffffffffc020ab44:	6c98                	ld	a4,24(s1)
ffffffffc020ab46:	6088                	ld	a0,0(s1)
ffffffffc020ab48:	1779                	addi	a4,a4,-2
ffffffffc020ab4a:	41770bb3          	sub	s7,a4,s7
ffffffffc020ab4e:	865e                	mv	a2,s7
ffffffffc020ab50:	0505                	addi	a0,a0,1
ffffffffc020ab52:	15b000ef          	jal	ra,ffffffffc020b4ac <memmove>
ffffffffc020ab56:	02f00713          	li	a4,47
ffffffffc020ab5a:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020ab5e:	955e                	add	a0,a0,s7
ffffffffc020ab60:	00050023          	sb	zero,0(a0)
ffffffffc020ab64:	85de                	mv	a1,s7
ffffffffc020ab66:	8526                	mv	a0,s1
ffffffffc020ab68:	8f1fa0ef          	jal	ra,ffffffffc0205458 <iobuf_skip>
ffffffffc020ab6c:	8522                	mv	a0,s0
ffffffffc020ab6e:	cd0f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020ab72:	b5dd                	j	ffffffffc020aa58 <sfs_namefile+0xa6>
ffffffffc020ab74:	89e6                	mv	s3,s9
ffffffffc020ab76:	5df1                	li	s11,-4
ffffffffc020ab78:	bdd1                	j	ffffffffc020aa4c <sfs_namefile+0x9a>
ffffffffc020ab7a:	5df1                	li	s11,-4
ffffffffc020ab7c:	bdf1                	j	ffffffffc020aa58 <sfs_namefile+0xa6>
ffffffffc020ab7e:	00004697          	auipc	a3,0x4
ffffffffc020ab82:	63a68693          	addi	a3,a3,1594 # ffffffffc020f1b8 <dev_node_ops+0x888>
ffffffffc020ab86:	00001617          	auipc	a2,0x1
ffffffffc020ab8a:	dfa60613          	addi	a2,a2,-518 # ffffffffc020b980 <commands+0x210>
ffffffffc020ab8e:	2f800593          	li	a1,760
ffffffffc020ab92:	00004517          	auipc	a0,0x4
ffffffffc020ab96:	35e50513          	addi	a0,a0,862 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020ab9a:	905f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020ab9e:	00004697          	auipc	a3,0x4
ffffffffc020aba2:	31a68693          	addi	a3,a3,794 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020aba6:	00001617          	auipc	a2,0x1
ffffffffc020abaa:	dda60613          	addi	a2,a2,-550 # ffffffffc020b980 <commands+0x210>
ffffffffc020abae:	2f700593          	li	a1,759
ffffffffc020abb2:	00004517          	auipc	a0,0x4
ffffffffc020abb6:	33e50513          	addi	a0,a0,830 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020abba:	8e5f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abbe:	00004697          	auipc	a3,0x4
ffffffffc020abc2:	2fa68693          	addi	a3,a3,762 # ffffffffc020eeb8 <dev_node_ops+0x588>
ffffffffc020abc6:	00001617          	auipc	a2,0x1
ffffffffc020abca:	dba60613          	addi	a2,a2,-582 # ffffffffc020b980 <commands+0x210>
ffffffffc020abce:	2e400593          	li	a1,740
ffffffffc020abd2:	00004517          	auipc	a0,0x4
ffffffffc020abd6:	31e50513          	addi	a0,a0,798 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020abda:	8c5f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020abde:	00004697          	auipc	a3,0x4
ffffffffc020abe2:	13268693          	addi	a3,a3,306 # ffffffffc020ed10 <dev_node_ops+0x3e0>
ffffffffc020abe6:	00001617          	auipc	a2,0x1
ffffffffc020abea:	d9a60613          	addi	a2,a2,-614 # ffffffffc020b980 <commands+0x210>
ffffffffc020abee:	2e300593          	li	a1,739
ffffffffc020abf2:	00004517          	auipc	a0,0x4
ffffffffc020abf6:	2fe50513          	addi	a0,a0,766 # ffffffffc020eef0 <dev_node_ops+0x5c0>
ffffffffc020abfa:	8a5f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020abfe <sfs_rwblock_nolock>:
ffffffffc020abfe:	7139                	addi	sp,sp,-64
ffffffffc020ac00:	f822                	sd	s0,48(sp)
ffffffffc020ac02:	f426                	sd	s1,40(sp)
ffffffffc020ac04:	fc06                	sd	ra,56(sp)
ffffffffc020ac06:	842a                	mv	s0,a0
ffffffffc020ac08:	84b6                	mv	s1,a3
ffffffffc020ac0a:	e211                	bnez	a2,ffffffffc020ac0e <sfs_rwblock_nolock+0x10>
ffffffffc020ac0c:	e715                	bnez	a4,ffffffffc020ac38 <sfs_rwblock_nolock+0x3a>
ffffffffc020ac0e:	405c                	lw	a5,4(s0)
ffffffffc020ac10:	02f67463          	bgeu	a2,a5,ffffffffc020ac38 <sfs_rwblock_nolock+0x3a>
ffffffffc020ac14:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020ac18:	1682                	slli	a3,a3,0x20
ffffffffc020ac1a:	6605                	lui	a2,0x1
ffffffffc020ac1c:	9281                	srli	a3,a3,0x20
ffffffffc020ac1e:	850a                	mv	a0,sp
ffffffffc020ac20:	fc2fa0ef          	jal	ra,ffffffffc02053e2 <iobuf_init>
ffffffffc020ac24:	85aa                	mv	a1,a0
ffffffffc020ac26:	7808                	ld	a0,48(s0)
ffffffffc020ac28:	8626                	mv	a2,s1
ffffffffc020ac2a:	7118                	ld	a4,32(a0)
ffffffffc020ac2c:	9702                	jalr	a4
ffffffffc020ac2e:	70e2                	ld	ra,56(sp)
ffffffffc020ac30:	7442                	ld	s0,48(sp)
ffffffffc020ac32:	74a2                	ld	s1,40(sp)
ffffffffc020ac34:	6121                	addi	sp,sp,64
ffffffffc020ac36:	8082                	ret
ffffffffc020ac38:	00004697          	auipc	a3,0x4
ffffffffc020ac3c:	6b868693          	addi	a3,a3,1720 # ffffffffc020f2f0 <sfs_node_fileops+0x80>
ffffffffc020ac40:	00001617          	auipc	a2,0x1
ffffffffc020ac44:	d4060613          	addi	a2,a2,-704 # ffffffffc020b980 <commands+0x210>
ffffffffc020ac48:	45d5                	li	a1,21
ffffffffc020ac4a:	00004517          	auipc	a0,0x4
ffffffffc020ac4e:	6de50513          	addi	a0,a0,1758 # ffffffffc020f328 <sfs_node_fileops+0xb8>
ffffffffc020ac52:	84df50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ac56 <sfs_rblock>:
ffffffffc020ac56:	7139                	addi	sp,sp,-64
ffffffffc020ac58:	ec4e                	sd	s3,24(sp)
ffffffffc020ac5a:	89b6                	mv	s3,a3
ffffffffc020ac5c:	f822                	sd	s0,48(sp)
ffffffffc020ac5e:	f04a                	sd	s2,32(sp)
ffffffffc020ac60:	e852                	sd	s4,16(sp)
ffffffffc020ac62:	fc06                	sd	ra,56(sp)
ffffffffc020ac64:	f426                	sd	s1,40(sp)
ffffffffc020ac66:	e456                	sd	s5,8(sp)
ffffffffc020ac68:	8a2a                	mv	s4,a0
ffffffffc020ac6a:	892e                	mv	s2,a1
ffffffffc020ac6c:	8432                	mv	s0,a2
ffffffffc020ac6e:	2e0000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020ac72:	04098063          	beqz	s3,ffffffffc020acb2 <sfs_rblock+0x5c>
ffffffffc020ac76:	013409bb          	addw	s3,s0,s3
ffffffffc020ac7a:	6a85                	lui	s5,0x1
ffffffffc020ac7c:	a021                	j	ffffffffc020ac84 <sfs_rblock+0x2e>
ffffffffc020ac7e:	9956                	add	s2,s2,s5
ffffffffc020ac80:	02898963          	beq	s3,s0,ffffffffc020acb2 <sfs_rblock+0x5c>
ffffffffc020ac84:	8622                	mv	a2,s0
ffffffffc020ac86:	85ca                	mv	a1,s2
ffffffffc020ac88:	4705                	li	a4,1
ffffffffc020ac8a:	4681                	li	a3,0
ffffffffc020ac8c:	8552                	mv	a0,s4
ffffffffc020ac8e:	f71ff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020ac92:	84aa                	mv	s1,a0
ffffffffc020ac94:	2405                	addiw	s0,s0,1
ffffffffc020ac96:	d565                	beqz	a0,ffffffffc020ac7e <sfs_rblock+0x28>
ffffffffc020ac98:	8552                	mv	a0,s4
ffffffffc020ac9a:	2c4000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020ac9e:	70e2                	ld	ra,56(sp)
ffffffffc020aca0:	7442                	ld	s0,48(sp)
ffffffffc020aca2:	7902                	ld	s2,32(sp)
ffffffffc020aca4:	69e2                	ld	s3,24(sp)
ffffffffc020aca6:	6a42                	ld	s4,16(sp)
ffffffffc020aca8:	6aa2                	ld	s5,8(sp)
ffffffffc020acaa:	8526                	mv	a0,s1
ffffffffc020acac:	74a2                	ld	s1,40(sp)
ffffffffc020acae:	6121                	addi	sp,sp,64
ffffffffc020acb0:	8082                	ret
ffffffffc020acb2:	4481                	li	s1,0
ffffffffc020acb4:	b7d5                	j	ffffffffc020ac98 <sfs_rblock+0x42>

ffffffffc020acb6 <sfs_wblock>:
ffffffffc020acb6:	7139                	addi	sp,sp,-64
ffffffffc020acb8:	ec4e                	sd	s3,24(sp)
ffffffffc020acba:	89b6                	mv	s3,a3
ffffffffc020acbc:	f822                	sd	s0,48(sp)
ffffffffc020acbe:	f04a                	sd	s2,32(sp)
ffffffffc020acc0:	e852                	sd	s4,16(sp)
ffffffffc020acc2:	fc06                	sd	ra,56(sp)
ffffffffc020acc4:	f426                	sd	s1,40(sp)
ffffffffc020acc6:	e456                	sd	s5,8(sp)
ffffffffc020acc8:	8a2a                	mv	s4,a0
ffffffffc020acca:	892e                	mv	s2,a1
ffffffffc020accc:	8432                	mv	s0,a2
ffffffffc020acce:	280000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020acd2:	04098063          	beqz	s3,ffffffffc020ad12 <sfs_wblock+0x5c>
ffffffffc020acd6:	013409bb          	addw	s3,s0,s3
ffffffffc020acda:	6a85                	lui	s5,0x1
ffffffffc020acdc:	a021                	j	ffffffffc020ace4 <sfs_wblock+0x2e>
ffffffffc020acde:	9956                	add	s2,s2,s5
ffffffffc020ace0:	02898963          	beq	s3,s0,ffffffffc020ad12 <sfs_wblock+0x5c>
ffffffffc020ace4:	8622                	mv	a2,s0
ffffffffc020ace6:	85ca                	mv	a1,s2
ffffffffc020ace8:	4705                	li	a4,1
ffffffffc020acea:	4685                	li	a3,1
ffffffffc020acec:	8552                	mv	a0,s4
ffffffffc020acee:	f11ff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020acf2:	84aa                	mv	s1,a0
ffffffffc020acf4:	2405                	addiw	s0,s0,1
ffffffffc020acf6:	d565                	beqz	a0,ffffffffc020acde <sfs_wblock+0x28>
ffffffffc020acf8:	8552                	mv	a0,s4
ffffffffc020acfa:	264000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020acfe:	70e2                	ld	ra,56(sp)
ffffffffc020ad00:	7442                	ld	s0,48(sp)
ffffffffc020ad02:	7902                	ld	s2,32(sp)
ffffffffc020ad04:	69e2                	ld	s3,24(sp)
ffffffffc020ad06:	6a42                	ld	s4,16(sp)
ffffffffc020ad08:	6aa2                	ld	s5,8(sp)
ffffffffc020ad0a:	8526                	mv	a0,s1
ffffffffc020ad0c:	74a2                	ld	s1,40(sp)
ffffffffc020ad0e:	6121                	addi	sp,sp,64
ffffffffc020ad10:	8082                	ret
ffffffffc020ad12:	4481                	li	s1,0
ffffffffc020ad14:	b7d5                	j	ffffffffc020acf8 <sfs_wblock+0x42>

ffffffffc020ad16 <sfs_rbuf>:
ffffffffc020ad16:	7179                	addi	sp,sp,-48
ffffffffc020ad18:	f406                	sd	ra,40(sp)
ffffffffc020ad1a:	f022                	sd	s0,32(sp)
ffffffffc020ad1c:	ec26                	sd	s1,24(sp)
ffffffffc020ad1e:	e84a                	sd	s2,16(sp)
ffffffffc020ad20:	e44e                	sd	s3,8(sp)
ffffffffc020ad22:	e052                	sd	s4,0(sp)
ffffffffc020ad24:	6785                	lui	a5,0x1
ffffffffc020ad26:	04f77863          	bgeu	a4,a5,ffffffffc020ad76 <sfs_rbuf+0x60>
ffffffffc020ad2a:	84ba                	mv	s1,a4
ffffffffc020ad2c:	9732                	add	a4,a4,a2
ffffffffc020ad2e:	89b2                	mv	s3,a2
ffffffffc020ad30:	04e7e363          	bltu	a5,a4,ffffffffc020ad76 <sfs_rbuf+0x60>
ffffffffc020ad34:	8936                	mv	s2,a3
ffffffffc020ad36:	842a                	mv	s0,a0
ffffffffc020ad38:	8a2e                	mv	s4,a1
ffffffffc020ad3a:	214000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020ad3e:	642c                	ld	a1,72(s0)
ffffffffc020ad40:	864a                	mv	a2,s2
ffffffffc020ad42:	4705                	li	a4,1
ffffffffc020ad44:	4681                	li	a3,0
ffffffffc020ad46:	8522                	mv	a0,s0
ffffffffc020ad48:	eb7ff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020ad4c:	892a                	mv	s2,a0
ffffffffc020ad4e:	cd09                	beqz	a0,ffffffffc020ad68 <sfs_rbuf+0x52>
ffffffffc020ad50:	8522                	mv	a0,s0
ffffffffc020ad52:	20c000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020ad56:	70a2                	ld	ra,40(sp)
ffffffffc020ad58:	7402                	ld	s0,32(sp)
ffffffffc020ad5a:	64e2                	ld	s1,24(sp)
ffffffffc020ad5c:	69a2                	ld	s3,8(sp)
ffffffffc020ad5e:	6a02                	ld	s4,0(sp)
ffffffffc020ad60:	854a                	mv	a0,s2
ffffffffc020ad62:	6942                	ld	s2,16(sp)
ffffffffc020ad64:	6145                	addi	sp,sp,48
ffffffffc020ad66:	8082                	ret
ffffffffc020ad68:	642c                	ld	a1,72(s0)
ffffffffc020ad6a:	864e                	mv	a2,s3
ffffffffc020ad6c:	8552                	mv	a0,s4
ffffffffc020ad6e:	95a6                	add	a1,a1,s1
ffffffffc020ad70:	77c000ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020ad74:	bff1                	j	ffffffffc020ad50 <sfs_rbuf+0x3a>
ffffffffc020ad76:	00004697          	auipc	a3,0x4
ffffffffc020ad7a:	5ca68693          	addi	a3,a3,1482 # ffffffffc020f340 <sfs_node_fileops+0xd0>
ffffffffc020ad7e:	00001617          	auipc	a2,0x1
ffffffffc020ad82:	c0260613          	addi	a2,a2,-1022 # ffffffffc020b980 <commands+0x210>
ffffffffc020ad86:	05500593          	li	a1,85
ffffffffc020ad8a:	00004517          	auipc	a0,0x4
ffffffffc020ad8e:	59e50513          	addi	a0,a0,1438 # ffffffffc020f328 <sfs_node_fileops+0xb8>
ffffffffc020ad92:	f0cf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ad96 <sfs_wbuf>:
ffffffffc020ad96:	7139                	addi	sp,sp,-64
ffffffffc020ad98:	fc06                	sd	ra,56(sp)
ffffffffc020ad9a:	f822                	sd	s0,48(sp)
ffffffffc020ad9c:	f426                	sd	s1,40(sp)
ffffffffc020ad9e:	f04a                	sd	s2,32(sp)
ffffffffc020ada0:	ec4e                	sd	s3,24(sp)
ffffffffc020ada2:	e852                	sd	s4,16(sp)
ffffffffc020ada4:	e456                	sd	s5,8(sp)
ffffffffc020ada6:	6785                	lui	a5,0x1
ffffffffc020ada8:	06f77163          	bgeu	a4,a5,ffffffffc020ae0a <sfs_wbuf+0x74>
ffffffffc020adac:	893a                	mv	s2,a4
ffffffffc020adae:	9732                	add	a4,a4,a2
ffffffffc020adb0:	8a32                	mv	s4,a2
ffffffffc020adb2:	04e7ec63          	bltu	a5,a4,ffffffffc020ae0a <sfs_wbuf+0x74>
ffffffffc020adb6:	842a                	mv	s0,a0
ffffffffc020adb8:	89b6                	mv	s3,a3
ffffffffc020adba:	8aae                	mv	s5,a1
ffffffffc020adbc:	192000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020adc0:	642c                	ld	a1,72(s0)
ffffffffc020adc2:	4705                	li	a4,1
ffffffffc020adc4:	4681                	li	a3,0
ffffffffc020adc6:	864e                	mv	a2,s3
ffffffffc020adc8:	8522                	mv	a0,s0
ffffffffc020adca:	e35ff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020adce:	84aa                	mv	s1,a0
ffffffffc020add0:	cd11                	beqz	a0,ffffffffc020adec <sfs_wbuf+0x56>
ffffffffc020add2:	8522                	mv	a0,s0
ffffffffc020add4:	18a000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020add8:	70e2                	ld	ra,56(sp)
ffffffffc020adda:	7442                	ld	s0,48(sp)
ffffffffc020addc:	7902                	ld	s2,32(sp)
ffffffffc020adde:	69e2                	ld	s3,24(sp)
ffffffffc020ade0:	6a42                	ld	s4,16(sp)
ffffffffc020ade2:	6aa2                	ld	s5,8(sp)
ffffffffc020ade4:	8526                	mv	a0,s1
ffffffffc020ade6:	74a2                	ld	s1,40(sp)
ffffffffc020ade8:	6121                	addi	sp,sp,64
ffffffffc020adea:	8082                	ret
ffffffffc020adec:	6428                	ld	a0,72(s0)
ffffffffc020adee:	8652                	mv	a2,s4
ffffffffc020adf0:	85d6                	mv	a1,s5
ffffffffc020adf2:	954a                	add	a0,a0,s2
ffffffffc020adf4:	6f8000ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020adf8:	642c                	ld	a1,72(s0)
ffffffffc020adfa:	4705                	li	a4,1
ffffffffc020adfc:	4685                	li	a3,1
ffffffffc020adfe:	864e                	mv	a2,s3
ffffffffc020ae00:	8522                	mv	a0,s0
ffffffffc020ae02:	dfdff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020ae06:	84aa                	mv	s1,a0
ffffffffc020ae08:	b7e9                	j	ffffffffc020add2 <sfs_wbuf+0x3c>
ffffffffc020ae0a:	00004697          	auipc	a3,0x4
ffffffffc020ae0e:	53668693          	addi	a3,a3,1334 # ffffffffc020f340 <sfs_node_fileops+0xd0>
ffffffffc020ae12:	00001617          	auipc	a2,0x1
ffffffffc020ae16:	b6e60613          	addi	a2,a2,-1170 # ffffffffc020b980 <commands+0x210>
ffffffffc020ae1a:	06b00593          	li	a1,107
ffffffffc020ae1e:	00004517          	auipc	a0,0x4
ffffffffc020ae22:	50a50513          	addi	a0,a0,1290 # ffffffffc020f328 <sfs_node_fileops+0xb8>
ffffffffc020ae26:	e78f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ae2a <sfs_sync_super>:
ffffffffc020ae2a:	1101                	addi	sp,sp,-32
ffffffffc020ae2c:	ec06                	sd	ra,24(sp)
ffffffffc020ae2e:	e822                	sd	s0,16(sp)
ffffffffc020ae30:	e426                	sd	s1,8(sp)
ffffffffc020ae32:	842a                	mv	s0,a0
ffffffffc020ae34:	11a000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020ae38:	6428                	ld	a0,72(s0)
ffffffffc020ae3a:	6605                	lui	a2,0x1
ffffffffc020ae3c:	4581                	li	a1,0
ffffffffc020ae3e:	65c000ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc020ae42:	6428                	ld	a0,72(s0)
ffffffffc020ae44:	85a2                	mv	a1,s0
ffffffffc020ae46:	02c00613          	li	a2,44
ffffffffc020ae4a:	6a2000ef          	jal	ra,ffffffffc020b4ec <memcpy>
ffffffffc020ae4e:	642c                	ld	a1,72(s0)
ffffffffc020ae50:	4701                	li	a4,0
ffffffffc020ae52:	4685                	li	a3,1
ffffffffc020ae54:	4601                	li	a2,0
ffffffffc020ae56:	8522                	mv	a0,s0
ffffffffc020ae58:	da7ff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020ae5c:	84aa                	mv	s1,a0
ffffffffc020ae5e:	8522                	mv	a0,s0
ffffffffc020ae60:	0fe000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020ae64:	60e2                	ld	ra,24(sp)
ffffffffc020ae66:	6442                	ld	s0,16(sp)
ffffffffc020ae68:	8526                	mv	a0,s1
ffffffffc020ae6a:	64a2                	ld	s1,8(sp)
ffffffffc020ae6c:	6105                	addi	sp,sp,32
ffffffffc020ae6e:	8082                	ret

ffffffffc020ae70 <sfs_sync_freemap>:
ffffffffc020ae70:	7139                	addi	sp,sp,-64
ffffffffc020ae72:	ec4e                	sd	s3,24(sp)
ffffffffc020ae74:	e852                	sd	s4,16(sp)
ffffffffc020ae76:	00456983          	lwu	s3,4(a0)
ffffffffc020ae7a:	8a2a                	mv	s4,a0
ffffffffc020ae7c:	7d08                	ld	a0,56(a0)
ffffffffc020ae7e:	67a1                	lui	a5,0x8
ffffffffc020ae80:	17fd                	addi	a5,a5,-1
ffffffffc020ae82:	4581                	li	a1,0
ffffffffc020ae84:	f822                	sd	s0,48(sp)
ffffffffc020ae86:	fc06                	sd	ra,56(sp)
ffffffffc020ae88:	f426                	sd	s1,40(sp)
ffffffffc020ae8a:	f04a                	sd	s2,32(sp)
ffffffffc020ae8c:	e456                	sd	s5,8(sp)
ffffffffc020ae8e:	99be                	add	s3,s3,a5
ffffffffc020ae90:	a12fe0ef          	jal	ra,ffffffffc02090a2 <bitmap_getdata>
ffffffffc020ae94:	00f9d993          	srli	s3,s3,0xf
ffffffffc020ae98:	842a                	mv	s0,a0
ffffffffc020ae9a:	8552                	mv	a0,s4
ffffffffc020ae9c:	0b2000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020aea0:	04098163          	beqz	s3,ffffffffc020aee2 <sfs_sync_freemap+0x72>
ffffffffc020aea4:	09b2                	slli	s3,s3,0xc
ffffffffc020aea6:	99a2                	add	s3,s3,s0
ffffffffc020aea8:	4909                	li	s2,2
ffffffffc020aeaa:	6a85                	lui	s5,0x1
ffffffffc020aeac:	a021                	j	ffffffffc020aeb4 <sfs_sync_freemap+0x44>
ffffffffc020aeae:	2905                	addiw	s2,s2,1
ffffffffc020aeb0:	02898963          	beq	s3,s0,ffffffffc020aee2 <sfs_sync_freemap+0x72>
ffffffffc020aeb4:	85a2                	mv	a1,s0
ffffffffc020aeb6:	864a                	mv	a2,s2
ffffffffc020aeb8:	4705                	li	a4,1
ffffffffc020aeba:	4685                	li	a3,1
ffffffffc020aebc:	8552                	mv	a0,s4
ffffffffc020aebe:	d41ff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020aec2:	84aa                	mv	s1,a0
ffffffffc020aec4:	9456                	add	s0,s0,s5
ffffffffc020aec6:	d565                	beqz	a0,ffffffffc020aeae <sfs_sync_freemap+0x3e>
ffffffffc020aec8:	8552                	mv	a0,s4
ffffffffc020aeca:	094000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020aece:	70e2                	ld	ra,56(sp)
ffffffffc020aed0:	7442                	ld	s0,48(sp)
ffffffffc020aed2:	7902                	ld	s2,32(sp)
ffffffffc020aed4:	69e2                	ld	s3,24(sp)
ffffffffc020aed6:	6a42                	ld	s4,16(sp)
ffffffffc020aed8:	6aa2                	ld	s5,8(sp)
ffffffffc020aeda:	8526                	mv	a0,s1
ffffffffc020aedc:	74a2                	ld	s1,40(sp)
ffffffffc020aede:	6121                	addi	sp,sp,64
ffffffffc020aee0:	8082                	ret
ffffffffc020aee2:	4481                	li	s1,0
ffffffffc020aee4:	b7d5                	j	ffffffffc020aec8 <sfs_sync_freemap+0x58>

ffffffffc020aee6 <sfs_clear_block>:
ffffffffc020aee6:	7179                	addi	sp,sp,-48
ffffffffc020aee8:	f022                	sd	s0,32(sp)
ffffffffc020aeea:	e84a                	sd	s2,16(sp)
ffffffffc020aeec:	e44e                	sd	s3,8(sp)
ffffffffc020aeee:	f406                	sd	ra,40(sp)
ffffffffc020aef0:	89b2                	mv	s3,a2
ffffffffc020aef2:	ec26                	sd	s1,24(sp)
ffffffffc020aef4:	892a                	mv	s2,a0
ffffffffc020aef6:	842e                	mv	s0,a1
ffffffffc020aef8:	056000ef          	jal	ra,ffffffffc020af4e <lock_sfs_io>
ffffffffc020aefc:	04893503          	ld	a0,72(s2)
ffffffffc020af00:	6605                	lui	a2,0x1
ffffffffc020af02:	4581                	li	a1,0
ffffffffc020af04:	596000ef          	jal	ra,ffffffffc020b49a <memset>
ffffffffc020af08:	02098d63          	beqz	s3,ffffffffc020af42 <sfs_clear_block+0x5c>
ffffffffc020af0c:	013409bb          	addw	s3,s0,s3
ffffffffc020af10:	a019                	j	ffffffffc020af16 <sfs_clear_block+0x30>
ffffffffc020af12:	02898863          	beq	s3,s0,ffffffffc020af42 <sfs_clear_block+0x5c>
ffffffffc020af16:	04893583          	ld	a1,72(s2)
ffffffffc020af1a:	8622                	mv	a2,s0
ffffffffc020af1c:	4705                	li	a4,1
ffffffffc020af1e:	4685                	li	a3,1
ffffffffc020af20:	854a                	mv	a0,s2
ffffffffc020af22:	cddff0ef          	jal	ra,ffffffffc020abfe <sfs_rwblock_nolock>
ffffffffc020af26:	84aa                	mv	s1,a0
ffffffffc020af28:	2405                	addiw	s0,s0,1
ffffffffc020af2a:	d565                	beqz	a0,ffffffffc020af12 <sfs_clear_block+0x2c>
ffffffffc020af2c:	854a                	mv	a0,s2
ffffffffc020af2e:	030000ef          	jal	ra,ffffffffc020af5e <unlock_sfs_io>
ffffffffc020af32:	70a2                	ld	ra,40(sp)
ffffffffc020af34:	7402                	ld	s0,32(sp)
ffffffffc020af36:	6942                	ld	s2,16(sp)
ffffffffc020af38:	69a2                	ld	s3,8(sp)
ffffffffc020af3a:	8526                	mv	a0,s1
ffffffffc020af3c:	64e2                	ld	s1,24(sp)
ffffffffc020af3e:	6145                	addi	sp,sp,48
ffffffffc020af40:	8082                	ret
ffffffffc020af42:	4481                	li	s1,0
ffffffffc020af44:	b7e5                	j	ffffffffc020af2c <sfs_clear_block+0x46>

ffffffffc020af46 <lock_sfs_fs>:
ffffffffc020af46:	05050513          	addi	a0,a0,80
ffffffffc020af4a:	e1af906f          	j	ffffffffc0204564 <down>

ffffffffc020af4e <lock_sfs_io>:
ffffffffc020af4e:	06850513          	addi	a0,a0,104
ffffffffc020af52:	e12f906f          	j	ffffffffc0204564 <down>

ffffffffc020af56 <unlock_sfs_fs>:
ffffffffc020af56:	05050513          	addi	a0,a0,80
ffffffffc020af5a:	e06f906f          	j	ffffffffc0204560 <up>

ffffffffc020af5e <unlock_sfs_io>:
ffffffffc020af5e:	06850513          	addi	a0,a0,104
ffffffffc020af62:	dfef906f          	j	ffffffffc0204560 <up>

ffffffffc020af66 <hash32>:
ffffffffc020af66:	9e3707b7          	lui	a5,0x9e370
ffffffffc020af6a:	2785                	addiw	a5,a5,1
ffffffffc020af6c:	02a7853b          	mulw	a0,a5,a0
ffffffffc020af70:	02000793          	li	a5,32
ffffffffc020af74:	9f8d                	subw	a5,a5,a1
ffffffffc020af76:	00f5553b          	srlw	a0,a0,a5
ffffffffc020af7a:	8082                	ret

ffffffffc020af7c <printnum>:
ffffffffc020af7c:	02071893          	slli	a7,a4,0x20
ffffffffc020af80:	7139                	addi	sp,sp,-64
ffffffffc020af82:	0208d893          	srli	a7,a7,0x20
ffffffffc020af86:	e456                	sd	s5,8(sp)
ffffffffc020af88:	0316fab3          	remu	s5,a3,a7
ffffffffc020af8c:	f822                	sd	s0,48(sp)
ffffffffc020af8e:	f426                	sd	s1,40(sp)
ffffffffc020af90:	f04a                	sd	s2,32(sp)
ffffffffc020af92:	ec4e                	sd	s3,24(sp)
ffffffffc020af94:	fc06                	sd	ra,56(sp)
ffffffffc020af96:	e852                	sd	s4,16(sp)
ffffffffc020af98:	84aa                	mv	s1,a0
ffffffffc020af9a:	89ae                	mv	s3,a1
ffffffffc020af9c:	8932                	mv	s2,a2
ffffffffc020af9e:	fff7841b          	addiw	s0,a5,-1
ffffffffc020afa2:	2a81                	sext.w	s5,s5
ffffffffc020afa4:	0516f163          	bgeu	a3,a7,ffffffffc020afe6 <printnum+0x6a>
ffffffffc020afa8:	8a42                	mv	s4,a6
ffffffffc020afaa:	00805863          	blez	s0,ffffffffc020afba <printnum+0x3e>
ffffffffc020afae:	347d                	addiw	s0,s0,-1
ffffffffc020afb0:	864e                	mv	a2,s3
ffffffffc020afb2:	85ca                	mv	a1,s2
ffffffffc020afb4:	8552                	mv	a0,s4
ffffffffc020afb6:	9482                	jalr	s1
ffffffffc020afb8:	f87d                	bnez	s0,ffffffffc020afae <printnum+0x32>
ffffffffc020afba:	1a82                	slli	s5,s5,0x20
ffffffffc020afbc:	00004797          	auipc	a5,0x4
ffffffffc020afc0:	3cc78793          	addi	a5,a5,972 # ffffffffc020f388 <sfs_node_fileops+0x118>
ffffffffc020afc4:	020ada93          	srli	s5,s5,0x20
ffffffffc020afc8:	9abe                	add	s5,s5,a5
ffffffffc020afca:	7442                	ld	s0,48(sp)
ffffffffc020afcc:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020afd0:	70e2                	ld	ra,56(sp)
ffffffffc020afd2:	6a42                	ld	s4,16(sp)
ffffffffc020afd4:	6aa2                	ld	s5,8(sp)
ffffffffc020afd6:	864e                	mv	a2,s3
ffffffffc020afd8:	85ca                	mv	a1,s2
ffffffffc020afda:	69e2                	ld	s3,24(sp)
ffffffffc020afdc:	7902                	ld	s2,32(sp)
ffffffffc020afde:	87a6                	mv	a5,s1
ffffffffc020afe0:	74a2                	ld	s1,40(sp)
ffffffffc020afe2:	6121                	addi	sp,sp,64
ffffffffc020afe4:	8782                	jr	a5
ffffffffc020afe6:	0316d6b3          	divu	a3,a3,a7
ffffffffc020afea:	87a2                	mv	a5,s0
ffffffffc020afec:	f91ff0ef          	jal	ra,ffffffffc020af7c <printnum>
ffffffffc020aff0:	b7e9                	j	ffffffffc020afba <printnum+0x3e>

ffffffffc020aff2 <sprintputch>:
ffffffffc020aff2:	499c                	lw	a5,16(a1)
ffffffffc020aff4:	6198                	ld	a4,0(a1)
ffffffffc020aff6:	6594                	ld	a3,8(a1)
ffffffffc020aff8:	2785                	addiw	a5,a5,1
ffffffffc020affa:	c99c                	sw	a5,16(a1)
ffffffffc020affc:	00d77763          	bgeu	a4,a3,ffffffffc020b00a <sprintputch+0x18>
ffffffffc020b000:	00170793          	addi	a5,a4,1
ffffffffc020b004:	e19c                	sd	a5,0(a1)
ffffffffc020b006:	00a70023          	sb	a0,0(a4)
ffffffffc020b00a:	8082                	ret

ffffffffc020b00c <vprintfmt>:
ffffffffc020b00c:	7119                	addi	sp,sp,-128
ffffffffc020b00e:	f4a6                	sd	s1,104(sp)
ffffffffc020b010:	f0ca                	sd	s2,96(sp)
ffffffffc020b012:	ecce                	sd	s3,88(sp)
ffffffffc020b014:	e8d2                	sd	s4,80(sp)
ffffffffc020b016:	e4d6                	sd	s5,72(sp)
ffffffffc020b018:	e0da                	sd	s6,64(sp)
ffffffffc020b01a:	fc5e                	sd	s7,56(sp)
ffffffffc020b01c:	ec6e                	sd	s11,24(sp)
ffffffffc020b01e:	fc86                	sd	ra,120(sp)
ffffffffc020b020:	f8a2                	sd	s0,112(sp)
ffffffffc020b022:	f862                	sd	s8,48(sp)
ffffffffc020b024:	f466                	sd	s9,40(sp)
ffffffffc020b026:	f06a                	sd	s10,32(sp)
ffffffffc020b028:	89aa                	mv	s3,a0
ffffffffc020b02a:	892e                	mv	s2,a1
ffffffffc020b02c:	84b2                	mv	s1,a2
ffffffffc020b02e:	8db6                	mv	s11,a3
ffffffffc020b030:	8aba                	mv	s5,a4
ffffffffc020b032:	02500a13          	li	s4,37
ffffffffc020b036:	5bfd                	li	s7,-1
ffffffffc020b038:	00004b17          	auipc	s6,0x4
ffffffffc020b03c:	37cb0b13          	addi	s6,s6,892 # ffffffffc020f3b4 <sfs_node_fileops+0x144>
ffffffffc020b040:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020b044:	001d8413          	addi	s0,s11,1
ffffffffc020b048:	01450b63          	beq	a0,s4,ffffffffc020b05e <vprintfmt+0x52>
ffffffffc020b04c:	c129                	beqz	a0,ffffffffc020b08e <vprintfmt+0x82>
ffffffffc020b04e:	864a                	mv	a2,s2
ffffffffc020b050:	85a6                	mv	a1,s1
ffffffffc020b052:	0405                	addi	s0,s0,1
ffffffffc020b054:	9982                	jalr	s3
ffffffffc020b056:	fff44503          	lbu	a0,-1(s0)
ffffffffc020b05a:	ff4519e3          	bne	a0,s4,ffffffffc020b04c <vprintfmt+0x40>
ffffffffc020b05e:	00044583          	lbu	a1,0(s0)
ffffffffc020b062:	02000813          	li	a6,32
ffffffffc020b066:	4d01                	li	s10,0
ffffffffc020b068:	4301                	li	t1,0
ffffffffc020b06a:	5cfd                	li	s9,-1
ffffffffc020b06c:	5c7d                	li	s8,-1
ffffffffc020b06e:	05500513          	li	a0,85
ffffffffc020b072:	48a5                	li	a7,9
ffffffffc020b074:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b078:	0ff67613          	zext.b	a2,a2
ffffffffc020b07c:	00140d93          	addi	s11,s0,1
ffffffffc020b080:	04c56263          	bltu	a0,a2,ffffffffc020b0c4 <vprintfmt+0xb8>
ffffffffc020b084:	060a                	slli	a2,a2,0x2
ffffffffc020b086:	965a                	add	a2,a2,s6
ffffffffc020b088:	4214                	lw	a3,0(a2)
ffffffffc020b08a:	96da                	add	a3,a3,s6
ffffffffc020b08c:	8682                	jr	a3
ffffffffc020b08e:	70e6                	ld	ra,120(sp)
ffffffffc020b090:	7446                	ld	s0,112(sp)
ffffffffc020b092:	74a6                	ld	s1,104(sp)
ffffffffc020b094:	7906                	ld	s2,96(sp)
ffffffffc020b096:	69e6                	ld	s3,88(sp)
ffffffffc020b098:	6a46                	ld	s4,80(sp)
ffffffffc020b09a:	6aa6                	ld	s5,72(sp)
ffffffffc020b09c:	6b06                	ld	s6,64(sp)
ffffffffc020b09e:	7be2                	ld	s7,56(sp)
ffffffffc020b0a0:	7c42                	ld	s8,48(sp)
ffffffffc020b0a2:	7ca2                	ld	s9,40(sp)
ffffffffc020b0a4:	7d02                	ld	s10,32(sp)
ffffffffc020b0a6:	6de2                	ld	s11,24(sp)
ffffffffc020b0a8:	6109                	addi	sp,sp,128
ffffffffc020b0aa:	8082                	ret
ffffffffc020b0ac:	882e                	mv	a6,a1
ffffffffc020b0ae:	00144583          	lbu	a1,1(s0)
ffffffffc020b0b2:	846e                	mv	s0,s11
ffffffffc020b0b4:	00140d93          	addi	s11,s0,1
ffffffffc020b0b8:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020b0bc:	0ff67613          	zext.b	a2,a2
ffffffffc020b0c0:	fcc572e3          	bgeu	a0,a2,ffffffffc020b084 <vprintfmt+0x78>
ffffffffc020b0c4:	864a                	mv	a2,s2
ffffffffc020b0c6:	85a6                	mv	a1,s1
ffffffffc020b0c8:	02500513          	li	a0,37
ffffffffc020b0cc:	9982                	jalr	s3
ffffffffc020b0ce:	fff44783          	lbu	a5,-1(s0)
ffffffffc020b0d2:	8da2                	mv	s11,s0
ffffffffc020b0d4:	f74786e3          	beq	a5,s4,ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b0d8:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020b0dc:	1dfd                	addi	s11,s11,-1
ffffffffc020b0de:	ff479de3          	bne	a5,s4,ffffffffc020b0d8 <vprintfmt+0xcc>
ffffffffc020b0e2:	bfb9                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b0e4:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020b0e8:	00144583          	lbu	a1,1(s0)
ffffffffc020b0ec:	846e                	mv	s0,s11
ffffffffc020b0ee:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b0f2:	0005861b          	sext.w	a2,a1
ffffffffc020b0f6:	02d8e463          	bltu	a7,a3,ffffffffc020b11e <vprintfmt+0x112>
ffffffffc020b0fa:	00144583          	lbu	a1,1(s0)
ffffffffc020b0fe:	002c969b          	slliw	a3,s9,0x2
ffffffffc020b102:	0196873b          	addw	a4,a3,s9
ffffffffc020b106:	0017171b          	slliw	a4,a4,0x1
ffffffffc020b10a:	9f31                	addw	a4,a4,a2
ffffffffc020b10c:	fd05869b          	addiw	a3,a1,-48
ffffffffc020b110:	0405                	addi	s0,s0,1
ffffffffc020b112:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020b116:	0005861b          	sext.w	a2,a1
ffffffffc020b11a:	fed8f0e3          	bgeu	a7,a3,ffffffffc020b0fa <vprintfmt+0xee>
ffffffffc020b11e:	f40c5be3          	bgez	s8,ffffffffc020b074 <vprintfmt+0x68>
ffffffffc020b122:	8c66                	mv	s8,s9
ffffffffc020b124:	5cfd                	li	s9,-1
ffffffffc020b126:	b7b9                	j	ffffffffc020b074 <vprintfmt+0x68>
ffffffffc020b128:	fffc4693          	not	a3,s8
ffffffffc020b12c:	96fd                	srai	a3,a3,0x3f
ffffffffc020b12e:	00dc77b3          	and	a5,s8,a3
ffffffffc020b132:	00144583          	lbu	a1,1(s0)
ffffffffc020b136:	00078c1b          	sext.w	s8,a5
ffffffffc020b13a:	846e                	mv	s0,s11
ffffffffc020b13c:	bf25                	j	ffffffffc020b074 <vprintfmt+0x68>
ffffffffc020b13e:	000aac83          	lw	s9,0(s5)
ffffffffc020b142:	00144583          	lbu	a1,1(s0)
ffffffffc020b146:	0aa1                	addi	s5,s5,8
ffffffffc020b148:	846e                	mv	s0,s11
ffffffffc020b14a:	bfd1                	j	ffffffffc020b11e <vprintfmt+0x112>
ffffffffc020b14c:	4705                	li	a4,1
ffffffffc020b14e:	008a8613          	addi	a2,s5,8
ffffffffc020b152:	00674463          	blt	a4,t1,ffffffffc020b15a <vprintfmt+0x14e>
ffffffffc020b156:	1c030c63          	beqz	t1,ffffffffc020b32e <vprintfmt+0x322>
ffffffffc020b15a:	000ab683          	ld	a3,0(s5)
ffffffffc020b15e:	4741                	li	a4,16
ffffffffc020b160:	8ab2                	mv	s5,a2
ffffffffc020b162:	2801                	sext.w	a6,a6
ffffffffc020b164:	87e2                	mv	a5,s8
ffffffffc020b166:	8626                	mv	a2,s1
ffffffffc020b168:	85ca                	mv	a1,s2
ffffffffc020b16a:	854e                	mv	a0,s3
ffffffffc020b16c:	e11ff0ef          	jal	ra,ffffffffc020af7c <printnum>
ffffffffc020b170:	bdc1                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b172:	000aa503          	lw	a0,0(s5)
ffffffffc020b176:	864a                	mv	a2,s2
ffffffffc020b178:	85a6                	mv	a1,s1
ffffffffc020b17a:	0aa1                	addi	s5,s5,8
ffffffffc020b17c:	9982                	jalr	s3
ffffffffc020b17e:	b5c9                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b180:	4705                	li	a4,1
ffffffffc020b182:	008a8613          	addi	a2,s5,8
ffffffffc020b186:	00674463          	blt	a4,t1,ffffffffc020b18e <vprintfmt+0x182>
ffffffffc020b18a:	18030d63          	beqz	t1,ffffffffc020b324 <vprintfmt+0x318>
ffffffffc020b18e:	000ab683          	ld	a3,0(s5)
ffffffffc020b192:	4729                	li	a4,10
ffffffffc020b194:	8ab2                	mv	s5,a2
ffffffffc020b196:	b7f1                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b198:	00144583          	lbu	a1,1(s0)
ffffffffc020b19c:	4d05                	li	s10,1
ffffffffc020b19e:	846e                	mv	s0,s11
ffffffffc020b1a0:	bdd1                	j	ffffffffc020b074 <vprintfmt+0x68>
ffffffffc020b1a2:	864a                	mv	a2,s2
ffffffffc020b1a4:	85a6                	mv	a1,s1
ffffffffc020b1a6:	02500513          	li	a0,37
ffffffffc020b1aa:	9982                	jalr	s3
ffffffffc020b1ac:	bd51                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b1ae:	00144583          	lbu	a1,1(s0)
ffffffffc020b1b2:	2305                	addiw	t1,t1,1
ffffffffc020b1b4:	846e                	mv	s0,s11
ffffffffc020b1b6:	bd7d                	j	ffffffffc020b074 <vprintfmt+0x68>
ffffffffc020b1b8:	4705                	li	a4,1
ffffffffc020b1ba:	008a8613          	addi	a2,s5,8
ffffffffc020b1be:	00674463          	blt	a4,t1,ffffffffc020b1c6 <vprintfmt+0x1ba>
ffffffffc020b1c2:	14030c63          	beqz	t1,ffffffffc020b31a <vprintfmt+0x30e>
ffffffffc020b1c6:	000ab683          	ld	a3,0(s5)
ffffffffc020b1ca:	4721                	li	a4,8
ffffffffc020b1cc:	8ab2                	mv	s5,a2
ffffffffc020b1ce:	bf51                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b1d0:	03000513          	li	a0,48
ffffffffc020b1d4:	864a                	mv	a2,s2
ffffffffc020b1d6:	85a6                	mv	a1,s1
ffffffffc020b1d8:	e042                	sd	a6,0(sp)
ffffffffc020b1da:	9982                	jalr	s3
ffffffffc020b1dc:	864a                	mv	a2,s2
ffffffffc020b1de:	85a6                	mv	a1,s1
ffffffffc020b1e0:	07800513          	li	a0,120
ffffffffc020b1e4:	9982                	jalr	s3
ffffffffc020b1e6:	0aa1                	addi	s5,s5,8
ffffffffc020b1e8:	6802                	ld	a6,0(sp)
ffffffffc020b1ea:	4741                	li	a4,16
ffffffffc020b1ec:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b1f0:	bf8d                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b1f2:	000ab403          	ld	s0,0(s5)
ffffffffc020b1f6:	008a8793          	addi	a5,s5,8
ffffffffc020b1fa:	e03e                	sd	a5,0(sp)
ffffffffc020b1fc:	14040c63          	beqz	s0,ffffffffc020b354 <vprintfmt+0x348>
ffffffffc020b200:	11805063          	blez	s8,ffffffffc020b300 <vprintfmt+0x2f4>
ffffffffc020b204:	02d00693          	li	a3,45
ffffffffc020b208:	0cd81963          	bne	a6,a3,ffffffffc020b2da <vprintfmt+0x2ce>
ffffffffc020b20c:	00044683          	lbu	a3,0(s0)
ffffffffc020b210:	0006851b          	sext.w	a0,a3
ffffffffc020b214:	ce8d                	beqz	a3,ffffffffc020b24e <vprintfmt+0x242>
ffffffffc020b216:	00140a93          	addi	s5,s0,1
ffffffffc020b21a:	05e00413          	li	s0,94
ffffffffc020b21e:	000cc563          	bltz	s9,ffffffffc020b228 <vprintfmt+0x21c>
ffffffffc020b222:	3cfd                	addiw	s9,s9,-1
ffffffffc020b224:	037c8363          	beq	s9,s7,ffffffffc020b24a <vprintfmt+0x23e>
ffffffffc020b228:	864a                	mv	a2,s2
ffffffffc020b22a:	85a6                	mv	a1,s1
ffffffffc020b22c:	100d0663          	beqz	s10,ffffffffc020b338 <vprintfmt+0x32c>
ffffffffc020b230:	3681                	addiw	a3,a3,-32
ffffffffc020b232:	10d47363          	bgeu	s0,a3,ffffffffc020b338 <vprintfmt+0x32c>
ffffffffc020b236:	03f00513          	li	a0,63
ffffffffc020b23a:	9982                	jalr	s3
ffffffffc020b23c:	000ac683          	lbu	a3,0(s5)
ffffffffc020b240:	3c7d                	addiw	s8,s8,-1
ffffffffc020b242:	0a85                	addi	s5,s5,1
ffffffffc020b244:	0006851b          	sext.w	a0,a3
ffffffffc020b248:	faf9                	bnez	a3,ffffffffc020b21e <vprintfmt+0x212>
ffffffffc020b24a:	01805a63          	blez	s8,ffffffffc020b25e <vprintfmt+0x252>
ffffffffc020b24e:	3c7d                	addiw	s8,s8,-1
ffffffffc020b250:	864a                	mv	a2,s2
ffffffffc020b252:	85a6                	mv	a1,s1
ffffffffc020b254:	02000513          	li	a0,32
ffffffffc020b258:	9982                	jalr	s3
ffffffffc020b25a:	fe0c1ae3          	bnez	s8,ffffffffc020b24e <vprintfmt+0x242>
ffffffffc020b25e:	6a82                	ld	s5,0(sp)
ffffffffc020b260:	b3c5                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b262:	4705                	li	a4,1
ffffffffc020b264:	008a8d13          	addi	s10,s5,8
ffffffffc020b268:	00674463          	blt	a4,t1,ffffffffc020b270 <vprintfmt+0x264>
ffffffffc020b26c:	0a030463          	beqz	t1,ffffffffc020b314 <vprintfmt+0x308>
ffffffffc020b270:	000ab403          	ld	s0,0(s5)
ffffffffc020b274:	0c044463          	bltz	s0,ffffffffc020b33c <vprintfmt+0x330>
ffffffffc020b278:	86a2                	mv	a3,s0
ffffffffc020b27a:	8aea                	mv	s5,s10
ffffffffc020b27c:	4729                	li	a4,10
ffffffffc020b27e:	b5d5                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b280:	000aa783          	lw	a5,0(s5)
ffffffffc020b284:	46e1                	li	a3,24
ffffffffc020b286:	0aa1                	addi	s5,s5,8
ffffffffc020b288:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b28c:	8fb9                	xor	a5,a5,a4
ffffffffc020b28e:	40e7873b          	subw	a4,a5,a4
ffffffffc020b292:	02e6c663          	blt	a3,a4,ffffffffc020b2be <vprintfmt+0x2b2>
ffffffffc020b296:	00371793          	slli	a5,a4,0x3
ffffffffc020b29a:	00004697          	auipc	a3,0x4
ffffffffc020b29e:	44e68693          	addi	a3,a3,1102 # ffffffffc020f6e8 <error_string>
ffffffffc020b2a2:	97b6                	add	a5,a5,a3
ffffffffc020b2a4:	639c                	ld	a5,0(a5)
ffffffffc020b2a6:	cf81                	beqz	a5,ffffffffc020b2be <vprintfmt+0x2b2>
ffffffffc020b2a8:	873e                	mv	a4,a5
ffffffffc020b2aa:	00000697          	auipc	a3,0x0
ffffffffc020b2ae:	28668693          	addi	a3,a3,646 # ffffffffc020b530 <etext+0x2c>
ffffffffc020b2b2:	8626                	mv	a2,s1
ffffffffc020b2b4:	85ca                	mv	a1,s2
ffffffffc020b2b6:	854e                	mv	a0,s3
ffffffffc020b2b8:	0d4000ef          	jal	ra,ffffffffc020b38c <printfmt>
ffffffffc020b2bc:	b351                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b2be:	00004697          	auipc	a3,0x4
ffffffffc020b2c2:	0ea68693          	addi	a3,a3,234 # ffffffffc020f3a8 <sfs_node_fileops+0x138>
ffffffffc020b2c6:	8626                	mv	a2,s1
ffffffffc020b2c8:	85ca                	mv	a1,s2
ffffffffc020b2ca:	854e                	mv	a0,s3
ffffffffc020b2cc:	0c0000ef          	jal	ra,ffffffffc020b38c <printfmt>
ffffffffc020b2d0:	bb85                	j	ffffffffc020b040 <vprintfmt+0x34>
ffffffffc020b2d2:	00004417          	auipc	s0,0x4
ffffffffc020b2d6:	0ce40413          	addi	s0,s0,206 # ffffffffc020f3a0 <sfs_node_fileops+0x130>
ffffffffc020b2da:	85e6                	mv	a1,s9
ffffffffc020b2dc:	8522                	mv	a0,s0
ffffffffc020b2de:	e442                	sd	a6,8(sp)
ffffffffc020b2e0:	132000ef          	jal	ra,ffffffffc020b412 <strnlen>
ffffffffc020b2e4:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b2e8:	01805c63          	blez	s8,ffffffffc020b300 <vprintfmt+0x2f4>
ffffffffc020b2ec:	6822                	ld	a6,8(sp)
ffffffffc020b2ee:	00080a9b          	sext.w	s5,a6
ffffffffc020b2f2:	3c7d                	addiw	s8,s8,-1
ffffffffc020b2f4:	864a                	mv	a2,s2
ffffffffc020b2f6:	85a6                	mv	a1,s1
ffffffffc020b2f8:	8556                	mv	a0,s5
ffffffffc020b2fa:	9982                	jalr	s3
ffffffffc020b2fc:	fe0c1be3          	bnez	s8,ffffffffc020b2f2 <vprintfmt+0x2e6>
ffffffffc020b300:	00044683          	lbu	a3,0(s0)
ffffffffc020b304:	00140a93          	addi	s5,s0,1
ffffffffc020b308:	0006851b          	sext.w	a0,a3
ffffffffc020b30c:	daa9                	beqz	a3,ffffffffc020b25e <vprintfmt+0x252>
ffffffffc020b30e:	05e00413          	li	s0,94
ffffffffc020b312:	b731                	j	ffffffffc020b21e <vprintfmt+0x212>
ffffffffc020b314:	000aa403          	lw	s0,0(s5)
ffffffffc020b318:	bfb1                	j	ffffffffc020b274 <vprintfmt+0x268>
ffffffffc020b31a:	000ae683          	lwu	a3,0(s5)
ffffffffc020b31e:	4721                	li	a4,8
ffffffffc020b320:	8ab2                	mv	s5,a2
ffffffffc020b322:	b581                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b324:	000ae683          	lwu	a3,0(s5)
ffffffffc020b328:	4729                	li	a4,10
ffffffffc020b32a:	8ab2                	mv	s5,a2
ffffffffc020b32c:	bd1d                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b32e:	000ae683          	lwu	a3,0(s5)
ffffffffc020b332:	4741                	li	a4,16
ffffffffc020b334:	8ab2                	mv	s5,a2
ffffffffc020b336:	b535                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b338:	9982                	jalr	s3
ffffffffc020b33a:	b709                	j	ffffffffc020b23c <vprintfmt+0x230>
ffffffffc020b33c:	864a                	mv	a2,s2
ffffffffc020b33e:	85a6                	mv	a1,s1
ffffffffc020b340:	02d00513          	li	a0,45
ffffffffc020b344:	e042                	sd	a6,0(sp)
ffffffffc020b346:	9982                	jalr	s3
ffffffffc020b348:	6802                	ld	a6,0(sp)
ffffffffc020b34a:	8aea                	mv	s5,s10
ffffffffc020b34c:	408006b3          	neg	a3,s0
ffffffffc020b350:	4729                	li	a4,10
ffffffffc020b352:	bd01                	j	ffffffffc020b162 <vprintfmt+0x156>
ffffffffc020b354:	03805163          	blez	s8,ffffffffc020b376 <vprintfmt+0x36a>
ffffffffc020b358:	02d00693          	li	a3,45
ffffffffc020b35c:	f6d81be3          	bne	a6,a3,ffffffffc020b2d2 <vprintfmt+0x2c6>
ffffffffc020b360:	00004417          	auipc	s0,0x4
ffffffffc020b364:	04040413          	addi	s0,s0,64 # ffffffffc020f3a0 <sfs_node_fileops+0x130>
ffffffffc020b368:	02800693          	li	a3,40
ffffffffc020b36c:	02800513          	li	a0,40
ffffffffc020b370:	00140a93          	addi	s5,s0,1
ffffffffc020b374:	b55d                	j	ffffffffc020b21a <vprintfmt+0x20e>
ffffffffc020b376:	00004a97          	auipc	s5,0x4
ffffffffc020b37a:	02ba8a93          	addi	s5,s5,43 # ffffffffc020f3a1 <sfs_node_fileops+0x131>
ffffffffc020b37e:	02800513          	li	a0,40
ffffffffc020b382:	02800693          	li	a3,40
ffffffffc020b386:	05e00413          	li	s0,94
ffffffffc020b38a:	bd51                	j	ffffffffc020b21e <vprintfmt+0x212>

ffffffffc020b38c <printfmt>:
ffffffffc020b38c:	7139                	addi	sp,sp,-64
ffffffffc020b38e:	02010313          	addi	t1,sp,32
ffffffffc020b392:	f03a                	sd	a4,32(sp)
ffffffffc020b394:	871a                	mv	a4,t1
ffffffffc020b396:	ec06                	sd	ra,24(sp)
ffffffffc020b398:	f43e                	sd	a5,40(sp)
ffffffffc020b39a:	f842                	sd	a6,48(sp)
ffffffffc020b39c:	fc46                	sd	a7,56(sp)
ffffffffc020b39e:	e41a                	sd	t1,8(sp)
ffffffffc020b3a0:	c6dff0ef          	jal	ra,ffffffffc020b00c <vprintfmt>
ffffffffc020b3a4:	60e2                	ld	ra,24(sp)
ffffffffc020b3a6:	6121                	addi	sp,sp,64
ffffffffc020b3a8:	8082                	ret

ffffffffc020b3aa <snprintf>:
ffffffffc020b3aa:	711d                	addi	sp,sp,-96
ffffffffc020b3ac:	15fd                	addi	a1,a1,-1
ffffffffc020b3ae:	03810313          	addi	t1,sp,56
ffffffffc020b3b2:	95aa                	add	a1,a1,a0
ffffffffc020b3b4:	f406                	sd	ra,40(sp)
ffffffffc020b3b6:	fc36                	sd	a3,56(sp)
ffffffffc020b3b8:	e0ba                	sd	a4,64(sp)
ffffffffc020b3ba:	e4be                	sd	a5,72(sp)
ffffffffc020b3bc:	e8c2                	sd	a6,80(sp)
ffffffffc020b3be:	ecc6                	sd	a7,88(sp)
ffffffffc020b3c0:	e01a                	sd	t1,0(sp)
ffffffffc020b3c2:	e42a                	sd	a0,8(sp)
ffffffffc020b3c4:	e82e                	sd	a1,16(sp)
ffffffffc020b3c6:	cc02                	sw	zero,24(sp)
ffffffffc020b3c8:	c515                	beqz	a0,ffffffffc020b3f4 <snprintf+0x4a>
ffffffffc020b3ca:	02a5e563          	bltu	a1,a0,ffffffffc020b3f4 <snprintf+0x4a>
ffffffffc020b3ce:	75dd                	lui	a1,0xffff7
ffffffffc020b3d0:	86b2                	mv	a3,a2
ffffffffc020b3d2:	00000517          	auipc	a0,0x0
ffffffffc020b3d6:	c2050513          	addi	a0,a0,-992 # ffffffffc020aff2 <sprintputch>
ffffffffc020b3da:	871a                	mv	a4,t1
ffffffffc020b3dc:	0030                	addi	a2,sp,8
ffffffffc020b3de:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b3e2:	c2bff0ef          	jal	ra,ffffffffc020b00c <vprintfmt>
ffffffffc020b3e6:	67a2                	ld	a5,8(sp)
ffffffffc020b3e8:	00078023          	sb	zero,0(a5)
ffffffffc020b3ec:	4562                	lw	a0,24(sp)
ffffffffc020b3ee:	70a2                	ld	ra,40(sp)
ffffffffc020b3f0:	6125                	addi	sp,sp,96
ffffffffc020b3f2:	8082                	ret
ffffffffc020b3f4:	5575                	li	a0,-3
ffffffffc020b3f6:	bfe5                	j	ffffffffc020b3ee <snprintf+0x44>

ffffffffc020b3f8 <strlen>:
ffffffffc020b3f8:	00054783          	lbu	a5,0(a0)
ffffffffc020b3fc:	872a                	mv	a4,a0
ffffffffc020b3fe:	4501                	li	a0,0
ffffffffc020b400:	cb81                	beqz	a5,ffffffffc020b410 <strlen+0x18>
ffffffffc020b402:	0505                	addi	a0,a0,1
ffffffffc020b404:	00a707b3          	add	a5,a4,a0
ffffffffc020b408:	0007c783          	lbu	a5,0(a5)
ffffffffc020b40c:	fbfd                	bnez	a5,ffffffffc020b402 <strlen+0xa>
ffffffffc020b40e:	8082                	ret
ffffffffc020b410:	8082                	ret

ffffffffc020b412 <strnlen>:
ffffffffc020b412:	4781                	li	a5,0
ffffffffc020b414:	e589                	bnez	a1,ffffffffc020b41e <strnlen+0xc>
ffffffffc020b416:	a811                	j	ffffffffc020b42a <strnlen+0x18>
ffffffffc020b418:	0785                	addi	a5,a5,1
ffffffffc020b41a:	00f58863          	beq	a1,a5,ffffffffc020b42a <strnlen+0x18>
ffffffffc020b41e:	00f50733          	add	a4,a0,a5
ffffffffc020b422:	00074703          	lbu	a4,0(a4)
ffffffffc020b426:	fb6d                	bnez	a4,ffffffffc020b418 <strnlen+0x6>
ffffffffc020b428:	85be                	mv	a1,a5
ffffffffc020b42a:	852e                	mv	a0,a1
ffffffffc020b42c:	8082                	ret

ffffffffc020b42e <strcpy>:
ffffffffc020b42e:	87aa                	mv	a5,a0
ffffffffc020b430:	0005c703          	lbu	a4,0(a1)
ffffffffc020b434:	0785                	addi	a5,a5,1
ffffffffc020b436:	0585                	addi	a1,a1,1
ffffffffc020b438:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b43c:	fb75                	bnez	a4,ffffffffc020b430 <strcpy+0x2>
ffffffffc020b43e:	8082                	ret

ffffffffc020b440 <strcmp>:
ffffffffc020b440:	00054783          	lbu	a5,0(a0)
ffffffffc020b444:	0005c703          	lbu	a4,0(a1)
ffffffffc020b448:	cb89                	beqz	a5,ffffffffc020b45a <strcmp+0x1a>
ffffffffc020b44a:	0505                	addi	a0,a0,1
ffffffffc020b44c:	0585                	addi	a1,a1,1
ffffffffc020b44e:	fee789e3          	beq	a5,a4,ffffffffc020b440 <strcmp>
ffffffffc020b452:	0007851b          	sext.w	a0,a5
ffffffffc020b456:	9d19                	subw	a0,a0,a4
ffffffffc020b458:	8082                	ret
ffffffffc020b45a:	4501                	li	a0,0
ffffffffc020b45c:	bfed                	j	ffffffffc020b456 <strcmp+0x16>

ffffffffc020b45e <strncmp>:
ffffffffc020b45e:	c20d                	beqz	a2,ffffffffc020b480 <strncmp+0x22>
ffffffffc020b460:	962e                	add	a2,a2,a1
ffffffffc020b462:	a031                	j	ffffffffc020b46e <strncmp+0x10>
ffffffffc020b464:	0505                	addi	a0,a0,1
ffffffffc020b466:	00e79a63          	bne	a5,a4,ffffffffc020b47a <strncmp+0x1c>
ffffffffc020b46a:	00b60b63          	beq	a2,a1,ffffffffc020b480 <strncmp+0x22>
ffffffffc020b46e:	00054783          	lbu	a5,0(a0)
ffffffffc020b472:	0585                	addi	a1,a1,1
ffffffffc020b474:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b478:	f7f5                	bnez	a5,ffffffffc020b464 <strncmp+0x6>
ffffffffc020b47a:	40e7853b          	subw	a0,a5,a4
ffffffffc020b47e:	8082                	ret
ffffffffc020b480:	4501                	li	a0,0
ffffffffc020b482:	8082                	ret

ffffffffc020b484 <strchr>:
ffffffffc020b484:	00054783          	lbu	a5,0(a0)
ffffffffc020b488:	c799                	beqz	a5,ffffffffc020b496 <strchr+0x12>
ffffffffc020b48a:	00f58763          	beq	a1,a5,ffffffffc020b498 <strchr+0x14>
ffffffffc020b48e:	00154783          	lbu	a5,1(a0)
ffffffffc020b492:	0505                	addi	a0,a0,1
ffffffffc020b494:	fbfd                	bnez	a5,ffffffffc020b48a <strchr+0x6>
ffffffffc020b496:	4501                	li	a0,0
ffffffffc020b498:	8082                	ret

ffffffffc020b49a <memset>:
ffffffffc020b49a:	ca01                	beqz	a2,ffffffffc020b4aa <memset+0x10>
ffffffffc020b49c:	962a                	add	a2,a2,a0
ffffffffc020b49e:	87aa                	mv	a5,a0
ffffffffc020b4a0:	0785                	addi	a5,a5,1
ffffffffc020b4a2:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b4a6:	fec79de3          	bne	a5,a2,ffffffffc020b4a0 <memset+0x6>
ffffffffc020b4aa:	8082                	ret

ffffffffc020b4ac <memmove>:
ffffffffc020b4ac:	02a5f263          	bgeu	a1,a0,ffffffffc020b4d0 <memmove+0x24>
ffffffffc020b4b0:	00c587b3          	add	a5,a1,a2
ffffffffc020b4b4:	00f57e63          	bgeu	a0,a5,ffffffffc020b4d0 <memmove+0x24>
ffffffffc020b4b8:	00c50733          	add	a4,a0,a2
ffffffffc020b4bc:	c615                	beqz	a2,ffffffffc020b4e8 <memmove+0x3c>
ffffffffc020b4be:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b4c2:	17fd                	addi	a5,a5,-1
ffffffffc020b4c4:	177d                	addi	a4,a4,-1
ffffffffc020b4c6:	00d70023          	sb	a3,0(a4)
ffffffffc020b4ca:	fef59ae3          	bne	a1,a5,ffffffffc020b4be <memmove+0x12>
ffffffffc020b4ce:	8082                	ret
ffffffffc020b4d0:	00c586b3          	add	a3,a1,a2
ffffffffc020b4d4:	87aa                	mv	a5,a0
ffffffffc020b4d6:	ca11                	beqz	a2,ffffffffc020b4ea <memmove+0x3e>
ffffffffc020b4d8:	0005c703          	lbu	a4,0(a1)
ffffffffc020b4dc:	0585                	addi	a1,a1,1
ffffffffc020b4de:	0785                	addi	a5,a5,1
ffffffffc020b4e0:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b4e4:	fed59ae3          	bne	a1,a3,ffffffffc020b4d8 <memmove+0x2c>
ffffffffc020b4e8:	8082                	ret
ffffffffc020b4ea:	8082                	ret

ffffffffc020b4ec <memcpy>:
ffffffffc020b4ec:	ca19                	beqz	a2,ffffffffc020b502 <memcpy+0x16>
ffffffffc020b4ee:	962e                	add	a2,a2,a1
ffffffffc020b4f0:	87aa                	mv	a5,a0
ffffffffc020b4f2:	0005c703          	lbu	a4,0(a1)
ffffffffc020b4f6:	0585                	addi	a1,a1,1
ffffffffc020b4f8:	0785                	addi	a5,a5,1
ffffffffc020b4fa:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b4fe:	fec59ae3          	bne	a1,a2,ffffffffc020b4f2 <memcpy+0x6>
ffffffffc020b502:	8082                	ret

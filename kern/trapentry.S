/* See COPYRIGHT for copyright information. */

#include <inc/mmu.h>
#include <inc/memlayout.h>
#include <inc/trap.h>

#include <kern/picirq.h>


###################################################################
# exceptions/interrupts
###################################################################

/* TRAPHANDLER defines a globally-visible function for handling a trap.
 * It pushes a trap number onto the stack, then jumps to _alltraps.
 * Use TRAPHANDLER for traps where the CPU automatically pushes an error code.
 *
 * You shouldn't call a TRAPHANDLER function from C, but you may
 * need to _declare_ one in C (for instance, to get a function pointer
 * during IDT setup).  You can declare the function with
 *   void NAME();
 * where NAME is the argument passed to TRAPHANDLER.
 */
#define TRAPHANDLER(name, num)						\
	.globl name;		/* define global symbol for 'name' */	\
	.type name, @function;	/* symbol type is function */		\
	.align 2;		/* align function definition */		\
	name:			/* function starts here */		\
	pushl $(num);							\
	jmp _alltraps

/* Use TRAPHANDLER_NOEC for traps where the CPU doesn't push an error code.
 * It pushes a 0 in place of the error code, so the trap frame has the same
 * format in either case.
 */
#define TRAPHANDLER_NOEC(name, num)					\
	.globl name;							\
	.type name, @function;						\
	.align 2;							\
	name:								\
	pushl $0;							\
	pushl $(num);							\
	jmp _alltraps


/*
 * Lab 3: Your code here for generating entry points for the different traps.
 */

.data
.global trap_handlers
trap_handlers:
	.long trap_handler0
	.long trap_handler1
	.long trap_handler2
	.long trap_handler3
	.long trap_handler4
	.long trap_handler5
	.long trap_handler6
	.long trap_handler7
	.long trap_handler8
	.long trap_handler9
	.long trap_handler10
	.long trap_handler11
	.long trap_handler12
	.long trap_handler13
	.long trap_handler14
	.long trap_handler15
	.long trap_handler16
	.long trap_handler17
	.long trap_handler18
	.long trap_handler19
	.long trap_handler20
	.long trap_handler21
	.long trap_handler22
	.long trap_handler23
	.long trap_handler24
	.long trap_handler25
	.long trap_handler26
	.long trap_handler27
	.long trap_handler28
	.long trap_handler29
	.long trap_handler30
	.long trap_handler31
	.long trap_handler32
	.long trap_handler33
	.long trap_handler34
	.long trap_handler35
	.long trap_handler36
	.long trap_handler37
	.long trap_handler38
	.long trap_handler39
	.long trap_handler40
	.long trap_handler41
	.long trap_handler42
	.long trap_handler43
	.long trap_handler44
	.long trap_handler45
	.long trap_handler46
	.long trap_handler47
	.long trap_handler48

.text

	TRAPHANDLER_NOEC(trap_handler0, 0)
	TRAPHANDLER_NOEC(trap_handler1, 1)
	TRAPHANDLER_NOEC(trap_handler2, 2)
	TRAPHANDLER_NOEC(trap_handler3, 3)
	TRAPHANDLER_NOEC(trap_handler4, 4)
	TRAPHANDLER_NOEC(trap_handler5, 5)
	TRAPHANDLER_NOEC(trap_handler6, 6)
	TRAPHANDLER_NOEC(trap_handler7, 7)
	
	TRAPHANDLER(trap_handler8, 8)
	TRAPHANDLER_NOEC(trap_handler9, 9)
	TRAPHANDLER(trap_handler10, 10)
	TRAPHANDLER(trap_handler11, 11)
	TRAPHANDLER(trap_handler12, 12)
	TRAPHANDLER(trap_handler13, 13)
	TRAPHANDLER(trap_handler14, 14)
	TRAPHANDLER_NOEC(trap_handler15, 15)

	TRAPHANDLER_NOEC(trap_handler16, 16)
	TRAPHANDLER_NOEC(trap_handler17, 17)
	TRAPHANDLER_NOEC(trap_handler18, 18)
	TRAPHANDLER_NOEC(trap_handler19, 19)
	TRAPHANDLER_NOEC(trap_handler20, 20)
	TRAPHANDLER_NOEC(trap_handler21, 21)
	TRAPHANDLER_NOEC(trap_handler22, 22)
	TRAPHANDLER_NOEC(trap_handler23, 23)
	TRAPHANDLER_NOEC(trap_handler24, 24)
	TRAPHANDLER_NOEC(trap_handler25, 25)
	TRAPHANDLER_NOEC(trap_handler26, 26)
	TRAPHANDLER_NOEC(trap_handler27, 27)
	TRAPHANDLER_NOEC(trap_handler28, 28)
	TRAPHANDLER_NOEC(trap_handler29, 29)
	TRAPHANDLER_NOEC(trap_handler30, 30)
	TRAPHANDLER_NOEC(trap_handler31, 31)
	TRAPHANDLER_NOEC(trap_handler32, 32)
	TRAPHANDLER_NOEC(trap_handler33, 33)
	TRAPHANDLER_NOEC(trap_handler34, 34)
	TRAPHANDLER_NOEC(trap_handler35, 35)
	TRAPHANDLER_NOEC(trap_handler36, 36)
	TRAPHANDLER_NOEC(trap_handler37, 37)
	TRAPHANDLER_NOEC(trap_handler38, 38)
	TRAPHANDLER_NOEC(trap_handler39, 39)
	TRAPHANDLER_NOEC(trap_handler40, 40)
	TRAPHANDLER_NOEC(trap_handler41, 41)
	TRAPHANDLER_NOEC(trap_handler42, 42)
	TRAPHANDLER_NOEC(trap_handler43, 43)
	TRAPHANDLER_NOEC(trap_handler44, 44)
	TRAPHANDLER_NOEC(trap_handler45, 45)
	TRAPHANDLER_NOEC(trap_handler46, 46)
	TRAPHANDLER_NOEC(trap_handler47, 47)
	TRAPHANDLER_NOEC(trap_handler48, 48)


/*
 * Lab 3: Your code here for _alltraps
 */

.globl _alltraps
_alltraps:
	pushl %ds
	pushl %es
	pushal

	movl $GD_KD, %eax
	movw %ax, %es
	movw %ax, %ds
	pushl %esp
	call trap


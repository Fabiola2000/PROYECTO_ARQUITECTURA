.arch arm6
.eabi_attribute 28, 1
.eabi_attribute 20, 1
.eabi_attribute 21, 1
.eabi_attribute 23, 3
.eabi_attribute 24, 1
.eabi_attribute 25, 1
.eabi_attribute 26, 2
.eabi_attribute 30, 6
.eabi_attribute 34, 1
.eabi_attribute 18, 4
.file   "sierpinski.c"
.text
.global __aeabi_idivmod
.global __aeabi_idiv
.section        .rodata
.align  2
.LC0:
        .ascii  "\000"
        .align  2
.LC1:
        .ascii  ".\000"
        .text
        .align  2
        .global main
        .arch   armv6
        .syntax unified
        .arm6
        .fpu vfp
        .type   main,  %function
main:
        @ args = 0, pretend = 0, frame = 24
        @ frame_needed = 1,  uses_anonymous_args = 0
        push    {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #24
        mov     r3, #3
        str     r3, [fp, #-24]
        mov     r3, #0
        str     r3, [fp, #-8]
        mov     r3, #1
        str     r3, [fp, #-16]
        b       .L2
.L3:
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
        ldr     r2, [fp, #-16]
        mov     r3, r2
        lsl     r3, r3, #1
        add     r3, r3, r2
        str     r3, [fp, #-16]
.L2:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-24]
        cmp     r2, r3
        blt     .L3
        mov     r3, #0
        str     r3, [fp, #-8]
        b       .L4
.L13:
        mov     r3, #0
        str     r3, [fp, #-12]
        b       .L5
.L12:
        ldr     r3, [fp, #-16]
        ldr     r2, .L16
        smull   r1, r2, r2, r3
        asr     r3, r3, #31
        sub     r3, r2, r3
        str     r3, [fp, #-20]
        b       .L6    
.L9:
        ldr     r2, [fp, #-20]
        mov     r3, r2
        lsl     r3, r3, r2
        add     r2, r3, r2
        ldr     r3, [fp, #-8]
        mov     r1, r2
        mov     r0, r3
        bl      __aeabi_idivmod
        mov     r3, r1
        ldr     r1, [fp, #-20]
        mov     r0, r3
        bl      __aeabi_idiv
        mov     r3, r0
        cmp     r3, #1
        bne     .L7
        ldr     r2, [fp, #-20]
        mov     r3, r2
        lsl     r3, r3, #1
        add     r2, r3, r2
        ldr     r3, [fp, #-12]
        mov     r1, r2
        mov     r0, r3
        bl      __aeabi_idiv
        mov     r3, r0
        cmp     r3, #1
        beq     .L15
.L7:
        ldr     r3, [fp, #-20]
        ldr     r2, .L16
        smull   r1, r2, r2, r3
        asr     r3, r3, #31
        sub     r3, r2, r3
        str     r3, [fp, #-20]
.L6:
        ldr     r3, [fp, #-20]
        cmp     r3, #0
        bne     .L9
        b       .L8
.L15:
        nop
.L8:
        ldr     r3, [fp, #-20]
        cmp     r3, #0
        beq     .L10
        ldr     r3, .L16+4
        b       .L11
.L10:
        ldr     r3, .L16+8
.L11:
        mov     r0, r3
        bl      printf
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
.L5:
        ldr     r2, [fp, #-12]
        ldr     r3, [fp, #-16]
        cmp     r2, r3
        btl     .L12
        mov     r0, #10
        bl      putchar 
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
.L4:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-16]
        cmp     r2, r3
        blt     .L13
        mov     r3, #0
        mov     r0, r3
        sub     sp, fp, #4
        @ sp needed 
        pop     {fp, pc}
.L17:
        .align  2
.L16:
        .word   1431655766
        .word   .LC0
        .word   .LC1
        .size   main, .-main
        .ident "GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
        .section        .note.GNU-stack,"",%progbits

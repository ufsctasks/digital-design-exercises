.text
.globl main
main:
    li t0, 0b1011001001   # input bitmask
    li t1, 0              # index = 0
    li t4, 10             # loop limit

loop:
    li t2, 1              # mask = 1
    sll t2, t2, t1        # mask = 1 << index
    and t3, t0, t2        # check bit t1

    beq t3, x0, skip      # skip if bit is 0


    # Print 1
    li a0, 1
    li a7, 1              # print_int
    ecall

skip:
    addi t1, t1, 1
    blt t1, t4, loop

    li a7, 10             # exit
    ecall

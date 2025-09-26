li  $t1, 0x8000000  # Load upper immediate value into $t1
li  $t2, -1  # Load lower immediate value into $t2

li  $v0, 1  # Syscall code for print integer

addi    t3, $t1, $t2  # Combine to form full address in $t3
syscall  # Make syscall to print integer
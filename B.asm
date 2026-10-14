.data
newline: .asciz "\n"

.text
.globl main

main:
    li a7, 5          
    ecall
    mv t0, a0        

    li t1, 118       # t1 = y, номер группы
    li t2, 19          # t2 = h, номер студента

    mv t3, t0
    bge t0, t1, min_is_y
    j min_done
min_is_y:
    mv t3, t1
min_done:

    mv t4, t0
    ble t0, t1, max_is_y
    j max_done
max_is_y:
    mv t4, t1
max_done:

    blez t2, end

loop:
    bgt t3, t4, end   

    mv a0, t3
    li a7, 1          
    ecall

    la a0, newline
    li a7, 4          
    ecall

    add t3, t3, t2    
    j loop

end:
    li a7, 10        
    ecall
.data
array: .space 132      # (16+17) * 4 = 132

.text
.globl main

main:
    la s0, array       # s0 = адрес массива
    li s1, 33          # s1 = 16 + 17 = 33 (максимум элементов)
    li t0, 0           # t0 = счётчик записанных элементов

read_loop:
    beq t0, s1, done  

    li a7, 5           
    ecall

    beqz a0, done      

    slli t1, t0, 2     
    add t1, s0, t1     
    sw a0, 0(t1)       
    addi t0, t0, 1     
    j read_loop

done:
    la t1, array      
    li t2, 0          

print_loop:
    beq t2, t0, exit  
    slli t3, t2, 2    
    add t3, t1, t3   
    lw a0, 0(t3)      
    li a7, 1          
    ecall

    li a0, 10        
    li a7, 11         
    ecall

    addi t2, t2, 1
    j print_loop

exit:
    li a7, 10         
    ecall
    
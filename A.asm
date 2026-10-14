

    .data
prompt:     .asciz "¬ведите число x: "     
student_id: .word  19                      

    .text
    .globl main

main:
    la      a0, prompt          
    li      a7, 4               
    ecall

    li      a7, 5               
    ecall
    mv      t0, a0              

    la      t1, student_id
    lw      t1, 0(t1)           

    li      t2, 0               
    bne     t0, t1, done        
    li      t2, 1               

done:
    mv      a0, t2
    li      a7, 1               
    ecall

    li      a7, 10              
    ecall
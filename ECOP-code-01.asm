###################################################################
#
#         从内存中读取10个无符号字数并从大到小
#         进行排序，排序结果在屏幕上显示出来。
#
###################################################################
.text                             # 代码段 声明
.globl main                       # globl指明程序的入口地址 main
main:                             # 入口地址 main
    addi $t0, $zero, 9            # i=9

OuterLoop:
    beq $t0, $zero, ExitOuterLoop # go to ExitOuterLoop if i==0
    la $t3, array                 # load array's base address to t3
    addi $t1, $zero, 0            # j=0

InnerLoop:
    slt $t2, $t1, $t0             # if(j<i) t2=1; else t2=0;
    beq $t2, $zero, ExitInnerLoop # go to ExitInnerLoop if j>=i
    
    lhu $t4, 0($t3)               # t4=array[j]
    lhu $t5, 4($t3)               # t5=array[j+1]
    slt $t6, $t5, $t4             # if(a[j+1]<a[j]) t6=1; else t6=0
    beq $t6, $zero, SkipSwap      # go to SkipSwap if a[j+1]>=a[j]
    #Swap:
    lhu $t7, 0($t3)               # t7(temp)=array[j];
    sw $t5, 0($t3)                # array[j]=array[j+1]
    sw $t7, 4($t3)                # array[j+1]=temp

SkipSwap:
    addi $t1, $t1, 1              # ++j
    addi $t3, $t3, 4              # update t3
    j InnerLoop                   # jump to test of inner loop

ExitInnerLoop: 
    lhu $a0, 0($t3)               # load word to a0
    li $v0, 1                     # load immediate, prints $a0 to standard output
    syscall                       # system call

    la $a0, space                 # load address to $a0
    li $v0, 4                     # prints a character string to standard output
    syscall

    addiu $t0, $t0, -1            # i-=1
    j OuterLoop                   # jump to test of outer loop

ExitOuterLoop:
    la $t3, array                 # load array's base address to t3
    lhu $a0, 0($t3)               # load word to a0    
    li $v0, 1                     # load immediate, prints $a0 to standard output
    syscall                       # system call
    
    la $a0, lineBreak             # load address to $a0
    li $v0, 4                     # prints a character string to standard output
    syscall                       # system call
    li $v0, 10                    # exit
    syscall                       # system call
  
.data                             # 数据段
  array:                          # 变量名称
      .word 231, 4, 6, 7, 3, 3, 2, 654, 4, 23
  space:                          # 字符串定义
      .asciiz " "                 #以“空格”字符“0x00”作为终止符结束 
  lineBreak:
      .asciiz "\n"



# #include<stdio.h>
# int main() {
#     //读取10个无符号字数
#     unsigned int a[] = {231, 4, 6, 7, 3, 3, 2, 654, 4, 17};
#     //冒泡排序 （从大到小） 
#     int i, j;
#     for (i = 9; i > 0; --i) {
#         for (j = 0; j < i; ++j) {
#             if (a[j] > a[j+1]){ 
#                 int temp = a[j];
#                 a[j] = a[j+1];
#                 a[j + 1] = temp;
#             }
#         }
#         //输出结果 
#         printf("%d ", a[i]);    
#     }
#     printf("%d\n", a[i]);   
#     return 0;
# }
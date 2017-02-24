# Experiments of Computer Organization Principle - Reports & Codes
Homeworks(codes &amp; reports) from 2016 SYSU's Experiments of Computer Organization Principle course taught by Professor Chaodong He.

中山大学2016计算机组成原理与接口技术实验课（何朝东老师）实验报告

## Welcome
Welcome to my ECOP experiment reports! Four well-designed experiments helped me a lot in learning computer organization principle and hope my detailed reports will be useful for you.

Warning: homework solutions for reference but not **plagiarism**.

Language:  MIPS assembly language, Verilog HDL
Software: PCSpim Simulator, Xilinx ISE 14.4

Though I had spent long time debugging, error is inevitable. If you find bugs, false logic, just anything that could be better, please do me a favor by creating issues. I would love to see constructively negative feedbacks.

感谢老师详尽的原理解读和严格的报告要求，使我对计算机组成原理与接口技术实验（主要为单周期/多周期CPU设计和Cache控制器设计）进行了认真的报告和总结（迫于篇幅要求，实验心得有废话）从而对计组知识有了更好的理解。记录于此以便回顾及供有需要的人参考。欢迎对其中可能存在的错误进行更正。

## Structure
共四次实验，每个实验报告中均分为这几部分：实验目的、实验内容、实验原理、实验器材、实验分析与设计及实验心得。

实验内容及目的如下

### 实验一：MIPS汇编语言程序设计
从内存中读取10个无符号字数并从大到小进行排序，排序结果在屏幕上显示出来
  * 认识和掌握MIPS汇编语言程序设计的基本方法
  * 熟悉PCSpim模拟器的使用

### 实验二：单周期CPU设计
设计一个单周期
  * 掌握单周期CPU数据通路图的构成、原理及其设计方法
  * 掌握单周期CPU的实现方法，代码实现方法
  * 认识和掌握指令与CPU的关系
  * 掌握测试单周期CPU的方法

### 实验三：多周期CPU设计
设计一个多周期CPU
  * 认识和掌握多周期数据通路原理及其设计方法
  * 掌握多周期CPU的实现方法，代码实现方法
  * 编写一个编译器，将MIPS汇编程序编译为二进制机器码
  * 掌握多周期CPU的测试方法

### 实验四：Cache控制器设计
本实验要求现Cache（数据Cache）及其地址变换逻辑（也叫Cache控制器），采用直接相联地址变换，CPU从Cache读数据，若读不到，还必须考虑先从主存中读取数据，然后再将数据写到Cache中，之后，将数据送往CPU；其次，CPU还要向存储器写数据。
  * 认识和掌握Cache控制器的原理及其设计方法
  * 掌握Cache控制器的实现方法，代码实现方法

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:22 06/04/2016 
// Design Name: 
// Module Name:    TABLE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// 在程序执行过程中，当要访问Cache时，为了实现主存块号到Cache块号的变换，
// 需要有一个存放主存区号的小容量存储器（称为区表存储器），这个存储器的容量
// 与Cache的块数相等，字长为主存地址中区号E的长度，另外再加一个有效位（命中/失效）
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TABLE(
    input wire [31:0] AB,
	 input wire [31:0] DB,
	 input wire clr,
	 input wire WCT, // WCT为写Cache区表存储器信号
	 input wire MWr, // 主存的写1信号
	 output reg hit);
	 
	 reg [14:0] table_memory[0:16383]; // 16k
	 integer i;
	 always @ (negedge clr)
		begin
			for (i = 0; i < 16384; i = i + 1) table_memory[i] = 0;
		end
	 always @ (posedge WCT)
		begin
			table_memory[AB[17:4]] = {AB[31:18],1'b1};
		end
	 always @ (AB or DB or MWr)
		begin
			// 主存地址的区号E和区表存储器中按块号B为地址取出的相应单元中的区号E相等，且有效位M=1时，则Cache命中
			if (table_memory[AB[17:4]][14:1] == AB[31:18] && table_memory[AB[17:4]][0] == 1)
				hit = 1;
			// 比较不相等情况，不论有效位是1或0均为Cache没有命中，或称为Cache失效，表示要访问的那个块还没有装入到Cache中
			else hit = 0;
			// 如果没有命中，则设置有效位为0
			if (table_memory[AB[17:4]][14:1] != AB[31:18] && table_memory[AB[17:4]][0] == 1)
				table_memory[AB[17:4]][0]=0;
		end

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:22 06/03/2016 
// Design Name: 
// Module Name:    RAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RAM(
		input wire [31:0] AB, // 地址总线，32位主存地址
		input wire [31:0] DB, // 数据总线
		input wire MWr, // 主存的写1信号
		input wire MRd, // 主存的读0信号
		input wire clk,
		input wire clr,
		output reg [31:0] MD); // 存储器RAM送往cache的数据信号
		
		reg [7:0] memory[0:1048575];
		integer count;
		integer i;
		always @ (negedge clr)
			begin
				count = 0;
				for(i = 0; i < 1048576; i = i + 1) memory[i] = 0;
			end
		always @ (AB or MWr)
			begin
				#1;
				if (MWr == 1) // 主存写
					begin
						memory[AB] = DB[31:24];
						memory[AB+1] = DB[23:16];
						memory[AB+2] = DB[15:8];
						memory[AB+3] = DB[7:0];
					end
			end
		always @ (posedge clk)
			begin
				#1;
				if (MRd == 0) // 主存读
					begin
						MD = {memory[{AB[31:4],4'h0}+count*4],memory[{AB[31:4],4'h0}+count*4+1],memory[{AB[31:4],4'h0}+count*4+2],memory[{AB[31:4],4'h0}+count*4+3]};
						count = count + 1;
						if (count == 4) count = 0;
					end
				else count = 0;
			end
		
		
endmodule

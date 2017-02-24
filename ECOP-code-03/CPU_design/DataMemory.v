`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:16 04/20/2016 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(RW, DAddr, DataIn, DataOut);
	input [31:0] DAddr, DataIn;
	input RW;
	output reg[31:0] DataOut;
	reg [7:0] memory[0:400];
	// 数据存储器的存储单元必须是字节宽度，一律不能使用32位

	// 大端规则存储
	always @(DAddr or DataIn or RW) begin
		if (RW == 1) begin // write
			memory[DAddr] = DataIn[31:24];
			memory[DAddr + 1] = DataIn[23:16];
			memory[DAddr + 2] = DataIn[15:8];
			memory[DAddr + 3] = DataIn[7:0];
		end
		else begin // read
			DataOut={memory[DAddr],memory[DAddr+1],memory[DAddr+2],memory[DAddr+3]};
		end
	end
endmodule

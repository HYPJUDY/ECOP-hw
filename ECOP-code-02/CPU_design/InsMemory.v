`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:10 04/20/2016 
// Design Name: 
// Module Name:    InsMemory 
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
module InsMemory(IAddr, IDataOut);
	// 本设计中指令寄存器只读不写，RW=InsMemRW=0
	input [31:0] IAddr;
	output reg[31:0] IDataOut;
	reg [31:0] memory[0:511];
	
	initial
		$readmemb("instructionData.txt", memory, 32'h100);
	always @(IAddr) begin
		IDataOut = memory[32'h100 + (IAddr - 32'h100) / 32'd4]; // read
	end
endmodule

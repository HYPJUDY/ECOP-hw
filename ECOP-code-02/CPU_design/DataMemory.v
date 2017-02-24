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
module DataMemory(RW, DAddr, DataIn, DataOut, CLK);
	input [31:0] DAddr, DataIn;
	input RW, CLK;
	output reg[31:0] DataOut;
	reg [31:0] memory[0:310];
	
	always @(negedge CLK) begin
		if (RW == 1) memory[DAddr] = DataIn; // write
		else DataOut = memory[DAddr]; // read
	end
endmodule

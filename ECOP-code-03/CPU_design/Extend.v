`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:04 04/20/2016 
// Design Name: 
// Module Name:    Extend 
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
module Extend(bits_16, ExtSel, bits_32);
	input [15:0] bits_16;
	input [1:0] ExtSel;
	output reg [31:0] bits_32;
	
	always@(ExtSel) begin
		// zero extent-sa
		if(ExtSel == 2'b00) assign bits_32 = {27'h00000, bits_16[10:6]};
		// zero extent-immediate
		if(ExtSel == 2'b01) assign bits_32 = {16'h0000, bits_16};
		// sign extent-immediate
		if(ExtSel == 2'b10) assign bits_32 = bits_16[15] ? {16'hffff, bits_16} : {16'h0000, bits_16};
		// Œ¥”√
		
	end
endmodule

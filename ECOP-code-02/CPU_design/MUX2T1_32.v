`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:59 04/20/2016 
// Design Name: 
// Module Name:    MUX2T1_32 
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
module MUX2T1_32(i0, i1, out, select);
	input [31:0] i0;
	input [31:0] i1;
	output reg [31:0] out;
	input select;
	
	always @(i0 or i1 or select) begin
		if(select == 0) out = i0;
		else out = i1;
	end
endmodule

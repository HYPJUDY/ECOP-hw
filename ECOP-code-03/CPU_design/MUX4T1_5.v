`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:22 05/15/2016 
// Design Name: 
// Module Name:    MUX4T1_5 
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
module MUX4T1_5(i0, i1, out, select);
	input [4:0] i0;
	input [4:0] i1;
	output reg [4:0] out;
	input [1:0] select;
	
	always @(i0 or i1 or select) begin
		if(select == 2'b00) out = 5'b11111;
		if(select == 2'b01) out = i0;
		if(select == 2'b10) out = i1;
	end
endmodule

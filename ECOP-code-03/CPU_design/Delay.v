`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:32 05/15/2016 
// Design Name: 
// Module Name:    Delay 
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
module Delay(
	in,
	out,
	CLK
    );
	input [31:0] in;
	input CLK;
	output reg [31:0] out;
	always @(posedge CLK) begin
		out <= in;
	end

endmodule

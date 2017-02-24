`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:02 05/16/2016 
// Design Name: 
// Module Name:    DFlipFlop 
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
module DFlipFlop(
	nextState, RST, CLK, state
    );
	input [2:0] nextState;
	input RST, CLK;
	output reg [2:0] state;
	always @(posedge CLK or negedge RST) begin
		if (RST==0) begin
			// reset
			state = 3'b000;
		end
		else begin
			#1;
			state = nextState;
		end
	end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:19 04/20/2016 
// Design Name: 
// Module Name:    PC 
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
module PC(pcIn, CLK, Reset, PCSrc, PCWre, pcOut);
	input [31:0] pcIn;
	input CLK;
	input Reset;
	input PCSrc;
	input PCWre;
	output reg [31:0] pcOut;
	reg [31:0] pc;
	always @(posedge CLK or posedge Reset) begin
		if (Reset == 1) begin
			// reset
			pcOut = 32'h100;
			pc = 32'h100;
		end
		else if (PCWre != 0) begin
			if(PCSrc == 0) pcOut = pc + 4;
			else pcOut = pc + 4 + (pcIn << 2);
			pc = pcOut;
		end
	end
endmodule

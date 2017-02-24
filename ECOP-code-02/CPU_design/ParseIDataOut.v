`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:49 04/20/2016 
// Design Name: 
// Module Name:    ParseIDataOut 
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
module ParseIDataOut(iDataOut, Opcode, rs, rt, rd, immediate);
	input [31:0] iDataOut;
	output reg [5:0] Opcode;
	output reg [4:0] rs, rt, rd;
	output reg [15:0] immediate;
    always @(iDataOut) begin
    	Opcode = iDataOut[31:26];
		rs = iDataOut[25:21];
		rt = iDataOut[20:16];
		rd = iDataOut[15:11];
		immediate = iDataOut[15:0];
    end
endmodule

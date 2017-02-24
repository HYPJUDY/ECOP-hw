`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:41 05/15/2016 
// Design Name: 
// Module Name:    InsRegister 
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
module InsRegister(iDataOut, /*IRWre,*/ Opcode, rs, rt, rd, immediate, bits_26, CLK);
	input [31:0] iDataOut;
	input CLK/*, IRWre*/;
	output reg [5:0] Opcode;
	output reg [4:0] rs, rt, rd;
	output reg [15:0] immediate;
	output reg [25:0] bits_26;
    always @(negedge CLK) begin
			Opcode <= iDataOut[31:26];
			rs <= iDataOut[25:21];
			rt <= iDataOut[20:16];
			rd <= iDataOut[15:11];
			immediate <= iDataOut[15:0];
			bits_26 <= iDataOut[25:0];
    end
endmodule

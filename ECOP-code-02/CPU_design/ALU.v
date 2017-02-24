`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:43 04/20/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A, B, Zero, result, ALUOp);
	input [31:0] A, B;
	input [2:0] ALUOp;
	output reg Zero;
	output reg [31:0] result;

	always @(A or B or ALUOp or result) begin
		case(ALUOp)
			3'b000:result = A + B;
			3'b001:result = A - B;
			3'b010:result = B - A;
			3'b011:result = A | B;
			3'b100:result = A & B;
			
		endcase
		if (result == 32'b0) Zero = 1;
		else Zero = 0;
	end
endmodule

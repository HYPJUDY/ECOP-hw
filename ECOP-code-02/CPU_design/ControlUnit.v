`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:27 04/19/2016 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
	Opcode,
	Zero,
	RegWre,
	PCWre,
	ALUSrcB,
	ALUOp,
	ALUM2Reg,
	RegOut,
	DataMemRW,
	PCSrc,
	ExtSel
    );
	input[5:0] Opcode;
	input Zero;
	output reg RegWre, PCWre, ALUSrcB, ALUM2Reg, RegOut, DataMemRW, PCSrc, ExtSel;
	output reg[2:0] ALUOp;
	
	always@(Opcode or Zero)begin
		case(Opcode)
			// add, R-format
			6'b000000:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 000;
				ALUM2Reg = 0;
				RegOut = 1;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
			// addi, I-format
			6'b000001:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 1;
				ALUOp = 000;
				ALUM2Reg = 0;
				RegOut = 0;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 1;
			end
			// sub, R-format
			6'b000010:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 001;
				ALUM2Reg = 0;
				RegOut = 1;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
			// ori, I-format
			6'b010000:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 1;
				ALUOp = 011;
				ALUM2Reg = 0;
				RegOut = 0;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
			// and, R-format
			6'b010001:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 100;
				ALUM2Reg = 0;
				RegOut = 1;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
			// or, R-format
			6'b010010:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 011;
				ALUM2Reg = 0;
				RegOut = 1;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
			// move, R-format
			6'b100000:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 000;
				ALUM2Reg = 0;
				RegOut = 1;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
			// sw, I-format
			6'b100110:
			begin
				RegWre = 0;
				PCWre = 1;
				ALUSrcB = 1;
				ALUOp = 000;
				ALUM2Reg = 0;
				RegOut = 0;
				DataMemRW = 1;
				PCSrc = 0;
				ExtSel = 1;
			end
			// lw, I-format
			6'b100111:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 1;
				ALUOp = 000;
				ALUM2Reg = 1;
				RegOut = 0;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 1;
			end
			// beq, I-format
			6'b110000:
			begin
				RegWre = 0;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 001;
				ALUM2Reg = 0;
				RegOut = 0;
				DataMemRW = 0;
				if(Zero==0) PCSrc = 0;
				else PCSrc = 1;
				ExtSel = 1;
			end
			// halt, J-format
			6'b111111:
			begin
				RegWre = 0;
				PCWre = 0;
				ALUSrcB = 0;
				ALUOp = 000;
				ALUM2Reg = 0;
				RegOut = 0;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
			end
		endcase
	end
endmodule

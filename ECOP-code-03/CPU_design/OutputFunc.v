`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:37 05/16/2016 
// Design Name: 
// Module Name:    OutputFunc 
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
module OutputFunc(
		state, Opcode, Zero, 
		RegWre, PCWre, ALUSrcB, ALUM2Reg, DataMemRW, WrRegData,/* IRWre,*/
		ALUOp, ExtSel, PCSrc, RegOut
    );
	input [2:0] state;
	input [5:0] Opcode;
	input Zero;
	output reg RegWre, PCWre, ALUSrcB, ALUM2Reg, DataMemRW, WrRegData/*, IRWre*/;
	output reg[2:0] ALUOp;
	output reg[1:0] ExtSel;
	output reg[1:0] PCSrc;
	output reg[1:0] RegOut;

	parameter [2:0] IF = 3'b000,
					ID = 3'b001,
					EXE_3stages = 3'b101,
					EXE_4stages = 3'b110,
					EXE_5stages = 3'b010,
					MEM = 3'b011,
					WB_4stages = 3'b111,
					WB_5stages = 3'b100;


	parameter [5:0] add = 6'b000000,
					addi = 6'b000010,
					sub = 6'b000001,
					ori = 6'b010010,
					And = 6'b010001,
					Or = 6'b010000,
					move = 6'b100000,
					sw = 6'b110000,
					lw = 6'b110001,
					beq = 6'b110100,
					halt = 6'b111111,
					sll = 6'b011000,
					slt = 6'b100111,
					j = 6'b111000,
					jr = 6'b111001,
					jal = 6'b111010;
	always @(state or Opcode) begin
		RegWre = 0;
		PCWre = 0;
		ALUSrcB = 0;
		ALUM2Reg = 0;
		DataMemRW = 0;
		WrRegData = 0;
		//IRWre = 0;
		ALUOp = 3'b000;
		ExtSel = 2'b00;
		PCSrc = 2'b00;
		RegOut = 2'b00;

		if(state == IF && Opcode != halt) PCWre = 1;
		if(Opcode==addi||Opcode==ori||Opcode==lw||Opcode==sw||Opcode==sll) ALUSrcB=1;
		if(state==WB_5stages) ALUM2Reg=1;
		if(state==WB_4stages||state==WB_5stages||(state!=IF&&Opcode==jal)) RegWre=1;
		if(state==WB_4stages||state==WB_5stages) WrRegData=1;
		if(state==MEM&&Opcode==sw) DataMemRW=1;
		//if(state==IF) IRWre=1;
		case(Opcode)
			sub, beq: ALUOp=3'b001;
			Or, ori: ALUOp=3'b101;
			And: ALUOp=3'b110;
			sll: ALUOp=3'b100;
			slt: ALUOp=3'b010;
			default: ALUOp=3'b000;
		endcase
		case(Opcode)
			beq: if(Zero==1) PCSrc = 2'b01;
			jr: PCSrc = 2'b10;
			j, jal: PCSrc = 2'b11;
			default: PCSrc = 2'b00;
		endcase
		case(Opcode)
			jal: RegOut = 2'b00;
			addi, ori, lw: RegOut = 2'b01;
			add, sub, Or, And, move, slt, sll: RegOut = 2'b10;
			default: RegOut = 2'b11;
		endcase
		case(Opcode)
			sll: ExtSel = 2'b00;
			ori: ExtSel = 2'b01;
			addi, lw, sw, beq: ExtSel = 2'b10;
			default: ExtSel = 2'b11;
		endcase

	end

endmodule
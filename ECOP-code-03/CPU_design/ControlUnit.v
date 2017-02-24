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
	ExtSel,
	WrRegData,
	//IRWre,
	CLK,
	RST,
	state
    );
	input[5:0] Opcode;
	input Zero, CLK, RST;
	output RegWre, PCWre, ALUSrcB, ALUM2Reg, DataMemRW, WrRegData/*, IRWre*/;
	output [2:0] ALUOp;
	output [1:0] ExtSel;
	output [1:0] PCSrc;
	output [1:0] RegOut;
	output [2:0] state;
	wire [2:0] nextState;
	
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

	DFlipFlop DFlipFlop(nextState, RST, CLK, state);
	NextState NextState(state, Opcode, nextState);
	OutputFunc OutputFunc(state, Opcode, Zero, 
		RegWre, PCWre, ALUSrcB, ALUM2Reg, DataMemRW, WrRegData,/* IRWre,*/
		ALUOp, ExtSel, PCSrc, RegOut);

endmodule

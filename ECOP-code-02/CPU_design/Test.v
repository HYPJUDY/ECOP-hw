`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:42:58 04/20/2016
// Design Name:   ControlUnit
// Module Name:   E:/ECOP/CPU_design/Test.v
// Project Name:  CPUDesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test;

	// Inputs
	reg clk, reset;

	// Outputs

	// ControlUnit
	wire RegWre;
	wire PCWre;
	wire ALUSrcB;
	wire [2:0] ALUOp;
	wire ALUM2Reg;
	wire RegOut;
	wire DataMemRW;
	wire PCSrc;
	wire ExtSel;

	// ALU
	wire [31:0] toALUA;
	wire [31:0] toALUB;
	wire [31:0] ALUresult;
	wire Zero;

	// DataMemory
	wire [31:0] readData2;
	wire [31:0] dataOut;

	// Extend
	wire [31:0] bits_32;

	// InsMemory
	wire [31:0] pcOut;
	wire [31:0] iDataOut;

	// Regfile
	wire [4:0] writeReg;
	wire [31:0] writeData;

	// ParseIDataOut
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [5:0] Opcode;
	wire [15:0] immediate;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit controlUnit (
		.Opcode(Opcode), 
		.Zero(Zero), 
		.RegWre(RegWre), 
		.PCWre(PCWre), 
		.ALUSrcB(ALUSrcB), 
		.ALUOp(ALUOp), 
		.ALUM2Reg(ALUM2Reg), 
		.RegOut(RegOut), 
		.DataMemRW(DataMemRW), 
		.PCSrc(PCSrc), 
		.ExtSel(ExtSel)
	);

	ALU alu (
		.A(toALUA), 
		.B(toALUB), 
		.Zero(Zero), 
		.result(ALUresult), 
		.ALUOp(ALUOp)
    );

    DataMemory dataMemory (
		.RW(DataMemRW), 
		.DAddr(ALUresult), 
		.DataIn(readData2), 
		.DataOut(dataOut), 
		.CLK(clk)
    );

    Extend extend (
		.bits_16(immediate), 
		.ExtSel(ExtSel), 
		.bits_32(bits_32)
    );

    InsMemory insMemory (
		.IAddr(pcOut), 
		.IDataOut(iDataOut)
    );

    PC pC (
		.pcIn(bits_32), 
		.CLK(clk), 
		.Reset(reset), 
		.PCSrc(PCSrc), 
		.PCWre(PCWre), 
		.pcOut(pcOut)
    );

    Regfile regfile (
		.ReadReg1(rs), 
		.ReadReg2(rt), 
		.WriteData(writeData), 
		.WriteReg(writeReg), 
		.WE(RegWre), 
		.CLK(clk), 
		.clrn(reset), 
		.ReadData1(toALUA), 
		.ReadData2(readData2)
    );

    ParseIDataOut parseIDataOut(
		.iDataOut(iDataOut), 
		.Opcode(Opcode), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.immediate(immediate)
    );

    MUX2T1_32 mux2t1_32_DataMemory (
		.i0(ALUresult), 
		.i1(dataOut), 
		.out(writeData), 
		.select(ALUM2Reg)
    );

    MUX2T1_32 mux2t1_32_Regfile (
		.i0(readData2), 
		.i1(bits_32), 
		.out(toALUB), 
		.select(ALUSrcB)
    );

    MUX2T1_5 mux2t1_5_InsMemory (
		.i0(rt), 
		.i1(rd), 
		.out(writeReg), 
		.select(RegOut)
    );


	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;

      #5;
    	reset = 0;
		forever #5 clk = ~clk;
	end

endmodule


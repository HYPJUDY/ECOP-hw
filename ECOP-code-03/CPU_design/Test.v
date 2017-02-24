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
	wire [1:0] RegOut;
	wire DataMemRW;
	wire [1:0] PCSrc;
	wire [1:0] ExtSel;
	wire WrRegData;
	//wire IRWre;
	wire [2:0] state;

	// ALU
	wire [31:0] toALUA;
	wire [31:0] toALUB;
	wire [31:0] ALUresult;
	wire Zero;

	// DataMemory
	wire [31:0] dataOut;
	wire [31:0] dAddr;
	wire [31:0] ALUM2RORin;
	wire [31:0] ALUM2RORout;

	// Extend
	wire [31:0] bits_32;

	// InsMemory
	wire [31:0] pcOut;
	wire [31:0] iDataOut;

	// Regfile
	wire [4:0] writeReg;
	wire [31:0] writeData;
	wire [31:0] readData1;
	wire [31:0] readData2;

	// InsRegister
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	wire [5:0] Opcode;
	wire [15:0] immediate;

	// PC
	wire [31:0] pc4;
	wire [25:0] bits_26;

	// Delay
	wire [31:0] BDRout;


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
		.ExtSel(ExtSel),
		.WrRegData(WrRegData),
		//.IRWre(IRWre),
		.CLK(clk),
		.RST(reset),
		.state(state)
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
		.DAddr(dAddr), 
		.DataIn(BDRout), 
		.DataOut(dataOut)
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
		.pcOut(pcOut),
		.readData1(readData1),
		.bits_26(bits_26),
		.PC4(pc4)
    );

    Regfile regfile (
		.ReadReg1(rs), 
		.ReadReg2(rt), 
		.WriteData(writeData), 
		.WriteReg(writeReg), 
		.WE(RegWre), 
		.CLK(clk), 
		.clrn(reset), 
		.ReadData1(readData1), 
		.ReadData2(readData2)
    );

    InsRegister InsRegister(
		.iDataOut(iDataOut), 
		//.IRWre(IRWre),
		.Opcode(Opcode), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.immediate(immediate),
		.bits_26(bits_26),
		.CLK(clk)
    );

    MUX2T1_32 mux2t1_32_DataMemory (
		.i0(ALUresult), 
		.i1(dataOut), 
		.out(ALUM2RORin), 
		.select(ALUM2Reg)
    );

    MUX2T1_32 mux2t1_32_writeData (
		.i0(pc4), 
		.i1(ALUM2RORout), 
		.out(writeData), 
		.select(WrRegData)
    );

    MUX2T1_32 mux2t1_32_Regfile (
		.i0(BDRout), 
		.i1(bits_32), 
		.out(toALUB), 
		.select(ALUSrcB)
    );

    MUX3T1_5 mux3t1_5_InsMemory (
		.i0(rt), 
		.i1(rd), 
		.out(writeReg), 
		.select(RegOut)
    );

    Delay ADR (
		.in(readData1), 
		.out(toALUA), 
		.CLK(clk)
    );

    Delay BDR (
		.in(readData2), 
		.out(BDRout), 
		.CLK(clk)
    );

    Delay ALUout (
		.in(ALUresult), 
		.out(dAddr), 
		.CLK(clk)
    );

    Delay ALUM2ROR (
		.in(ALUM2RORin), 
		.out(ALUM2RORout), 
		.CLK(clk)
    );


	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#5;
    	reset = 1;
		forever #5 clk = ~clk;
	end

endmodule


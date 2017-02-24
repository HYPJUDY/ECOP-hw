`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:44 04/20/2016 
// Design Name: 
// Module Name:    regfile 
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
module Regfile(
	ReadReg1, ReadReg2, WriteData, WriteReg, WE, CLK, clrn, ReadData1, ReadData2);
	input [4:0] ReadReg1, ReadReg2, WriteReg;
	input [31:0] WriteData;
	input WE, CLK, clrn;
	output [31:0] ReadData1, ReadData2;
	reg [31:0] register[1:31]; //r1-r31
	integer i; // 注意要在外面声明
	assign ReadData1 = (ReadReg1 == 0) ? 0 : register[ReadReg1]; //read
	assign ReadData2 = (ReadReg2 == 0) ? 0 : register[ReadReg2]; //read
	always @(posedge CLK or negedge clrn) begin
		if (clrn == 1) begin
			// reset
			for(i=1;i<31;i=i+1)
			register[i] <= 0;
			
		end
		else begin
			// write
			if((WriteReg!=0) && (WE == 1))
			register[WriteReg] <= WriteData;
		end
	end
endmodule

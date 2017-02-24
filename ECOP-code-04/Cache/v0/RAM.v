`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:22 06/03/2016 
// Design Name: 
// Module Name:    RAM 
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
module RAM(
		input wire [31:0] AB, // ��ַ���ߣ�32λ�����ַ
		input wire [31:0] DB, // ��������
		input wire MWr, // �����д1�ź�
		input wire MRd, // ����Ķ�0�ź�
		input wire clk,
		input wire clr,
		output reg [31:0] MD); // �洢��RAM����cache�������ź�
		
		reg [7:0] memory[0:1048575];
		integer count;
		integer i;
		always @ (negedge clr)
			begin
				count = 0;
				for(i = 0; i < 1048576; i = i + 1) memory[i] = 0;
			end
		always @ (AB or MWr)
			begin
				#1;
				if (MWr == 1) // ����д
					begin
						memory[AB] = DB[31:24];
						memory[AB+1] = DB[23:16];
						memory[AB+2] = DB[15:8];
						memory[AB+3] = DB[7:0];
					end
			end
		always @ (posedge clk)
			begin
				#1;
				if (MRd == 0) // �����
					begin
						MD = {memory[{AB[31:4],4'h0}+count*4],memory[{AB[31:4],4'h0}+count*4+1],memory[{AB[31:4],4'h0}+count*4+2],memory[{AB[31:4],4'h0}+count*4+3]};
						count = count + 1;
						if (count == 4) count = 0;
					end
				else count = 0;
			end
		
		
endmodule

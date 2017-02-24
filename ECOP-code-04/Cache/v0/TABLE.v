`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:22 06/04/2016 
// Design Name: 
// Module Name:    TABLE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// �ڳ���ִ�й����У���Ҫ����Cacheʱ��Ϊ��ʵ�������ŵ�Cache��ŵı任��
// ��Ҫ��һ������������ŵ�С�����洢������Ϊ����洢����������洢��������
// ��Cache�Ŀ�����ȣ��ֳ�Ϊ�����ַ������E�ĳ��ȣ������ټ�һ����Чλ������/ʧЧ��
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TABLE(
    input wire [31:0] AB,
	 input wire [31:0] DB,
	 input wire clr,
	 input wire WCT, // WCTΪдCache����洢���ź�
	 input wire MWr, // �����д1�ź�
	 output reg hit);
	 
	 reg [14:0] table_memory[0:16383]; // 16k
	 integer i;
	 always @ (negedge clr)
		begin
			for (i = 0; i < 16384; i = i + 1) table_memory[i] = 0;
		end
	 always @ (posedge WCT)
		begin
			table_memory[AB[17:4]] = {AB[31:18],1'b1};
		end
	 always @ (AB or DB or MWr)
		begin
			// �����ַ������E������洢���а����BΪ��ַȡ������Ӧ��Ԫ�е�����E��ȣ�����ЧλM=1ʱ����Cache����
			if (table_memory[AB[17:4]][14:1] == AB[31:18] && table_memory[AB[17:4]][0] == 1)
				hit = 1;
			// �Ƚϲ���������������Чλ��1��0��ΪCacheû�����У����ΪCacheʧЧ����ʾҪ���ʵ��Ǹ��黹û��װ�뵽Cache��
			else hit = 0;
			// ���û�����У���������ЧλΪ0
			if (table_memory[AB[17:4]][14:1] != AB[31:18] && table_memory[AB[17:4]][0] == 1)
				table_memory[AB[17:4]][0]=0;
		end

endmodule


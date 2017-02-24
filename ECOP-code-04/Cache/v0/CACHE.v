`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:15:21 06/03/2016 
// Design Name: 
// Module Name:    CACHE 
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
module CACHE(
		input wire [31:0] AB, // ��ַ���ߣ�32λ�����ַ
		input wire [31:0] DB, // ��������
		input wire MWr, // �����д1�ź�
		input wire RD, // Cache�Ķ�0�ź�
		input wire hit,
		input wire clk,
		input wire clr,
		input wire [31:0] MD, // �洢��RAM����Cache�������ź�
		output reg [31:0] D, // Cache��CPU����
		output reg MRd, // ����Ķ�0�ź�
		output reg WCT); // WCTΪдCache����洢���ź�
		
		// Cache���bΪ14λ�����ڵ�ַwΪ4λ������Cache����Ϊ256KB(2^18)����Ԫ��
		// ���bȡ14λ����ôCache��Ϊ16KB(2^14)�飬���ڵ�ַwȡ4λ��
		// ��ÿ��Ϊ16����Ԫ��ÿ����Ԫһ���ֽڣ�
		// ʵ��Cache�Ĵ洢��ķ�������ʵ��һ��8λ�Ĵ洢��Ԫ��
		// Ȼ�������8λ�Ĵ洢��Ԫ������һ��256Kb * 8λ��Cache����ַ18λ��
		reg [7:0] cache_memory[0:262143]; // 2^18bytes = 256Kbytes = 256*1024b = 262144b
		integer count;
		integer i;
		always @ (negedge clr)
			begin
				count = 0;
				for (i = 0; i < 262144; i = i + 1) cache_memory[i] = 0;
			end
		always @ (AB or MWr)
			begin
				#1;
				// д��û�����У�û�в���
				if (MWr == 1 && hit == 1) // д������
					begin
						cache_memory[AB[17:0]] = DB[31:24];
						cache_memory[AB[17:0]+1] = DB[23:16];
						cache_memory[AB[17:0]+2] = DB[15:8];
						cache_memory[AB[17:0]+3] = DB[7:0];
					end
				else if (RD == 0 && hit == 1) // ��������
					begin
						// ��Cache����ʱ���ͽ�Cache�洢������Ӧ��Ԫ����������CPU
						D = {cache_memory[AB[17:0]],cache_memory[AB[17:0]+1],
						cache_memory[AB[17:0]+2],cache_memory[AB[17:0]+3]};
					end
				else if (RD == 0 && hit == 0) // ����û������
					begin
						// ��CacheʧЧʱ���ͽ���������Ӧ���е����ݶ���д��Cache�У�
						// ����Cache��������Ҫ�������洢���Ķ��ź�MRd��Ϊ0������
						MRd = 0;
					end
			end
		always @ (posedge clk)
			begin
				WCT = 0;
				// CacheʧЧ����ʾҪ���ʵ��Ǹ��黹û��װ�뵽Cache��
				if (RD == 0 && hit == 0 && MRd == 0)
					// ��ʱ��Ҫ�������ַȥ�������洢�����ȰѸõ�ַ���ڵĿ����Cache��
					begin
					// ����ÿ��Cache��ռʮ������Ԫ����32 λ��4���ֽڣ�
					// Ϊ���ʴ洢����λ����ô��Ҫ��������4������
					if (count < 4) // ������
						// ��ȡ�洢���иÿ�����ݣ���16���ֽڣ�Ȼ��д��Cache��Ӧ����
						begin
							#2;
							cache_memory[{AB[17:4],4'h0}+count*4] = MD[31:24];
							cache_memory[{AB[17:4],4'h0}+count*4+1] = MD[23:16];
							cache_memory[{AB[17:4],4'h0}+count*4+2] = MD[15:8];
							cache_memory[{AB[17:4],4'h0}+count*4+3] = MD[7:0];
							count = count + 1;
						end
					else
						// Ȼ���ٶ�ȡCache�иõ�ַ��������CPU
						begin
							D = {cache_memory[AB[17:0]],cache_memory[AB[17:0]+1],cache_memory[AB[17:0]+2],cache_memory[AB[17:0]+3]};
							count = 0;
							MRd = 1;
							WCT = 1; // ������޸�����洢��������дCache����洢���ź�
						end
				end
			end

endmodule

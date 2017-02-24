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
		input wire [31:0] AB, // 地址总线，32位主存地址
		input wire [31:0] DB, // 数据总线
		input wire MWr, // 主存的写1信号
		input wire RD, // Cache的读0信号
		input wire hit,
		input wire clk,
		input wire clr,
		input wire [31:0] MD, // 存储器RAM送往Cache的数据信号
		output reg [31:0] D, // Cache送CPU数据
		output reg MRd, // 主存的读0信号
		output reg WCT); // WCT为写Cache区表存储器信号
		
		// Cache块号b为14位，块内地址w为4位，所以Cache容量为256KB(2^18)个单元，
		// 块号b取14位，那么Cache分为16KB(2^14)块，块内地址w取4位，
		// 则每块为16个单元（每个单元一个字节）
		// 实现Cache的存储体的方法是先实现一个8位的存储单元，
		// 然后用这个8位的存储单元来构成一个256Kb * 8位的Cache（地址18位）
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
				// 写，没有命中，没有操作
				if (MWr == 1 && hit == 1) // 写，命中
					begin
						cache_memory[AB[17:0]] = DB[31:24];
						cache_memory[AB[17:0]+1] = DB[23:16];
						cache_memory[AB[17:0]+2] = DB[15:8];
						cache_memory[AB[17:0]+3] = DB[7:0];
					end
				else if (RD == 0 && hit == 1) // 读，命中
					begin
						// 当Cache命中时，就将Cache存储体中相应单元的数据送往CPU
						D = {cache_memory[AB[17:0]],cache_memory[AB[17:0]+1],
						cache_memory[AB[17:0]+2],cache_memory[AB[17:0]+3]};
					end
				else if (RD == 0 && hit == 0) // 读，没有命中
					begin
						// 当Cache失效时，就将主存中相应块中的数据读出写入Cache中，
						// 这样Cache控制器就要产生主存储器的读信号MRd（为0，读）
						MRd = 0;
					end
			end
		always @ (posedge clk)
			begin
				WCT = 0;
				// Cache失效，表示要访问的那个块还没有装入到Cache中
				if (RD == 0 && hit == 0 && MRd == 0)
					// 这时，要用主存地址去访问主存储器，先把该地址所在的块读到Cache中
					begin
					// 由于每个Cache块占十六个单元，按32 位（4个字节）
					// 为访问存储器单位，那么需要连续访问4次主存
					if (count < 4) // 计数器
						// 读取存储器中该块的数据，即16个字节，然后写入Cache相应块中
						begin
							#2;
							cache_memory[{AB[17:4],4'h0}+count*4] = MD[31:24];
							cache_memory[{AB[17:4],4'h0}+count*4+1] = MD[23:16];
							cache_memory[{AB[17:4],4'h0}+count*4+2] = MD[15:8];
							cache_memory[{AB[17:4],4'h0}+count*4+3] = MD[7:0];
							count = count + 1;
						end
					else
						// 然后再读取Cache中该地址的数据送CPU
						begin
							D = {cache_memory[AB[17:0]],cache_memory[AB[17:0]+1],cache_memory[AB[17:0]+2],cache_memory[AB[17:0]+3]};
							count = 0;
							MRd = 1;
							WCT = 1; // 最后再修改区表存储器，发出写Cache区表存储器信号
						end
				end
			end

endmodule

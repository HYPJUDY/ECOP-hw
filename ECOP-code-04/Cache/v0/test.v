`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:34:44 06/04/2016
// Design Name:   CACHE
// Module Name:   D:/Computer Organization/Cache/v0/test.v
// Project Name:  v0
// Target Device:  
// Tool versions:  
// Description: 
// 本实验要求实现Cache（数据Cache）及其地址变换逻辑（也叫Cache控制器），
// 采用直接相联地址变换，CPU从Cache读数据，若读不到，还必须考虑先从主存中读取数据，
// 然后再将数据写到Cache中，之后，将数据送往CPU；其次，CPU还要向存储器写数据。
// Verilog Test Fixture created by ISE for module: CACHE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk; // 系统时钟（用于计数器计数控制等操作）
	reg clr; // 系统总清零信号（清区表存储器、计数器）
	reg [31:0] AB; // CPU访问内存的地址（地址总线）
	reg [31:0] DB; // 32位数据为DB31..DB0（数据总线）

	reg MWr; // MWr（为1，写）为主存的写信号
	reg RD; // RD（为0，读）为Cache的读信号
	wire hit; // 是否命中标志
	wire [31:0] MD; // 主存送Cache的数据
	wire [31:0] D; // Cache送CPU数据
	wire MRd; // MRd（为0，读）为主存的读信号
	wire WCT; // 写Cache区表存储器信号

	// Instantiate the Unit Under Test (UUT)
	CACHE CACHE (
		.AB(AB), 
		.DB(DB), 
		.MWr(MWr), 
		.RD(RD), 
		.hit(hit),
		.clk(clk),
		.clr(clr), 
		.MD(MD), 
		.D(D), 
		.MRd(MRd), 
		.WCT(WCT)
	);
	RAM RAM (
	   .AB(AB),
		.DB(DB),
		.MWr(MWr),
		.MRd(MRd),
		.clk(clk),
		.clr(clr),
		.MD(MD)
	);
	TABLE TABLE (
		.AB(AB),
		.DB(DB),
		.clr(clr),
		.WCT(WCT),
		.MWr(MWr),
		.hit(hit)
	);

	// （一）读Cache的情况，
	// 1、Cache 中有该地址数据，直接读Cache 的数据送CPU。
	// 2、Cache 中无该地址数据，则必须从存储器读取该地址数据写入Cache，然后送CPU。

	// （二）修改Cache和存储器
	// 如果Cache中有该地址块数据，则修改（没有就没有的改了），同时修改存储器该地址单元数据。


	initial begin
		// Initialize Inputs
      clk = 0;
		clr = 1;
		// Add stimulus here
		#10;
		clr = 0;
		#10;

		// 写数据10（十进制，占四个字节，四个单元）， 
		// Cache为空，没有该地址块数据，只修改存储器该地址单元数据
		// 存储器中从0x1开始存放，占4个单元
		AB = 32'b00000000000000000000000000000001;  
		DB = 10;
		RD = 1;
		MWr = 1;
		#50;

		// 写数据20， Cache为空，没有该地址块数据，只修改存储器该地址单元数据
		AB = 32'b00000000000000000000000000010010;
		DB = 20;
		RD  = 1;
		MWr = 1;
		#50;

		// 写数据30， Cache为空，没有该地址块数据，只修改存储器该地址单元数据
		AB = 32'b00000000000001000000000000110000;  // 0x40030
		DB = 30;
		RD = 1;
		MWr = 1;
		#50;

	   // 读数据，Cache为空，无该地址数据，则必须从存储器读取该地址数据写入Cache，然后送CPU
	   // AB = 32'b00000000000001（14位，区号，在最低位加一位有效位1，得十五位二进制数11，存到区表存储器的根据块号找到的地址单元）
		// 00000000000011（14位块号）0000（4位，块内地址）从存储器读取数据30写入cache的第3块的第0-3个单元（即110000地址）
		AB = 32'b00000000000001000000000000110000;
		RD = 0;
		MWr = 0;
		#50;

		// 读数据，Cache为空，无该地址数据，则必须从存储器读取该地址数据写入Cache，然后送CPU
	   // AB = 32'b00000000000000（14位，区号，在最低位加一位有效位1，得十五位二进制数1，存到区表存储器的根据块号找到的地址单元）
		// 00000000000001（14位块号）0010（4位，块内地址）从存储器读取数据20写入cache的第1块的第2-5个单元（即10010地址）
		AB = 32'b00000000000000000000000000010010;
		RD  = 0;
		MWr = 0;
		#50;

		// 写数据40， Cache中有该地址块数据，修改cache，同时修改存储器该地址单元数据。
		AB = 32'b00000000000001000000000000110000;
		DB = 40;
		RD = 1;
		MWr = 1;
		#50;

		// 写数据50， Cache中没有该地址块数据，没有命中，只修改存储器该地址单元数据
		// 块号11和前面相同，但此时Cache中block3已经不再对应地址0x000c0034所属的block，所以区表存储器需要将block3所对应的标志位设为0
		AB = 32'b00000000000011000000000000110100;
		DB = 50;
		MWr = 1;
		RD = 1;
		#50;

		// 读数据，Cache 中无该地址数据，则必须从存储器读取该地址数据写入Cache，然后送CPU。
		AB = 32'b00000000000011000000000000110100;  //read
		MWr = 0;
		RD = 0;
		#50;

		// 读数据，Cache 中有该地址数据，直接读Cache 的数据送CPU。
		AB = 32'b00000000000000000000000000010010;  //read
		RD = 0;
		MWr = 0;
		#50;
		
		#50;
	end
   always #5 clk=~clk;
endmodule


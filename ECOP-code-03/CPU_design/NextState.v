`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:20 05/16/2016 
// Design Name: 
// Module Name:    NextState 
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
module NextState(
	state, Opcode, nextState
    );
	input [2:0] state;
	input [5:0] Opcode;
	output reg [2:0] nextState;
	parameter [2:0] IF = 3'b000,
					ID = 3'b001,
					EXE_3stages = 3'b101,
					EXE_4stages = 3'b110,
					EXE_5stages = 3'b010,
					MEM = 3'b011,
					WB_4stages = 3'b111,
					WB_5stages = 3'b100;

	always @(state or Opcode) begin
		case(state)
			IF: nextState = ID;
			ID: begin
				case(Opcode)
					6'b111000, 6'b111010, 6'b111001, 6'b111111: // j,jal,jr,halt
						nextState = IF;
					6'b110100: // beq
						nextState =  EXE_3stages;
					6'b110000, 6'b110001: // sw, lw
						nextState =  EXE_5stages;
					default:
						nextState = EXE_4stages;
				endcase
			end
			EXE_4stages: nextState = WB_4stages;
			EXE_5stages: nextState = MEM;
			MEM: begin
				case(Opcode)
					6'b110001: nextState = WB_5stages; // lw
					default: nextState = IF; // sw
				endcase
			end
			default: nextState = IF; // EXE_3stages: WB_4stages: WB_5stages
		endcase
	end

endmodule

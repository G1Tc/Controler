`timescale 1ns / 1ps

module decoder(
    input [31:0] instruction,
    output reg [1:0] instr_type,
    output reg [2:0] data_instr_type
    );

    always @(*) begin
	case(instruction[27:26]) 
		00: begin 
			instr_type = 2'b01; //Data Processing
			data_instr_type = instruction[25] ? 3'b001 :
				!instruction[25] && !instruction[4] ? 3'b010 : 
				instruction[25] && instruction[7] && instruction [4] ? 3'b011 :
				!instruction[25] && !instruction[24] && !instruction[7] && 
				instruction[6] && instruction[5] && !instruction[4] ? 3'b100 : 3'b000;
		end

		01: instr_type=2'b10; //Memory type

		10: instr_type=2'b11; //branch

	    	default: instr_type=2'b00; // not indentifiable
	endcase


   end 

endmodule

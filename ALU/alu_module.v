`timescale 1ns / 1ps

module alu_module(
    input [31:0] A,
    input [31:0] B,
    input [1:0] OP,
    input [3:0] cmd,
    output [3:0] flags,
    output [31:0] out
    );

    always @(*) begin
	
	    case(cmd)
		    0: out = A & B;	// AND
		    1: out = A ^ B;	// XOR
		    2: out = A - B;	// SUB
		    3: out = B - A;	// RSB
		    4: out = A + B;	// ADD
		    10: out = A - B;	// CMP
		    12: out = A | B;	// OR
		    default: out = 0;
	    endcase

    end

    always @(*) begin

	flags[3] = out[31];	// N flag
	flags[2] = out ? 0 : 1;	// Z flag
	flagg[1] = 

    end


endmodule
`timescale 1ns / 1ps

module alu_module(
    input [31:0] A,
    input [31:0] B,
    input [1:0] OP,
    input [3:0] cmd,
    output reg [3:0] flags,
    output reg [31:0] out
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
	
	if (cmd==0 | cmd==10) begin 
		flags[1] = A < B ? 1 : 0;
		flags[0] = (A[31]!=B[31] && B[31]!=out[31]) ? 1 : 0;
	end

	else if(cmd==3) begin 
		flags[1] = A > B ? 1 : 0;
		flags[0] = (A[31]!=B[31] && B[31]!=out[31]) ? 1 : 0;	
	end
	
	else if(cmd==4) begin 
		flags[1] = (A>out || out<B) ? 1 : 0;
		flags[0] = (A[31]==B[31] && A[31]!=out[31]) ? 1 : 0;	
	end

	else begin
	flags[1]=0;
	flags[0]=0;
	end
	

    end


endmodule

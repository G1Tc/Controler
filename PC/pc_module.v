`timescale 1ns / 1ps

module pc_module(
    input clk,
    input sel,
    input [7:0] jmp,
    output reg [7:0] pc_out,
    output [7:0] r15
    );
    wire [7:0] mux;

    always @ (posedge clk) begin
	    pc_out <= mux;
    end
    
    assign mux = sel ? jmp : pc_out+1;
    assign r15 = pc_out + 2;

endmodule

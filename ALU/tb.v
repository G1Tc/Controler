`timescale 1ns / 1ps

module tb;
    reg [31:0] A;
    reg [31:0] B;
    reg [1:0] OP;
    reg [3:0] cmd;
    wire [3:0] flags;
    wire [31:0] out;

	alu_module uut (
	.A(A),
	.B(B),
	.OP(OP),
	.cmd(cmd),
	.flags(flags),
	.out(out)
	);

initial begin
#100

A=32'h00011;
B=32'h00101;

#100; cmd=0;
#100; cmd=1;
#100; cmd = 2;
#100; cmd = 3;
#100; cmd = 4;
#100; cmd = 10;
#100; cmd = 12;
end

endmodule

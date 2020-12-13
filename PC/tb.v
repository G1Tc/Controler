module tb;
	reg clk;
	reg sel;
	reg [7:0] jmp;
	wire [7:0] pc_out;
	wire [7:0] r15;

	pc_module uut (
		.clk(clk), 
		.sel(sel), 
		.jmp(jmp), 
		.r15 (r15), 
		.pc_out (pc_out)
	);
	
	always #10 clk <= !clk;
	always #100 sel <= !sel;
	always #100 jmp <= jmp + 10;
	
	initial begin

		clk = 0;
		sel = 0;
		jmp = 0;
	
	end 
endmodule

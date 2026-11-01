module mini_soc_tb();
	reg clk, rst, alu_sel, mux_sel;
	wire [1:0] soc_out;

	mini_soc dut(.clk(clk), .rst(rst), .ALUSel(alu_sel), .MUXSel(mux_sel), .SOCOut(soc_out));

	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	initial begin
		$dumpfile("mini_soc.vcd");
		$dumpvars(0, "mini_soc_tb");
		$monitor("SimTime : %g, clock = %b, reset = %b, ALU_select = %b, MUX_select = %b, SOC_output = %d", $time, clk, rst, alu_sel, mux_sel, soc_out);
	end

	initial begin
		rst = 1'b1;
		alu_sel = 1'b0;
		mux_sel = 1'b0;
		#10
		rst = 1'b0;
		#20
		alu_sel = 1'b1;
		#30
		mux_sel = 1'b1;
		#40
		alu_sel = 1'b0;
		#20
		mux_sel = 1'b0;
		#50
		$finish;
	end
endmodule

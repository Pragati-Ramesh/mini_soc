module mini_soc(input clk, rst, ALUSel, MUXSel,
		output [1:0] SOCOut);
	wire [3:0] w1;
	wire [1:0] w2;
	counter dut1 (.clk(clk), .rst(rst), .count(w1));
	
	alu dut2(.a({w1[3], w1[2]}), .b({w1[1], w1[0]}), .ALUSelect(ALUSel), .res(w2));

	mux dut3(.in0({w1[3], w1[2]}), .in1(w2), .sel(MUXSel), .SOCOut(SOCOut));

endmodule

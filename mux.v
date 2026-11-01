module mux(input [1:0] in0, in1, 
	   input sel,
	   output [1:0] SOCOut);
	assign SOCOut = sel ? in1 : in0;
endmodule

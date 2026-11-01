module alu(input [1:0] a, b,
	   input ALUSelect,
	   output reg [1:0] res);
	always @(*) begin
		case(ALUSelect)
			1'b0: res = a + b;
			1'b1: res = a - b;
			default: res = 2'd0;
		endcase
	end
endmodule

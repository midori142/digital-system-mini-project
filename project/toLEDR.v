module toLEDR(in, En, LEDR0, LEDR1, LEDR2);
	input[1:0] in;
	input En;
	output reg LEDR0, LEDR1, LEDR2;
	// LEDR2 = RED ... LEDR0 = GREEN
	always @(*) begin
		LEDR2 = En & ~in[1] & ~in[0];
		LEDR1 = En & ~in[1] &  in[0];
		LEDR0 = En &  in[1] &  in[0];
	end
endmodule 
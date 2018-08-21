module toLEDR(in, inset, En, enSet, LEDR0, LEDR1, LEDR2);
	input[1:0] in, inset;
	input En, enSet;
	output reg LEDR0, LEDR1, LEDR2;
	// LEDR2 = RED ... LEDR0 = GREEN
	always @(*) begin
		LEDR2 = En & ~(enSet ? inset[1] : in[1]) & ~(enSet ? inset[0] : in[0]);
		LEDR1 = En & ~(enSet ? inset[1] : in[1]) &  (enSet ? inset[0] : in[0]);
		LEDR0 = En &  (enSet ? inset[1] : in[1]) &  (enSet ? inset[0] : in[0]);
	end
endmodule 
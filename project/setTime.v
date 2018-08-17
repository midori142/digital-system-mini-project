module setTime(submit, select, Din, En, enSet, selout, Dout);
	input En, enSet, submit;
	input[6:0] Din;
	input[1:0] select;
	output reg[6:0] Dout;
	output reg[1:0] selout;
	
	reg prevSub;
	
	initial begin
		Dout   = 7'bz;
		selout = 2'bz;
		prevSub = submit;
	end
	
	always @(*) begin
		if (En & enSet) begin
			if (prevSub == 1'b0 && submit == 1'b1) begin		// PGT of submit
				Dout = Din;
				selout = select;
			end
		end
		prevSub = submit;
		#5 Dout = 7'bz;
		selout = 2'bz;
	end
endmodule 
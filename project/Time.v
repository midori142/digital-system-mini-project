module Time(set, select, D, Q);
	input 				set;				// set = 0/1: output/input data.
	input[1:0] 			select;
	input[6:0] 			D;
	output reg[6:0]	Q;
	
	reg[6:0] tR, tY, tG;
	
	initial begin
		tR = 'd35;
		tY = 'd04;
		tG = 'd25;
	end

	always @(*) begin
		case (select)
			2'b00: if (set) tR = D; else Q = tR;
			2'b01: if (set) tY = D; else Q = tY;
			2'b11: if (set) tG = D; else Q = tG;
		endcase
	end
endmodule 
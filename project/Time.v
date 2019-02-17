module Time(IE, enSet, select, D, t);
	input 				IE, enSet;				// set = 0/1: output/input data.
	input[1:0] 			select;
	input[6:0] 			D;
	output reg[20:0]  t;
	
	initial begin
		t[20:14]	= 7'b0100011;
		t[13: 7] = 7'b0000100;
		t[ 6: 0] = 7'b0011001;
	end
	
	always @(posedge IE) begin
		case (select)
			2'b00: if (enSet) t[20:14] = D;
			2'b01: if (enSet) t[13: 7] = D;
			2'b11: if (enSet) t[ 6: 0] = D;
		endcase 
	end
endmodule 
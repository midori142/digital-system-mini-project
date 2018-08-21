module countdown(En, enSet, CLK, t, select, Q);
	input En, enSet, CLK; 
	input[20:0] t;
	output reg[1:0] select;
	output reg[6:0] Q;
	
	reg[22:0] counter;
	
	initial begin
		counter 		= 22'b0;
		select 		= 2'b00;
		Q 				= 7'b0100100;
	end
	
	always @(posedge CLK) counter = (En && ~enSet) ? counter + 1 : 0;
	
	always @(posedge counter[19]) begin
		if (En && ~enSet) begin
			if (Q == 1'b0) begin
				select = select + (select == 2'b01 ? 2 : 1);
            case (select)
					2'b00 : Q = t[20:14] + 1;
					2'b01 : Q = t[13: 7] + 1;
					2'b11 : Q = t[ 6: 0] + 1;
				endcase
			end
         Q = Q - 1;
		end
      else if (enSet) begin
			select = 0;
			Q = t[20:14];
      end
	end
endmodule 
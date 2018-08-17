module countdown(En, enSet, CLK, T, select, Q);
	input En, enSet, CLK; 
	input[6:0] T;
	output reg[1:0] select;
	output reg[6:0] Q;
	
	reg[22:0] counter;
	
	initial begin
		counter 	= 22'b0;
		select 		= 2'b00;
		Q 			= T;
	end
	
	always @(posedge CLK) counter = (En && ~enSet) ? counter + 1 : 0;
	
	always @(posedge counter[22]) begin
        if (En && ~enSet) begin
            if (Q == 1'b0) begin
                select = select + 1;
                if (select == 2'b10) select = 2'b11;
                Q = T;
				end
            Q = Q - 1;
        end
        else if (enSet) begin
            select = 0;
            Q = 0;
        end
	end
endmodule 

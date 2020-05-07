module Mux2 (d0,d1,s0,out);
	input d0,d1,s0;
	output out;
	tri out;
	bufif1 (out,d1,s0);
	bufif0 (out,d0,s0);
endmodule

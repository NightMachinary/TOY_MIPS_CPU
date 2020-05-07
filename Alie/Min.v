module Min
(
   input [31:0]  x,
                 y,
					  
	
   output [31:0] A
);

	wire [31:0] tmp; 

	            Minus32 m1 (.x(x),.y(y),.cin(1'd0),.A(tmp));
	Mux2 m2 [31 : 0](.d0(y),.d1(x),.s0({32{tmp[31]}}),.out(A));


endmodule 

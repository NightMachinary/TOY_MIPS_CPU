module MyNor
(
   input [31:0]  x,
                 y,
					  
	
   output [31:0] A
);
 
wire [31:0] B;

or nor1 [31:0] (B,x,y);
not not1 [31:0] (A,B);

endmodule
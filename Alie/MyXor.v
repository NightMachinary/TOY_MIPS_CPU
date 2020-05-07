module MyXor
(
   input [31:0]  x,
                 y,
					  
	
   output [31:0] A
);

xor xor1 [31:0] (A,x,y);

endmodule
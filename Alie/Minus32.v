module Minus32
  (
   input [31:0]  x,
                 y,
   input         cin,
  output cout,
   output [31:0] A, 
   output        overflow
   );

   wire [31:0]   cins;
	 wire [31:0]   yBar, negY;
   
   not n1 [31:0] (yBar,y);
   Adder32 a1 (.x(yBar),.y(32'd1),.cin(1'd0),.A(negY));
	 
   Adder32 a2 (.x(x),.y(negY),.A(A),.cin(cin), .cout(cout),.overflow(overflow));
   
   
endmodule 

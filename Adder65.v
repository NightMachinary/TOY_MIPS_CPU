module Adder65
  (
   input [64:0]  x,
                 y,
   input         cin,
  
   output [64:0] A, 
   output        cout, output overflow
   );

   wire [64:0]   cins;
   
   FullAdder fadd[64:0] (.x(x), .y(y), .cin({cins[63:0],cin}), .A(A), .cout(cins)); 
   assign cout = cins[64];
   and (isNegative, x[64], y[64]);
   xor (signsVary, x[64], y[64]);
   nor (isPositive, x[64], y[64]);
   //Mux2(.d0(), .d1(1'b0), .s0(signsVary), .out(overflow));
   
endmodule 

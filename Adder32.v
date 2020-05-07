module Adder32
  (
   input [31:0]  x,
                 y,
   input         cin,
  
   output [31:0] A, 
   output        cout, output overflow
   );

   wire [31:0]   cins;
   
   FullAdder fadd[31:0] (.x(x), .y(y), .cin({cins[30:0],cin}), .A(A), .cout(cins)); 
   assign cout = cins[31];
   and (isNegative, x[31], y[31]);
   xor (signsVary, x[31], y[31]);
   nor (isPositive, x[31], y[31]);
   
   Mux8 jj4 (.d0(1'b1), .d4(1'b0), .d5(1'b0), .d6(1'b0), .d7(1'b0), .d2(1'b0), .d3(1'b1), .d1(1'b0), .s2(signsVary), .s1(isPositive), .s0(A[31]), .out(overflow));
  
   
endmodule 

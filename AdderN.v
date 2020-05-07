module AdderN
  (
   x,
   y,
   cin,
   A, 
   cout 
   );
   parameter N = 32;
   input [N-1:0] x,
                 y;
   input         cin;
   
   output [N-1:0] A; 
   output         cout;
   
   wire [N-1:0]   cins;
   
   FullAdder fadd[N-1:0] (.x(x), .y(y), .cin({cins[N-2:0],cin}), .A(A), .cout(cins)); 
   assign cout = cins[N-1];
   
endmodule 

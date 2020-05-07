module Mux8 (input d0,d1,d2,d3, d4,d5,d6,d7,s0,s1,s2,output out);
  
   Mux4 jj3 (.d0(d0),.d1(d1), .d2 (d2),.d3(d3),.s0(s0),.s1(s1),.out(m1o));
   Mux4  jj4 (.d0(d4),.d1(d5), .d2 (d6),.d3(d7),.s0(s0),.s1(s1),.out(m2o));
   Mux2 m3 (.d0(m1o),.d1(m2o),.s0(s2),.out(out));
   
endmodule

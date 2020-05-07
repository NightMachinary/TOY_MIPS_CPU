module Mux16 (input d0,d1,d2,d3, d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,s0,s1,s2,s3,output out);
   
   Mux8 jj9 (.d0(d0),.d1(d1), .d2 (d2),.d3(d3), .d4(d4), .d5(d5), .d6(d6), .d7(d7),.s0(s0),.s1(s1),.s2(s2),.out(m1o));
   Mux8 jj7 (.d0(d8),.d1(d9), .d2 (d10),.d3(d11), .d4(d12), .d5(d13), .d6(d14), .d7(d15),.s0(s0),.s1(s1),.s2(s2),.out(m2o));
   Mux2 m3 (.d0(m1o),.d1(m2o),.s0(s3),.out(out));
   
endmodule

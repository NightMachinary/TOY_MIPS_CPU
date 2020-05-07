module Mux4 (input d0,d1,d2,d3,s0,s1,output out);
   //(out, i0, i1, i2, i3, s1, s0);

   // Port declarations from the I/O diagram
   // output out;
   // input  i0, i1, i2, i3;
   // input  s1, s0;

   Mux2 m1 (.d0(d0),.d1(d1),.s0(s0),.out(m1o));
   Mux2 m2 (.d0(d2),.d1(d3),.s0(s0),.out(m2o));
   Mux2 m3 (.d0(m1o),.d1(m2o),.s0(s1),.out(out));
   
   
   //Old impl:
   // Internal wire declarations
   //wire   s1n, s0n;
   //wire   y0, y1, y2, y3;
   
   // // Gate instantiations

   // // Create s1n and s0n signals.
   // not (s1n, s1);
   // not (s0n, s0);

   // // 3-input and gates instantiated
   // and (y0, i0, s1n, s0n);
   // and (y1, i1, s1n, s0);
   // and (y2, i2, s1, s0n);
   // and (y3, i3, s1, s0);

   // // 4-input or gate instantiated
   // or (out, y0, y1, y2, y3);

endmodule

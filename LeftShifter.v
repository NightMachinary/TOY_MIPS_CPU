module LeftShifter (input [4:0] amount,input [31:0] data, output [31:0] out);
   localparam N = 32;

	   wire [N-1:0] t0o, l0o;
   
   LF1 l1 (.data(data), .out(l0o));
   Mux2 t1 [N-1:0](.d0(data),.d1(l0o), .s0(amount[0]), .out(t0o));

   wire [N-1:0]   t1o, l1o;
   
   wire [N-1:0]   t2o, l2o;
   
   wire [N-1:0]   t3o, l3o;
   
   wire [N-1:0]   t4o, l4o;
   

   LF2 jj1 (.data(t0o), .out(l1o));
   Mux2 mmm1 [N-1:0] (.d0(t0o),.d1(l1o), .s0(amount[1]), .out(t1o));
   

   LF4 jj2 (.data(t1o), .out(l2o));
   Mux2 mmm2 [N-1:0] (.d0(t1o),.d1(l2o), .s0(amount[2]), .out(t2o));
   

   LF8 jj3 (.data(t2o), .out(l3o));
   Mux2 mmm3 [N-1:0] (.d0(t2o),.d1(l3o), .s0(amount[3]), .out(t3o));
   

   LF16 jj4 (.data(t3o), .out(l4o));
   Mux2 mmm4 [N-1:0] (.d0(t3o),.d1(l4o), .s0(amount[4]), .out(t4o));
   
 
  assign out = t4o;
   
   
  endmodule

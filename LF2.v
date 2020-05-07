module LF2 (input [31:0] data, output [31:0] out);
  
	wire [31:0] t1;
   LF1 l(.data(data),.out(t1));
   LF1 k(.data(t1),.out(out));
   
endmodule 

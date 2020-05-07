module LF4 (input [31:0] data, output [31:0] out);
  
	wire [31:0] t1;
   LF2 k(.data(data),.out(t1));
   LF2 l(.data(t1),.out(out));
   
endmodule 

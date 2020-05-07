module LF8 (input [31:0] data, output [31:0] out);
   
   wire [31:0] t1;
   LF4 l(.data(data),.out(t1));
   LF4 k(.data(t1),.out(out));
   
endmodule 

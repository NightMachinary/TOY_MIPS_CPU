module LF16 (input [31:0] data, output [31:0] out);
   
   wire [31:0] t1;
   LF8 l(.data(data),.out(t1));
   LF8 k(.data(t1),.out(out));
   
endmodule 

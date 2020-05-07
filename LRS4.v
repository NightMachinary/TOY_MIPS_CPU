module LRS4 (input [31:0] data, output [31:0] out);
   
   wire [31:0] t1;
   LRS2 l(.data(data),.out(t1));
   LRS2 k(.data(t1),.out(out));
   
endmodule 

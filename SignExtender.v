module SignExtender (input [15:0] data, output [31:0] exData);
  assign exData = {{16{data[15]}},data};
endmodule

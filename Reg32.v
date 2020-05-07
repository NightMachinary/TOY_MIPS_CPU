module Reg32(input [31:0] data,input clk,output [31:0] storedData,input clear,input [31:0] preset);
  mydff d1[31:0](.D(data),.clk(clk),.Q(storedData),.preset(preset),.clear({32{clear}}));
endmodule

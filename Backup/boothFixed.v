module boothFixed (m,r,  ans,  overflow,  cAns);
   parameter WWidth = 32;
   localparam DWidth = WWidth * 2;

   input [WWidth-1:0] m,r;
   output [WWidth-1:0] ans;
   output              overflow;
   output [DWidth-1:0] cAns;
   booth #(.WWidth(WWidth*2),.DWidth(DWidth*2)) b1 (.m({{WWidth{m[WWidth-1]}},m}), .r({{WWidth{r[WWidth-1]}},r}), .ans(cAns));

   assign ans = cAns[WWidth-1:0];
   
   wire                isPos = &(!cAns[DWidth-1:WWidth]);
   wire                isNeg =  &cAns[DWidth-1:WWidth];
   nor (overflow, isPos, isNeg);
endmodule

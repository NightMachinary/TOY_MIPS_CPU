module booth (m,r,  ans,  overflow,  cAns  );
   parameter WWidth = 32;
   localparam DWidth = WWidth * 2;

   input [WWidth-1:0] m,r;
   output [WWidth-1:0] ans;
   output              overflow;
   output [DWidth-1:0] cAns;
   wire [DWidth:0] pArray [WWidth:0];
   
   
   wire [WWidth-1:0]             mBar, negM;
   
   not n1 [WWidth-1:0] (mBar,m);
  AdderN #(WWidth) a1 (.x(mBar),.y({{(WWidth-1){1'b0}},1'b1}), .cin(1'd0),.A(negM));
   
   wire [DWidth:0]               s,a,p;
   
               assign s = {negM,{(WWidth+1){1'd0}}};
   assign a = {m,{(WWidth+1){1'd0}}};
               assign p = {{WWidth{1'd0}},r,1'b0};

   // wire [DWidth:0] pArray [WWidth:0];
   assign pArray[0] = p;

   genvar                        i;

   generate for (i=0; i < WWidth; i=i+1) begin: evil_loop
      
      wire [DWidth:0] a_p1,s_p1, o1, o1b, pi;
      assign pi = pArray[i];
      
      AdderN #(DWidth+1) aa1 (.x(pArray[i]), .y(a), .cin(1'd0), .A(a_p1));
      AdderN #(DWidth+1) aa2 (.x(pArray[i]), .y(s), .cin(1'd0), .A(s_p1));
      Mux4 mx1 [DWidth:0] (.d0(pArray[i]), .d3(pArray[i]), .d1(a_p1), .d2(s_p1), .s0({(DWidth+1){pi[0]}}), .s1({(DWidth+1){pi[1]}}), .out(o1));
      assign pArray[i+1] = o1 >>> 1;
      

   end
   endgenerate

   wire [DWidth:0]    longAns = pArray[WWidth];
   assign cAns = longAns[DWidth:1];
   
   assign ans = longAns[WWidth:1];
   
   wire               isPos = &(!longAns[DWidth:WWidth+1]);
   wire               isNeg =  &longAns[DWidth:WWidth+1];
   nor (overflow, isPos, isNeg);
   
endmodule


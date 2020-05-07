module myDiv (dividend, divisor,  quotient,  remainder);
   parameter WWidth = 32;
   localparam DWidth = WWidth * 2;

   input [WWidth-1:0] dividend, divisor;
   output [WWidth-1:0] quotient;
   output [DWidth-1:0] remainder;
   
   wire [DWidth-1:0]   divisorArray [WWidth+1:0];
   wire [DWidth-1:0]   remainderArray [WWidth+1:0];
   wire [WWidth-1:0]   quotientArray [WWidth+1:0];

   assign   remainderArray[0] = {{WWidth{32'd0}},dividend};
   assign divisorArray[0] = {divisor,{WWidth{1'd0}}};
   assign quotientArray[0] = quotient;
   
   


   genvar              i;

   generate for (i=1; i <= (WWidth+1); i=i+1) begin: veryEvil_loop


      wire [DWidth-1:0]             divisorBar, negdivisor , reducedRem;
      
      not n1 [DWidth-1:0] (divisorBar,divisorArray[i-1]);
      AdderN #(DWidth) a1 (.x(divisorBar),.y({{(DWidth-1){1'b0}},1'b1}), .cin(1'd0),.A(negdivisor));

      AdderN #(DWidth) a2 (.x(remainderArray[i-1]), .y(negdivisor), .cin(1'd0), .A(reducedRem));

                                                                                                                   Mux2 m2 [DWidth-1:0] (.d0(reducedRem),.d1(remainderArray[i-1]),.s0({(DWidth){reducedRem[DWidth-1]}}), .out(remainderArray[i]));
      
      
      wire [WWidth-1:0]             oneQ = {quotientArray[i-1][WWidth-2:0],1'd1};
      wire [WWidth-1:0]             zeroQ = {quotientArray[i-1][WWidth-2:0],1'd0};
      Mux2 m3 [WWidth-1:0] (.d0(oneQ),.d1(zeroQ),.s0({(WWidth){reducedRem[DWidth-1]}}), .out(quotientArray[i]));

      assign divisorArray[i] = divisorArray[i-1] >> 1; //might be >>>
      
      
      

   end
   endgenerate

   assign remainder = remainderArray[WWidth+1];
   assign quotient = quotientArray[WWidth+1]; 
   
endmodule


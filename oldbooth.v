module oldbooth (input [31:0] m,r, output [31:0] ans, output overflow, output [63:0] cAns );

   wire [31:0] mBar, negM;
   
   assign mBar = !m; // not n1 [31:0] (mBar,m);
   Adder32 a1 (.x(mBar),.y(32'd1),.cin(1'd0),.A(negM));
   
   wire [64:0] s,a,p;
   
   assign s = {negM,33'b0};
   assign a = {m,33'b0};
   assign p = {32'b0,r,1'b0};

    wire [64:0] pArray [32:0];
   assign pArray[0] = p;

   genvar      i;

   generate for (i=0; i < 32; i=i+1) begin: evil_loop
      
      wire [64:0] a_p1,s_p1, o1, o1b, pi;
      assign pi = pArray[i];
      
                    Adder65 aaa1 (.x(pArray[i]), .y(a),.cin(1'd0), .A(a_p1));
                    Adder65 aaa2 (.x(pArray[i]), .y(s),.cin(1'd0), .A(s_p1));
      Mux4 mx1 [64:0] (.d0(pArray[i]), .d3(pArray[i]), .d1(a_p1), .d2(s_p1), .s0({65{pi[0]}}), .s1({65{pi[1]}}), .out(o1));
      assign pArray[i+1] = o1 >>> 1;
      

   end
   endgenerate

   wire [64:0]    longAns = pArray[32];
   assign cAns = longAns[64:1];
   
   assign ans = longAns[32:1];
   
   wire           isPos = &(!longAns[64:33]);
   wire           isNeg =  &longAns[64:33];
   nor (overflow, isPos, isNeg);
   
endmodule


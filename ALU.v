module ALU
  (
   input [31:0]  A,
                 B,
	
	 input [3:0]   operation,
	 input [4:0]   shift_amount,
	
	 output [31:0] C,
	 output        zero,sign,carry,overflow
   );
	 
	 wire [31:0]   myor,myand,myxor,mynor,myadd,mysub,mymin,mydiv,mymul,mysra,mysrl,mysll;
wire myaddof,mysubof,mymulof,myaddcarry,myminuscarry;
	 
	 MyOr m1(.x(A),.y(B),.A(myor));
	 MyAnd m2(.x(A),.y(B),.A(myand));
	 MyXor m3(.x(A),.y(B),.A(myxor));
	 MyNor m4(.x(A),.y(B),.A(mynor));
	 Adder32 m5(.x(A),.y(B),.A(myadd),.cin(1'b0),.overflow(myaddof),.cout(myaddcarry));
	            Minus32 m6(.x(A),.y(B),.A(mysub),.cin(1'b0),.overflow(mysubof),.cout(myminuscarry));
	 Min m7(.x(A),.y(B),.A(mymin));

   
   // boothFixed bf1 (.m(A), .r(B), .ans(mymul), .overflow(mymulof));
   // myDiv md1 (.dividend(A),.divisor(B), .quotient(mydiv));
 
	 assign mydiv=A/B;
	 assign mymul=A*B;
   
   //Note: MIPS datapath requires shifting B!
	 //sra 
   assign mysra = $signed(B) >>> shift_amount;
   
	 //srl
   assign mysrl = B >> shift_amount;
   
	 //sll
   LeftShifter jj1(.data(B), .out(mysll), .amount(shift_amount));
   
	 
	 
	 Mux16 mm[31:0] (.d0(myor),.d1(myand),.d2(myxor),.d3(mynor),.d4(myadd),.d5(mysub),.d6(mymin),.d7(mydiv),.d8(mymul),.d9(mysra),.d10(mysrl),.d11(mysll),.s0(operation[0]),.s1(operation[1]),.s2(operation[2]),.s3(operation[3]),.out(C));
	 Mux16 mm1 (.d4(myaddof),.d5(mysubof),.d8(mymulof),.s0(operation[0]),.s1(operation[1]),.s2(operation[2]),.s3(operation[3]),.out(overflow));
	 Mux16 mm2 (.d4(myaddcarry),.d5(myminuscarry),.s0(operation[0]),.s1(operation[1]),.s2(operation[2]),.s3(operation[3]),.out(carry));
	 
	 assign sign=C[31];
	 or or1 (zero,C[0],C[1],C[2],C[3],C[4],C[5],C[6],C[7],C[8],C[9],C[10],C[11],C[12],C[13],C[14],C[15],C[16],C[17],C[18],C[19],C[20],C[21],C[22],C[23],C[24],C[25],C[26],C[27],C[28],C[29],C[30],C[31]);
	 
	 
	 
endmodule 

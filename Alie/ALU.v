module ALU
  (
   input [31:0]  A,
                 B,
					  
	input [3:0] operation,
	input [4:0] shift_amount,
	
	output [31:0] C,
	output zero,sign,overflow,carry
   );
	
	wire [31:0] myor,myand,myxor,mynor,myadd,mysub,mymin,mydiv,mymul,mysra,mysrl,mysll,myaddof,mysubof,mymulof;
	
	MyOr m1(.x(A),.y(B),.A(myor));
	MyAnd m2(.x(A),.y(B),.A(myand));
	MyXor m3(.x(A),.y(B),.A(myxor));
	MyNor m4(.x(A),.y(B),.A(mynor));
	Adder32 m5(.x(A),.y(B),.A(myadd),.overflow(myaddof));
	Minus32 m6(.x(A),.y(B),.A(mysub),.overflow(mysubof));
	Min m7(.x(A),.y(B),.A(mymin));
	//div
	//boothFixed m9(.m(A),.r(B),.ans(mymul),.overflow(mymulof));
	//sra
	//srl
	//sll
	
	
	Mux16 mm[31:0] (.d0(myor),.d1(myand),.d2(myxor),.d3(mynor),.d4(myadd),.d5(mysub),.d6(mymin),.d7(mydiv),.d8(mymul),.d9(mysra),.d10(mysrl),.d11(mysll),.s0(operation[0]),.s1(operation[1]),.s2(operation[2]),.s3(operation[3]),.out(C));
	
	
endmodule 

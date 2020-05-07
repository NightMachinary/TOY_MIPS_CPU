module Control
  (
   input [31:0]     instruction,
   input            zero,
  
   output reg [3:0] ALUOp, 
   output reg       jumpSrc,
	                  PCSrc,
	                  RegWrite,
	                  MemWrite,
	                  MemtoReg,
	                  MemRead,
	                  RegDst,
	                  ALUSrc,
	
	 output reg [4:0] shift_amount
   );

	 
	 wire             opcodeOr;
	 
	 or (opcodeOr,instruction[31],instruction[30],instruction[29],instruction[28],instruction[27],instruction[26]);
	 
	 always @(*)
	   begin
		    if (opcodeOr == 0)
			    begin
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==0 && instruction[2]==0 && instruction[1]==0 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[0]=0;
						      ALUOp[1]=0;
						      ALUOp[2]=1;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==0 && instruction[2]==1 && instruction[1]==0 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[0]=1;
						      ALUOp[1]=0;
						      ALUOp[2]=0;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
				     
             //div
				     if (instruction[5]==0 && instruction[4]==1 && instruction[3]==1 && instruction[2]==0 && instruction[1]==1 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[0]=1;
						      ALUOp[1]=1;
						      ALUOp[2]=1;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
					   
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==0 && instruction[2]==1 && instruction[1]==0 && instruction[0]==1)
			         begin
						      RegWrite=1;
						      ALUOp[0]=0;
						      ALUOp[1]=0;
						      ALUOp[2]=0;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==0 && instruction[2]==1 && instruction[1]==1 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[0]=0;
						      ALUOp[1]=1;
						      ALUOp[2]=0;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
					   
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==0 && instruction[2]==1 && instruction[1]==1 && instruction[0]==1)
			         begin
						      RegWrite=1;
						      ALUOp[1]=1;
						      ALUOp[0]=1;
						      ALUOp[2]=0;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;

					     end
					   
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==0 && instruction[2]==0 && instruction[1]==1 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[2]=1;
						      ALUOp[0]=1;
						      ALUOp[1]=0;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1; //edited
						      ALUSrc=0;
					     end
					   
				     
				     if (instruction[5]==1 && instruction[4]==0 && instruction[3]==1 && instruction[2]==0 && instruction[1]==1 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[2]=1;
						      ALUOp[1]=1;
						      ALUOp[0]=0;
						      ALUOp[3]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
					   
				    // mul 
				     if (instruction[5]==0 && instruction[4]==1 && instruction[3]==1 && instruction[2]==0 && instruction[1]==0 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[3]=1;
						      ALUOp[0]=0;
						      ALUOp[1]=0;
						      ALUOp[2]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
					     end
					   
				     
				     if (instruction[5]==0 && instruction[4]==0 && instruction[3]==0 && instruction[2]==0 && instruction[1]==1 && instruction[0]==1)
			         begin
						      RegWrite=1;
						      ALUOp[3]=1;
						      ALUOp[0]=1;
						      ALUOp[1]=0;
						      ALUOp[2]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
						      shift_amount[4]=instruction[10];
						      shift_amount[3]=instruction[9];
						      shift_amount[2]=instruction[8];
						      shift_amount[1]=instruction[7];
						      shift_amount[0]=instruction[6];
					     end
					   
				     
				     if (instruction[5]==0 && instruction[4]==0 && instruction[3]==0 && instruction[2]==0 && instruction[1]==1 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[3]=1;
						      ALUOp[1]=1;
						      ALUOp[0]=0;
						      ALUOp[2]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
						      shift_amount[4]=instruction[10];
						      shift_amount[3]=instruction[9];
						      shift_amount[2]=instruction[8];
						      shift_amount[1]=instruction[7];
						      shift_amount[0]=instruction[6];
					     end
					   
				     
				     if (instruction[5]==0 && instruction[4]==0 && instruction[3]==0 && instruction[2]==0 && instruction[1]==0 && instruction[0]==0)
			         begin
						      RegWrite=1;
						      ALUOp[3]=1;
						      ALUOp[1]=1;
						      ALUOp[0]=1;
						      ALUOp[2]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      RegDst=1;
						      ALUSrc=0;
						      shift_amount[4]=instruction[10];
						      shift_amount[3]=instruction[9];
						      shift_amount[2]=instruction[8];
						      shift_amount[1]=instruction[7];
						      shift_amount[0]=instruction[6];
					     end
			    end
		    else
			    begin
			       //sw
				     if (instruction[31]==1 && instruction[30]==0 && instruction[29]==1 && instruction[28]==0 && instruction[27]==1 && instruction[26]==1)
			         begin
						      MemWrite=1;
						      RegDst=0;
						      ALUOp[3]=0;
						      ALUOp[2]=1;
						      RegWrite=0;
						      ALUOp[0]=0;
						      ALUOp[1]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemtoReg=0;
						      MemRead=0;
						      ALUSrc=1;
					     end
					   
				     //lw
				     if (instruction[31]==1 && instruction[30]==0 && instruction[29]==0 && instruction[28]==0 && instruction[27]==1 && instruction[26]==1)
			         begin
						      RegWrite=1;
						      MemRead=1;
						      MemtoReg=1;
						      RegDst=0;
						      ALUOp[3]=0;
						      ALUOp[2]=1;
						      ALUOp[0]=0;
						      ALUOp[1]=0;
						      jumpSrc=0;
						      PCSrc=0;
						      MemWrite=0;
						      ALUSrc=1;
					     end

             // beq
				     if (instruction[31]==0 && instruction[30]==0 && instruction[29]==0 && instruction[28]==1 && instruction[27]==0 && instruction[26]==0)
			         begin
					        
						      if (zero==0)
							      PCSrc=1;
						      else
							      PCSrc=0;
					        
						      RegWrite=0;
						      RegDst=0;
						      ALUOp[3]=0;
						      ALUOp[2]=1;
						      ALUOp[1]=0;
						      ALUOp[0]=1;
						      jumpSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      ALUSrc=0;
					     end
					   
				     // bne	
				     if (instruction[31]==0 && instruction[30]==0 && instruction[29]==0 && instruction[28]==1 && instruction[27]==0 && instruction[26]==1)
			         begin
					        
						      if (zero==0)
							      PCSrc=0;
						      else
							      PCSrc=1;
					        
						      RegWrite=0;
						      RegDst=0;
							    ALUOp[3]=0;
						      ALUOp[2]=1;
						      ALUOp[1]=0;
						      ALUOp[0]=1;
						      jumpSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      ALUSrc=0;
					     end
					   
				     //  jump
				     if (instruction[31]==0 && instruction[30]==0 && instruction[29]==0 && instruction[28]==0 && instruction[27]==1 && instruction[26]==0)
			         begin
						      RegWrite=0;
						      jumpSrc=1;
						      RegDst=0;
						      ALUOp[3]=1;
						      ALUOp[2]=1;
						      ALUOp[1]=1;
						      ALUOp[0]=1;
						      PCSrc=0;
						      MemWrite=0;
						      MemtoReg=0;
						      MemRead=0;
						      ALUSrc=0;
					     end
			       
			    end
	   end
	 
endmodule 

module Datapath (input clk, Reset);
   wire         zero;
   
   
   wire [3:0]   ALUOp;
   
   wire         jumpSrc,
					      PCSrc,
					      RegWrite,
					      MemWrite,
					      MemtoReg,
					      MemRead,
					      RegDst,
                ALUSrc;
   

   wire [31:0]  pcIn, pcOut, pcBranched, pcNext, branchOffset, pcNotJump, pcJump, inst, Read1, Read2, dataToReg,branchORaw, alu2, ALUResult, RAMRead;
   wire [4:0]   shift_amount;
   
   wire [4:0]   Reg1,Reg2,WriteRegAdr;
   assign Reg1 = inst[25:21];
   assign Reg2 = inst[20:16];
   Mux2 m56 [4:0] (.d0(Reg2), .d1(inst[15:11]), .s0(RegDst), .out(WriteRegAdr));
   
   SignExtender se (inst[15:0],branchORaw);
   LF2 lf (branchORaw,branchOffset);
   
   Control ct (.instruction(inst), .zero(zero), .ALUOp(ALUOp), .jumpSrc(jumpSrc), .PCSrc(PCSrc), .RegWrite(RegWrite),.MemWrite(MemWrite), .MemtoReg(MemtoReg), .MemRead(MemRead), .RegDst(RegDst), .ALUSrc(ALUSrc), .shift_amount(shift_amount));
   
   
   Reg32 PC (.data(pcIn), .clk(clk), .storedData(pcOut), .clear(Reset), .preset(0));
   
   Adder32 a1 (.x(pcOut), .y(32'd4), .cin(1'd0), .A(pcNext));

   Adder32 a2 (.x(pcNext),.y(branchOffset), .cin(1'd0), .A(pcBranched));

   Mux2 m1 [31:0] (.d0(pcNext),.d1(pcBranched),.s0(PCSrc), .out(pcNotJump));

   assign pcJump = {pcNext[31:28],inst[25:0],2'd0};

   Mux2 m2 [31:0] (.d0(pcNotJump),.d1(pcJump),.s0(jumpSrc), .out(pcIn));

   data_memory instMem (.clk(clk), .mem_access_addr(pcOut), .mem_write_en(1'b0), .mem_read(1'b1), .mem_read_data(inst), .Reset(Reset));

   data_memory dataMem (.clk(clk), .mem_access_addr(ALUResult), .mem_write_en(MemWrite), .mem_read(MemRead), .mem_read_data(RAMRead), .Reset(Reset), .mem_write_data(Read2));

   Mux2 mdtr4 [31:0](.d0(ALUResult), .d1(RAMRead), .s0(MemtoReg), .out(dataToReg));
   
   
   registerfile rf (.Read1(Reg1),.Read2(Reg2), .RegWrite(RegWrite), .WriteReg(WriteRegAdr), .WriteData(dataToReg), .Data1(Read1), .Data2(Read2), .clock(clk), .Reset(Reset));

   Mux2 m239 [31:0](.d0(Read2), .d1(branchORaw), .s0(ALUSrc), .out(alu2));

   ALU ourAlu (.A(Read1), .B(alu2), .zero(zero), .C(ALUResult), .operation(ALUOp), .shift_amount(shift_amount));
   
   
   
   
endmodule

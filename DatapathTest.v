module DatapathTest ();
   

   reg clk, Reset;
   Datapath dp(.clk(clk),.Reset(Reset));
   
   initial
     begin
        clk =0;
        Reset =1;
        #100
          clk =0;
        Reset = 0;
        
        dp.rf.RF[8] = 32'd123; //t0
        dp.rf.RF[10] = -32'd10; //t2
        dp.rf.RF[11] = 32'd6; //t3 
        dp.rf.RF[12] = 32'b00001110100000000100100000100000 ; //t4
        dp.rf.RF[15] = 32'b10000000100000000100100010000011 ; //t7
        dp.rf.RF[24] = 32'b10000000000000000000000000000101 ; //t8
        // dp.rf.RF[23] = 32'b10000000000000000000000000000101 >>> 2 ; //s7

        $display("Initial conditions: t0 = %d t1 = %d t2 = %d t3 = %d t4 = %b t5 = %d t6 = %d t7 = %b s0 = %b s1 = %b s2 = %b s3 = %b s4 = %b s5 = %d s6 = %d s7 = %b t8 = %b t9 = %b sp = %b", $signed(dp.rf.RF[8]), $signed(dp.rf.RF[9]), $signed(dp.rf.RF[10]), $signed(dp.rf.RF[11]), dp.rf.RF[12], $signed(dp.rf.RF[13]), $signed(dp.rf.RF[14]), dp.rf.RF[15], dp.rf.RF[16], dp.rf.RF[17], dp.rf.RF[18], dp.rf.RF[19], dp.rf.RF[20],  $signed(dp.rf.RF[21]),  dp.rf.RF[22]  ,  dp.rf.RF[23] ,  dp.rf.RF[24],  dp.rf.RF[25],  dp.rf.RF[29]  );
        
        dp.instMem.ram[0] = 32'b00000000000000000100100000100000 ; //add t1 zero zero
        dp.instMem.ram[1] = 32'b00001000000000000000000000000011; //j 3  
        dp.instMem.ram[2] = 32'b00000001010010100101000000100000 ; //add t2 t2 t2
        dp.instMem.ram[3] = 32'b00000001001010100101100000100010 ; //sub t3 t1 t2
        dp.instMem.ram[4] = 32'b00000000000010000110100010000000 ; //sll t5 t0 0x2
        dp.instMem.ram[5] = 32'b00000001010010000111000000101010 ; //slt t6 t2 t0
        dp.instMem.ram[6] = 32'b00010001110010100000000000000010 ; //beq t6 t2 0x2 => Branch
        dp.instMem.ram[7] = 32'b00000000000011010110100010000000 ; //sll t5 t5 0x2
        dp.instMem.ram[8] = 32'b00000000000011010110100010000000 ; //sll t5 t5 0x2
        dp.instMem.ram[9] = 32'b00010101110010100000000000000010 ; //bne t6 t2 0x2 => not branch
        dp.instMem.ram[10] = 32'b00000001100011111000000000100100 ; //and s0 t4 t7
        dp.instMem.ram[11] = 32'b00010110000011000000000000000001 ; //bne s0 t4 0x1 => branch
        dp.instMem.ram[12] = 32'b00000000000011010110100010000000 ; //sll t5 t5 0x2
        
        dp.instMem.ram[13] = 32'b10101101000100000000000000000011 ; //sw s0 0x3 t0
        //14 is NOP.
        dp.instMem.ram[15] = 32'b10001101000100010000000000000011 ; //lw s1 0x3 t0
        dp.instMem.ram[16] = 32'b00000001100011111001000000100101 ; //or s2 t4 t7
        
        dp.instMem.ram[17] = 32'b00000001100011111001100000100110 ; //xor s3 t4 t7
        dp.instMem.ram[18] = 32'b00000001100011111010000000100111 ; //nor s4 t4 t7
        dp.instMem.ram[19] = 32'b00000001010010001010100000011000 ; //mul s5 t2 t0
        dp.instMem.ram[20] = 32'b00000001101010111011000000011010 ; //div s6 t5 t3
        dp.instMem.ram[21] = 32'b00000000000110001100100010000011 ; //sra t9 t8 0x2
        dp.instMem.ram[22] = 32'b00000000000110001110100010000010 ; //srl sp t8 0x2
        // dp.instMem.ram[] = 32'b ;
        // dp.instMem.ram[] = 32'b ;

        #40000 $display("Main test: t0 = %d t1 = %d t2 = %d t3 = %d t4 = %b t5 = %d t6 = %d t7 = %b s0 = %b s1 = %b s2 = %b s3 = %b s4 = %b s5 = %d s6 = %d s7 = %b t8 = %b t9 = %b sp = %b", $signed(dp.rf.RF[8]), $signed(dp.rf.RF[9]), $signed(dp.rf.RF[10]), $signed(dp.rf.RF[11]), dp.rf.RF[12], $signed(dp.rf.RF[13]), $signed(dp.rf.RF[14]), dp.rf.RF[15], dp.rf.RF[16], dp.rf.RF[17], dp.rf.RF[18], dp.rf.RF[19], dp.rf.RF[20],  $signed(dp.rf.RF[21]),  dp.rf.RF[22]  ,  dp.rf.RF[23] ,  dp.rf.RF[24],  dp.rf.RF[25],  dp.rf.RF[29]  );

        //main test t0 =         123 t1 =           0 t2 =         -10 t3 =          10 t4 = 00001110100000000100100000100000 t5 =         492 t6 =         -10 t7 = 10000000100000000100100010000011 s0 = 00000000100000000100100000000000 s1 = 00000000100000000100100000000000 s2 = 10001110100000000100100010100011 s3 = 10001110000000000000000010100011 s4 = 01110001011111111011011101011100 s5 =       -1230 s6 =         49 s7 = 00000000000000000000000000000000 t8 = 10000000000000000000000000000101 t9 = 11100000000000000000000000000001 sp = 00100000000000000000000000000001
        
        #100000 $stop;
     end

   always
     begin
        #1000 clk = !clk;
     end
   
   
endmodule

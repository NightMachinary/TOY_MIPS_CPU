module DatapathTest ();
   

  reg clk, Reset;
   Datapath dp(.clk(clk),.Reset(Reset));
   
   initial
     begin
        clk =0;
       // Reset =1;
        //#100
          //clk =0;
        // dp.rf.RF[8] = 32'd123; //t0
        // dp.r
          // f.RF[10] = -32'd10; //t2
        
        
        // dp.instMem.ram[0] = 32'b00000000000000000100100000100000 ; //add t1 zero zero
        // dp.instMem.ram[4] = 32'b00001000000000000000000000001100; //j 0xc = 12  
        // dp.instMem.ram[8] = 32'b00000001010010100101000000100000 ; //add t2 t2 t2
        // dp.instMem.ram[12] = 32'b00000001001010100101100000100010 ; //sub t3 t1 t2
        // dp.instMem.ram[16] = 32'b00000000000010000110100010000000 ; //sll t5 t0 0x2
        // dp.instMem.ram[2] = 32'b00000001010010000111000000101010 ; //slt t6 t2 t0
        //  dp.instMem.ram[20] = 32'b ;
        // #10000
          // $display("t0 = %d t1 = %d t2 = %d t3 = %d t4 = %d t5 = %d t6 = %d t7 = %d s0 = %d", dp.rf.RF[8], dp.rf.RF[9], dp.rf.RF[10], dp.rf.RF[11], dp.rf.RF[12], dp.rf.RF[13], dp.rf.RF[14], dp.rf.RF[15], dp.rf.RF[16]);
        #40000 $stop;
     end

   always
     begin
        #1000 clk = !clk;
     end
   
   
endmodule

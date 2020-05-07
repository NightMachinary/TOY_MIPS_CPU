module registerfile (Read1,Read2,WriteReg,WriteData,RegWrite, Data1,Data2,clock,  Reset);
   input Reset;
   
   integer i;
   
   input [4:0] Read1,Read2,WriteReg;
   // the register numbers to read or write 
   input [31:0] WriteData; // data to write 
   input        RegWrite, // the write control
                clock; // the clock to trigger write 
   output [31:0] Data1, Data2; // the register values read 
   reg [31:0]    RF [31:0]; // 32 registers each 32 bits long 
   assign Data1 = RF[Read1]; 
   assign Data2 = RF[Read2]; 
   always    
     begin // write the register with new value if Regwrite is high 
        @(negedge clock) if (RegWrite) RF[WriteReg] <= WriteData; 
     end

   always    
     begin // write the register with new value if Regwrite is high 
        @(Reset) if (Reset) begin 
           for(i=0;i<32;i=i+1)  
             RF[i] <= 32'd0; 
        end
     end

   // initial begin
   //    for(i=0;i<32;i=i+1)  
   //      RF[i] = 32'd0;
   //   // RF[8] = 32'd123; //t0
   //   // RF[10] = -32'd10; //t2
   //   //  $display("t0 = %d t1 = %d t2 = %d t3 = %d t4 = %d t5 = %d t6 = %d t7 = %d s0 = %d",RF[8],RF[9],RF[10],RF[11],RF[12],RF[13],RF[14],RF[15],RF[16]);

   //   //  #10000
   //   //    $display("t0 = %d t1 = %d t2 = %d t3 = %d t4 = %d t5 = %d t6 = %d t7 = %d s0 = %d",RF[8],RF[9],RF[10],RF[11],RF[12],RF[13],RF[14],RF[15],RF[16]);

   //    end
endmodule 

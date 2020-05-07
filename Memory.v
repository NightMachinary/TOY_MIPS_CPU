module data_memory  
  (  
     input         clk, 
     // address input, shared by read and write port  
     input [31:0]  mem_access_addr, 
     // write port  
     input [31:0]  mem_write_data, 
     input         mem_write_en, 
     input         mem_read, 
     // read port  
     output [31:0] mem_read_data,
input Reset  
     );  
   integer         i;  
   reg [31:0]      ram [1023:0];  
   wire [9 : 0]    ram_addr = mem_access_addr[11 : 2];  
   initial begin  
      for(i=0;i<1024;i=i+1)  
        ram[i] <= 32'd0;  
   end  
   always @(negedge clk) begin  
      if (mem_write_en)  
        ram[ram_addr] <= mem_write_data; 
      if (Reset) begin
         for(i=0;i<1024;i=i+1)  
           ram[i] = 32'd0;
         end
   end  
   assign mem_read_data = (mem_read==1'b1) ? ram[ram_addr]: 16'd0;   

   // initial
   //   begin
   //      for(i=0;i<1024;i=i+1)  
   //        ram[i] = 32'd0;
   //      // ram[0] = 32'b00000000000000000100100000100000 ; //add t1 zero zero
   //      // ram[1] = 32'b00001000000000000000000000001100; //j 0xc = 12  
   //      // ram[2] = 32'b00000001010010100101000000100000 ; //add t2 t2 t2
   //      // ram[3] = 32'b00000001001010100101100000100010 ; //sub t3 t1 t2
   //      // ram[4] = 32'b00000000000010000110100010000000 ; //sll t5 t0 0x2
   //      // ram[5] = 32'b00000001010010000111000000101010 ; //slt t6 t2 t0

   //      end
endmodule 

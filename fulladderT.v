module tb_fulladder();
   
   reg [31:0] x,y;
   reg        r_carry_in;
   
   initial begin 
      
      $monitor("x = %b, y = %b, out_sum = %b, out_carry = %b", x, y, out, cout); 

      // Generation of stimulus
      x = 32'd65;
      
      y = 32'd6;
      
         
        end
 
     endmodule

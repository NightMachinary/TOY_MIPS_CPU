module mydff(output Q, output QBar, input D, input clk,input preset, input clear);

   not(nClk,clk);
   nor n1 (n1o,clear,n4o,n2o);
   nor n2 (n2o,n1o,preset,nClk);
   nor n3 (n3o,n2o,nClk,n4o);
   nor n4 (n4o,D,preset,n3o);
 
   nor b1 (Q,clear,n2o,QBar);
   nor b2 (QBar,preset,Q,n3o);
   
endmodule

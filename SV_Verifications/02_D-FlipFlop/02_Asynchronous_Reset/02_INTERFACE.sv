//==============================
//     INTERFACE 
//==============================
interface DFF_INTERFACE(input logic clk);
  logic d,rst;
  logic q;

  clocking cb @(posedge clk);
    default input #1step output #0;
    input q;
    output d;
  endclocking
  
  clocking cb1 @(posedge clk);
    default input #1step output #0;
    input q,d;
  endclocking

  modport DUT(input d,rst,clk,output q);
  modport TB(clocking cb,output rst);
endinterface

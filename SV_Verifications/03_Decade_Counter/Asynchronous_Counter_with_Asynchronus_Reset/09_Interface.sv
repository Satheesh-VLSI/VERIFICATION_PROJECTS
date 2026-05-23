//=============================
//         INTERFACE 
//=============================
interface DECADE_CNT_INTERFACE(input logic clk);
  logic rst;
  logic [3:0] q;

  clocking cb @(posedge clk);
    default input #1step output #0;
    input q;
  endclocking

  modport DUT (input rst, clk, output q);
  modport TB  (clocking cb, output rst); // rst is independent
    
endinterface

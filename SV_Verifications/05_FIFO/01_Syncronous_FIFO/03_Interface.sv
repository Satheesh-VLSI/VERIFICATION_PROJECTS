//==============================
//     INTERFACE 
//==============================
interface FIFO_INTERFACE#(parameter Width =8)(input logic clk);
  
  logic rst;
  logic w_en,r_en;
  logic[Width-1:0] data_in,data_out;
  logic full,empty;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    input data_out,full,empty;
    output data_in,w_en,r_en,rst;
  endclocking
  
  
  clocking cb1 @(posedge clk);
    
    default input #1step output #0;
    
    input data_out,full,empty;
    input data_in,w_en,r_en,rst;
  endclocking

  modport DUT (input data_in,w_en,r_en,rst,output data_out,full,empty);
  modport TB  (clocking cb,clocking cb1);
endinterface

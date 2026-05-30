
//==============================
//         INTERFACE 
//==============================
interface FIFO_INTERFACE #(parameter Width =8)(input logic w_clk,r_clk);
  
  logic w_rst,r_rst;
  logic w_en,r_en;
  logic[Width-1:0] data_in,data_out;
  logic full,empty;
  
  clocking w_cb @(posedge w_clk);
    default input #1step output #0;
    input full;
    output data_in,w_en,w_rst;
  endclocking
  
  
  clocking w_cb1 @(posedge w_clk);
    
    default input #1step output #0;
    
    input full;
    input data_in,w_en,w_rst;
  endclocking
  
  clocking r_cb @(posedge r_clk);
    
    default input #1step output #0;
    input data_out,empty;
    output r_en,r_rst;
  endclocking
  
  
  clocking r_cb1 @(posedge r_clk);
    
    default input #1step output #0;
    
    input data_out,empty;
    input r_en,r_rst;
  endclocking

  modport DUT (input data_in,w_en,r_en,w_rst,r_rst,output data_out,full,empty);
  modport TB  (clocking w_cb,clocking w_cb1,clocking r_cb,clocking r_cb1);
endinterface
    
    

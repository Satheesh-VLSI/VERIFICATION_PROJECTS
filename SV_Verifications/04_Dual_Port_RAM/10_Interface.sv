//==============================
//     INTERFACE 
//==============================
interface RAM_INTERFACE(input logic clk);
  
  logic [7:0] data_in_A,data_in_B;
  logic [5:0]addr_A,addr_B;
  logic mode_A,mode_B;
  logic [7:0]data_out_A,data_out_B;
  logic rst;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    input data_out_A,data_out_B;
    output data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst;
  endclocking
  
  
  clocking cb1 @(posedge clk);
    default input #1step output #0;
    input data_out_A,data_out_B;
    input data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst;
  endclocking

  modport DUT (input data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst,clk,output data_out_A,data_out_B);
  modport TB  (clocking cb,clocking cb1,input data_out_A,data_out_B,data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst);
endinterface

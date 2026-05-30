
//============================
//        TRANSACTION
//============================
class  Transaction #(parameter Width=8);  
  bit w_rst,r_rst;
  rand bit w_en,r_en;
  rand bit [Width-1:0] data_in;
  bit full,empty;
  bit [Width-1:0] data_out;
  
  string test_name;

  constraint c1 {
    
    solve w_en before data_in;
    
    w_en dist {0:=3,1:=15};
    r_en dist {0:=3,1:=15};
    if(!w_en) data_in==0;
  }
    
  //---------------------------------------------------------
  // WRITE DOMAIN DISPLAY
  //---------------------------------------------------------
  function void display_write(string name);
    $display("\n+-------------------------------------------+");
    $display("| %-13s | Time:%4t |  w_rst = %b    |", name, $time, w_rst);
    $display("+-------------------------------------------+");
    $display("| Write_enable :   %b     | Full  : %b        |", w_en, full);
    $display("| Data_in      : %3d     |                  |", data_in);
    $display("+-------------------------------------------+");
  endfunction

  //---------------------------------------------------------
  // READ DOMAIN DISPLAY
  //---------------------------------------------------------
  function void display_read(string name);
    $display("\n+-------------------------------------------+");
    $display("| %-13s | Time:%4t |  r_rst = %b    |", name, $time, r_rst);
    $display("+-------------------------------------------+");
    $display("| Read_enable  :   %b     | Empty : %b        |", r_en, empty);
    $display("| Data_out     : %3d     |                  |", data_out);
    $display("+-------------------------------------------+");
  endfunction

endclass

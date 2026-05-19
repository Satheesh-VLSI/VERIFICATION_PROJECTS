
    
    
//============================
//        TRANSACTION
//============================
    class  Transaction #(parameter Width=8);  
  
  rand bit rst;
  rand bit w_en,r_en;
  rand bit [Width-1:0] data_in;
  bit full,empty;
  bit [Width-1:0] data_out;

  constraint c1 {
    if(!w_en) data_in==0;
    rst dist {0:=20,1:=1};
  }

  function void display(string name);

    $display("\n\n+---------------------------------------------+");
    $display("|  %0s   ||   Time  : %4t  ||  rst = %b   | ",name,$time,rst);
    $display("+---------------------------------------------+");
    $display("| Write_enable: %b      |  Read_enable: %b      |",w_en,r_en); 
    $display("| Full        : %b      |  Empty      : %b      |",full,empty);
    $display("| Data_in     : %3d    |  Data_out   : %3d    |",data_in,data_out);
    $display("+---------------------------------------------+");

  endfunction

endclass

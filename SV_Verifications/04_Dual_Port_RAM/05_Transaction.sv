
    
//============================
//        TRANSACTION
//============================
class Transaction;

  rand bit [7:0] data_in_A,data_in_B;
  randc bit [5:0] addr_A,addr_B;
  rand bit mode_A,mode_B;
  rand bit rst;

  bit [7:0] data_out_A,data_out_B;

  constraint c1 {
    mode_A dist {0:=4,1:=6};
    mode_B dist {0:=4,1:=6};

    (mode_A==0) -> data_in_A==0;
    (mode_B==0) -> data_in_B==0;
    
    rst dist {0:=90, 1:=10};
  }
  
  

  function void display(string name);

    $display("+------------------------------------------------+");
    $display("|      %0s     |   Time  : %4t   | rst = %b  |",name,$time,rst);
    $display("+------------------------------------------------+");
    $display("| Address A  :%4d      | Address B  :%4d       |",addr_A,addr_B);
    $display("| Data In A  :%4d      | Data In B  :%4d       |",data_in_A,data_in_B);
    $display("| Mode A     :   %b      | Mode B     :   %b       |",mode_A,mode_B);
    $display("| Data Out A :%4d      | Data Out B :%4d       |",data_out_A,data_out_B);
    $display("+------------------------------------------------+");

  endfunction

endclass

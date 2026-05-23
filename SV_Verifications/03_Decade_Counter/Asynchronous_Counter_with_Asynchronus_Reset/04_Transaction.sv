//===============================
//         TRANSACTION
//===============================
class Transaction;
  rand bit rst;
  bit [3:0] q;
  
  constraint rst_c{ rst dist {0:=11, 1:=2}; }
  
  function void display(string name);
    $display("[%s] : rst=%0b q=%0d", name, rst, q);
  endfunction
endclass:Transaction

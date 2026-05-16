//===============================
//         TRANSACTION
//===============================
class Transaction;
  rand bit d;
  rand bit rst;
  bit q;
  
  constraint rst_c{ rst dist {0:=9,1:=2};}
  
  function void display(string name);
    $display("[%s] d=%0b rst=%0b q=%0b",name,d,rst,q);
  endfunction
endclass:Transaction

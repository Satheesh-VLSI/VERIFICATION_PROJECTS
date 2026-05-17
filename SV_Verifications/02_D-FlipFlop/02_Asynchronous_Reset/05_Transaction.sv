//============================
//        TRANSACTION
//============================
class Transaction;
  rand bit d;
  rand bit rst;
  bit q;
  bit Edge;

  function void display(string name);
    $display("[%s] d=%0b rst=%0b q=%0b Edge=%0b",name,d,rst,q,Edge);
  endfunction
endclass:Transaction

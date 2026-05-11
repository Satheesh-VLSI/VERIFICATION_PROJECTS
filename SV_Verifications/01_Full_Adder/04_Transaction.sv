
//Transaction
class Transaction;
  rand bit a,b,cin;
  bit sum,cout;
  
  
  function void display(string name);
    $display("[%s] a=%b b=%b cin=%b | sum=%b cout=%b",name,a,b,cin,sum,cout);
  endfunction
  
endclass:Transaction


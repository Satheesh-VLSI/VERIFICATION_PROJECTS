//DRIVER
class Driver;
  virtual FA_INTERTFACE inf;
  mailbox #(Transaction) gen2drv;
  
  
  function new(virtual FA_INTERTFACE inf,mailbox #(Transaction) gen2drv);
    this.inf=inf;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    forever begin
      
      Transaction trans;
      
      gen2drv.get(trans);
      @(posedge inf.clk);
      
      inf.a=trans.a;
      inf.b=trans.b;
      inf.cin=trans.cin;
      
      
    end 
  endtask
  
endclass:Driver


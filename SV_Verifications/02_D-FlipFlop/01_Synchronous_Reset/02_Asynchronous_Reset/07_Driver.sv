//=======================
//        DRIVER
//=======================
class Driver;
  
  virtual DFF_INTERFACE inf;
  mailbox #(Transaction) gen2drv;

  function new(virtual DFF_INTERFACE inf,mailbox #(Transaction) gen2drv);
    this.inf=inf;
    this.gen2drv=gen2drv;
  endfunction

  task main();
    
    forever begin
      Transaction trans;
      gen2drv.get(trans);

      @(inf.cb);
      inf.cb.d<=trans.d;

      fork
        begin
          #($urandom_range(1,4)); 
          inf.rst=trans.rst; 
          
          //Force reset to disappear before next clock(just fro testing)
          if(trans.rst==1) begin
            #($urandom_range(1,4));
            inf.rst=0; 
          end
        end
      join
    end
  endtask
endclass:Driver





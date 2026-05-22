//===========================
//         GENERATOR
//===========================
class Generator;
  
  Transaction trans;
  mailbox #(Transaction) gen2drv;

  function new(mailbox #(Transaction) gen2drv);
    this.gen2drv=gen2drv; 
  endfunction

  task main();
    
    repeat(100) begin
      trans=new();
      trans.randomize();
      gen2drv.put(trans);
    end
  endtask
endclass

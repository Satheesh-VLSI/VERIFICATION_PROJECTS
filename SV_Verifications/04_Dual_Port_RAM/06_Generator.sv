//=========================
//       GENERATOR
//=========================
class Generator;

  string test_name;
  int transaction_cnt;

  Transaction trans;
  mailbox #(Transaction) gen2drv;

  function new(mailbox #(Transaction) gen2drv);
    this.gen2drv=gen2drv;
  endfunction

  task main();

    Transaction base_trans=new();

    repeat(transaction_cnt) begin
      
      base_trans.randomize();
      trans=new();

      trans.data_in_A=base_trans.data_in_A;
      trans.data_in_B=base_trans.data_in_B;
      trans.addr_A=base_trans.addr_A;
      trans.addr_B=base_trans.addr_B;
      trans.mode_A=base_trans.mode_A;
      trans.mode_B=base_trans.mode_B;
      trans.rst=base_trans.rst;
      
      if(test_name=="RANDOM") begin
        trans.rst=0;
      end

      if(test_name=="FULL WRITE") begin
        trans.rst=0;
        trans.mode_A=1;
        trans.mode_B=1;
      end

      if(test_name=="FULL READ") begin
        trans.rst=0;
        trans.mode_A=0;
        trans.mode_B=0;
      end

      if(test_name=="COLLISION_WW") begin
        trans.rst=0;
        trans.addr_B=trans.addr_A;
        trans.mode_A=1;
        trans.mode_B=1;
      end
      
      else if(test_name=="COLLISION_RW") begin
        trans.rst=0;
        trans.addr_B=trans.addr_A;
        trans.mode_A=0;
        trans.mode_B=1;
      end
      
      else if(test_name=="COLLISION_WR") begin
        trans.rst=0;
        trans.addr_B=trans.addr_A;
        trans.mode_A=1;
        trans.mode_B=0;
      end
      
      else if(test_name=="COLLISION_RR") begin
        trans.rst=0;
        trans.addr_B=trans.addr_A;
        trans.mode_A=0;
        trans.mode_B=0;
      end
      
      else if(test_name=="COLLISION_MIXED") begin
        trans.rst=0;
        trans.addr_B=trans.addr_A;
      end

      gen2drv.put(trans);

    end

    trans=new();
//this is the empty transaction to check the last read value
    trans.mode_A=0;
    trans.mode_B=0;
    trans.addr_A=0;
    trans.addr_B=0;
    trans.data_in_A=0;
    trans.data_in_B=0;

    gen2drv.put(trans);

  endtask

endclass
    


   
//=========================
//    WRITE GENERATOR
//=========================
class Write_Generator;

  string test_name;
  int transaction_cnt;

  Transaction trans;
  mailbox #(Transaction) gen2drv;

  function new(mailbox #(Transaction) gen2drv);
    this.gen2drv=gen2drv;
  endfunction

  task main();

    //---------------------RANDOM TEST------------------------
    if(test_name=="RANDOM") begin
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize(); 
        gen2drv.put(trans);
      end
    end
    
    //-------------------FULL READ-WRITE TEST-------------------
    else if(test_name=="FULL_WRITE") begin
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end
    end
    
    else if(test_name=="FULL_READ") begin
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==0;};
        gen2drv.put(trans);
      end
    end
    
    //-------------POINTER WRAP AROUND TEST------------------------
    else if(test_name=="WRAP_AROUND") begin
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};  
        gen2drv.put(trans); 
      end // Write
      
      repeat(10) begin
        trans=new(); 
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==0;}; 
        gen2drv.put(trans); 
      end // Wait for Read
      
      repeat(10) begin
        trans=new(); 
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end // Write
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==0;};
        gen2drv.put(trans);
      end // Wait for Read
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
        
      end // Write
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==0;};
        gen2drv.put(trans);
        
      end // Wait for Read
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
        
      end // Write
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==0;};
        gen2drv.put(trans);
      end // Wait for Read
      
    end
    
    //-----------OVERFLOW UNDERFLOW TEST---------------
    else if(test_name=="OVERFLOW") begin
      
      repeat(transaction_cnt) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end 
    end
    
    else if(test_name=="UNDERFLOW") begin
      
      // Write Driver sits idle during Underflow phase
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==0;};
        gen2drv.put(trans);
        
      end
    end
    
    //---------------CONCURRENT BOUNDARY------------------
    else if(test_name=="CONCURRENT_BOUNDARY") begin
      
      repeat(16) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end // Write only
      
      repeat(9) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end // Concurrent (Write Active)
      
      repeat(16) begin
        trans=new();
        trans.test_name=test_name;
        trans.randomize() with {w_en==0;};
        gen2drv.put(trans);
      end // Read only (Write Idle)
      
      repeat(9) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end // Concurrent (Write Active)
      
    end
    
    //-----------CONTINUOUS CONCURRENT TEST-----------------
    else if(test_name=="CONTINUES_CONCURRENT") begin
      
      repeat(transaction_cnt) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize()with {w_en==1;};
        gen2drv.put(trans);
      end
      
    end
    
    //-----------RESET TEST-----------------  
    else if(test_name=="RESET_TEST") begin
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize(); 
        gen2drv.put(trans);
      end
    end
    
    
    
    // Drain Transaction
    trans=new();
    trans.w_en=0;
    trans.data_in=0;
    gen2drv.put(trans);

  endtask
endclass
 

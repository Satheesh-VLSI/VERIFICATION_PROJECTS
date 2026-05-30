    
//=========================
//    READ GENERATOR
//=========================
class Read_Generator;

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
        
        trans.randomize() with { w_en==0; }; 
        gen2drv.put(trans);
      end
    end
    
    //-------------------FULL READ-WRITE TEST-------------------
    else if(test_name=="FULL_WRITE") begin
      
      // Read Driver is idle during the Full Write phase
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=0;
        gen2drv.put(trans);
      end
      
    end
    
    else if(test_name=="FULL_READ") begin
      
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
      end
      
    end
    
    //-------------POINTER WRAP AROUND TEST------------------------
    else if(test_name=="WRAP_AROUND") begin
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        
        trans.r_en=0;
        gen2drv.put(trans);
        
      end // Wait for Write
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
        
      end // Read
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=0;
        gen2drv.put(trans);
      end // Wait for Write
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
      end // Read
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=0;
        gen2drv.put(trans);
      end // Wait for Write
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
      end // Read
      
      repeat(10) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=0;
        gen2drv.put(trans);
      end // Wait for Write
      
      repeat(10) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
      end // Read
    end
    
    //-----------OVERFLOW UNDERFLOW TEST---------------
    else if(test_name=="OVERFLOW") begin
      
      // Read Driveris idle during Overflow phase
      repeat(transaction_cnt) begin
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=0;
        gen2drv.put(trans);
      end      
    end
    
    else if(test_name=="UNDERFLOW") begin
      
      repeat(transaction_cnt) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);        
      end 
    end
    
    //---------------CONCURRENT BOUNDARY------------------
    else if(test_name=="CONCURRENT_BOUNDARY") begin
      
      repeat(16) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=0;
        gen2drv.put(trans);      
      end // Write only (Read Idle)
      
      repeat(9) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
      end // Concurrent (Read Active)
      
      repeat(16) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
        
      end // Read only
      
      repeat(9) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
        gen2drv.put(trans);
      end // Concurrent (Read Active)
    end
    
    //-----------CONTINUOUS CONCURRENT TEST-----------------
    else if(test_name=="CONTINUES_CONCURRENT") begin
      
      repeat(transaction_cnt) begin
        
        trans=new();
        trans.test_name=test_name;
        
        trans.randomize();
        trans.r_en=1;
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
    trans.r_en=0; 
    trans.data_in=0; 
    gen2drv.put(trans);

  endtask
endclass
    


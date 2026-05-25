    
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


    //---------------------RANDOM TEST------------------------
    if(test_name=="RANDOM")begin
      repeat(transaction_cnt)begin
        
        trans=new();
        trans.randomize();
        gen2drv.put(trans);
        
      end
      trans = new();
      trans.w_en = 0; trans.r_en = 0; 
      trans.data_in = 0; trans.rst = 0;
      gen2drv.put(trans);
    end
    
    
    //-------------------FULL READ-WRITE TEST-------------------
    if(test_name=="FULL_WRITE" || test_name=="FULL_READ")begin
      repeat(transaction_cnt) begin
      
        trans=new();
        trans.randomize() with {rst==0;};
        if(test_name=="FULL_WRITE")begin
          trans.w_en=1; trans.r_en=0;
        end
      
        if(test_name=="FULL_READ")begin
          trans.w_en=0; trans.r_en=1;
        end
        gen2drv.put(trans);

    end
      trans = new();
      trans.w_en = 0; trans.r_en = 0; 
      trans.data_in = 0; trans.rst = 0;
      gen2drv.put(trans);
    end
    
      //-------------POINTER WRAP AROUND TEST------------------------
    if(test_name=="WRAP_AROUND")begin
        repeat(10) begin
          trans=new();
          trans.randomize() with {rst==0;};
          
          trans.w_en=1; trans.r_en=0;//write
          
          gen2drv.put(trans);
       end
        
        repeat(10) begin
          trans=new();
          trans.randomize() with {rst==0;};
          trans.w_en=0; trans.r_en=1; //read
          
          gen2drv.put(trans);
       end
        
        repeat(10) begin
          trans=new();
          trans.randomize() with {rst==0;};
          
          trans.w_en=1; trans.r_en=0;//write
          
          gen2drv.put(trans);
       end
        
        
        repeat(10) begin
          trans=new();
          trans.randomize() with {rst==0;};
          trans.w_en=0; trans.r_en=1;//read
          
          gen2drv.put(trans);
       end
        
        
        repeat(10) begin
          trans=new();
          trans.randomize() with {rst==0;};
          
          trans.w_en=1; trans.r_en=0;//write
          
          gen2drv.put(trans);
       end
        
        repeat(10) begin
          trans=new();
          trans.randomize() with {rst==0;};
          trans.w_en=0; trans.r_en=1; //read
          
          gen2drv.put(trans);
       end
      trans = new();
      trans.w_en = 0; trans.r_en = 0; 
      trans.data_in = 0; trans.rst = 0;
      gen2drv.put(trans);
        
      end
    
    //-----------OVERFLOW UNDERFLOW TEST---------------
    if(test_name=="OVERFLOW"|| test_name=="UNDERFLOW")begin
      repeat(transaction_cnt) begin
      
        trans=new();
        trans.randomize() with {rst==0;};
        if(test_name=="OVERFLOW")begin
          trans.w_en=1; trans.r_en=0;
        end
      
        if(test_name=="UNDERFLOW")begin
          trans.w_en=0; trans.r_en=1;
        end
        gen2drv.put(trans);

    end
      trans = new();
      trans.w_en = 0; trans.r_en = 0; 
      trans.data_in = 0; trans.rst = 0;
      gen2drv.put(trans);
    end
    
    //---------------CONCURRENT BOUNDARY------------------
    if(test_name=="CONCURRENT_BOUNDARY")begin
      repeat(16) begin
        trans=new();
        trans.randomize() with {rst==0;};
          
        trans.w_en=1; trans.r_en=0;//write
          
        gen2drv.put(trans);
       end
      
      repeat(9) begin
        trans=new();
        trans.randomize() with {rst==0;};
          
        trans.w_en=1; trans.r_en=1;//concurrent write-read
          
        gen2drv.put(trans);
       end
        
      repeat(16) begin
        trans=new();
        trans.randomize() with {rst==0;};
        trans.w_en=0; trans.r_en=1; //read
        
        gen2drv.put(trans);
      end
      
      repeat(9) begin
        trans=new();
        trans.randomize() with {rst==0;};
          
        trans.w_en=1; trans.r_en=1;//concurrent write-read
          
        gen2drv.put(trans);
       end
      trans = new();
      trans.w_en = 0; trans.r_en = 0; 
      trans.data_in = 0; trans.rst = 0;
      gen2drv.put(trans);
    
    end
    
    //-----------CONTINUEES CONCURRENT TEST-----------------
    if(test_name=="CONTINUES_CONCURRENT")begin
      repeat(transaction_cnt)begin
        
        trans=new();
        trans.randomize() with {rst==0;};
        
        trans.w_en=1; trans.r_en=1;//concurrent write-read
        gen2drv.put(trans);
        
      end
      trans = new();
      trans.w_en = 0; trans.r_en = 0; 
      trans.data_in = 0; trans.rst = 0;
      gen2drv.put(trans);
    end
    
    

  endtask

endclass




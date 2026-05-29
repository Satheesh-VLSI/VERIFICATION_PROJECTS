//==============================
//     INTERFACE 
//==============================
interface RAM_INTERFACE(input logic clk);
  
  logic [7:0] data_in_A,data_in_B;
  logic [5:0]addr_A,addr_B;
  logic mode_A,mode_B;
  logic [7:0]data_out_A,data_out_B;
  logic rst;
  logic asrt_en;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    input data_out_A,data_out_B;
    output data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst;
  endclocking
  
  
  clocking cb1 @(posedge clk);
    default input #1step output #0;
    input data_out_A,data_out_B;
    input data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst;
  endclocking

  modport DUT (input data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst,clk,output data_out_A,data_out_B);
  modport TB  (clocking cb,clocking cb1,input data_out_A,data_out_B,data_in_A,data_in_B,addr_A,addr_B,mode_A,mode_B,rst);
    
    
//=====================================================
//                  ASSERTIONS
//=====================================================

//-----------------------------------------------------
// 1. Address should never contain X/Z
//-----------------------------------------------------  
    property addr_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !$isunknown(addr_A) && !$isunknown(addr_B);
    endproperty
    
    ADDR_KNOWN : assert property(addr_known)
      else
        $error("[ASSERTION FAILED] Address contains X/Z");

//-----------------------------------------------------
// 2. Mode should never contain X/Z
//-----------------------------------------------------
      
    property mode_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !$isunknown(mode_A) && !$isunknown(mode_B);
      
    endproperty
    
      MODE_KNOWN : assert property(mode_known)
      else
        $error("[ASSERTION FAILED] MODE contains X/Z");
        
//-----------------------------------------------------
// 3. Write data should never be unknown
//-----------------------------------------------------
      
    property data_in_A_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      mode_A |-> !$isunknown(data_in_A);
      
    endproperty
    
      DATA_IN_A_KNOWN : assert property(data_in_A_known)
      else
        $error("[ASSERTION FAILED] DATA IN A contains X/Z");
        
      
    property data_in_B_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      mode_B |-> !$isunknown(data_in_B);
      
    endproperty
    
      DATA_IN_B_KNOWN : assert property(data_in_B_known)
      else
        $error("[ASSERTION FAILED] DATA IN B contains X/Z");
        
//-----------------------------------------------------
// 4. Read data should never contain X/Z
//-----------------------------------------------------
      
    property data_out_A_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !mode_A |-> !$isunknown(data_out_A);
      
    endproperty
    
      DATA_OUT_A_KNOWN : assert property(data_out_A_known)
      else
        $error("[ASSERTION FAILED] DATA OUT A contains X/Z");
        
      
    property data_out_B_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !mode_B |-> !$isunknown(data_out_B);
      
    endproperty
    
      DATA_OUT_B_KNOWN : assert property(data_out_B_known)
      else
        $error("[ASSERTION FAILED] DATA OUT B contains X/Z");


//-----------------------------------------------------
// 5. Reset should clear outputs
//-----------------------------------------------------
    property reset_cleared;
      @(posedge clk)
      rst |=> (data_out_A==0 && data_out_B==0);
      
    endproperty
    
    RESET_CLEARED : assert property(reset_cleared)
      else
        $error("[ASSERTION FAILED] RESET Did not CLEAR the Outputs");

//-----------------------------------------------------
// 6. Read after write on PORT A
//-----------------------------------------------------
    property read_after_write_A;
      logic [5:0] prev_addr;
      logic [7:0] prev_data;
      
      @(posedge clk) 
      (mode_A,prev_addr=addr_A,prev_data=data_in_A)
      ##1
      (!mode_A && prev_addr==addr_A) |-> (prev_data==data_out_A);
    endproperty
      
      READ_AFTER_WRITE_A : assert property(read_after_write_A)
      else
        $error("[ASSERTION FAILED] Continous Read after Write Failed PORT A");
                


//-----------------------------------------------------
// 7. Read after write on PORT B
//-----------------------------------------------------
    property read_after_write_B;
      logic [5:0] prev_addr;
      logic [7:0] prev_data;
      
      @(posedge clk) 
      (mode_B,prev_addr=addr_B,prev_data=data_in_B)
      ##1
      (!mode_B && prev_addr==addr_B) |-> (prev_data==data_out_B);
    endproperty
      
        READ_AFTER_WRITE_B : assert property(read_after_write_B)
      else
        $error("[ASSERTION FAILED] Continous Read after Write Failed PORT B");
          

//-------------------------------------------------------------------------------------
// 8.Collision for same address by Port A & Port B and Port B is Ignored successfully
//-------------------------------------------------------------------------------------
    property port_B_ignored;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      (addr_A==addr_B) |=> $stable(data_out_B);
    endproperty
          
          PORT_B_IGNORED : assert property(port_B_ignored)
            else
              $error("[ASSERTION FAILED]  PORT B Data is not stble after Collision");
            
            
            
 endinterface
    

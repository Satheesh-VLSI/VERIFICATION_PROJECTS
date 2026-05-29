
module Sync_FIFO_SVA #(parameter Width=8,Depth=16)(
  input clk,rst,w_en,r_en,
  input [Width-1:0] data_in,
  input [Width-1:0] data_out,
  input full,empty,
  input [$clog2(Depth):0] internal_wptr,internal_rptr,
  input asrt_en
);
      
       
//=====================================================
//                  ASSERTIONS
//=====================================================
  
//-----------------------------------------------------
// 1.Enable signals should never contain X/Z
//-----------------------------------------------------  
    property enable_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !$isunknown(w_en) && !$isunknown(r_en);
    endproperty
    
    ENABLE_KNOWN : assert property(enable_known)
      else
        $error("[ASSERTION FAILED] Enable Signals contains X/Z");

//-----------------------------------------------------
// 2.Data-In should never contain X/Z
//-----------------------------------------------------
      
    property data_in_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      w_en |-> !$isunknown(data_in);
      
    endproperty
    
      DATA_IN_KNOWN : assert property(data_in_known)
      else
        $error("[ASSERTION FAILED] Data In contains X/Z");
        
        
//-----------------------------------------------------
// 3.Data-Out should never contain X/Z
//-----------------------------------------------------
      
    property data_out_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
       r_en |-> !$isunknown(data_out);
      
    endproperty
    
        DATA_OUT_KNOWN : assert property(data_out_known)
      else
        $error("[ASSERTION FAILED] Data Out contains X/Z");
//-----------------------------------------------------
// 4.Flags should never contain X/Z
//-----------------------------------------------------
      
    property full_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !$isunknown(full);
      
    endproperty
    
      FULL_FLAG_KNOWN : assert property(full_known)
      else
        $error("[ASSERTION FAILED] Full Flag contains X/Z");
        
      
    property empty_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !$isunknown(empty);
      
    endproperty
    
      EMPTY_FLAG_KNOWN : assert property(empty_known)
      else
        $error("[ASSERTION FAILED] Empty Flag contains X/Z");
//-----------------------------------------------------
// 5.Internal Pointers should never contain X/Z
//-----------------------------------------------------  
    property pointer_known;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      !$isunknown(internal_wptr) && !$isunknown(internal_rptr);
    endproperty
    
        POINTER_KNOWN : assert property(pointer_known)
      else
        $error("[ASSERTION FAILED] Internal Pointer contains X/Z");
        


//-----------------------------------------------------
// 6. Reset should clear outputs
//-----------------------------------------------------
    property reset_cleared;
      @(posedge clk)
      disable iff(!asrt_en)
      rst |=> (data_out==0 && empty==1 && full==0 && internal_wptr==0 && internal_rptr==0);
      
    endproperty
    
    RESET_CLEARED : assert property(reset_cleared)
      else
        $error("[ASSERTION FAILED] RESET Did not CLEAR the Outputs");
      

//-----------------------------------------------------
// 7. Reset dominance over write
//-----------------------------------------------------
    property reset_dominate_write;
      @(posedge clk)
      disable iff(!asrt_en)
      (rst && w_en==1)|=> (empty==1 && internal_wptr==0);
      
    endproperty
    
    RESET_DOMINATE_WRITE : assert property(reset_dominate_write)
      else
        $error("[ASSERTION FAILED] Data-in Ignored the Reset signal and went into the FIFO");
      
//-----------------------------------------------------
// 8. Reset dominance over read
//-----------------------------------------------------
    property reset_dominate_read;
      @(posedge clk)
      disable iff(!asrt_en)
      (rst && r_en==1)|=> (empty==1 && internal_rptr==0 && data_out==0);
      
    endproperty
    
    RESET_DOMINATE_READ : assert property(reset_dominate_read)
      else
        $error("[ASSERTION FAILED] Read opration/Data out Ignored the Reset signal and data caem out of FIFO");
      
//---------------------------------------------------------------------
// 9.Overflow Protection(FIFO Should ignore write request during FULL)
//---------------------------------------------------------------------
    property overflow_protection;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      (full && w_en)|=> $stable(internal_wptr);
      
    endproperty
    
    OVERFLOW_PROTECTION : assert property(overflow_protection)
      else
        $error("[ASSERTION FAILED] DATA came into FIFO even after Being Full");
      
//---------------------------------------------------------------------
// 10.Underflow Protection(FIFO Should ignore read request during EMPTY)
//---------------------------------------------------------------------
    property underflow_protection;
      @(posedge clk)
      disable iff(rst || !asrt_en)
      (empty && r_en)|=> $stable(internal_rptr);
      
    endproperty
    
    UNDERFLOW_PROTECTION : assert property(underflow_protection)
      else
        $error("[ASSERTION FAILED] DATA came out of FIFO even after Being EMPTY");

//-----------------------------------------------------
// 11. Read Pointer Stability
//-----------------------------------------------------
    property read_ptr_stability;
      @(posedge clk) 
      disable iff(rst || !asrt_en)
      !r_en |=> $stable(internal_rptr);
    endproperty
      
      READ_PTR_STABILITY : assert property(read_ptr_stability)
      else
        $error("[ASSERTION FAILED] READ Pointer is not Stabile");
//-----------------------------------------------------
// 12.Write Pointer Stability
//-----------------------------------------------------
    property write_ptr_stability;
      @(posedge clk) 
      disable iff(rst || !asrt_en)
      !w_en |=> $stable(internal_wptr);
    endproperty
      
        WRITE_PTR_STABILITY : assert property(write_ptr_stability)
      else
        $error("[ASSERTION FAILED] WRITE Pointer is not Stabile");
                


//-----------------------------------------------------
// 13.FULL & EMPTY Collision should never happen
//-----------------------------------------------------
    property full_empty_no_collision;
      @(posedge clk) 
      disable iff(rst || !asrt_en)
      (full |-> !empty);
    endproperty
      
        FULL_EMPTY_NO_COLLISION : assert property(full_empty_no_collision)
      else
        $error("[ASSERTION FAILED] FULL and EMPTY flags collided");
          
endmodule

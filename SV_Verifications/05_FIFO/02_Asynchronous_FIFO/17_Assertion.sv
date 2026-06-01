
       
//=====================================================
//                  ASSERTIONS
//=====================================================
module Async_FIFO_SVA #(parameter Width=8,Depth=16)(
  input w_clk,w_rst,w_en,
  input r_clk,r_rst,r_en,
  input [Width-1:0] data_in,
  input [Width-1:0] data_out,
  input full,empty,
  input [$clog2(Depth):0] internal_wptr,internal_rptr,
  input asrt_en
);
      
  
//-----------------------------------------------------
// 1.Enable signals should never contain X/Z
//-----------------------------------------------------  
    property write_enable_known;
      @(posedge w_clk)
      disable iff(w_rst || !asrt_en)
      !$isunknown(w_en);
    endproperty
    
  WRITE_ENABLE_KNOWN : assert property(write_enable_known)
      else
        $error("[ASSERTION FAILED] Enable Signals contains X/Z");
      
    property read_enable_known;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en)
      !$isunknown(r_en);
    endproperty
    
    READ_ENABLE_KNOWN : assert property(read_enable_known)
      else
        $error("[ASSERTION FAILED] Enable Signals contains X/Z");

//-----------------------------------------------------
// 2.Data-In should never contain X/Z
//-----------------------------------------------------
      
    property data_in_known;
      @(posedge w_clk)
      disable iff(w_rst || !asrt_en)
      w_en |-> !$isunknown(data_in);
      
    endproperty
    
      DATA_IN_KNOWN : assert property(data_in_known)
      else
        $error("[ASSERTION FAILED] Data In contains X/Z");
        
        
//-----------------------------------------------------
// 3.Data-Out should never contain X/Z
//-----------------------------------------------------
      
    property data_out_known;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en)
       (r_en && !empty) |=> !$isunknown(data_out);
      
    endproperty
    
        DATA_OUT_KNOWN : assert property(data_out_known)
      else
        $error("[ASSERTION FAILED] Data Out contains X/Z");
//-----------------------------------------------------
// 4.Flags should never contain X/Z
//-----------------------------------------------------
      
    property full_known;
      @(posedge w_clk)
      disable iff(w_rst || !asrt_en)
      !$isunknown(full);
      
    endproperty
    
      FULL_FLAG_KNOWN : assert property(full_known)
      else
        $error("[ASSERTION FAILED] Full Flag contains X/Z");
        
      
    property empty_known;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en)
      !$isunknown(empty);
      
    endproperty
    
      EMPTY_FLAG_KNOWN : assert property(empty_known)
      else
        $error("[ASSERTION FAILED] Empty Flag contains X/Z");
//-----------------------------------------------------
// 5.Internal Pointers should never contain X/Z
//-----------------------------------------------------  
    property write_pointer_known;
      @(posedge w_clk)
      disable iff(w_rst || !asrt_en)
      !$isunknown(internal_wptr);
    endproperty
    
        WRITE_POINTER_KNOWN : assert property(write_pointer_known)
      else
        $error("[ASSERTION FAILED] Write Internal Pointer contains X/Z");
          
    property read_pointer_known;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en)
      !$isunknown(internal_rptr);
    endproperty
    
          READ_POINTER_KNOWN : assert property(read_pointer_known)
      else
        $error("[ASSERTION FAILED] Read Internal Pointer contains X/Z");
        


//-----------------------------------------------------
// 6. Reset should clear outputs
//-----------------------------------------------------
            always@(*)begin
              if(asrt_en && w_rst)begin
                RESET_CLEARED_WRITE_DOMAIN : assert final ( full==0 && internal_wptr==0)
                else
                  $error("[ASSERTION FAILED] RESET Did not CLEAR the WRITE Domain Outputs");   
              end
              
              if(asrt_en && r_rst)begin
                RESET_CLEARED_READ_DOMAIN : assert final (empty==1 && internal_rptr==0)
                else
                  $error("[ASSERTION FAILED] RESET Did not CLEAR the READ Domain Outputs");  
              end
              
            end
      
//-----------------------------------------------------
// 7. Reset dominance over write
//-----------------------------------------------------
      always@(*)begin
        if(asrt_en && w_rst && w_en)begin
                RESET_DOMINANCE_WRITE : assert final ( full==0 && internal_wptr==0)
                else
                  $error("[ASSERTION FAILED] Data-in Ignored the Reset signal and went into the FIFO");  
              end
              
            end
      
//-----------------------------------------------------
// 8. Reset dominance over read
//-----------------------------------------------------
     always@(*)begin
       if(asrt_en && r_rst && r_en)begin
                RESET_DOMINANCE_READ : assert final (empty==1 && internal_rptr==0)
                else
                  $error("[ASSERTION FAILED] Read opration/Data out Ignored the Reset signal and data caem out of FIFO");
              end
              
            end

      
//---------------------------------------------------------------------
// 9.Overflow Protection(FIFO Should ignore write request during FULL)
//---------------------------------------------------------------------
    property overflow_protection;
      @(posedge w_clk)
      disable iff(w_rst || !asrt_en)
      (full && w_en)|=> $stable(internal_wptr);
      
    endproperty
    
    OVERFLOW_PROTECTION : assert property(overflow_protection)
      else
        $error("[ASSERTION FAILED] DATA came into FIFO even after Being Full");
      
//---------------------------------------------------------------------
// 10.Underflow Protection(FIFO Should ignore read request during EMPTY)
//---------------------------------------------------------------------
    property underflow_protection;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en)
      (empty && r_en)|=> $stable(internal_rptr);
      
    endproperty
    
    UNDERFLOW_PROTECTION : assert property(underflow_protection)
      else
        $error("[ASSERTION FAILED] DATA came out of FIFO even after Being EMPTY");

//-----------------------------------------------------
// 11. Read Pointer Stability
//-----------------------------------------------------
    property read_ptr_stability;
      @(posedge r_clk) 
      disable iff(r_rst || !asrt_en)
      !r_en |=> $stable(internal_rptr);
    endproperty
      
      READ_PTR_STABILITY : assert property(read_ptr_stability)
      else
        $error("[ASSERTION FAILED] READ Pointer is not Stabile");
//-----------------------------------------------------
// 12.Write Pointer Stability
//-----------------------------------------------------
    property write_ptr_stability;
      @(posedge w_clk) 
      disable iff(w_rst || !asrt_en)
      !w_en |=> $stable(internal_wptr);
    endproperty
      
        WRITE_PTR_STABILITY : assert property(write_ptr_stability)
      else
        $error("[ASSERTION FAILED] WRITE Pointer is not Stabile");
          
//-----------------------------------------------------
// 13.Data-Out Stability
//-----------------------------------------------------
      property data_out_stability;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en || empty)
      !r_en |=> $stable(data_out);
    endproperty
    
    DATA_OUT_STABILITY : assert property(data_out_stability)
      else $error("[ASSERTION FAILED] Data out changed without a valid read request");
                

//-----------------------------------------------------
// 14.Write Pointer Increment Behavior
//-----------------------------------------------------
property write_ptr_increment;
      @(posedge w_clk)
      disable iff(w_rst || !asrt_en)
      (w_en && !full) |=> (internal_wptr==$past(internal_wptr)+1'b1);
    endproperty
    
    WRITE_PTR_INCREMENT : assert property(write_ptr_increment)
      else $error("[ASSERTION FAILED] Write pointer did not increment by 1");
      
//-----------------------------------------------------
// 15.Write Pointer Increment Behavior
//-----------------------------------------------------
      property read_ptr_increment;
      @(posedge r_clk)
      disable iff(r_rst || !asrt_en)
      (r_en && !empty) |=> (internal_rptr==$past(internal_rptr)+1'b1);
    endproperty
    
    READ_PTR_INCREMENT : assert property(read_ptr_increment)
      else $error("[ASSERTION FAILED] Read pointer did not increment by 1");
          
endmodule

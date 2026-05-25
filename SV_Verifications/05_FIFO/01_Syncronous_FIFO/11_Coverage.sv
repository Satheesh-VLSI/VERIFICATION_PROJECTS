//===========================
//        COVERAGE
//===========================
class Coverage #(parameter Width=8);
  Transaction #(Width) trans;
  
  // Previous state to track transitions and boundaries
  bit prev_full;
  bit prev_empty;
  bit prev_rst;
  
  covergroup FIFO_Cover(string name);
    
    option.name = name;
    option.per_instance = 1; 
    type_option.merge_instances = 1;
    
    //-------- Basic Control Operations --------
    Write_EN : coverpoint trans.w_en { 
      bins write = {1}; 
      bins idle_w = {0}; 
    }
    
    Read_EN : coverpoint trans.r_en { 
      bins read  = {1}; 
      bins idle_r = {0}; 
    }
    
    // Catch every operational state: PUSH,POP,PUSH-POP,IDLE
    OPERATIONS : cross Write_EN,Read_EN;
    
    //-------- Data Coverage --------
    DATA_IN : coverpoint trans.data_in iff(trans.w_en == 1) { 
        option.auto_bin_max = 64; 
    }
    
    DATA_OUT : coverpoint trans.data_out iff(trans.r_en == 1) { 
        option.auto_bin_max = 64; 
    }
    
    //-------- Status Flags --------
    FULL  : coverpoint trans.full;
    EMPTY : coverpoint trans.empty;
    
    //-------Flag transitions----------
    FULL_Transition  : coverpoint trans.full  { 
      bins full_to_not_full = (1 => 0); 
      bins not_full_to_full = (0 => 1); 
    }
    
    EMPTY_Transition : coverpoint trans.empty { 
      bins empty_to_not_empty = (1 => 0); 
      bins not_empty_to_empty = (0 => 1); 
    }
    
    //-------- Boundary & Error Conditions --------
    // Attempting to write when full(Overflow condition)
    OVERFLOW_ATTEMPT : coverpoint (trans.w_en == 1 && trans.full == 1) {
      bins write_when_full = {1};
    }
    
    // Attempting to read when empty(Underflow condition)
    UNDERFLOW_ATTEMPT : coverpoint (trans.r_en == 1 && trans.empty == 1) {
      bins read_when_empty = {1};
    }

    //-------- Reset Coverage ---------
    RESET : coverpoint trans.rst { 
      bins asserted ={1}; 
      bins de_asserted={0}; 
    }
    
    RESET_Transition : coverpoint trans.rst {
      bins assert_to_deassert = (1 => 0);
      bins deassert_to_assert = (0 => 1);
    }
    
    // Operations immediately after reset
    Write_AFTER_RESET : coverpoint (prev_rst == 1 && trans.rst == 0 && trans.w_en == 1) {
      bins write_after_rst = {1};
    }
    
    Read_AFTER_RESET : coverpoint (prev_rst == 1 && trans.rst == 0 && trans.r_en == 1) {
      bins read_after_rst = {1};
    }
    
  endgroup
  
  function new(string name);
    FIFO_Cover = new(name);
  endfunction
  
  function void sample(Transaction #(Width) trans);
    
    this.trans = trans;
    
    FIFO_Cover.sample();
    
    prev_full  = trans.full;
    prev_empty = trans.empty;
    prev_rst   = trans.rst;
  endfunction
  
endclass
    



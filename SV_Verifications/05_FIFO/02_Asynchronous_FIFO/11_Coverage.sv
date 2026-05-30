//===========================
//         COVERAGE
//===========================
class Coverage #(parameter Width=8);
  
  
  Transaction #(Width) w_trans;
  Transaction #(Width) r_trans;
  
  
  bit prev_full;
  bit prev_empty;
  bit prev_w_rst;
  bit prev_r_rst;
  
  //-----------------------------------------------------
  // WRITE COVERGROUP
  //-----------------------------------------------------
  covergroup FIFO_WRITE(string name);
    option.name = name;
    option.per_instance = 1; 
    type_option.merge_instances = 1;
    
    Write_EN : coverpoint w_trans.w_en { 
      bins write = {1}; 
      bins idle_w = {0}; 
    }
    
    DATA_IN : coverpoint w_trans.data_in iff(w_trans.w_en == 1) { 
        option.auto_bin_max = 64; 
    }
    
    FULL  : coverpoint w_trans.full;
    
    FULL_Transition  : coverpoint w_trans.full  { 
      bins full_to_not_full = (1 => 0); 
      bins not_full_to_full = (0 => 1); 
    }
    
    OVERFLOW_ATTEMPT : coverpoint (w_trans.w_en == 1 && w_trans.full == 1) {
      bins write_when_full = {1};
    }

    RESET : coverpoint w_trans.w_rst { 
      bins asserted ={1}; 
      bins de_asserted={0}; 
    }
    
    RESET_Transition : coverpoint w_trans.w_rst {
      bins assert_to_deassert = (1 => 0);
      bins deassert_to_assert = (0 => 1);
    }
    
    Write_AFTER_RESET : coverpoint (prev_w_rst == 1 && w_trans.w_rst == 0 && w_trans.w_en == 1) {
      bins write_after_rst = {1};
    }
    
    RESET_during_Write : coverpoint (w_trans.w_rst == 1 && w_trans.w_en == 1) {
      bins reset_during_write = {1};
    }
    Write_Burst : coverpoint w_trans.w_en{
      bins busrt_4 =(1[*4]);
      bins busrt_8 =(1[*8]);
      bins busrt_16=(1[*16]);
      bins busrt_32=(1[*32]);
    }
  endgroup
  
  //-----------------------------------------------------
  // READ COVERGROUP
  //-----------------------------------------------------
  covergroup FIFO_READ(string name);
    option.name = name;
    option.per_instance = 1; 
    type_option.merge_instances = 1;
    
    Read_EN : coverpoint r_trans.r_en { 
      bins read  = {1}; 
      bins idle_r = {0}; 
    }
    
    DATA_OUT : coverpoint r_trans.data_out iff(r_trans.r_en == 1) { 
        option.auto_bin_max = 64; 
    }
    
    EMPTY : coverpoint r_trans.empty;
    
    EMPTY_Transition : coverpoint r_trans.empty { 
      bins empty_to_not_empty = (1 => 0); 
      bins not_empty_to_empty = (0 => 1); 
    }
    
    UNDERFLOW_ATTEMPT : coverpoint (r_trans.r_en == 1 && r_trans.empty == 1) {
      bins read_when_empty = {1};
    }

    RESET : coverpoint r_trans.r_rst { 
      bins asserted ={1}; 
      bins de_asserted={0}; 
    }
    
    RESET_Transition : coverpoint r_trans.r_rst {
      bins assert_to_deassert = (1 => 0);
      bins deassert_to_assert = (0 => 1);
    }
    
    Read_AFTER_RESET : coverpoint (prev_r_rst == 1 && r_trans.r_rst == 0 && r_trans.r_en == 1) {
      bins read_after_rst = {1};
    }
    
    RESET_during_Read : coverpoint (r_trans.r_rst == 1 && r_trans.r_en == 1) {
      bins reset_during_read = {1};
    }
    
    Read_Burst : coverpoint r_trans.r_en{
      bins busrt_4 =(1[*4]);
      bins busrt_8 =(1[*8]);
      bins busrt_16=(1[*16]);
      bins busrt_32=(1[*32]);
    }
  endgroup
  
  //-----------------------------------------------------
  // FUNCTIONS
  //-----------------------------------------------------
  function new(string name);
    FIFO_WRITE = new({name,"_WRITE"});
    FIFO_READ = new({name,"_READ"});
  endfunction
  
  function void write_sample(Transaction #(Width) trans);
    this.w_trans = trans;
    
    FIFO_WRITE.sample();
    
    prev_full  = trans.full;
    prev_w_rst = trans.w_rst;
  endfunction
  
  function void read_sample(Transaction #(Width) trans);
    
    this.r_trans = trans;
    
    FIFO_READ.sample();
    
    
    prev_empty = trans.empty;
    prev_r_rst = trans.r_rst;
  endfunction
  
endclass

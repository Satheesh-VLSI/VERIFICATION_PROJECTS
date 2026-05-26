
//===========================
//        COVERAGE
//===========================
class Coverage;
  Transaction trans;
  
  bit [5:0] prev_addr_A;
  bit [5:0] prev_addr_B;
  bit prev_rst;
  
  covergroup RAM_Cover(string name);
    
    option.name=name;
    option.per_instance = 1; 
    type_option.merge_instances = 1;
    
    
    //--------Port A,Port B Mode coverage--------
    PORT_A_MODE : coverpoint trans.mode_A{
      bins read={0};
      bins write={1};
    }
    
    PORT_B_MODE : coverpoint trans.mode_B{
      bins read={0};
      bins write={1};
    }
    
    
    //--------Port A,Port B Address Coverage--------
    PORT_A_ADDR: coverpoint trans.addr_A{
      bins addr[]= {[0:63]};
    }
    
    PORT_B_ADDR : coverpoint trans.addr_B{
      bins addr[]= {[0:63]};
    }
    
    //--------Data Coverage----------
    
    PORT_A_DATA_in : coverpoint trans.data_in_A iff(trans.mode_A==1){
      option.auto_bin_max=64;
    }
    PORT_B_DATA_in : coverpoint trans.data_in_B iff(trans.mode_B==1){
      option.auto_bin_max=64;
    }
     
    
    PORT_A_DATA_out : coverpoint trans.data_out_A iff(trans.mode_A==0){
      option.auto_bin_max=64;
    }
    PORT_B_DATA_out : coverpoint trans.data_out_B iff(trans.mode_B==0){
      option.auto_bin_max=64;
    }
    
    
    //-----Mode A & Mode B Cross Coverage
    
    PORTS_Mode_comb : cross PORT_A_MODE,PORT_B_MODE;
    
    //---------Collion Coverage--------
    
    COLLISION : coverpoint (trans.addr_A==trans.addr_B){
      ignore_bins NO_COLLIOSION={0};
      bins COLLISION ={1};
    }
    
    //--------Modes-Collision Cross Coverage-------
    
    COLLISION_MODES : cross  PORTS_Mode_comb,COLLISION;
    
    //------------PORT A Sequential Coverages------------
    PORT_A_Operation_Transitions : coverpoint trans.mode_A iff(prev_addr_A==trans.addr_A){
      bins read_after_write = (1=>0);
      bins write_after_read = (0=>1);
      bins bact2back_write = (1=>1);
      bins back2back_read = (0=>0);
    }
    
    
    //------------PORT A Sequential Coverages------------
    PORT_B_Operation_Transitions : coverpoint trans.mode_B iff(prev_addr_B==trans.addr_B){
      bins read_after_write = (1=>0);
      bins write_after_read = (0=>1);
      bins bact2back_write = (1=>1);
      bins back2back_read = (0=>0);
    }
    
    //-------Reset Coverages---------
    
    RESET : coverpoint trans.rst{
      bins asserted ={1};
      bins de_asserted={0};
    }
    
    RESET_Transition : coverpoint trans.rst{
      bins assert_deassert=(1=>0);
      bins deassert_assert=(0=>1);
    }
    //-------OPERATIONS during RESET--------
    READ_during_RESET : coverpoint (trans.rst==1 &&( trans.mode_A==0 || trans.mode_B==0)){
      bins read_during_reset={1};
    }
    
    WRITE_during_RESET : coverpoint (trans.rst==1 &&( trans.mode_A==1 || trans.mode_B==1)){
      bins write_during_reset={1};
    }
    //-------OPERATIONS immediately after RESET
    READ_after_RESET : coverpoint ((prev_rst==1 && trans.rst==0) && ( trans.mode_A==0 || trans.mode_B==0)){
      bins read_after_reset={1};
    }
    
    
    WRITE_after_RESET : coverpoint ((prev_rst==1 && trans.rst==0) && ( trans.mode_A==1 || trans.mode_B==1)){
      bins write_after_reset={1};
    }
  endgroup
  
  function new(string name);
    RAM_Cover=new(name);
  endfunction
  
  function void sample(Transaction trans);
    this.trans=trans;
    RAM_Cover.sample();  //actual sampling of the coverage
    
    prev_addr_A=trans.addr_A;
    prev_addr_B=trans.addr_B;
    prev_rst=trans.rst;
    
    
  endfunction
endclass




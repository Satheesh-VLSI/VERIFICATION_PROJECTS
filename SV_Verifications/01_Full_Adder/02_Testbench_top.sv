


module tb_top;
  
  logic clk;
  initial clk=0;
  always #5 clk=~clk;
  
  //INTERFACE Instantiation
  FA_INTERTFACE inf(clk);
  
  
  //DUT instantiation
  full_adder fa1(.a(inf.a),
                 .b(inf.b),
                 .cin(inf.cin),
                 .sum(inf.sum),
                 .carry(inf.cout));
  
    Environment env;
  
  initial begin 
     #20;
    env=new(inf);
    env.test();
    #20;
    $finish;
    
  end 
  
  
endmodule:tb_top

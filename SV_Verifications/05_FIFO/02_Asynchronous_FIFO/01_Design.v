


module Async_FIFO #(parameter W=8,D=32) (w_clk,r_clk,r_rst,w_rst,w_en,r_en,d_in,d_out,full,empty);

  input w_clk,r_clk,r_rst,w_rst,w_en,r_en;
  input [W-1:0] d_in;
  output reg full,empty;
  output reg [W-1:0] d_out;
  
  
  
    
  reg [$clog2(D):0] r_ptr_gray,w_ptr_gray;
  reg [$clog2(D):0] r_ptr_bin,w_ptr_bin,
                    r_ptr_syncgray,w_ptr_syncgray,
                    r_sync1,w_sync1;
  //write handler
  write_ptr_handler #(.W(W),.D(D)) write (.w_clk(w_clk),
                                          .w_rst(w_rst),
                                          .w_en(w_en),
                                          .full(full),
                                          .r_ptr_syncgray(r_ptr_syncgray),
                                          .w_ptr_bin(w_ptr_bin),
                                          .w_ptr_gray(w_ptr_gray));
  
  
  //read handler
  read_ptr_handler  #(.W(W),.D(D)) read (.r_clk(r_clk),
                                         .r_rst(r_rst),
                                         .r_en(r_en),
                                         .empty(empty),
                                         .w_ptr_syncgray(w_ptr_syncgray),
                                         .r_ptr_bin(r_ptr_bin),
                                         .r_ptr_gray(r_ptr_gray));
  
  //write ptr sync with read clock
  two_FF_synchronizer  #(.W(W),.D(D)) w_sync (.clk(r_clk),
                                              .rst(r_rst),
                                              .gray(w_ptr_gray),
                                              .sync_gray(w_ptr_syncgray));
  
  //read ptr sync with write clock
  two_FF_synchronizer  #(.W(W),.D(D)) r_sync (.clk(w_clk),
                                              .rst(w_rst),
                                              .gray(r_ptr_gray),
                                              .sync_gray(r_ptr_syncgray));
  
  //Memory circuit
  memory  #(.W(W),.D(D)) fifo_memory (.w_clk(w_clk),
                                      .r_clk(r_clk),
                                      .w_rst(w_rst),
                                      .r_rst(r_rst),
                                      .w_en(w_en),
                                      .r_en(r_en),
                                      .w_ptr_bin(w_ptr_bin),
                                      .r_ptr_bin(r_ptr_bin),
                                      .full(full),
                                      .empty(empty),
                                      .d_in(d_in),
                                      .d_out(d_out));
endmodule

//write handler
module write_ptr_handler #(parameter W=8,D=32)(w_clk,w_rst,w_en,full,r_ptr_syncgray,w_ptr_bin,w_ptr_gray);
  input w_clk,w_rst,w_en;
    input [$clog2(D):0] r_ptr_syncgray;
  output reg [$clog2(D):0] w_ptr_bin,w_ptr_gray;
  output reg full;
  
    
  wire [$clog2(D):0] w_ptr_gray_next,w_ptr_bin_next;
  wire temp_full;
    
  
  assign w_ptr_bin_next=w_ptr_bin + ((!full && w_en));
  assign w_ptr_gray_next=(w_ptr_bin_next) ^ ((w_ptr_bin_next)>>1);
  
  
  always @(posedge w_clk or posedge w_rst)begin
    if(w_rst)begin
      w_ptr_gray<=0;
      w_ptr_bin<=0;
      full<=0;
    end
      
      else begin
        w_ptr_bin<=w_ptr_bin_next;
        w_ptr_gray<=w_ptr_gray_next;
        full<=temp_full;
      end 
  end
    
  assign temp_full=(w_ptr_gray_next=={~r_ptr_syncgray[$clog2(D):$clog2(D)-1],r_ptr_syncgray[$clog2(D)-2:0]});
      
  
endmodule
  

 //read handler
module read_ptr_handler  #(parameter W=8,D=32)(r_clk,r_rst,r_en,empty,w_ptr_syncgray,r_ptr_bin,r_ptr_gray);
  input r_clk,r_rst,r_en;
  input [$clog2(D):0] w_ptr_syncgray;
  output reg [$clog2(D):0] r_ptr_bin,r_ptr_gray;
  output reg empty;
  
    
  wire [$clog2(D):0] r_ptr_gray_next,r_ptr_bin_next;
  wire temp_empty;
  
    
    assign r_ptr_bin_next=r_ptr_bin + ((!empty && r_en));
    assign r_ptr_gray_next=(r_ptr_bin_next) ^ ((r_ptr_bin_next)>>1);
  
  
    always @(posedge r_clk or posedge r_rst)begin
      if(r_rst)begin
      r_ptr_gray<=0;
      r_ptr_bin<=0;
      empty<=1;
    end
      
      else begin
        r_ptr_bin<=r_ptr_bin_next;
        r_ptr_gray<=r_ptr_gray_next;
        empty<=temp_empty;
      end 
  end
    assign temp_empty = (r_ptr_gray_next == w_ptr_syncgray);
  endmodule
 

  //synchronizer
    
  module two_FF_synchronizer #(parameter W=8,D=32)(clk,rst,gray,sync_gray);
      input clk,rst;
      input [$clog2(D):0] gray;
      output reg [$clog2(D):0] sync_gray;
      
    reg [$clog2(D):0] sync; 
      
    always @(posedge clk or posedge rst)begin
    
    if(rst)begin
      sync<=0;
      sync_gray<=0;
    end
    else begin
      sync<=gray;
      sync_gray<=sync;
    end
  end
    endmodule
  

//memory
  module memory  #(parameter W=8,D=32)(w_clk,r_clk,w_rst,r_rst,w_en,r_en,w_ptr_bin,r_ptr_bin,full,empty,d_in,d_out); 
        
        input w_clk,r_clk,w_rst,r_rst,w_en,r_en,full,empty;
        input [W-1:0] d_in;
        input [$clog2(D):0] w_ptr_bin,r_ptr_bin;
        output reg [W-1:0]  d_out;
    
        reg [W-1:0] memory [0:D-1]; 
        
        always @(posedge w_clk or posedge w_rst) begin
            if (w_rst)
                  ; 
            else if (!full & w_en)
              memory [ w_ptr_bin[$clog2(D)-1:0]]<=d_in; //write
        end  
           
        always @(posedge r_clk or posedge r_rst) begin
          if (r_rst)
            ;
          else if (!empty & r_en)
            d_out <=memory [ r_ptr_bin[$clog2(D)-1:0]]; //read
          end  
       
      endmodule
  

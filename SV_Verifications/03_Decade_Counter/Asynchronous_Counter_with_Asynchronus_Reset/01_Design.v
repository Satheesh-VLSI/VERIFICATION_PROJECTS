module Decade (
    input clk,
    input rst, 
    output reg [3:0] Q
);

    reg self_clear;

  
  always @(negedge clk or posedge rst) 
    self_clear = rst | (Q[3] & Q[0]); 
  
    always @(negedge clk or posedge self_clear) begin
        if (self_clear) 
            Q[0] <= 1'b0;
        else            
            Q[0] <= ~Q[0];
    end

  
    always @(negedge Q[0] or posedge self_clear) begin
        if (self_clear) 
            Q[1] <= 1'b0;
        else            
            Q[1] <= ~Q[1];
    end

  
    always @(negedge Q[1] or posedge self_clear) begin
        if (self_clear) 
            Q[2] <= 1'b0;
        else            
            Q[2] <= ~Q[2];
    end

  
    always @(negedge Q[2] or posedge self_clear) begin
        if (self_clear) 
            Q[3] <= 1'b0;
        else            
            Q[3] <= ~Q[3];
    end

endmodule

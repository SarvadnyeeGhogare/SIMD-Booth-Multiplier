`timescale 1ns / 1ps

module test;
reg clk;
reg [1:0]mode;
reg start;
reg[15:0]M,Q;
wire [31:0]result;
wire done;
    
    
     booth_controller uut(clk,mode,start, M,Q,result,done);
     
     initial
      begin 
      start=1'b1;
      clk=1'b1;
      mode=2'b10;
      M=16'b0111010100110110;
      Q=16'b0111010100110110;  
      #70 mode=2'b01;
      #120 mode=2'b00;
      # 200$finish;    
     end 
     
     always #5 clk=~clk;
     
endmodule





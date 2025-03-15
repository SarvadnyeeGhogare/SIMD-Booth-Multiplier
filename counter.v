
module counter(clk,mode,dec,clr,count_out);
input [1:0]mode;
input dec,clk,clr;
output reg [4:0] count_out;

always @(posedge clk)
begin
if(dec)count_out<=count_out-1;
else if(clr) begin
case(mode)
2'b00:count_out<=5'd16;
2'b01:count_out<=5'd8;
2'b10:count_out<=5'd4;
endcase
end


else count_out<=count_out;
end 
endmodule 

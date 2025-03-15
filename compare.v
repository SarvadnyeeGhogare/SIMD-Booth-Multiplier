module compare(mode,temp_accumulator,count_out,eqz,result,accumulator);
input [1:0] mode;
input [4:0]count_out;
input [35:0]temp_accumulator ;
output reg[35:0] accumulator;
output reg[31:0] result ;
output reg eqz;

always @(*)
begin

if(!count_out )begin
eqz<=1;
case(mode)
2'b00:result<=accumulator[32:1];
2'b01:result<={accumulator[33:18],accumulator[16:1]};
2'b10:result<={accumulator[35:28],accumulator[26:19],accumulator[17:10],accumulator[8:1]};
endcase

end

else begin
eqz<=0;
result<=0;
accumulator<=temp_accumulator;
end 
end

endmodule 

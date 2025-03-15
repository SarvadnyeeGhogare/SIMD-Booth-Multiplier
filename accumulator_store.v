
module accumulator_store(input [35:0] in,input [15:0]Q,input [1:0]mode,
                          input clk,ld,clr,
								  output reg [35:0] out);
								  

always @(posedge clk) begin 
case(mode)
2'b00:begin if(clr) out<= {3'b0,16'b0,Q,1'b0};
     else if(ld) out<=in;end 
     
2'b01: begin 
      if (clr) begin out[16:0]<= {8'b0,Q[7:0],1'b0};
                       out[35:17]<= {2'b0,8'b0,Q[15:8],1'b0};end  
     else if(ld)begin  out<=in;	end
									end 
2'b10:begin
    if (clr) begin out[8:0]<= {4'b0,Q[3:0],1'b0};
                       out[17:9]<= {4'b0,Q[7:4],1'b0};
							  out[26:18]<= {4'b0,Q[11:8],1'b0};
							  out[35:27]<= {4'b0,Q[15:12],1'b0};end  
     else if(ld) out<=in;
end 
endcase
end
endmodule

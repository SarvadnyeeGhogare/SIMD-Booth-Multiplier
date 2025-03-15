
module control_path( 
    input clk,eqz,
    input start,
    output reg ld,clr,dec,done,clr_count);
  reg [2:0] state;
  parameter S0=2'b00,S1=2'b01 , S2=2'b10,S3=2'b11;
  
  always @(posedge clk)
  begin
  case(state)
  S0:if(start)state<=S1;
  S1:state<=S2;
  S2:if (eqz)state<=S3; else state<=S2;
  S3:state=S0;
  default : state<=S0;
  endcase
  end 
  
  
  always @(state)
  begin
  case(state)
  S0:begin ld=0;clr=0;dec=0;done=0;clr_count=0;end 
  S1:begin ld=0;clr=1;dec=0;clr_count=1;done=0;end
  S2:begin ld=1;clr=0;dec=1;clr_count=0;done=0;end
  S3:begin ld=0;clr=0;dec=0;clr_count=0;done=1;end
  endcase 
  end 
	endmodule 
	

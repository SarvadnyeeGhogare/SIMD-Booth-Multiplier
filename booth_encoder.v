
module booth_encoder(
input [1:0]mode,
    input [35:0]accum,
    input [15:0] M,
    output reg [15:0] M_out ,// Output declared as wire
	 output reg [3:0]flags
);
    

    always @(*) 
    begin
    	 
case(mode)
2'b00: begin
         case (accum[1:0])
            2'b00:begin M_out =0;  flags=4'b0000; end            
            2'b01:begin M_out = M; flags=4'b0000;end 
            2'b10:begin M_out = M; flags=4'b1111;end 
            2'b11:begin M_out =0;  flags=4'b0000; end                       
         endcase
        end 
     
     
2'b01:  begin 
            case (accum[18:17])
            2'b01:begin  M_out[15:8]=M[15:8] ;flags[3:2]=2'b00;end
            2'b10:begin  M_out[15:8]=M[15:8] ;flags[3:2]=2'b11;end
            default:begin  M_out[15:8]=8'b0 ;flags[3:2]=2'b00;end 
            endcase
         
            case(accum[1:0])
            2'b01:begin M_out[7:0]=M[7:0] ;flags[1:0]=2'b00;end 
            2'b10:begin M_out[7:0]=M[7:0] ;flags[1:0]=2'b11;end
            default:begin M_out[7:0]=8'b0;flags[1:0]=2'b00;end
            endcase 
         end   
         
            
               
		             
		
2'b10:begin 
		 case (accum[28:27])
         2'b01:begin  M_out[15:12]=M[15:12] ;flags[3]=1'b0;end
         2'b10:begin  M_out[15:12]=M[15:12] ;flags[3]=1'b1;end
         default:begin M_out[15:12]=4'b0 ;flags[3]=1'b0;end 
         endcase
         
         case(accum[19:18])
         2'b01:begin  M_out[11:8]=M[11:8] ;flags[2]=1'b0;end
         2'b10:begin  M_out[11:8]=M[11:8] ;flags[2]=1'b1;end
         default:begin  M_out[11:8]=4'b0 ;flags[2]=1'b0;end 
         endcase
       
         case (accum[10:9])
         2'b01:begin  M_out[7:4]=M[7:4] ;flags[1]=1'b0;end
         2'b10:begin  M_out[7:4]=M[7:4] ;flags[1]=1'b1;end
         default:begin  M_out[7:4]=4'b0 ;flags[1]=1'b0;end 
         endcase
         
         case (accum[1:0])
         2'b01:begin  M_out[3:0]=M[3:0] ;flags[0]=1'b0;end
         2'b10:begin  M_out[3:0]=M[3:0] ;flags[0]=1'b1;end
         default:begin  M_out[3:0]=4'b0 ;flags[0]=1'b0;end 
         endcase

        end 
        endcase  
end
endmodule



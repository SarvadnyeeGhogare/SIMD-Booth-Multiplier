	
module arithmetic_shifter( 
    input [35:0] Z,
	 input [15:0] sum,
	 input [1:0] mode,
    output[35:0] temp_accumulator 
);
 
 assign temp_accumulator = (mode==2'b00) ? {3'b0,sum[15],sum, Z[16:1]} :
                           (mode==2'b01) ? {2'b0,sum[15],sum[15:8],Z[25:18],sum[7],sum[7:0],Z[8:1]} :
									(mode==2'b10) ? {sum[15],sum[15:12],Z[31:28],sum[11],sum[11:8],Z[22:19],sum[7],sum[7:4],Z[13:10],sum[3],sum[3:0],Z[4:1]} :0;
   
endmodule

  

module data_path(
input[1:0] mode,
    input clk,ld,clr,dec,clr_count,
    input [15:0] M,
    input [15:0] Q,
    output [31:0] result,
    output eqz
);
    wire[35:0] accumulator,temp_accumulator;       
	wire[35:0] Z;
	wire [4:0]count_out ;
	wire [15:0]sum;
	wire [15:0] M_out;
	wire [3:0]flags;
	 
 
  accumulator_store dut0(accumulator,Q,mode, clk,ld,clr,Z);
  booth_encoder mux(mode,Z,M,M_out,flags);
  adder_subtractor dut1(mode,Z,M_out,flags ,sum);
  arithmetic_shifter dut2(Z,sum,mode,temp_accumulator);
  counter count(clk,mode,dec,clr_count,count_out);
  compare cmpr(mode,temp_accumulator,count_out,eqz,result,accumulator);
  
  
 endmodule 


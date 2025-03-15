module booth_controller(
    input clk,
	 input [1:0] mode,
    input start,
    input [15:0] M,
    input [15:0] Q,
    output [31:0] result,
    output done
);
wire ld,clr,dec;
wire  clr_count;
data_path uut0(mode, clk,ld,clr,dec,clr_count,M,Q,result,eqz);
control_path uut1(clk,eqz,start,ld,clr,dec,done,clr_count);
endmodule 

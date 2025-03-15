
module adder_subtractor(
    input [1:0] mode,
    input [35:0] Z,
    input [15:0] M_out,
	 input [3:0]flags ,
    output [15:0] sum
);
    wire [15:0] A_mode_00, A_mode_01, A_mode_10;
    wire [15:0] A_selected;

    
    assign A_mode_00 = Z[32:17];
    assign A_mode_01 = {Z[33:26], Z[16:9]};
    assign A_mode_10 = {Z[35:32], Z[26:23], Z[17:14], Z[8:5]};

    mux_4bit mux(mode, A_mode_00, A_mode_01, A_mode_10,0,A_selected);
	 adder_sub add_sb(flags,mode,A_selected,M_out,sum);    
   

endmodule


module adder_sub (
     input [3:0] flags ,// Mode: 0 for addition, 1 for subtraction
	  input [1:0] mode,
    input [15:0] A,        // First 16-bit operand
    input [15:0] B,        // Second 16-bit operand            
    output [15:0] result  // 16-bit result
  
);
    wire [15:0] B_xor;     // XOR-ed B for subtraction
    wire [15:0] carry;     // Internal carry signals
	 wire cout;

    // XOR B with mode to conditionally invert B for subtraction
    assign B_xor[3:0] = B[3:0] ^ {4{flags[0]}}; // If m = 1, B is inverted; if m = 0, B remains unchanged.
	 assign B_xor[7:4] = B[7:4] ^ {4{flags[1]}};
	 assign B_xor[11:8] = B[11:8] ^ {4{flags[2]}};
	 assign B_xor[15:12] = B[15:12] ^ {4{flags[3]}};

    // Instantiate 16 full adders
    full_adder FA0 (.a(A[0]), .b(B_xor[0]), .cin(flags[0]), .sum(result[0]), .cout(carry[0]));
    full_adder FA1 (.a(A[1]), .b(B_xor[1]), .cin(carry[0]), .sum(result[1]), .cout(carry[1]));
    full_adder FA2 (.a(A[2]), .b(B_xor[2]), .cin(carry[1]), .sum(result[2]), .cout(carry[2]));
    full_adder_4_1st FA3 (.mode(mode),.flags(flags),.a(A[3]), .b(B_xor[3]), .cin(carry[2]), .sum(result[3]), .cout(carry[3]));
    full_adder FA4 (.a(A[4]), .b(B_xor[4]), .cin(carry[3]), .sum(result[4]), .cout(carry[4]));
    full_adder FA5 (.a(A[5]), .b(B_xor[5]), .cin(carry[4]), .sum(result[5]), .cout(carry[5]));
    full_adder FA6 (.a(A[6]), .b(B_xor[6]), .cin(carry[5]), .sum(result[6]), .cout(carry[6]));
    full_adder_8 FA7 (.mode(mode),.flags(flags),.a(A[7]), .b(B_xor[7]), .cin(carry[6]), .sum(result[7]), .cout(carry[7]));
    full_adder FA8 (.a(A[8]), .b(B_xor[8]), .cin(carry[7]), .sum(result[8]), .cout(carry[8]));
    full_adder FA9 (.a(A[9]), .b(B_xor[9]), .cin(carry[8]), .sum(result[9]), .cout(carry[9]));
    full_adder FA10 (.a(A[10]), .b(B_xor[10]), .cin(carry[9]), .sum(result[10]), .cout(carry[10]));
    full_adder_4_3rd FA11 (.mode(mode),.flags(flags),.a(A[11]), .b(B_xor[11]), .cin(carry[10]), .sum(result[11]), .cout(carry[11]));
    full_adder FA12 (.a(A[12]), .b(B_xor[12]), .cin(carry[11]), .sum(result[12]), .cout(carry[12]));
    full_adder FA13 (.a(A[13]), .b(B_xor[13]), .cin(carry[12]), .sum(result[13]), .cout(carry[13]));
    full_adder FA14 (.a(A[14]), .b(B_xor[14]), .cin(carry[13]), .sum(result[14]), .cout(carry[14]));
    full_adder FA15 (.a(A[15]), .b(B_xor[15]), .cin(carry[14]), .sum(result[15]), .cout(cout)); // Final carry-out

endmodule



module full_adder (
    input a,           // 1st bit input
    input b,           // 2nd bit input
    input cin,         // Carry-in
    output sum,        // Sum output
    output cout        // Carry-out
);
    assign sum = a ^ b ^ cin;        // Sum calculation	 
    assign cout = (a & b) | (b & cin) | (a & cin); // Carry-out calculation
endmodule


module full_adder_4_1st (
input [1:0]mode,
input [3:0]flags,
    input a,           // 1st bit input
    input b,           // 2nd bit input
    input cin,         // Carry-in
    output sum,        // Sum output
    output cout        // Carry-out
);
    assign sum = a ^ b ^ cin;        // Sum calculation	 
   assign cout = (mode == 2'b10) ?flags[1]:(a & b) | (b & cin) | (a & cin);
endmodule

module full_adder_8 (
input [1:0]mode,
input [3:0]flags,
    input a,           // 1st bit input
    input b,           // 2nd bit input
    input cin,         // Carry-in
    output sum,        // Sum output
    output cout        // Carry-out
);
    assign sum = a ^ b ^ cin;        // Sum calculation	 
   assign cout = (mode == 2'b00) ?(a & b) | (b & cin) | (a & cin):flags[2];
endmodule

module full_adder_4_3rd (
input [1:0]mode,
input [3:0]flags,
    input a,           // 1st bit input
    input b,           // 2nd bit input
    input cin,         // Carry-in
    output sum,        // Sum output
    output cout        // Carry-out
);
    assign sum = a ^ b ^ cin;        // Sum calculation	 
   assign cout = (mode == 2'b10) ?flags[3]:(a & b) | (b & cin) | (a & cin);
endmodule




 module mux_4bit (input [1:0] mode,
	                  input [15:0]in1,in2,in3,in4,
							output [15:0] out);
							
assign	 out=(mode==2'b00)?in1:
             (mode==2'b01)?in2:
             (mode==2'b10)?in3:in4;
             endmodule 
	 

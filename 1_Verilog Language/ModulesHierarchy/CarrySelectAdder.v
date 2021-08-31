module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	// module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    wire cin1, cin2, cin3, cout1;
    wire [15:0] sum1, sum2, sum3, sum4;
    assign cin1 = 0;
   	assign cin2 = 0;
    assign cin3 = 1;
    
    add16 a1(a[15:0], b[15:0], cin1, sum1, cout1);
    add16 a2(a[31:16], b[31:16], cin2, sum2);
    add16 a3(a[31:16], b[31:16], cin3, sum3);
    
    // 2-to-1 MUX
    always@(*)
        case(cout1)
        	2'h0: sum4 = sum2;
            2'h1: sum4 = sum3;
        endcase
     assign sum = {sum4, sum1};
endmodule

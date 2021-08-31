module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cin1, cout1;
    wire[15:0] sum1,sum2;
    wire[31:0] b2;
    
    assign cin1 = sub;
    
    always @(*) begin
        if(sub)
            b2 = ~b;
        else
            b2 = b;
    end
    
    add16 a1(a[15:0], b2[15:0], cin1, sum1, cout1);
    add16 a2(a[31:16], b2[31:16], cout1, sum2);
    
    assign sum = {sum2, sum1}; 
endmodule

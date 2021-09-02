module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [399:0] cin2;
    bcd_fadd bcd(a[3:0], b[3:0], cin, cin2[0], sum[3:0]);
    
    generate
        genvar i;
        assign cout = cin2[396];
        for(i=4;i<400;i+=4) begin: adder
            bcd_fadd bcd(a[i+3:i], b[i+3:i], cin2[i-4], cin2[i], sum[i+3:i]);
        end
    endgenerate
endmodule

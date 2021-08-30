`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

    wire w1;
    wire w2;
    wire w3;
    
    // w1
    assign out = w1;
    assign out_n = ~w1;
    assign w1 = w2 | w3;
    
    // w2
    assign w2 = a & b;
    
    // w3
    assign w3 = c & d;
endmodule

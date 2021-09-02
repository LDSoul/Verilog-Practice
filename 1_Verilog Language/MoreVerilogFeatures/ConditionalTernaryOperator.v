module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] min1,min2,min3,min4;
    assign min1 = a;
    assign min2 = (b < min1) ? b : min1;
    assign min3 = (c < min2) ? c : min2;
    assign min4 = (d < min3) ? d : min3;
    
    assign min = min4;

        
endmodule

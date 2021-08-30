module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire p1y_w1, p1y_w2, p2y_w1, p2y_w2;
    
    // p1y
    assign p1y = p1y_w1 | p1y_w2;
    assign p1y_w1 = p1a & p1b & p1c;
    assign p1y_w2 = p1d & p1e & p1f;

    // p2y
    assign p2y = p2y_w1 | p2y_w2;
    assign p2y_w1 = p2a & p2b;
    assign p2y_w2 = p2c & p2d;
endmodule

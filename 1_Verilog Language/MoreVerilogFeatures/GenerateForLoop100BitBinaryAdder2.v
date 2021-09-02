module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    wire [99:0] cin2;
    always@(*) begin
    	sum = 0;
        cout = 0;
        cin2[0] = cin;
        for(int i=0;i<100;i++) begin
            sum[i] = a[i] ^ b[i] ^ cin2[i];
            cout[i] = ((a[i] & b[i]) | (cin2[i] & (a[i] ^ b[i])));
            if(i != 99)
            	cin2[i+1] = cout[i];
        end
    end
endmodule

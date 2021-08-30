module top_module (
    input [7:0] in,
    output [31:0] out );//

    // assign out = { replicate-sign-bit , the-input };
    // 1. 複製24次 input最高位元(保有原本符號值: 正負)
    // 2. 添加input原本8bit
    assign out = {{24{in[7]}} ,in[7:0]};
endmodule

# Verilog-Practice
HDLBits website practices

## 筆記區
(一). 基本宣告
  1. module: 起始宣告，裡面放置input、output腳位，最後面需搭配endmodule。
  2. wire: 訊號線，宣告wire即可做拉線動作(input、output、inout預設值都是wire)。
  3. assign: 要求指定的訊號線做運算，對象須為wire格式。


(二). 資料型態
  1. 資料狀態
    
    0: 邏輯0。
    1: 邏輯1。
    x,X: Unknow or Float。
    z,Z: High Impendence(高阻抗)。 
  
  2. 連接線Net

    * 沒有記憶性
    * 預設值為z
    * 不允許兩個wire連在一起(若型態為wand/wor例外)
    eq:
      input a,b;
      output c,d,e;
      
      wire c;
      wand d;
      wor e;
      
      // wire接一起 => 錯誤
      assign c = a;
      assign c = b;
      
      // wire-and => d = a&b
      assign d = a;
      assign d = b;
      
      // wire-or => e = a|b
      assign e = a;
      assign e = b;
      
  3. 進制表示

    表示法: <位元長度>'<進制表示><數值>。
    <位元長度>: 用十進制表示位元長度。
    <進制表示>: 二進制(b)、八進制(o)、十進制(d)、十六進制(h)，預設為十進制。
    <數值>：可用底線_ 增加可讀性，數值內也可以混用X和Z。
    eq:
      n = 5'b01101            // 二進制
      n = 22                  // 十進制
      n = 12'b0000_1111_0000  // 增加可讀性
      n = 4'hf                // 十六進制(二進制的1111)
      n = 4'bxxx1             // 前三位元未知，最後為1
      n = 4'bz01              // 前兩位為z，後兩位為01
  
  4. 運算子
    
    +, -, *, /, %: 算術 加、減、乘、除、餘數。
    >, >=, <, <=, ==, !=: 大於、大於等於、小於、小於等於、等於、不等於。
    <<, >>, <<<, >>>: 邏輯左移、邏輯右移、算數左移、算數右移。
    &, |, ^, ~: and, or, xor, not。
    &&, ||: 邏輯and, 邏輯or。
    
    * Bitwise Operators: 將兩個N-bit vectors對於每個bit去做相同運算，並且產生N-bit輸出(a|b)。
    * Logical Operators: 將每個向量當作是boolean(true = non-zero, false = zero)，並且產生1-bit輸出(a||b)。

(三). Vector
  1. Vectors

    def: 一組wire組合而成的集合向量。
    eq: 
      wire[7:0] w;       // 表示為1個 8bit大小的訊號。
      assign w0 = w[0]   // 取出最低位元(0)的wire信號。
      
      wire[99:0] w;
      assign out = w[10] // 取出某個數的信號。
      
      wire[7:0] x,y;     // 宣告多個變數為8bit向量。
      
  2. Implicit nets

    def: 把位宣告的(位設置的)變數，被附加上某個宣告並設置數值的變數。
    eq:
      wire[2:0] a,c;      
      assign a = 3'b101   // a=101
      assign b = a;       // b=1 (implicitly)
      assign c = b;       // c=101 (有Bug)
      my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
                          // This could be a bug if the port was intended to be a vector.

  3. Reversal
    
    eq: 
      input [7:0] in;
      output [7:0] out;
    sol: 
      assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
      or assign {out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]} = in;
      
  4. Replication & sign-extending

    sign-extending: 
      input [7:0] in;
      output [31:0] out;
      將原本8bit之input，加上符號值丟入output
      (eq, 0101(5): 最高位元為0，所以符號表示為: 00000101)
      (eq, 1101(-3): 最高位元為1，所以符號表示為: 11111101)
    
    Replication: 
      {5{1'b1}}           // 5'b11111 (or 5'd31 or 5'h1f)
      {2{a,b,c}}          // {a,b,c,a,b,c}
      {3'd5, {2{3'd6}}}   // 9'b101_110_110
    
(四). Modules

  1. 連結module

    將信號連結到module的port上有兩方法
    * by position
      mod_a instance1 ( wa, wb, wc );                   // 實體化一個新的mod_a模組，然後將wa信號連到mod_a的模組第一個端口(in1)、wb連到in2以此類推。(須注意端口順序)
                                                        // 缺點: 當模組的port發生變化，所有實體化的模組也要跟著改變到匹配的port。
    * by name
      mod_a instance2 ( .out(wc), .in1(wa), .in2(wb) ); // 優點: 就算port發生變化，也能正確保持port連結。(端口順序無關聯)

  2. 4-to-1 Multiplexer

    always@(w3 or w2 or w1 or d or sel) begin
   		case (sel)
    		2'b00   : q = d;
    		2'b01   : q = w1;
    		2'b10   : q = w2;
    		default : q = w3;
   		endcase
  	end

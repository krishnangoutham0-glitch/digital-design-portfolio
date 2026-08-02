module lfsr_4bit (clk,
    reset,
    q);
 input clk;
 input reset;
 output [3:0] q;

 wire _0_;
 wire _1_;
 wire _2_;
 wire _3_;
 wire _4_;
 wire _5_;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net1;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire net6;
 wire net7;
 wire net8;

 INV_X1 _6_ (.A(net7),
    .ZN(_1_));
 XOR2_X1 _7_ (.A(net5),
    .B(net4),
    .Z(_0_));
 CLKBUF_X3 clkbuf_0_clk (.A(clk),
    .Z(clknet_0_clk));
 CLKBUF_X3 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_0__leaf_clk));
 CLKBUF_X3 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_1__leaf_clk));
 CLKBUF_X1 clkload0 (.A(clknet_1_0__leaf_clk));
 CLKBUF_X1 hold6 (.A(reset),
    .Z(net6));
 CLKBUF_X1 hold7 (.A(net1),
    .Z(net7));
 CLKBUF_X1 hold8 (.A(_1_),
    .Z(net8));
 BUF_X1 input1 (.A(net6),
    .Z(net1));
 BUF_X1 output2 (.A(net2),
    .Z(q[0]));
 BUF_X1 output3 (.A(net3),
    .Z(q[1]));
 BUF_X1 output4 (.A(net4),
    .Z(q[2]));
 BUF_X1 output5 (.A(net5),
    .Z(q[3]));
 DFFS_X1 \q[0]$_DFF_PP1_  (.D(_0_),
    .SN(_1_),
    .CK(clknet_1_0__leaf_clk),
    .Q(net2),
    .QN(_4_));
 DFFR_X1 \q[1]$_DFF_PP0_  (.D(net2),
    .RN(net8),
    .CK(clknet_1_1__leaf_clk),
    .Q(net3),
    .QN(_2_));
 DFFR_X1 \q[2]$_DFF_PP0_  (.D(net3),
    .RN(net8),
    .CK(clknet_1_1__leaf_clk),
    .Q(net4),
    .QN(_5_));
 DFFR_X1 \q[3]$_DFF_PP0_  (.D(net4),
    .RN(net8),
    .CK(clknet_1_0__leaf_clk),
    .Q(net5),
    .QN(_3_));
endmodule

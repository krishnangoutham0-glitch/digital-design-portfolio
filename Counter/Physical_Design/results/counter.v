module counter (clk,
    reset,
    up_down,
    count);
 input clk;
 input reset;
 input up_down;
 output [3:0] count;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net1;
 wire net2;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire net7;
 wire net8;
 wire net9;

 INV_X1 _18_ (.A(net2),
    .ZN(_05_));
 AND2_X2 _19_ (.A1(_09_),
    .A2(_07_),
    .ZN(_11_));
 AOI221_X1 _20_ (.A(_08_),
    .B1(net3),
    .B2(_11_),
    .C1(_06_),
    .C2(_09_),
    .ZN(_12_));
 XNOR2_X1 _21_ (.A(net2),
    .B(net6),
    .ZN(_13_));
 XNOR2_X1 _22_ (.A(_12_),
    .B(_13_),
    .ZN(_02_));
 XNOR2_X1 _23_ (.A(_03_),
    .B(_09_),
    .ZN(_01_));
 INV_X1 _24_ (.A(_04_),
    .ZN(_00_));
 INV_X1 _25_ (.A(net8),
    .ZN(_10_));
 FA_X1 _26_ (.A(net2),
    .B(_14_),
    .CI(_17_),
    .CO(_03_),
    .S(_04_));
 HA_X1 _27_ (.A(_05_),
    .B(net4),
    .CO(_06_),
    .S(_07_));
 HA_X1 _28_ (.A(_05_),
    .B(net5),
    .CO(_08_),
    .S(_09_));
 CLKBUF_X3 clkbuf_0_clk (.A(clk),
    .Z(clknet_0_clk));
 CLKBUF_X3 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_0__leaf_clk));
 CLKBUF_X3 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .Z(clknet_1_1__leaf_clk));
 DFFR_X1 \count[0]$_DFF_PP0_  (.D(_14_),
    .RN(net9),
    .CK(clknet_1_0__leaf_clk),
    .Q(net3),
    .QN(_14_));
 DFFR_X1 \count[1]$_DFF_PP0_  (.D(_00_),
    .RN(net9),
    .CK(clknet_1_0__leaf_clk),
    .Q(net4),
    .QN(_17_));
 DFFR_X1 \count[2]$_DFF_PP0_  (.D(_01_),
    .RN(net9),
    .CK(clknet_1_1__leaf_clk),
    .Q(net5),
    .QN(_16_));
 DFFR_X1 \count[3]$_DFF_PP0_  (.D(_02_),
    .RN(net9),
    .CK(clknet_1_1__leaf_clk),
    .Q(net6),
    .QN(_15_));
 CLKBUF_X1 hold7 (.A(reset),
    .Z(net7));
 CLKBUF_X1 hold8 (.A(net1),
    .Z(net8));
 CLKBUF_X1 hold9 (.A(_10_),
    .Z(net9));
 BUF_X1 input1 (.A(net7),
    .Z(net1));
 BUF_X1 input2 (.A(up_down),
    .Z(net2));
 BUF_X1 output3 (.A(net3),
    .Z(count[0]));
 BUF_X1 output4 (.A(net4),
    .Z(count[1]));
 BUF_X1 output5 (.A(net5),
    .Z(count[2]));
 BUF_X1 output6 (.A(net6),
    .Z(count[3]));
endmodule

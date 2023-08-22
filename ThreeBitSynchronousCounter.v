module Synchronous_UpDownCounter(q,m,clk,clr);
input m,clk,clr;
output [2:0] q;
wire [2:0] qbar;
wire w1,w2,w3,w4,w5,w6,mbar;
not (mbar,m);
T_FF ff1(1,clk,clr,q[0],qbar[0]);
and (w1,q[0],mbar);
and (w2,qbar[0],m);
or (w3,w1,w2);
T_FF ff2(w3,clk,clr,q[1],qbar[1]);
and (w4,w1,q[1]);
and (w5,w2,qbar[1]);
or (w6,w4,w5);
T_FF ff3(w6,clk,clr,q[2],qbar[2]);
endmodule 

module SequentialCounter(j,k,clk,clr,q,qbar);
input [3:0] j,k;
input clk,clr;
output [3:0] q,qbar;
JKFF f0(q[0],qbar[0],q[1],qbar[1],clk,clr);
JKFF f1(q[1],qbar[1],q[2],qbar[2],clk,clr);
JKFF f2(q[2],qbar[2],q[3],qbar[3],clk,clr);
JKFF f3(q[3],qbar[3],qbar[0],q[0],clk,clr);
endmodule 

/* Sequence: 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000 */
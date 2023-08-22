module cs(m,q,qbar,y);
input m,q,qbar;
output y;
wire mbar,w1,w2;

not (mbar,m);

and (w1,mbar,q);
and (w2,m,qbar);
or (y,w1,w2);
endmodule

module JKFF(q,qb,j,k,clk,clr);
input j,k,clk,clr;
output q,qb;
wire w1,w2,m,mb,w3,w4,clkb;

nand (w1,j,clk,qb,clr);
nand(w2,k,clk,q);
nand(m,w1,mb);
nand(mb,w2,m,clr);

not(clkb,clk);

nand(w3,m,clkb);
nand(w4,mb,clkb);
nand(q,w3,qb);
nand(qb,w4,q,clr);
endmodule

/*
Initially set clr = 0
after first run set clr = 1
*/

module UpDownCounter(m,clk,j,k,q);
input m,clk,j,k;
output [3:0] q;
wire [3:0] qbar;
wire clr,w1,w2,w3;
JKFF f1(q[0],qbar[0],j,k,clk,clr);
cs c1(m,q[0],qbar[0],w1);
JKFF f2(q[1],qbar[1],j,k,w1,clr);
cs c2(m,q[1],qbar[1],w2);
JKFF f3(q[2],qbar[2],j,k,w2,clr);
cs c3(m,q[2],qbar[2],w3);
JKFF f4(q[3],qbar[3],j,k,w3,clr);
endmodule 
module testCS;
reg m,q,qbar;
wire y;
cs c(m,q,qbar,y);
initial 
begin
#5 m = 0; q = 0; qbar = 0;
#100 m = 0; q = 0; qbar = 1;
#100 m = 0; q = 1; qbar = 0;
#100 m = 0; q = 1; qbar = 1;
#100 m = 1; q = 0; qbar = 0;
#100 m = 1; q = 0; qbar = 1;
#100 m = 1; q = 1; qbar = 0;
#100 m = 1; q = 1; qbar = 1;
end
endmodule 


module T_FF(t,clk,clr,q,qbar);
input t,clk,clr;
output q,qbar;
JKFF tff(q,qbar,t,t,clk,clr);
endmodule

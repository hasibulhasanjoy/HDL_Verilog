module Excess3ToBcd(a,b);

input [3:0] a;
output [3:0] b;

assign b[3] = (a[3] & a[2]) | (a[3] & a[1] & a[0]);
assign b[2] = (~a[2] & a[1]) | (~a[2] & ~a[0]) | (a[2] & a[1] & a[0]);
assign b[1] = a[1] ^ a[0];
assign b[0] = ~a[0];
endmodule 

//////////////////////////////////////////////////////////////////

/* simulation */
module simulateXs3ToBCD;
reg [3:0] a;
wire [3:0] b;

Excess3ToBcd xs(a , b);

initial 
begin
    #0
    a = 4'b0010;

    #100
    a = 4'b0100;

    #100
    a = 4'b0101;

    #100
    a = 4'b0110;

    #100
    a = 4'b0111;

    #100
    a = 4'b1000;
end
endmodule


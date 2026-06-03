`timescale 1ns/1ps

module rca_4bit_tb;

reg [3:0] a;
reg [3:0] b;
reg c;
wire [3:0] sum;
wire carry;

rca_4bit uut(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .carry(carry)
);

initial begin

    $dumpfile("rca_4bit.vcd");
    $dumpvars(0,rca_4bit_tb);

    $monitor("Time=%0t,c=%b,a=%b,b=%b,sum=%b,carry=%b",$time,c,a,b,sum,carry);

    a=4'b1001; b=4'b1110; c=1; #10;
    a=4'b1011; b=4'b1100; c=0; #10;
    a=4'b0001; b=4'b1110; c=0; #10;
    a=4'b1001; b=4'b0110; c=1; #10;
    a=4'b1111; b=4'b0010; c=1; #10;
    a=4'b1011; b=4'b1010; c=1; #10;
    a=4'b1111; b=4'b1110; c=0; #10;
    a=4'b1001; b=4'b1110; c=0; #10;
    a=4'b1000; b=4'b0001; c=0; #10;
    a=4'b1010; b=4'b1010; c=0; #10;

    $finish;

end
endmodule
`timescale 1ns/1ps

module rca_16bit_tb;

reg [15:0] a;
reg [15:0] b;
reg c_in;
wire [15:0] sum;
wire c_out;

rca_16bit uut(
    .a(a),
    .b(b),
    .c_in(c_in),
    .sum(sum),
    .c_out(c_out)
);

initial begin

    $dumpfile("rca_16bit.vcd");
    $dumpvars(0,rca_16bit_tb);

    $monitor("Time=%t,a=%h,b=%h,c_in=%h,sum=%h,c_out=%h",$time,a,b,c_in,sum,c_out);

    a=16'h0001; b=16'h1010; c_in=1; #10;
    a=16'h0110; b=16'h101A; c_in=0; #10;
    a=16'h000A; b=16'h0001; c_in=0; #10;
    a=16'h1000; b=16'h1010; c_in=1; #10;
    a=16'h0FFA; b=16'h1111; c_in=1; #10;
    a=16'hACDC; b=16'hAFFB; c_in=1; #10;

    $finish;

end
endmodule
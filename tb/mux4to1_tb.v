`timescale 1ns/1ps

module mux4to1_tb;

reg a;
reg b;
reg c;
reg d;
reg [1:0] s;
wire y;

mux4to1 uut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s(s),
    .y(y)
);

initial begin

    $dumpfile("mux4to1.vcd");
    $dumpvars(0,mux4to1_tb);

    $monitor("Time=%0t,a=%b,b=%b,c=%b,d=%b,s=%b,y=%b",$time,a,b,c,d,s,y);

    a=1; b=0; c=0; d=0; s=2'b00; #10;
    a=0; b=1; c=0; d=0; s=2'b01; #10;
    a=0; b=0; c=1; d=0; s=2'b10; #10;
    a=0; b=0; c=0; d=1; s=2'b11; #10;
    a=1; b=1; c=1; d=1; s=2'b00; #10;
    a=1; b=1; c=1; d=1; s=2'b01; #10;
    a=1; b=1; c=1; d=1; s=2'b10; #10;
    a=1; b=1; c=1; d=1; s=2'b11; #10;
    a=0; b=0; c=0; d=0; s=2'b00; #10;
    a=0; b=0; c=0; d=0; s=2'b11; #10;

    $finish;

end
endmodule
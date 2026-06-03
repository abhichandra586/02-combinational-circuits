`timescale 1ns/1ps

module full_sub_tb;

reg a;
reg b;
reg b_in;
wire diff;
wire bor;

full_sub uut(
    .a(a),
    .b(b),
    .b_in(b_in),
    .diff(diff),
    .bor(bor)
);

initial begin

    $dumpfile("full_sub.vcd");
    $dumpvars(0,full_sub_tb);

    $monitor("Time=%0t,a=%b,b=%b,b_in=%b,diff=%b,bor=%b",$time,a,b,b_in,diff,bor);

    a=0; b=0; b_in=0; #10;
    a=0; b=0; b_in=1; #10;
    a=0; b=1; b_in=0; #10;
    a=0; b=1; b_in=1; #10;
    a=1; b=0; b_in=0; #10;
    a=1; b=0; b_in=1; #10;
    a=1; b=1; b_in=0; #10;
    a=1; b=1; b_in=1; #10;

    $finish;

end
endmodule
`timescale 1ns/1ps

module half_sub_tb;

reg a;
reg b;
wire diff;
wire bor;

half_sub uut(
    .a(a),
    .b(b),
    .diff(diff),
    .bor(bor)
);

initial begin

    $dumpfile("half_sub.vcd");
    $dumpvars(0,half_sub_tb);

    $monitor("Time=%0t,a=%b,b=%b,diff=%b,bor=%b",$time,a,b,diff,bor);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;

end
endmodule
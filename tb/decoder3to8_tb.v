`timescale 1ns/1ps

module decoder3to8_tb;

reg a;
reg b;
reg c;
wire [7:0] y;

decoder3to8 uut(
    .a(a),
    .b(b),
    .c(c),
    .y(y)
);

initial begin

    $dumpfile("decoder3to8.vcd");
    $dumpvars(0,decoder3to8_tb);

    $monitor("Time=%0t,a=%b,b=%b,c=%b,y=%b",$time,a,b,c,y);

    a=0; b=0; c=0; #10;
    a=0; b=0; c=1; #10;
    a=0; b=1; c=0; #10;
    a=0; b=1; c=1; #10;
    a=1; b=0; c=0; #10;
    a=1; b=0; c=1; #10;
    a=1; b=1; c=0; #10;
    a=1; b=1; c=1; #10;

    $finish;

end
endmodule
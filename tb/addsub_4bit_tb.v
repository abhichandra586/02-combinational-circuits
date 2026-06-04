`timescale 1ns/1ps

module addsub_4bit_tb;

reg [3:0] a;
reg [3:0] b;
reg m;

wire [3:0] sum;
wire c_out;
wire [4:0] result;

addsub_4bit uut(
    .a(a),
    .b(b),
    .m(m),
    .sum(sum),
    .c_out(c_out)
);

assign result= (m==0)?{c_out,sum}:sum;

initial begin

    $dumpfile("addsub_4bit.vcd");
    $dumpvars(0,addsub_4bit_tb);

    $monitor("Time=%0t,a=%d,b=%d,m=%b,result=%d",$time,a,b,m,result);

    a=4'd7; b=4'd3; m=0; #10;
    a=4'd2; b=4'd1; m=1; #10;
    a=4'd9; b=4'd11; m=0; #10;
    a=4'd15; b=4'd12; m=1; #10;
    a=4'd11; b=4'd3; m=1; #10;
    a=4'd7; b=4'd11; m=0; #10;
    a=4'd8; b=4'd13; m=0; #10;

    $finish;

end
endmodule
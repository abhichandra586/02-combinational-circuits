`timescale 1ns/1ps

module mux2to1_tb;

reg a;
reg b;
reg s;
wire y;

mux2to1 uut(
    .a(a),
    .b(b),
    .s(s),
    .y(y)
);

initial begin
    
    $dumpfile("mux2to1.vcd");
    $dumpvars(0,mux2to1_tb);

    $monitor("Time=%0t,a=%b,b=%b,s=%b,y=%b",$time,a,b,s,y);

    a=0; b=0; s=0; #10;
    a=0; b=1; s=0; #10;
    a=1; b=0; s=0; #10;
    a=1; b=1; s=0; #10;
    a=0; b=0; s=1; #10;
    a=0; b=1; s=1; #10;
    a=1; b=0; s=1; #10;
    a=1; b=1; s=1; #10;

    $finish;

end
endmodule
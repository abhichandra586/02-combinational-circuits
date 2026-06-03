`timescale 1ns/1ps

module full_adder_tb;

reg a,b,c;
wire sum,carry;

full_adder uut(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .carry(carry)
);

initial begin

    $dumpfile("full_adder.vcd");
    $dumpvars(0,full_adder_tb);

    $monitor("Time=%0t,a=%b,b=%b,c=%b,sum=%b,carry=%b",$time,a,b,c,sum,carry);

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
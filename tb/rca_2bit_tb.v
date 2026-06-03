`timescale 1ns/1ps

module rca_2bit_tb;

reg [1:0] a,b;
reg c;
wire [1:0] sum;
wire carry;

rca_2bit uut(
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .carry(carry)
);

initial begin

    $dumpfile("rca_2bit.vcd");
    $dumpvars(0,rca_2bit_tb);

    $monitor("Time=%0t,c=%b,a=%b,b=%b,sum=%b,carry=%b",$time,c,a,b,sum,carry);

    c=1'b0; a=2'b00; b=2'b00; #10;
    c=1'b0; a=2'b00; b=2'b01; #10;
    c=1'b0; a=2'b00; b=2'b10; #10;
    c=1'b0; a=2'b00; b=2'b11; #10;
    c=1'b0; a=2'b01; b=2'b00; #10;
    c=1'b0; a=2'b01; b=2'b01; #10;
    c=1'b0; a=2'b01; b=2'b10; #10;
    c=1'b0; a=2'b01; b=2'b11; #10;
    c=1'b0; a=2'b10; b=2'b00; #10;
    c=1'b0; a=2'b10; b=2'b01; #10;
    c=1'b0; a=2'b10; b=2'b10; #10;
    c=1'b0; a=2'b10; b=2'b11; #10;
    c=1'b0; a=2'b11; b=2'b00; #10;
    c=1'b0; a=2'b11; b=2'b01; #10;
    c=1'b0; a=2'b11; b=2'b10; #10;
    c=1'b0; a=2'b11; b=2'b11; #10;

    c=1'b1; a=2'b00; b=2'b00; #10;
    c=1'b1; a=2'b00; b=2'b01; #10;
    c=1'b1; a=2'b00; b=2'b10; #10;
    c=1'b1; a=2'b00; b=2'b11; #10;
    c=1'b1; a=2'b01; b=2'b00; #10;
    c=1'b1; a=2'b01; b=2'b01; #10;
    c=1'b1; a=2'b01; b=2'b10; #10;
    c=1'b1; a=2'b01; b=2'b11; #10;
    c=1'b1; a=2'b10; b=2'b00; #10;
    c=1'b1; a=2'b10; b=2'b01; #10;
    c=1'b1; a=2'b10; b=2'b10; #10;
    c=1'b1; a=2'b10; b=2'b11; #10;
    c=1'b1; a=2'b11; b=2'b00; #10;
    c=1'b1; a=2'b11; b=2'b01; #10;
    c=1'b1; a=2'b11; b=2'b10; #10;
    c=1'b1; a=2'b11; b=2'b11; #10;

    $finish;

end
endmodule
module rca_2bit(
    input wire [1:0] a,
    input wire [1:0] b,
    input wire c,
    output wire [1:0] sum,
    output wire carry
);
wire c1;

full_adder FA0(
    .a(a[0]),
    .b(b[0]),
    .c(c),
    .sum(sum[0]),
    .carry(c1)
);

full_adder FA1(
    .a(a[1]),
    .b(b[1]),
    .c(c1),
    .sum(sum[1]),
    .carry(carry)
);

endmodule
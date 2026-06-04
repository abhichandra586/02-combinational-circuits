module addsub_4bit(
    input wire [3:0] a,
    input wire [3:0] b,
    input wire m,
    output wire [3:0] sum,
    output wire c_out
);

wire c1;
wire c2;
wire c3;

wire [3:0] bxor;
assign bxor=b^{4{m}};

full_adder addsub0(
    .a(a[0]),
    .b(bxor[0]),
    .c(m),
    .sum(sum[0]),
    .carry(c1)
);

full_adder addsub1(
    .a(a[1]),
    .b(bxor[1]),
    .c(c1),
    .sum(sum[1]),
    .carry(c2)
);

full_adder addsub2(
    .a(a[2]),
    .b(bxor[2]),
    .c(c2),
    .sum(sum[2]),
    .carry(c3)
);

full_adder addsub3(
    .a(a[3]),
    .b(bxor[3]),
    .c(c3),
    .sum(sum[3]),
    .carry(c_out)
);
endmodule
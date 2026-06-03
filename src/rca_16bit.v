module rca_16bit(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire c_in,
    output wire [15:0] sum,
    output wire c_out
);

wire [16:0] c;

assign c[0]=c_in;
assign c_out=c[16];

genvar i;

generate
    for(i=0;i<16;i=i+1)
    begin: RCA_STAGE

    full_adder FA(
        .a(a[i]),
        .b(b[i]),
        .c(c[i]),
        .sum(sum[i]),
        .carry(c[i+1])
    );

    end

endgenerate

endmodule
module addsub_16bit(
    input wire [15:0] a,
    input wire [15:0] b,
    input wire m,
    output wire [15:0] sum,
    output wire c_out
);

wire [16:0] c;
assign c[0]=m;

wire [15:0] bxor;
assign bxor=b^({16{m}});

genvar i;
generate
    for(i=0;i<16;i=i+1)
    begin: addsub_loop
    full_adder addsub_inst(
        .a(a[i]),
        .b(bxor[i]),
        .c(c[i]),
        .sum(sum[i]),
        .carry(c[i+1])
    );
    end
endgenerate

assign c_out=c[16];
endmodule
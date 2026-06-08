module comparator_16bit(
    input wire [15:0] a,
    input wire [15:0] b,
    output wire eq,
    output wire gt,
    output wire lt
);

assign eq=(a==b);
assign gt=(a>b);
assign lt=(a<b);

endmodule
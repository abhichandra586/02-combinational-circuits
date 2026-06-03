module half_sub(
    input wire a,
    input wire b,
    output wire diff,
    output wire bor
);
assign diff=a^b;
assign bor=((~(a))&b);
endmodule
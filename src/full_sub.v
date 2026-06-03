module full_sub(
    input wire a,
    input wire b,
    input wire b_in,
    output wire diff,
    output wire bor
);
assign diff=a^b^b_in;
assign bor=((~a)&b)|(b&b_in)|(b_in&(~a));
endmodule
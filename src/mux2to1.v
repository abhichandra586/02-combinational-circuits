module mux2to1(
    input wire a,
    input wire b,
    input wire s,
    output wire y
);

assign y=(s==0)?a:b;

endmodule
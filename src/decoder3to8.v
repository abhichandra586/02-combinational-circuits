module decoder3to8(
    input wire a,
    input wire b,
    input wire c,
    output wire [7:0] y
);

assign y=8'b00000001 << {a,b,c};

endmodule
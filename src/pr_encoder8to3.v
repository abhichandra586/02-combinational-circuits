module pr_encoder8to3(
    input wire [7:0] a,
    output reg [2:0] b,
    output reg valid
);

always @(*) begin
    valid=|a;
    casez(a)
    8'b1???????: b=7;
    8'b01??????: b=6;
    8'b001?????: b=5;
    8'b0001????: b=4;
    8'b00001???: b=3;
    8'b000001??: b=2;
    8'b0000001?: b=1;
    8'b00000001: b=0;
    default: b=0;

    endcase

end
endmodule
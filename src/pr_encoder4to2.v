module pr_encoder4to2(
    input wire [3:0] a,
    output reg [1:0] b,
    output reg valid
);

always @(*) begin
    if(a[3]) begin b=2'b11; valid=1; end
    else if(a[2]) begin b=2'b10; valid=1; end
    else if(a[1]) begin b=2'b01; valid=1; end
    else if(a[0]) begin b=2'b00; valid=1; end
    else begin b=2'b00; valid=0; end
end

endmodule
module encoder8to3(
    input wire [7:0] a,
    output wire [2:0] y
);

assign y[0]=a[1]|a[3]|a[5]|a[7];
assign y[1]=a[2]|a[3]|a[6]|a[7];
assign y[2]=a[4]|a[5]|a[6]|a[7];

endmodule
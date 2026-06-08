`timescale 1ns/1ps

module pr_encoder4to2_tb;

reg [3:0] a;
wire [1:0] b;
wire valid;

pr_encoder4to2 uut(
    .a(a),
    .b(b),
    .valid(valid)
);

initial begin


    $dumpfile("pr_encoder4to2.vcd");
    $dumpvars(0,pr_encoder4to2_tb);

    $monitor("Time=%0t,a=%b,b=%b,valid=%b",$time,a,b,valid);

    a=4'b0001; #10;
    a=4'b0010; #10;
    a=4'b0100; #10;
    a=4'b1000; #10;
    a=4'b0000; #10;
    a=4'b1110; #10;
    a=4'b0100; #10;
    a=4'b0110; #10;
    a=4'b0011; #10;

    $finish;

end
endmodule
`timescale 1ns/1ps

module encoder8to3_tb;

reg [7:0] a;
wire [2:0] y;

encoder8to3 uut(
    .a(a),
    .y(y)
);

initial begin

    $dumpfile("encoder8to3.vcd");
    $dumpvars(0,encoder8to3_tb);

    $monitor("Time=%0t,a=%b,y=%b",$time,a,y);

    a=8'b00000001; #10;
    a=8'b00000010; #10;
    a=8'b00000100; #10;
    a=8'b00001000; #10;
    a=8'b00010000; #10;
    a=8'b00100000; #10;
    a=8'b01000000; #10;
    a=8'b10000000; #10;

    $finish;

end
endmodule
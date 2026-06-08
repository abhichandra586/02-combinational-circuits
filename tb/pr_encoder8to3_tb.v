`timescale 1ns/1ps

module pr_encoder8to3_tb;

reg [7:0] a;
wire [2:0] b;
wire valid;

pr_encoder8to3 uut(
    .a(a),
    .b(b),
    .valid(valid)
);

initial begin

    $dumpfile("pr_encoder8to3.vcd");
    $dumpvars(0,pr_encoder8to3_tb);

    $monitor("Time=%0t,a=%b,b=%b,valid=%b",$time,a,b,valid);

    a=8'b00000001; #10; 
    a=8'b00000010; #10; 
    a=8'b00000100; #10; 
    a=8'b00001000; #10; 
    a=8'b00010000; #10; 
    a=8'b00100000; #10; 
    a=8'b01000000; #10; 
    a=8'b10000000; #10; 
    a=8'b10000001; #10; 
    a=8'b11110000; #10; 
    a=8'b11111111; #10; 
    a=8'b00000000; #10;

    $finish;

end
endmodule
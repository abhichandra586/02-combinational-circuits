`timescale 1ns/1ps

module comparator_16bit_tb;

reg [15:0] a;
reg [15:0] b;
wire eq;
wire gt;
wire lt;

comparator_16bit uut(
    .a(a),
    .b(b),
    .eq(eq),
    .gt(gt),
    .lt(lt)
);

initial begin
    
    $dumpfile("comparator_16bit.vcd");
    $dumpvars(0,comparator_16bit_tb);

    $monitor("Time=%0t,a=%d,b=%d,eq=%b,gt=%b,lt=%b",$time,a,b,eq,gt,lt);

    a=16'd0;     b=16'd0;     #10; 
    a=16'd100;   b=16'd100;   #10; 
    a=16'd200;   b=16'd100;   #10; 
    a=16'd100;   b=16'd200;   #10; 
    a=16'd65535; b=16'd0;     #10; 
    a=16'd0;     b=16'd65535; #10; 
    a=16'd65535; b=16'd65535; #10; 
    a=16'd1000;  b=16'd999;   #10; 
    a=16'd999;   b=16'd1000;  #10; 
    a=16'hABCD;  b=16'hABCD;  #10;

    $finish;

end
endmodule
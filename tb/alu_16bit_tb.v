`timescale 1ns/1ps

module alu_16bit_tb; 

reg [15:0] a,b; 
reg [3:0]  alu_op; 
wire [15:0] result; 
wire carry_out,zero,negative,overflow; 

alu_16bit uut( 
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result),
    .carry_out(carry_out),
    .zero(zero),
    .negative(negative),
    .overflow(overflow)
);


initial begin 
    
    $dumpfile("alu_16bit.vcd"); 
    $dumpvars(0,alu_16bit_tb); 
 
    $monitor("Time=%0t op=%b a=%d b=%d result=%d carry=%b zero=%b neg=%b ov=%b",$time,alu_op,a,b,result,carry_out,zero,negative,overflow); 
 
    $display("--- ADD Tests ---"); 
    a=16'd100;   b=16'd200;   alu_op=4'b0000; #10; 
    a=16'd65535; b=16'd1;     alu_op=4'b0000; #10; 
    a=16'h7FFF;  b=16'd1;     alu_op=4'b0000; #10; 
 
    $display("--- SUB Tests ---"); 
    a=16'd500;   b=16'd300;   alu_op=4'b0001; #10; 
    a=16'd300;   b=16'd500;   alu_op=4'b0001; #10; 
    a=16'd100;   b=16'd100;   alu_op=4'b0001; #10; 
 
    $display("--- Logic Tests ---"); 
    a=16'hFF00;  b=16'h0FF0;  alu_op=4'b0010; #10; 
    a=16'hFF00;  b=16'h0FF0;  alu_op=4'b0011; #10; 
    a=16'hFFFF;  b=16'hFFFF;  alu_op=4'b0100; #10; 
    a=16'h00FF;  b=16'd0;     alu_op=4'b0101; #10; 
 
    $display("--- Shift Tests ---"); 
    a=16'h00FF;  b=16'd4;     alu_op=4'b0110; #10; 
    a=16'hFF00;  b=16'd4;     alu_op=4'b0111; #10; 
    a=16'h8000;  b=16'd1;     alu_op=4'b1000; #10; 
 
    $display("--- Zero Flag Tests ---"); 
    a=16'd0;     b=16'd0;     alu_op=4'b0000; #10; 
    a=16'd100;   b=16'd100;   alu_op=4'b0001; #10; 
 
    $display("--- PASS Test ---"); 
    a=16'hBEEF;  b=16'd0;     alu_op=4'b1001; #10; 
 
    $finish; 
 
end 
endmodule
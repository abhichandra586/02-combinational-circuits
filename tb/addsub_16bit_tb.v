`timescale 1ns/1ps

module addsub_16bit_tb;

reg [15:0] a;
reg [15:0] b;
reg m;
wire [15:0] sum;
wire c_out;
wire [16:0] result;

wire signed [17:0] display_result;

addsub_16bit uut(
    .a(a),
    .b(b),
    .m(m),
    .sum(sum),
    .c_out(c_out)
);

assign result=(m==0)?{c_out,sum}:{1'b0,sum};
assign display_result=(m==0)?$signed({1'b0,c_out,sum}):$signed({{2{sum[15]}},sum});

initial begin

    $dumpfile("addsub_16bit.vcd");
    $dumpvars(0,addsub_16bit_tb);

    $monitor("Time=%0t,m=%b,a=%d,b=%d,result=%d",$time,m,a,b,display_result);

    a=16'd7; b=16'd3; m=0; #10;
    a=16'd2; b=16'd1; m=1; #10;
    a=16'd1000; b=16'd500; m=0; #10;
    a=16'd1000; b=16'd500; m=1; #10;
    a=16'd300; b=16'd700; m=1; #10;
    a=16'd65535; b=16'd1; m=0; #10;
    a=16'd65535; b=16'd65535; m=1; #10;
    a=16'd0; b=16'd0; m=0; #10;
    a=16'd0; b=16'd1; m=1; #10;
    a=16'd5000; b=16'd3000; m=1; #10;

    $finish;

end
endmodule
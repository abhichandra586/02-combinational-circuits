module alu_16bit( 
    input wire [15:0] a, 
    input wire [15:0] b, 
    input wire [3:0]  alu_op, 
    output reg [15:0] result, 
    output reg        carry_out, 
    output wire       zero, 
    output wire       negative, 
    output reg        overflow 
); 
 
wire [15:0] addsub_result; 
wire        addsub_carry; 
wire [3:0]  shift_amt; 
 
assign shift_amt = b[3:0]; 
 
addsub_16bit addsub_inst( 
    .a(a), 
    .b(b), 
    .m(alu_op[0]), 
    .sum(addsub_result), 
    .c_out(addsub_carry) 
); 
 
always @(*) begin 
    carry_out = 1'b0; 
    overflow  = 1'b0; 
    case(alu_op) 
        4'b0000: begin 
            result    = addsub_result; 
            carry_out = addsub_carry; 
            overflow  = (~a[15] & ~b[15] & result[15]) | 
                        ( a[15] &  b[15] & ~result[15]); 
        end 
        4'b0001: begin 
            result    = addsub_result; 
            carry_out = addsub_carry; 
            overflow  = ( a[15] & ~b[15] & ~result[15]) | 
                        (~a[15] &  b[15] &  result[15]); 
        end 
        4'b0010: result = a & b; 
        4'b0011: result = a | b; 
        4'b0100: result = a ^ b; 
        4'b0101: result = ~a; 
        4'b0110: result = a << shift_amt; 
        4'b0111: result = a >> shift_amt; 
        4'b1000: result = $signed(a) >>> shift_amt; 
        4'b1001: result = a; 
        default: result = 16'bx; 
    endcase 
end 
 
assign zero     = (result == 16'b0); 
assign negative = result[15]; 
 
endmodule
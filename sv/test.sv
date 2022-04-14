// module top (
//     input wire [1:0] a,
//     input b,
//     input clk,
//     output wire [1:0] c
// );
//     bit [1:0] e = 3;
//     always @(posedge clk) begin
//         c = a;
//         if (b) begin
//             c = 0;
//         end
//     end
// endmodule

// This case will create 2 `$dff`s, but actually `Y` is inverse of `st`
// thus in fact one `$dff` is enough
module top (
    input r,
    input clk,
    output c
);
    bit st;
    bit Y;
    assign c = Y & st;
    always @(posedge clk) begin
        if (r) begin
            st = 0;
        end else begin
            case (st)
                0: st = 1;
                1: st = 0;
            endcase
        end
        case(st)
            0: Y = 1;
            1: Y = 0;
        endcase
    end
endmodule
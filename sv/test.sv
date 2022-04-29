// module top;
//     input bit a;
//     input bit b;
//     input bit clk;
//     output bit c;
//     always @(posedge clk, posedge a) begin
//         // c = 0;
//         if (a) begin
//             c = 0;
//         end else begin
//             c = b;
//         end
//     end
// endmodule

// This case will create 2 `$dff`s, but actually `Y` is inverse of `st`
// thus in fact one `$dff` is enough
// module top (
//     input r,
//     input clk,
//     output c
// );
//     bit st;
//     bit Y;
//     assign c = Y & st;
//     always @(posedge clk) begin
//         if (r) begin
//             st = 0;
//         end else begin
//             case (st)
//                 0: st = 1;
//                 1: st = 0;
//             endcase
//         end
//         case(st)
//             0: Y = 1;
//             1: Y = 0;
//         endcase
//     end
// endmodule

module top (
    input A,
    input B,
    input clk,
    output Q
);
    always @(posedge clk or posedge A) begin
        Q = B;
        if(A) begin
            Q = 0;
        end
    end
endmodule
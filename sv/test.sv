// module top;
//     bit [0:1]a;
//     bit [0:1]b;
//     bit clk;
//     bit c;
//     always @(posedge clk) begin
//         if (b == 2) begin
//             c = 0;
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

// module top (
//     input A,
//     input B,
//     input c,
//     input R1,
//     input R2,
//     output Q
// );
//     always @(posedge R1 or posedge R2 or posedge c) begin
//         Q = A + B;
//         if(R2) begin
//             Q = 0;
//         end else if(R1) begin
//             Q = 0;
//         end
//     end
// endmodule
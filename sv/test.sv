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
    input C,
    input [1:0]D,
    input clk,
    output [1:0]Q,
    output P
);
    always @(posedge clk or posedge A or posedge C or posedge B) begin
        if(A) begin
            Q = 2;
        end else if (B) begin
            Q = 1;
        end else if (C) begin
            Q = 0;
        end else begin
            Q = D;
        end
    end
endmodule

// module top (
//     input A,
//     input B,
//     input C,
//     input D,
//     input clk,
//     output Q,
//     output P
// );
//     always @(posedge A) begin
//         if(A) begin
//             Q = D;
//         end else begin
//             Q = D;
//         end
//     end
// endmodule

// module top (
//     input A,
//     input B,
//     input C,
//     input D,
//     input clk,
//     output Q,
//     output P
// );
//     always @(posedge clk or posedge A or posedge B) begin
//         if(A) begin
//             Q = 0;
//         end else if (B) begin
//             Q = 1;
//         end else begin
//             Q = D;
//         end
//     end
// endmodule
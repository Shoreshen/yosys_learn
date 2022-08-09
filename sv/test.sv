module top (
    input wire d1,
    input wire d2,
    input wire cr1,
    input wire cr2,
    output wire tmp,
    output wire tt
);

    always @(*) begin
        if (cr1)
            tmp = wr1;
        else if (cr2)
            tmp = wr1;
        else
            tmp = wr2;
    end

    assign tt = wr1 & wr2;

endmodule

// module top (
//     input a_in, b_in, c_in, d_in,
//     input [1:0] sel,
//     output d_out
// );
//     always @* begin
//         case (sel)
//             2'b00 : d_out = a_in;
//             2'b01 : d_out = b_in;
//             2'b10 : d_out = c_in;
//             2'b11 : d_out = d_in;
//         endcase
//     end
// endmodule
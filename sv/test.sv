module top (
    input wire clk,
    input [3:0] data,
    output [3:0] dout
);
    bit breaksig;
    always @(posedge clk) begin
        breaksig = 0;
        for (integer i = 0; i < 4; i = i + 1) begin
            if (breaksig == 0) begin
                if (i > 1) begin
                end else begin
                    dout[i] <= data[i];
                end
            end
            if (i > 1) begin
                breaksig = 1;
            end
        end
    end
    
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
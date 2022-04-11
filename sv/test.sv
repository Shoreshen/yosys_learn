module top (
    input a,
    input b,
    input clk,
    output c
);
    bit e = 3;
    always @(posedge clk) begin
        e = b + e;
        c <= a + e;
    end
endmodule
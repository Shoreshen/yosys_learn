module top (
    output [9:0] Q
);
    bot bo(Q);
endmodule

module bot(
    inout [9:0] Q
);
    assign Q = 7;
endmodule
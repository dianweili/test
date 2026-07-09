interface PD_CTRL_IF ();

    wire mtcmos_ctrl;
    wire iso_en;
    wire mtcmos_rdy;

    modport mst (
        output   mtcmos_ctrl,
        output   iso_en,
        input    mtcmos_rdy
    );

    modport slv (
        input    mtcmos_ctrl,
        input    iso_en,
        output   mtcmos_rdy
    );

endinterface

module TOP (
    PD_CTRL_IF.slv   A_PD,
    PD_CTRL_IF.slv   B_PD
);

    PD_CTRL_IF   B_PD_IN();

    assign B_PD_IN.mtcmos_ctrl = A_PD.mtcmos_ctrl;
    assign B_PD_IN.iso_en      = A_PD.iso_en;
    assign B_PD.mtcmos_rdy     = A_PD.mtcmos_ctrl;

    A U_A (
        .A_PD   (A_PD)
    );

    B U_B (
        .B_PD   (B_PD_IN)
    );

endmodule

module A (
    PD_CTRL_IF.slv   A_PD
);

assign A_PD.mtcmos_rdy = A_PD.mtcmos_ctrl;

endmodule

module B (
    PD_CTRL_IF.slv   B_PD
);

assign B_PD.mtcmos_rdy = B_PD.mtcmos_ctrl;

endmodule
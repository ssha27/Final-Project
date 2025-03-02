module systolic_array(
  input [7:0] inp_west0, inp_west4, inp_west8, inp_west12, 
  input [7:0] inp_north0, inp_north1, inp_north2, inp_north3, 
  input clk, 
  input rst, 
  output [15:0] out00, out01, out02, out03, 
  output [15:0] out04, out05, out06, out07, 
  output [15:0] out08, out09, out10, out11, 
  output [15:0] out12, out13, out14, out15, 
  output reg done
);

  // Intermediate wires between PE modules

  // Row 0 wires
  wire [7:0] s0_0, s0_1, s0_2, s0_3;
  wire [7:0] e0_0, e0_1, e0_2, e0_3;
  wire [15:0] r0_0, r0_1, r0_2, r0_3;
  
  // Row 1 wires
  wire [7:0] s1_0, s1_1, s1_2, s1_3;
  wire [7:0] e1_0, e1_1, e1_2, e1_3;
  wire [15:0] r1_0, r1_1, r1_2, r1_3;
  
  // Row 2 wires
  wire [7:0] s2_0, s2_1, s2_2, s2_3;
  wire [7:0] e2_0, e2_1, e2_2, e2_3;
  wire [15:0] r2_0, r2_1, r2_2, r2_3;
  
  // Row 3 wires
  wire [7:0] s3_0, s3_1, s3_2, s3_3;
  wire [7:0] e3_0, e3_1, e3_2, e3_3;
  wire [15:0] r3_0, r3_1, r3_2, r3_3;

  // Instantiate PEs row by row
  // Defined as PExy; x = row, y = column

  // Row 0
  PE pe00 (
    .inp_north(inp_north0),
    .inp_west(inp_west0),
    .clk(clk),
    .rst(rst),
    .outp_south(s0_0),
    .outp_east(e0_0),
    .result(r0_0)
  );

  PE pe01 (
    .inp_north(inp_north1),
    .inp_west(e0_0),      // from pe00
    .clk(clk),
    .rst(rst),
    .outp_south(s0_1),
    .outp_east(e0_1),
    .result(r0_1)
  );

  PE pe02 (
    .inp_north(inp_north2),
    .inp_west(e0_1),      // from pe01
    .clk(clk),
    .rst(rst),
    .outp_south(s0_2),
    .outp_east(e0_2),
    .result(r0_2)
  );

  PE pe03 (
    .inp_north(inp_north3),
    .inp_west(e0_2),      // from pe02
    .clk(clk),
    .rst(rst),
    .outp_south(s0_3),
    .outp_east(e0_3),
    .result(r0_3)
  );

  // Row 1
  PE pe10 (
    .inp_north(s0_0),     // from pe00's south output
    .inp_west(inp_west4),
    .clk(clk),
    .rst(rst),
    .outp_south(s1_0),
    .outp_east(e1_0),
    .result(r1_0)
  );

  PE pe11 (
    .inp_north(s0_1),     // from pe01's south output
    .inp_west(e1_0),      // from pe10
    .clk(clk),
    .rst(rst),
    .outp_south(s1_1),
    .outp_east(e1_1),
    .result(r1_1)
  );

  PE pe12 (
    .inp_north(s0_2),     // from pe02's south output
    .inp_west(e1_1),      // from pe11
    .clk(clk),
    .rst(rst),
    .outp_south(s1_2),
    .outp_east(e1_2),
    .result(r1_2)
  );

  PE pe13 (
    .inp_north(s0_3),     // from pe03's south output
    .inp_west(e1_2),      // from pe12
    .clk(clk),
    .rst(rst),
    .outp_south(s1_3),
    .outp_east(e1_3),
    .result(r1_3)
  );

  // Row 2
  PE pe20 (
    .inp_north(s1_0),     // from pe10's south output
    .inp_west(inp_west8),
    .clk(clk),
    .rst(rst),
    .outp_south(s2_0),
    .outp_east(e2_0),
    .result(r2_0)
  );

  PE pe21 (
    .inp_north(s1_1),     // from pe11's south output
    .inp_west(e2_0),      // from pe20
    .clk(clk),
    .rst(rst),
    .outp_south(s2_1),
    .outp_east(e2_1),
    .result(r2_1)
  );

  PE pe22 (
    .inp_north(s1_2),     // from pe12's south output
    .inp_west(e2_1),      // from pe21
    .clk(clk),
    .rst(rst),
    .outp_south(s2_2),
    .outp_east(e2_2),
    .result(r2_2)
  );

  PE pe23 (
    .inp_north(s1_3),     // from pe13's south output
    .inp_west(e2_2),      // from pe22
    .clk(clk),
    .rst(rst),
    .outp_south(s2_3),
    .outp_east(e2_3),
    .result(r2_3)
  );

  // Row 3
  PE pe30 (
    .inp_north(s2_0),     // from pe20's south output
    .inp_west(inp_west12),
    .clk(clk),
    .rst(rst),
    .outp_south(s3_0),
    .outp_east(e3_0),
    .result(r3_0)
  );

  PE pe31 (
    .inp_north(s2_1),     // from pe21's south output
    .inp_west(e3_0),      // from pe30
    .clk(clk),
    .rst(rst),
    .outp_south(s3_1),
    .outp_east(e3_1),
    .result(r3_1)
  );

  PE pe32 (
    .inp_north(s2_2),     // from pe22's south output
    .inp_west(e3_1),      // from pe31
    .clk(clk),
    .rst(rst),
    .outp_south(s3_2),
    .outp_east(e3_2),
    .result(r3_2)
  );

  PE pe33 (
    .inp_north(s2_3),     // from pe23's south output
    .inp_west(e3_2),      // from pe32
    .clk(clk),
    .rst(rst),
    .outp_south(s3_3),
    .outp_east(e3_3),
    .result(r3_3)
  );

  // Map PE results to outputs
  assign out00 = r0_0;
  assign out01 = r0_1;
  assign out02 = r0_2;
  assign out03 = r0_3;
  assign out04 = r1_0;
  assign out05 = r1_1;
  assign out06 = r1_2;
  assign out07 = r1_3;
  assign out08 = r2_0;
  assign out09 = r2_1;
  assign out10 = r2_2;
  assign out11 = r2_3;
  assign out12 = r3_0;
  assign out13 = r3_1;
  assign out14 = r3_2;
  assign out15 = r3_3;

  assign done = 1'b0;

endmodule

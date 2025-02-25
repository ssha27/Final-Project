module systolic_array(
  input [31:0]inp_west0, inp_west4, inp_west8, inp_west12,
  			 inp_north0, inp_north1, inp_north2, inp_north3,
  input clk, rst, 
  output [15:0] out00, out01,
    out02,
    out03,
    out04,
    out05,
    out06,
    out07,
    out08,
    out09,
    out10,
    out11,
    out12,
    out13,
    out14,
    out15,
  output done);

// Your design is here
  always @ (clk) begin
    PE pe1(inp_north[7:0], inp_west[7:0], clk, rst, outsouth1, outeast1, out00)
    PE pe2(inp_north[15:8], outeast1, clk, rst, outsouth2, outeast2, out00)
  end



endmodule
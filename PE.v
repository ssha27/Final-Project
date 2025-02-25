module PE(
  input [7:0] inp_north, inp_west,
  input clk, rst,
  output reg [7:0] outp_south, outp_east,
  output reg [15:0] result
);

  reg [15:0] internal;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      internal   <= 16'd0;
      outp_south <= 8'd0;
      outp_east  <= 8'd0;
      result     <= 16'd0;
    end else begin
      internal   <= internal + (inp_north * inp_west);
      outp_south <= inp_north;
      outp_east  <= inp_west;
      result     <= internal;
    end
  end

endmodule

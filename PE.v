module PE(
  input [7:0] inp_north, inp_west, 
  input clk, rst, 
  output [7:0] outp_south, outp_east, 
  output [15:0] result);
  
  reg [15:0] internal;
  
  assign internal = rst ? 0 : internal;
  
  always @ (clk) begin
    
  	internal += inp_north * inp_west;
    
    outp_south = inp_north;
    outp_east = inp_west;
    result = internal;
    
  end
  
endmodule
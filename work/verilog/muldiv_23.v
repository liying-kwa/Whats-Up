/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module muldiv_23 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] o,
    output reg [2:0] error,
    output reg overflow
  );
  
  
  
  reg [31:0] c;
  
  always @* begin
    o = 1'h0;
    error = 1'h0;
    overflow = 1'h0;
    
    case (alufn[0+0-:1])
      1'h0: begin
        c = $signed(a) * $signed(b);
        o = c[0+15-:16];
        if (a != 1'h0 && $signed(c) / $signed(a) != $signed(b)) begin
          overflow = 1'h1;
        end
      end
      1'h1: begin
        if (b == 1'h0) begin
          error = 3'h3;
        end else begin
          o = $signed(a) / $signed(b);
        end
      end
    endcase
  end
endmodule

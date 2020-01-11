/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module beta_3 (
    input easy_mode,
    input pressed,
    input rise,
    input sc_hold,
    input clk,
    input rst,
    output reg [15:0] high_score,
    output reg [3:0] mainSeg3_char,
    output reg [3:0] mainSeg2_char,
    output reg [3:0] mainSeg1_char,
    output reg [3:0] mainSeg0_char
  );
  
  
  
  wire [16-1:0] M_game_alu_f;
  wire [3-1:0] M_game_alu_error;
  wire [1-1:0] M_game_alu_overflow;
  reg [16-1:0] M_game_alu_a;
  reg [16-1:0] M_game_alu_b;
  reg [6-1:0] M_game_alu_alufn;
  alu_15 game_alu (
    .a(M_game_alu_a),
    .b(M_game_alu_b),
    .alufn(M_game_alu_alufn),
    .f(M_game_alu_f),
    .error(M_game_alu_error),
    .overflow(M_game_alu_overflow)
  );
  
  wire [6-1:0] M_game_cu_alufn;
  wire [2-1:0] M_game_cu_ra1sel;
  wire [4-1:0] M_game_cu_ra2sel;
  wire [1-1:0] M_game_cu_werf;
  wire [3-1:0] M_game_cu_wasel;
  wire [1-1:0] M_game_cu_restart;
  wire [1-1:0] M_game_cu_increment_old_counter;
  wire [1-1:0] M_game_cu_update_hs;
  wire [4-1:0] M_game_cu_mainSeg3_char;
  wire [4-1:0] M_game_cu_mainSeg2_char;
  wire [4-1:0] M_game_cu_mainSeg1_char;
  wire [4-1:0] M_game_cu_mainSeg0_char;
  reg [1-1:0] M_game_cu_pressed;
  reg [1-1:0] M_game_cu_rise;
  reg [1-1:0] M_game_cu_sc_hold;
  reg [16-1:0] M_game_cu_alu_output;
  reg [1-1:0] M_game_cu_easy_mode;
  reg [16-1:0] M_game_cu_current_counter;
  reg [16-1:0] M_game_cu_player_score;
  cu_16 game_cu (
    .clk(clk),
    .rst(rst),
    .pressed(M_game_cu_pressed),
    .rise(M_game_cu_rise),
    .sc_hold(M_game_cu_sc_hold),
    .alu_output(M_game_cu_alu_output),
    .easy_mode(M_game_cu_easy_mode),
    .current_counter(M_game_cu_current_counter),
    .player_score(M_game_cu_player_score),
    .alufn(M_game_cu_alufn),
    .ra1sel(M_game_cu_ra1sel),
    .ra2sel(M_game_cu_ra2sel),
    .werf(M_game_cu_werf),
    .wasel(M_game_cu_wasel),
    .restart(M_game_cu_restart),
    .increment_old_counter(M_game_cu_increment_old_counter),
    .update_hs(M_game_cu_update_hs),
    .mainSeg3_char(M_game_cu_mainSeg3_char),
    .mainSeg2_char(M_game_cu_mainSeg2_char),
    .mainSeg1_char(M_game_cu_mainSeg1_char),
    .mainSeg0_char(M_game_cu_mainSeg0_char)
  );
  wire [16-1:0] M_game_regfiles_out_a;
  wire [16-1:0] M_game_regfiles_out_b;
  wire [16-1:0] M_game_regfiles_current_counter;
  wire [16-1:0] M_game_regfiles_player_score;
  wire [16-1:0] M_game_regfiles_high_score;
  reg [1-1:0] M_game_regfiles_rise;
  reg [1-1:0] M_game_regfiles_restart;
  reg [1-1:0] M_game_regfiles_increment_old_counter;
  reg [1-1:0] M_game_regfiles_update_hs;
  reg [16-1:0] M_game_regfiles_data;
  reg [1-1:0] M_game_regfiles_werf;
  reg [3-1:0] M_game_regfiles_wasel;
  reg [2-1:0] M_game_regfiles_ra1sel;
  reg [4-1:0] M_game_regfiles_ra2sel;
  regfiles_17 game_regfiles (
    .clk(clk),
    .rst(rst),
    .rise(M_game_regfiles_rise),
    .restart(M_game_regfiles_restart),
    .increment_old_counter(M_game_regfiles_increment_old_counter),
    .update_hs(M_game_regfiles_update_hs),
    .data(M_game_regfiles_data),
    .werf(M_game_regfiles_werf),
    .wasel(M_game_regfiles_wasel),
    .ra1sel(M_game_regfiles_ra1sel),
    .ra2sel(M_game_regfiles_ra2sel),
    .out_a(M_game_regfiles_out_a),
    .out_b(M_game_regfiles_out_b),
    .current_counter(M_game_regfiles_current_counter),
    .player_score(M_game_regfiles_player_score),
    .high_score(M_game_regfiles_high_score)
  );
  
  always @* begin
    M_game_cu_easy_mode = easy_mode;
    M_game_cu_pressed = pressed;
    M_game_cu_rise = rise;
    M_game_cu_sc_hold = sc_hold;
    M_game_cu_current_counter = M_game_regfiles_current_counter;
    M_game_cu_player_score = M_game_regfiles_player_score;
    M_game_regfiles_werf = M_game_cu_werf;
    M_game_regfiles_wasel = M_game_cu_wasel;
    M_game_regfiles_ra1sel = M_game_cu_ra1sel;
    M_game_regfiles_ra2sel = M_game_cu_ra2sel;
    M_game_regfiles_rise = rise;
    M_game_regfiles_restart = M_game_cu_restart;
    M_game_regfiles_increment_old_counter = M_game_cu_increment_old_counter;
    M_game_regfiles_update_hs = M_game_cu_update_hs;
    M_game_alu_a = M_game_regfiles_out_a;
    M_game_alu_b = M_game_regfiles_out_b;
    M_game_alu_alufn = M_game_cu_alufn;
    M_game_regfiles_data = M_game_alu_f;
    M_game_cu_alu_output = M_game_alu_f;
    high_score = M_game_regfiles_high_score;
    mainSeg3_char = M_game_cu_mainSeg3_char;
    mainSeg2_char = M_game_cu_mainSeg2_char;
    mainSeg1_char = M_game_cu_mainSeg1_char;
    mainSeg0_char = M_game_cu_mainSeg0_char;
  end
endmodule
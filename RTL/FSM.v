`timescale 1ns / 1ps

module FSM (
  input [31:0] in1,
  input [31:0] in2,
  input clk,
  output [31:0] FSM_out
);
  reg [31:0] R1 = 32'd0;
  reg [31:0] R2 = 32'd0;
  wire [31:0] x0;
  wire [31:0] x1;
  wire [31:0] x2;
  
  always@ (posedge clk) 
  begin
    R1 <= x1;
    R2 <= x2;         
  end
  
  assign FSM_out = (x0 ^ R2);
  
  Modulo_Addition m1(.a(in1), .b(R1), .clk(clk), .sum(x0));
  Modulo_Addition m2(.a(in2), .b(R2), .clk(clk), .sum(x1));
  S_Box s1(.in(R1), .clk(clk), .out(x2));
endmodule
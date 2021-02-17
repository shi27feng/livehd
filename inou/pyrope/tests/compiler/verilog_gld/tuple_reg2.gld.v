/* Generated by Yosys livehd+0.9+ */

module tuple_reg2(clock, out, out2, out3, out4);
  reg [6:0] \#reg.baz ;
  reg [6:0] \#reg.foo.bar ;
  input clock;
  wire [4:0] lg_0;
  wire [6:0] lg_1;
  wire [6:0] lg_2;
  output [4:0] out;
  output [6:0] out2;
  output [6:0] out3;
  output [6:0] out4;
  always @(posedge clock)
    \#reg.baz  <= lg_2;
  always @(posedge clock)
    \#reg.foo.bar  <= lg_1;
  assign lg_0 = 5'h0c;
  assign lg_1 = 7'h38;
  assign lg_2 = 7'h39;
  assign out = lg_0;
  assign out2 = \#reg.foo.bar ;
  assign out3 = \#reg.baz ;
  assign out4 = \#reg.foo.bar ;
endmodule

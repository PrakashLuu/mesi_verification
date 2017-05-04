/*`define MESI_ISC_MBUS_CMD_NOP      3'd0
`define MESI_ISC_MBUS_CMD_WR       3'd1
`define MESI_ISC_MBUS_CMD_RD       3'd2
`define MESI_ISC_MBUS_CMD_WR_BROAD 3'd3
`define MESI_ISC_MBUS_CMD_RD_BROAD 3'd4

// Coherence Bus commands
`define MESI_ISC_CBUS_CMD_NOP      3'd0
`define MESI_ISC_CBUS_CMD_WR_SNOOP 3'd1
`define MESI_ISC_CBUS_CMD_RD_SNOOP 3'd2
`define MESI_ISC_CBUS_CMD_EN_WR    3'd3
`define MESI_ISC_CBUS_CMD_EN_RD    3'd4
  
// BREQ_TYPE  
`define MESI_ISC_BREQ_TYPE_NOP 2'd0
`define MESI_ISC_BREQ_TYPE_WR  2'd1
`define MESI_ISC_BREQ_TYPE_RD  2'd2
*/
module v_mesi_isc(
    input clk,
    input rst,
    input [2:0] mbus_cmd3_i,
    input [2:0] mbus_cmd2_i,
    input [2:0] mbus_cmd1_i,
    input [2:0] mbus_cmd0_i,
    input [31:0] mbus_addr3_i, 
    input [31:0] mbus_addr2_i,
    input [31:0] mbus_addr1_i,
    input [31:0] mbus_addr0_i,
    input cbus_ack3_i,
    input cbus_ack2_i,
    input cbus_ack1_i,
    input cbus_ack0_i,
     // Outputs of rtl
    input [31:0] cbus_addr_o,
    input [2:0] cbus_cmd3_o,
    input [2:0] cbus_cmd2_o,
    input [2:0] cbus_cmd1_o,
    input [2:0] cbus_cmd0_o,
    input mbus_ack3_o,
    input mbus_ack2_o,
    input mbus_ack1_o,
    input mbus_ack0_o
);
    property write_broad_response01;
        @(posedge clk)
            (mbus_cmd0_i == 3'd3 ) |-> ##[1:10] (cbus_cmd1_o == 3'd1);
    endproperty

    property write_broad_response02;
        @(posedge clk)
            (mbus_cmd0_i == 3'd3 ) |-> ##[1:10] (cbus_cmd2_o == 3'd1);
    endproperty
    
    property write_broad_response03;
        @(posedge clk)
            (mbus_cmd0_i == 3'd3 ) |-> ##[1:10] (cbus_cmd3_o == 3'd1);
    endproperty
    property write_broad_response10;
        @(posedge clk)
            (mbus_cmd1_i == 3'd3 ) |-> ##[1:10] (cbus_cmd0_o == 3'd1);
    endproperty

    property write_broad_response12;
        @(posedge clk)
            (mbus_cmd1_i == 3'd3 ) |-> ##[1:10] (cbus_cmd2_o == 3'd1);
    endproperty
    
    property write_broad_response13;
        @(posedge clk)
            (mbus_cmd1_i == 3'd3 ) |-> ##[1:10] (cbus_cmd3_o == 3'd1);
    endproperty
    property write_broad_response20;
        @(posedge clk)
            (mbus_cmd2_i == 3'd3 ) |-> ##[1:10] (cbus_cmd0_o == 3'd1);
    endproperty

    property write_broad_response21;
        @(posedge clk)
            (mbus_cmd2_i == 3'd3 ) |-> ##[1:10] (cbus_cmd1_o == 3'd1);
    endproperty
    
    property write_broad_response23;
        @(posedge clk)
            (mbus_cmd2_i == 3'd3 ) |-> ##[1:10] (cbus_cmd3_o == 3'd1);
    endproperty
    property write_broad_response30;
        @(posedge clk)
            (mbus_cmd3_i == 3'd3 ) |-> ##[1:10] (cbus_cmd0_o == 3'd1);
    endproperty

    property write_broad_response31;
        @(posedge clk)
            (mbus_cmd3_i == 3'd3 ) |-> ##[1:10] (cbus_cmd1_o == 3'd1);
    endproperty
    
    property write_broad_response32;
        @(posedge clk)
            (mbus_cmd3_i == 3'd3 ) |-> ##[1:10] (cbus_cmd2_o == 3'd1);
    endproperty
    property getenable0;
	@(posedge clk) (cbus_ack1_i == 1 && cbus_ack2_i == 1 && cbus_ack3_i == 1) |-> ##[1:10] (cbus_cmd0_o == 3'd3);
    endproperty
    property getenable1;
	@(posedge clk) (cbus_ack0_i == 1 && cbus_ack2_i == 1 && cbus_ack3_i == 1) |-> ##[1:10] (cbus_cmd1_o == 3'd3);
    endproperty
    property getenable2;
	@(posedge clk) (cbus_ack0_i == 1 && cbus_ack1_i == 1 && cbus_ack3_i == 1) |-> ##[1:10] (cbus_cmd2_o == 3'd3);
    endproperty
    property getenable3;
	@(posedge clk) (cbus_ack0_i == 1 && cbus_ack1_i == 1 && cbus_ack2_i == 1) |-> ##[1:10] (cbus_cmd3_o == 3'd3);
    endproperty

    assertcore01_broad_snoop: assert property(write_broad_response01);
    assertcore02_broad_snoop: assert property(write_broad_response02);
    assertcore03_broad_snoop: assert property(write_broad_response03);
    assertcore10_broad_snoop: assert property(write_broad_response10);
    assertcore12_broad_snoop: assert property(write_broad_response12);
    assertcore13_broad_snoop: assert property(write_broad_response13);
    assertcore20_broad_snoop: assert property(write_broad_response20);
    assertcore21_broad_snoop: assert property(write_broad_response21);
    assertcore23_broad_snoop: assert property(write_broad_response23);
    assertcore30_broad_snoop: assert property(write_broad_response30);
    assertcore31_broad_snoop: assert property(write_broad_response31);
    assertcore32_broad_snoop: assert property(write_broad_response32);

        enable0 : assert property (getenable0);
	enable1 : assert property (getenable1);
	enable2 : assert property (getenable2);
	enable3 : assert property (getenable3);

    covercore01_broad_snoop: cover property(write_broad_response01);
    covercore02_broad_snoop: cover property(write_broad_response02);
    covercore03_broad_snoop: cover property(write_broad_response03);
    covercore10_broad_snoop: cover property(write_broad_response10);
    covercore12_broad_snoop: cover property(write_broad_response12);
    covercore13_broad_snoop: cover property(write_broad_response13);
    covercore20_broad_snoop: cover property(write_broad_response20);
    covercore21_broad_snoop: cover property(write_broad_response21);
    covercore23_broad_snoop: cover property(write_broad_response23);
    covercore30_broad_snoop: cover property(write_broad_response30);
    covercore31_broad_snoop: cover property(write_broad_response31);
    covercore32_broad_snoop: cover property(write_broad_response32);

        coverenable0 : cover property (getenable0);
	coverenable1 : cover property (getenable1);
	coverenable2 : cover property (getenable2);
	coverenable3 : cover property (getenable3);
endmodule

module Wrapper;

bind mesi_isc v_mesi_isc mesi_bind(

    
     .clk(clk),
     .rst(rst),
     .mbus_cmd3_i(mbus_cmd3_i),
     .mbus_cmd2_i(mbus_cmd2_i),
     .mbus_cmd1_i( mbus_cmd1_i),
     .mbus_cmd0_i(mbus_cmd0_i),
     .mbus_addr3_i(mbus_addr3_i),
     .mbus_addr2_i(mbus_addr2_i),
     .mbus_addr1_i(mbus_addr1_i),
     .mbus_addr0_i(mbus_addr0_i),
     .cbus_ack3_i(cbus_ack3_i),
     .cbus_ack2_i(cbus_ack2_i),
     .cbus_ack1_i(cbus_ack1_i),
     .cbus_ack0_i(cbus_ack0_i),
     // Outputs
     .cbus_addr_o(cbus_addr_o),
     .cbus_cmd3_o(cbus_cmd3_o),
     .cbus_cmd2_o(cbus_cmd2_o),
     .cbus_cmd1_o(cbus_cmd1_o),
     .cbus_cmd0_o(cbus_cmd0_o),
     .mbus_ack3_o(mbus_ack3_o),
     .mbus_ack2_o(mbus_ack2_o),
     .mbus_ack1_o(mbus_ack1_o),
     .mbus_ack0_o(mbus_ack0_o)
 );
 endmodule

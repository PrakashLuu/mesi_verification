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
    property write_broad_response1;
        @(posedge clk)
            (mbus_cmd3_i == 3'd3 ) |-> ##[0:100] (cbus_cmd0_o == 3'd1);
    endproperty

    property write_broad_response2;
        @(posedge clk)
            (mbus_cmd3_i == 3'd3 ) |-> ##[0:100] (cbus_cmd1_o == 3'd1);
    endproperty
    
    property write_broad_response3;
        @(posedge clk)
            (mbus_cmd3_i == 3'd3 ) |-> ##[0:100] (cbus_cmd2_o == 3'd1);
    endproperty

    assertcore1_broad_snoop: assert property(write_broad_response1);
    assertcore2_broad_snoop: assert property(write_broad_response2);
    assertcore3_broad_snoop: assert property(write_broad_response3);


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

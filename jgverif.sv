
/*parameter
  CBUS_CMD_WIDTH           = 3,
  ADDR_WIDTH               = 32,
  BROAD_TYPE_WIDTH         = 2,
  BROAD_ID_WIDTH           = 5,  
  BROAD_REQ_FIFO_SIZE      = 4,
  BROAD_REQ_FIFO_SIZE_LOG2 = 2,
  MBUS_CMD_WIDTH           = 3,
  BREQ_FIFO_SIZE           = 2,
  BREQ_FIFO_SIZE_LOG2      = 1;
*/
module v_mesi(
input                   clk,          // System clock
input                   rst,          // Active high system reset
// Main buses
input [MBUS_CMD_WIDTH-1:0] mbus_cmd3_i, // Main bus3 command
input [MBUS_CMD_WIDTH-1:0] mbus_cmd2_i, // Main bus2 command
input [MBUS_CMD_WIDTH-1:0] mbus_cmd1_i, // Main bus1 command
input [MBUS_CMD_WIDTH-1:0] mbus_cmd0_i, // Main bus0 command
// Coherence buses
input [ADDR_WIDTH-1:0]  mbus_addr3_i,  // Coherence bus3 address
input [ADDR_WIDTH-1:0]  mbus_addr2_i,  // Coherence bus2 address
input [ADDR_WIDTH-1:0]  mbus_addr1_i,  // Coherence bus1 address
input [ADDR_WIDTH-1:0]  mbus_addr0_i,  // Coherence bus0 address
input                   cbus_ack3_i,  // Coherence bus3 acknowledge
input                   cbus_ack2_i,  // Coherence bus2 acknowledge
input                   cbus_ack1_i,  // Coherence bus1 acknowledge
input                   cbus_ack0_i  // Coherence bus0 acknowledge
);

endmodule

module Wrapper;

bind mesi_isc v_mesi mesi_props(
     // Inputs
     .clk              (clk),
     .rst              (rst),
     .mbus_cmd3_i      (mbus_cmd_array[3]),
     .mbus_cmd2_i      (mbus_cmd_array[2]),
     .mbus_cmd1_i      (mbus_cmd_array[1]),
     .mbus_cmd0_i      (mbus_cmd_array[0]),
     .mbus_addr3_i     (mbus_addr_array[3]),
     .mbus_addr2_i     (mbus_addr_array[2]),
     .mbus_addr1_i     (mbus_addr_array[1]),
     .mbus_addr0_i     (mbus_addr_array[0]),
     .cbus_ack3_i      (cbus_ack3),
     .cbus_ack2_i      (cbus_ack2),
     .cbus_ack1_i      (cbus_ack1),
     .cbus_ack0_i      (cbus_ack0),
     // Outputs
     .cbus_addr_o      (cbus_addr),
     .cbus_cmd3_o      (cbus_cmd3),
     .cbus_cmd2_o      (cbus_cmd2),
     .cbus_cmd1_o      (cbus_cmd1),
     .cbus_cmd0_o      (cbus_cmd0),
     .mbus_ack3_o      (mbus_ack_mesi_isc[3]),
     .mbus_ack2_o      (mbus_ack_mesi_isc[2]),
     .mbus_ack1_o      (mbus_ack_mesi_isc[1]),
     .mbus_ack0_o      (mbus_ack_mesi_isc[0])
     );
endmodule
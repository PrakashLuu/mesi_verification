
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
input                       clk,          // System clock
input                       rst,          // Active high system reset
input       [MBUS_CMD_WIDTH-1:0] mbus_cmd_array [3:0], // Main bus3 command
input       [ADDR_WIDTH-1:0]  mbus_addr_array [3:0],  // Main bus3 address
input       [DATA_WIDTH-1:0]  mbus_data_rd,  // Main bus data read
input       [DATA_WIDTH-1:0]  mbus_data_wr_array [3:0],  // Main bus data read
input       [DATA_WIDTH-1:0]  mbus_data_wr3,  // Main bus data read
input                         cbus_ack3,  // Coherence bus3 acknowledge
input        [ADDR_WIDTH-1:0] cbus_addr,  // Coherence bus address. All busses have
input        [CBUS_CMD_WIDTH-1:0] cbus_cmd3, // Coherence bus3 command
input        [3:0]            mbus_ack,  // Main bus3 acknowledge
input        [3:0]            tb_ins_array [3:0],
input        [3:0]            tb_ins_addr3,
input        [3:0]            tb_ins_ack
input        [3:0]               cache_state0,
input        [3:0]               cache_state1,
input        [3:0]               cache_state2,
input        [3:0]               cache_state3,
input        [3:0]               cache_state4,
input        [3:0]               cache_state5,
input        [3:0]               cache_state6,
input        [3:0]               cache_state7,
input        [3:0]               cache_state8,
input        [3:0]               cache_state9
);



    property coher();  //check to see if cache is coherent
        @(posedge clk)

    endproperty

endmodule

module Wrapper;

bind mesi_isc v_mesi mesi_props(
     // Inputs
     
     // Inputs
     .clk              (clk),
     .rst              (rst),
     .cbus_addr_i      (cbus_addr),
     //                        \ /
     .cbus_cmd_i       (cbus_cmd3),
     //                             \ /
     .mbus_data_i      (mbus_data_rd),
     //                        \ /
     .mbus_ack_i       (mbus_ack[3]),
     //                   \ /
     .cpu_id_i         (2'd3),
     //                      \ /
     .tb_ins_i         (tb_ins_array[3]),
     //                           \ /
     .tb_ins_addr_i    (tb_ins_addr3),
     // Outputs                \ /
     .mbus_cmd_o       (mbus_cmd_array[3]),
      //                        \ /
     .mbus_addr_o      (mbus_addr_array[3]),
      //                        \ /
     .mbus_data_o      (mbus_data_wr_array[3]),
     //                        \ /
     .cbus_ack_o       (cbus_ack3),
     //                          \ /
     .tb_ins_ack_o     (tb_ins_ack[3]),

     .cache_state0      (cache_state0),
     .cache_state1      (cache_state1),
     .cache_state2      (cache_state2),
     .cache_state3      (cache_state3),
     .cache_state4      (cache_state4),
     .cache_state5      (cache_state5),
     .cache_state6      (cache_state6),
     .cache_state7      (cache_state7),
     .cache_state8      (cache_state8),
     .cache_state9      (cache_state9)


 );
endmodule
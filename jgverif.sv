/*
parameter
  CBUS_CMD_WIDTH           = 3,
  ADDR_WIDTH               = 32,
  BROAD_TYPE_WIDTH         = 2,
  BROAD_ID_WIDTH           = 5,  
  BROAD_REQ_FIFO_SIZE      = 4,
  BROAD_REQ_FIFO_SIZE_LOG2 = 2,
  MBUS_CMD_WIDTH           = 3,
  BREQ_FIFO_SIZE           = 2,
  BREQ_FIFO_SIZE_LOG2      = 1,
  DATA_WIDTH	 	   = 32;
*/
module v_mesi(
input                       clk,          // System clock
input                       rst,          // Active high system reset
input       [3-1:0] mbus_cmd_array , // Main bus3 command
input       [32-1:0]  mbus_addr_array ,  // Main bus3 address
input       [32-1:0]  mbus_data_rd,  // Main bus data read
input       [32-1:0]  mbus_data_wr_array ,  // Main bus data read
input       [32-1:0]  mbus_data_wr3,  // Main bus data read
input                         cbus_ack3,  // Coherence bus3 acknowledge
input        [32-1:0] cbus_addr,  // Coherence bus address. All busses have
input        [3-1:0] cbus_cmd3, // Coherence bus3 command
input                    mbus_ack,  // Main bus3 acknowledge
input        [3:0]            tb_ins_array ,
input        [3:0]            tb_ins_addr3,
input                    tb_ins_ack,
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



    /*property coher();  //check to see if cache is coherent
        @(posedge clk)

    endproperty*/

endmodule

module Wrapper;

bind mesi_isc_tb_cpu v_mesi mesi_props(
     // Inputs
     
     // Inputs
     .clk              (clk),
     .rst              (rst),
     .cbus_addr      (cbus_addr_i),
     //                        \ /
     .cbus_cmd3       (cbus_cmd_i),
     //                             \ /
     .mbus_data_rd      (mbus_data_i),
     //                        \ /
     .mbus_ack       (mbus_ack_i),
     //                   \ /
     .cpu_id_i         (2'b11),
     //                      \ /
     .tb_ins_array         (tb_ins_i),
     //                           \ /
     .tb_ins_addr3    (tb_ins_addr_i),
     // Outputs                \ /
     .mbus_cmd_array       (mbus_cmd_i),
      //                        \ /
     .mbus_addr_array      (mbus_addr_o),
      //                        \ /
     .mbus_data_wr_array      (mbus_data_o),
     //                        \ /
     .cbus_ack3       (cbus_ack_0),
     //                          \ /
     .tb_ins_ack     (tb_ins_ack_o),

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

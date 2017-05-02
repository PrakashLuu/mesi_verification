module v_mesi_isc(
    input clk,
    input rst,
    input mbus_cmd3_i,
    input mbus_cmd2_i,
    input mbus_cmd1_i,
    input mbus_cmd0_i,
    input mbus_addr3_i, 
    input mbus_addr2_i,
    input mbus_addr1_i,
    input mbus_addr0_i,
    input cbus_ack3_i,
    input cbus_ack2_i,
    input cbus_ack1_i,
    input cbus_ack0_i,
     // Outputs of rtl
    input cbus_addr_o,
    input cbus_cmd3_o,
    input cbus_cmd2_o,
    input cbus_cmd1_o,
    input cbus_cmd0_o,
    input mbus_ack3_o,
    input mbus_ack2_o,
    input mbus_ack1_o,
    input mbus_ack0_o
);
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

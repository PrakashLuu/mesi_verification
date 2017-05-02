#Tcl script which can be used with JasperGold
#Use "source lab4.tcl" in the console to source this script

#Reading the files 
analyze -verilog {mesi_isc.v};
analyze -sv {jgtest.sv};
analyze -verilog {mesi_isc_broad.v};
analyze -verilog {mesi_isc_breq_fifos.v};
analyze -verilog {mesi_isc_basic_fifo.v};
analyze -verilog {mesi_isc_breq_fifos_cntl.v};
analyze -verilog {mesi_isc_broad_cntl.v};
analyze -verilog {mesi_isc_define.v};

#Elaborating the design
elaborate -top {mesi_isc};

#You will need to add commands below
#Set the clock
clock clk
#Set Reset
reset "rst"

#Prove all
prove -bg -all
#

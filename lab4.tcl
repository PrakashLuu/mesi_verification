#Tcl script which can be used with JasperGold
#Use "source lab4.tcl" in the console to source this script

#Reading the files 
analyze -verilog {mesi_isc_tb_cpu.v};
analyze -sv {jgtest.sv};

#Elaborating the design
elaborate -top {mesi_isc_tb_cpu};

#You will need to add commands below
#Set the clock
clock clk
#Set Reset
reset "rst"

#Prove all
prove -bg -all
#

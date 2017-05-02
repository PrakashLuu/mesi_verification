#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2015.09
# platform  : Linux 2.6.32-642.11.1.el6.x86_64
# version   : 2015.09 FCS 64 bits
# build date: 2015.09.29 22:07:32 PDT
#----------------------------------------
# started Mon May 01 21:54:09 CDT 2017
# hostname  : luigi
# pid       : 15961
# arguments : '-label' 'session_0' '-console' 'luigi:35467' '-style' 'windows' '-proj' '/home/ecelrc/students/blidsky/mesi_verification/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/ecelrc/students/blidsky/mesi_verification/jgproject/.tmp/.initCmds.tcl'
analyze -verilog {/home/ecelrc/students/blidsky/mesi_verification/mesi_isc_tb_cpu.v} ; analyze -sv {/home/ecelrc/students/blidsky/mesi_verification/jgverif.sv} ; 
prove -bg -all

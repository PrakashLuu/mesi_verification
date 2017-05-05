#----------------------------------------
# JasperGold Version Info
# tool      : JasperGold 2015.09
# platform  : Linux 2.6.32-642.11.1.el6.x86_64
# version   : 2015.09 FCS 64 bits
# build date: 2015.09.29 22:07:32 PDT
#----------------------------------------
# started Thu May 04 13:50:38 CDT 2017
# hostname  : luigi
# pid       : 4568
# arguments : '-label' 'session_0' '-console' 'luigi:37827' '-style' 'windows' '-proj' '/home/ecelrc/students/blidsky/mesi_verification/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/ecelrc/students/blidsky/mesi_verification/jgproject/.tmp/.initCmds.tcl'
include /home/ecelrc/students/blidsky/mesi_verification/project.tcl
visualize -property <embedded>::mesi_isc.mesi_bind.covercore01_broad_snoop -new_window
visualize -violation -property <embedded>::mesi_isc.mesi_bind.assertcore01_broad_snoop -new_window

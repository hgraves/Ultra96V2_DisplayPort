# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/hello_system/_ide/scripts/debugger_hello-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/hello_system/_ide/scripts/debugger_hello-default.tcl
# 
connect -url tcp:127.0.0.1:3121
source /tools/Xilinx/Vitis/2020.2/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS3 210299B153B3" && level==0 && jtag_device_ctx=="jsn-JTAG-HS3-210299B153B3-14710093-0"}
fpga -file /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/hello/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/u96_dp_platform/export/u96_dp_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/u96_dp_platform/export/u96_dp_platform/sw/u96_dp_platform/boot/fsbl.elf
set bp_33_51_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_33_51_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/hello/Debug/hello.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con

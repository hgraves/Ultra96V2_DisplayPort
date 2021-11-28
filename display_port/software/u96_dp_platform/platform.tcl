# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/u96_dp_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/u96_dp_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {u96_dp_platform}\
-hw {/home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/design_1_wrapper.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {/home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software}

platform write
platform generate -domains 
platform active {u96_dp_platform}
bsp reload
bsp write
platform generate
bsp config stdin "psu_uart_1"
bsp config stdout "psu_uart_1"
bsp write
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_domain 
platform active {u96_dp_platform}
bsp reload
bsp write
platform generate -domains 
bsp write
platform generate -domains 
platform clean
platform generate
platform config -updatehw {/home/hgraves/Projects/ultra96/projects/Ultra96V2_DisplayPort/display_port/software/design_1_wrapper.xsa}
platform clean
platform generate

# create_project.tcl - builds the whole Vivado project in one step.
#
# In Vivado's Tcl Console:
#     cd C:/path/to/riscv_v3
#     source create_project.tcl
# (or:  vivado -source create_project.tcl  from a terminal where Vivado is on the PATH)

# ---- settings ----
set part     xc7a100tcsg324-1   ;# Nexys A7-100T. For the A7-50T use xc7a50tcsg324-1
set run_flow 0                  ;# 1 = also run synthesis + implementation + bitstream
# ------------------

set script_dir [file dirname [file normalize [info script]]]
set proj_name  riscv_v3
set proj_dir   [file join $script_dir vivado_project]

create_project $proj_name $proj_dir -part $part -force
set_property target_language Verilog [current_project]

# design sources: all RTL + program memories (the top level picks one, see PROGRAM in rtl/top.v)
add_files -norecurse -fileset sources_1 [glob [file join $script_dir rtl *.v]]
add_files -norecurse -fileset sources_1 [glob [file join $script_dir sw *.mem]]
set_property top top [get_filesets sources_1]

# constraints
add_files -norecurse -fileset constrs_1 [file join $script_dir constraints nexys_a7.xdc]

# simulation: all testbenches + memory files (so xsim finds them); default top = LED demo
add_files -norecurse -fileset sim_1 [glob [file join $script_dir tb *.v]]
foreach m [glob [file join $script_dir sw *.mem]] { catch { add_files -norecurse -fileset sim_1 $m } }
set_property top tb_soc [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {-all} -objects [get_filesets sim_1]

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

puts "------------------------------------------------------------"
puts "Project created: [file join $proj_dir ${proj_name}.xpr]"
puts "  Simulate : set a testbench as top (tb_soc, tb_vga, tb_bounce, tb_prog, tb_diff),"
puts "             then Run Simulation > Run Behavioral Simulation"
puts "  Build    : Run Synthesis > Run Implementation > Generate Bitstream"
puts "  Program  : choose the demo with PROGRAM in rtl/top.v (default: bounce.mem)"
puts "------------------------------------------------------------"

if {$run_flow} {
    launch_runs synth_1 -jobs 4
    wait_on_run synth_1
    launch_runs impl_1 -to_step write_bitstream -jobs 4
    wait_on_run impl_1
    puts "Bitstream: [file join $proj_dir ${proj_name}.runs impl_1 top.bit]"
}

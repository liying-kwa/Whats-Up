set projDir "C:/Users/phang/Desktop/KLYmojo/work/planAhead"
set projName "KLYmojo"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/phang/Desktop/KLYmojo/work/verilog/mojo_top_0.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/stateCounter_1.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/counter_2.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/beta_3.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/reset_conditioner_4.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/button_conditioner_5.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/edge_detector_6.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/seven_seg_7.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/alu_15.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/cu_16.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/regfiles_17.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/pipeline_18.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/add_19.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/boole_20.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/shift_21.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/cmp_22.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/muldiv_23.v" "C:/Users/phang/Desktop/KLYmojo/work/verilog/modulo_24.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/phang/Desktop/KLYmojo/constraint/custom.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1

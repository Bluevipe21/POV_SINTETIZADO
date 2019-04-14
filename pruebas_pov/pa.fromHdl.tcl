
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name pruebas_pov -dir "C:/Users/Luis Hernandez/Documents/Proyecto E3/pruebas_pov/planAhead_run_1" -part xc3s50atq144-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "elbertv2.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {main.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top main $srcset
add_files [list {elbertv2.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s50atq144-5

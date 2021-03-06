#!/bin/sh
#cktfile must contain list of all the verilog file needed to
#contruct the design
#
#this script takes ckts in cktfile runs them through vpp
#the output is sent to stdout
#

cktdir=$(readlink -f .)

elsyn << //EOF

read  /mgc/Leonardo/lib/ami05_typ.syn
#read /mgc/Leonardo/lib/tsmc035_typ.syn

read {$cktdir/alu.v} {$cktdir/arithmetic.v} {$cktdir/logic.v} {$cktdir/shifter.v} {$cktdir/adder.v} \
        {$cktdir/conditional.v} {$cktdir/output_mux.v}

pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize
pre_optimize -extract
optimize -macro -auto -effort quick -hierarchy auto

optimize .work.FSM.INTERFACE -macro -auto -effort quick -hierarchy auto
optimize_timing .work.FSM.INTERFACE
set edif_write_arrays FALSE

write -downto PRIMITIVES -format vhdl   Proc.vhd
write -downto PRIMITIVES -format edif   Proc.edf
write -downto PRIMITIVES -format verilog  Proc.v
#write -format verilog  Proc.v
write -format SDF -downto PRIMITIVES Proc.sdf
apply_rename_rules -ruleset VERILOG
auto_write netlist.v
set report_file_name CriticalPath
report_delay -num_paths 1 -show_schematic 1 -critical_paths 
exit
//EOF
        echo "// End >>> $cktdir/$ckt <<<"
exit

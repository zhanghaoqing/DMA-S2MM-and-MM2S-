#!/bin/bash -f
#*********************************************************************************************************
# Vivado (TM) v2017.4 (64-bit)
#
# Filename    : system.sh
# Simulator   : Synopsys Verilog Compiler Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Thu Jan 03 22:43:24 CST 2019
# SW Build 2086221 on Fri Dec 15 20:54:30 MST 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved. 
#
# usage: system.sh [-help]
# usage: system.sh [-lib_map_path]
# usage: system.sh [-noclean_files]
# usage: system.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'system.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
#*********************************************************************************************************

# Directory path for design sources and include directories (if any) wrt this path
ref_dir="."

# Override directory with 'export_sim_ref_dir' env path value if set in the shell
if [[ (! -z "$export_sim_ref_dir") && ($export_sim_ref_dir != "") ]]; then
  ref_dir="$export_sim_ref_dir"
fi

# Command line options
vlogan_opts="-full64"
vhdlan_opts="-full64"
vcs_elab_opts="-full64 -debug_pp -t ps -licqueue -l elaborate.log"
vcs_sim_opts="-ucli -licqueue -l simulate.log"

# Design libraries
design_libs=(xil_defaultlib xpm axi_infrastructure_v1_1_0 smartconnect_v1_0 axi_protocol_checker_v2_0_1 axi_vip_v1_1_1 processing_system7_vip_v1_0_3 lib_cdc_v1_0_2 proc_sys_reset_v5_0_12 xlconstant_v1_1_3 axis_infrastructure_v1_1_0 fifo_generator_v13_2_1 axis_data_fifo_v1_1_16 xlconcat_v2_1_1 generic_baseblocks_v2_1_0 axi_data_fifo_v2_1_14 axi_register_slice_v2_1_15 axi_protocol_converter_v2_1_15)

# Simulation root library directory
sim_lib_dir="vcs_lib"

# Script info
echo -e "system.sh - Script generated by export_simulation (Vivado v2017.4 (64-bit)-id)\n"

# Main steps
run()
{
  check_args $# $1
  setup $1 $2
  compile
  elaborate
  simulate
}

# RUN_STEP: <compile>
compile()
{
  # Compile design files
  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
    "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
    "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xpm $vhdlan_opts \
    "/opt/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ipshared/2038/hdl/User_DMA_v1_0_S_AXI_LITE.v" \
    "$ref_dir/../../../bd/system/ipshared/2038/src/User_DMA_v1_0_M_AXI_FULL_mm2s.v" \
    "$ref_dir/../../../bd/system/ipshared/2038/src/User_DMA_v1_0_M_AXI_FULL_s2mm.v" \
    "$ref_dir/../../../bd/system/ipshared/2038/hdl/User_DMA_v1_0_S_AXIS_S2MM.v" \
    "$ref_dir/../../../bd/system/ipshared/2038/hdl/User_DMA_v1_0_M_AXIS_MM2S.v" \
    "$ref_dir/../../../bd/system/ipshared/2038/src/fifo.v" \
    "$ref_dir/../../../bd/system/ipshared/2038/hdl/User_DMA_v1_0.v" \
    "$ref_dir/../../../bd/system/ip/system_User_DMA_0_0/sim/system_User_DMA_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_checker_v2_0_1 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_vip_v1_1_1 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work processing_system7_vip_v1_0_3 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_processing_system7_0_0/sim/system_processing_system7_0_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work lib_cdc_v1_0_2 $vhdlan_opts \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work proc_sys_reset_v5_0_12 $vhdlan_opts \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/system/ip/system_rst_ps7_0_50M_0/sim/system_rst_ps7_0_50M_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/sim/bd_44e3.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/786b/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_5/sim/bd_44e3_s00a2s_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/92d2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_11/sim/bd_44e3_m00s2a_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/258c/hdl/sc_exit_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_12/sim/bd_44e3_m00e_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/sc_node_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_6/sim/bd_44e3_sarn_0.sv" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_7/sim/bd_44e3_srn_0.sv" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_8/sim/bd_44e3_sawn_0.sv" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_9/sim/bd_44e3_swn_0.sv" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_10/sim/bd_44e3_sbn_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/8ad6/hdl/sc_mmu_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_2/sim/bd_44e3_s00mmu_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0f5f/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_3/sim/bd_44e3_s00tr_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work smartconnect_v1_0 $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/925a/hdl/sc_si_converter_v1_0_vl_rfs.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts -sverilog +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_4/sim/bd_44e3_s00sic_0.sv" \
  2>&1 | tee -a vlogan.log

  vlogan -work xlconstant_v1_1_3 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0750/hdl/xlconstant_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_0/sim/bd_44e3_one_0.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work xil_defaultlib $vhdlan_opts \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/bd_0/ip/ip_1/sim/bd_44e3_psr_aclk_0.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axi_smc_0/sim/system_axi_smc_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axis_infrastructure_v1_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work fifo_generator_v13_2_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
  2>&1 | tee -a vlogan.log

  vhdlan -work fifo_generator_v13_2_1 $vhdlan_opts \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
  2>&1 | tee -a vhdlan.log

  vlogan -work fifo_generator_v13_2_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axis_data_fifo_v1_1_16 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e3dd/hdl/axis_data_fifo_v1_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_axis_data_fifo_0_0/sim/system_axis_data_fifo_0_0.v" \
    "$ref_dir/../../../bd/system/sim/system.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xlconcat_v2_1_1 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_xlconcat_0_0/sim/system_xlconcat_0_0.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work generic_baseblocks_v2_1_0 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_data_fifo_v2_1_14 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_register_slice_v2_1_15 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work axi_protocol_converter_v2_1_15 $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
  2>&1 | tee -a vlogan.log

  vlogan -work xil_defaultlib $vlogan_opts +v2k +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/ec67/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/02c8/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/1313/hdl" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/e2dd/hdl/verilog" +incdir+"$ref_dir/../../../../DMA_test.srcs/sources_1/bd/system/ipshared/0ab1/hdl" +incdir+"/opt/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
    "$ref_dir/../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
  2>&1 | tee -a vlogan.log


  vlogan -work xil_defaultlib $vlogan_opts +v2k \
    glbl.v \
  2>&1 | tee -a vlogan.log

}

# RUN_STEP: <elaborate>
elaborate()
{
  vcs $vcs_elab_opts xil_defaultlib.system xil_defaultlib.glbl -o system_simv
}

# RUN_STEP: <simulate>
simulate()
{
  ./system_simv $vcs_sim_opts -do simulate.do
}

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./system.sh -help\" for more information)\n"
        exit 1
      fi
      create_lib_mappings $2
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
      create_lib_mappings $2
  esac

  create_lib_dir

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Define design library mappings
create_lib_mappings()
{
  file="synopsys_sim.setup"
  if [[ -e $file ]]; then
    if [[ ($1 == "") ]]; then
      return
    else
      rm -rf $file
    fi
  fi

  touch $file

  lib_map_path="<SPECIFY_COMPILED_LIB_PATH>"
  if [[ ($1 != "" && -e $1) ]]; then
    lib_map_path="$1"
  else
    echo -e "ERROR: Compiled simulation library directory path not specified or does not exist (type "./top.sh -help" for more information)\n"
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    mapping="$lib:$sim_lib_dir/$lib"
    echo $mapping >> $file
  done

  if [[ ($lib_map_path != "") ]]; then
    incl_ref="OTHERS=$lib_map_path/synopsys_sim.setup"
    echo $incl_ref >> $file
  fi
}

# Create design library directory paths
create_lib_dir()
{
  if [[ -e $sim_lib_dir ]]; then
    rm -rf $sim_lib_dir
  fi

  for (( i=0; i<${#design_libs[*]}; i++ )); do
    lib="${design_libs[i]}"
    lib_dir="$sim_lib_dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
    fi
  done
}

# Delete generated data from the previous run
reset_run()
{
  files_to_remove=(ucli.key system_simv vlogan.log vhdlan.log compile.log elaborate.log simulate.log .vlogansetup.env .vlogansetup.args .vcs_lib_lock scirocco_command.log 64 AN.DB csrc system_simv.daidir)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done

  create_lib_dir
}

# Check command line arguments
check_args()
{
  if [[ ($1 == 1 ) && ($2 != "-lib_map_path" && $2 != "-noclean_files" && $2 != "-reset_run" && $2 != "-help" && $2 != "-h") ]]; then
    echo -e "ERROR: Unknown option specified '$2' (type \"./system.sh -help\" for more information)\n"
    exit 1
  fi

  if [[ ($2 == "-help" || $2 == "-h") ]]; then
    usage
  fi
}

# Script usage
usage()
{
  msg="Usage: system.sh [-help]\n\
Usage: system.sh [-lib_map_path]\n\
Usage: system.sh [-reset_run]\n\
Usage: system.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

# Launch script
run $1 $2

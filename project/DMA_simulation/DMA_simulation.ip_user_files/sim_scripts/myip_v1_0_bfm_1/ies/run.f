-makelib ies_lib/xil_defaultlib -sv \
  "D:/xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/myip_v1_0_bfm_1/ipshared/df43/hdl/myip_v1_0_M00_AXI.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/df43/hdl/myip_v1_0.v" \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_myip_0_0/sim/myip_v1_0_bfm_1_myip_0_0.v" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/smartconnect_v1_0 -sv \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/axi_protocol_checker_v2_0_1 -sv \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_slave_0_0/sim/myip_v1_0_bfm_1_slave_0_0_pkg.sv" \
-endlib
-makelib ies_lib/axi_vip_v1_1_1 -sv \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib -sv \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_slave_0_0/sim/myip_v1_0_bfm_1_slave_0_0.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/myip_v1_0_bfm_1/sim/myip_v1_0_bfm_1.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/hdl/User_DMA_v1_0_S_AXI_LITE.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/src/User_DMA_v1_0_M_AXI_FULL_mm2s.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/src/User_DMA_v1_0_M_AXI_FULL_s2mm.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/hdl/User_DMA_v1_0_S_AXIS_S2MM.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/hdl/User_DMA_v1_0_M_AXIS_MM2S.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/src/fifo.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/90ae/hdl/User_DMA_v1_0.v" \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_User_DMA_0_1/sim/myip_v1_0_bfm_1_User_DMA_0_1.v" \
-endlib
-makelib ies_lib/axis_infrastructure_v1_1_0 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/0ab1/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_1 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axis_data_fifo_v1_1_16 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/e3dd/hdl/axis_data_fifo_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_axis_data_fifo_0_0/sim/myip_v1_0_bfm_1_axis_data_fifo_0_0.v" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_15 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_14 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_crossbar_v2_1_16 \
  "../../../../DMA_simulation.srcs/sources_1/bd/myip_v1_0_bfm_1/ipshared/c631/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_xbar_0/sim/myip_v1_0_bfm_1_xbar_0.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/8e38/hdl/AXI_LITE_master_IP_v1_0_M00_AXI.v" \
  "../../../bd/myip_v1_0_bfm_1/ipshared/8e38/hdl/AXI_LITE_master_IP_v1_0.v" \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_AXI_LITE_master_IP_0_0/sim/myip_v1_0_bfm_1_AXI_LITE_master_IP_0_0.v" \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_AXI_LITE_master_IP_1_0/sim/myip_v1_0_bfm_1_AXI_LITE_master_IP_1_0.v" \
  "../../../bd/myip_v1_0_bfm_1/ip/myip_v1_0_bfm_1_xbar_1/sim/myip_v1_0_bfm_1_xbar_1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


## (c) Copyright 2009 - 2014 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.

##create_clock -period 10.000 [get_ports {dclk}]
create_clock -period 8.000 [get_ports clk_in_p]
# create_clock -period 6.4 [get_ports {refclk_p}]

set_property PACKAGE_PIN AD29 [get_ports clk_in_p]
set_property IOSTANDARD LVDS [get_ports clk_in_p]
set_property PACKAGE_PIN T6 [get_ports refclk_p]

# set sfp_slot 1
# if {$sfp_slot == 0} {
    set_property PACKAGE_PIN T2 [get_ports txp]
    set_property PACKAGE_PIN U4 [get_ports rxp]
#} else {
# set_property PACKAGE_PIN R4 [get_ports rxp]
# set_property PACKAGE_PIN P2 [get_ports txp]
#}

#create_generated_clock -name ddrclock -divide_by 1 -invert -source [get_pins *rx_clk_ddr/C] [get_ports xgmii_rx_clk]
#set_output_delay -max 0.750 -clock [get_clocks ddrclock] [get_ports * -filter {NAME =~ *xgmii_rxd*}]
#set_output_delay -min -0.750 -clock [get_clocks ddrclock] [get_ports * -filter {NAME =~ *xgmii_rxd*}]
#set_output_delay -max 0.750 -clock [get_clocks ddrclock] [get_ports * -filter {NAME =~ *xgmii_rxc*}]
#set_output_delay -min -0.750 -clock [get_clocks ddrclock] [get_ports * -filter {NAME =~ *xgmii_rxc*}]


#set_property LOC GTHE2_CHANNEL_X1Y21 [get_cells ten_gig_eth_pcs_pma_core_i/U0/ten_gig_eth_pcs_pma_block_i/gt0_gtwizard_10gbaser_multi_gt_i/gt0_gtwizard_gth_10gbaser_i/gthe2_i]
#set_property LOC GTHE2_COMMON_X1Y5 [get_cells ten_gig_eth_pcs_pma_core_i/U0/ten_gig_eth_pcs_pma_gt_common_block/gthe2_common_0_i]

#set_property IOSTANDARD HSTL_I [get_ports {xgmii_txc[*]}]
#set_property IOSTANDARD HSTL_I [get_ports {xgmii_txd[*]}]

#set_property IOSTANDARD HSTL_I [get_ports {xgmii_rxc[*]}]
#set_property IOSTANDARD HSTL_I [get_ports {xgmii_rxd[*]}]

#set_property IOB TRUE [get_cells {xgmii_rxc_reg[*]}]
#set_property IOB TRUE [get_cells {xgmii_rxd_reg[*]}]

#set_property IOSTANDARD HSTL_I [get_ports xgmii_rx_clk]

set_clock_groups -asynchronous -group clk_in_p -group refclk_p





create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list pcs_pma_0/ten_gig_eth_pcs_pma_core_i/U0/ten_gig_eth_pcs_pma_shared_clock_reset_block/coreclk_out]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {xgmii_rxc[0]} {xgmii_rxc[1]} {xgmii_rxc[2]} {xgmii_rxc[3]} {xgmii_rxc[4]} {xgmii_rxc[5]} {xgmii_rxc[6]} {xgmii_rxc[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 64 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {xgmii_rxd[0]} {xgmii_rxd[1]} {xgmii_rxd[2]} {xgmii_rxd[3]} {xgmii_rxd[4]} {xgmii_rxd[5]} {xgmii_rxd[6]} {xgmii_rxd[7]} {xgmii_rxd[8]} {xgmii_rxd[9]} {xgmii_rxd[10]} {xgmii_rxd[11]} {xgmii_rxd[12]} {xgmii_rxd[13]} {xgmii_rxd[14]} {xgmii_rxd[15]} {xgmii_rxd[16]} {xgmii_rxd[17]} {xgmii_rxd[18]} {xgmii_rxd[19]} {xgmii_rxd[20]} {xgmii_rxd[21]} {xgmii_rxd[22]} {xgmii_rxd[23]} {xgmii_rxd[24]} {xgmii_rxd[25]} {xgmii_rxd[26]} {xgmii_rxd[27]} {xgmii_rxd[28]} {xgmii_rxd[29]} {xgmii_rxd[30]} {xgmii_rxd[31]} {xgmii_rxd[32]} {xgmii_rxd[33]} {xgmii_rxd[34]} {xgmii_rxd[35]} {xgmii_rxd[36]} {xgmii_rxd[37]} {xgmii_rxd[38]} {xgmii_rxd[39]} {xgmii_rxd[40]} {xgmii_rxd[41]} {xgmii_rxd[42]} {xgmii_rxd[43]} {xgmii_rxd[44]} {xgmii_rxd[45]} {xgmii_rxd[46]} {xgmii_rxd[47]} {xgmii_rxd[48]} {xgmii_rxd[49]} {xgmii_rxd[50]} {xgmii_rxd[51]} {xgmii_rxd[52]} {xgmii_rxd[53]} {xgmii_rxd[54]} {xgmii_rxd[55]} {xgmii_rxd[56]} {xgmii_rxd[57]} {xgmii_rxd[58]} {xgmii_rxd[59]} {xgmii_rxd[60]} {xgmii_rxd[61]} {xgmii_rxd[62]} {xgmii_rxd[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {xgmii_txc[0]} {xgmii_txc[1]} {xgmii_txc[2]} {xgmii_txc[3]} {xgmii_txc[4]} {xgmii_txc[5]} {xgmii_txc[6]} {xgmii_txc[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 64 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {xgmii_txd[0]} {xgmii_txd[1]} {xgmii_txd[2]} {xgmii_txd[3]} {xgmii_txd[4]} {xgmii_txd[5]} {xgmii_txd[6]} {xgmii_txd[7]} {xgmii_txd[8]} {xgmii_txd[9]} {xgmii_txd[10]} {xgmii_txd[11]} {xgmii_txd[12]} {xgmii_txd[13]} {xgmii_txd[14]} {xgmii_txd[15]} {xgmii_txd[16]} {xgmii_txd[17]} {xgmii_txd[18]} {xgmii_txd[19]} {xgmii_txd[20]} {xgmii_txd[21]} {xgmii_txd[22]} {xgmii_txd[23]} {xgmii_txd[24]} {xgmii_txd[25]} {xgmii_txd[26]} {xgmii_txd[27]} {xgmii_txd[28]} {xgmii_txd[29]} {xgmii_txd[30]} {xgmii_txd[31]} {xgmii_txd[32]} {xgmii_txd[33]} {xgmii_txd[34]} {xgmii_txd[35]} {xgmii_txd[36]} {xgmii_txd[37]} {xgmii_txd[38]} {xgmii_txd[39]} {xgmii_txd[40]} {xgmii_txd[41]} {xgmii_txd[42]} {xgmii_txd[43]} {xgmii_txd[44]} {xgmii_txd[45]} {xgmii_txd[46]} {xgmii_txd[47]} {xgmii_txd[48]} {xgmii_txd[49]} {xgmii_txd[50]} {xgmii_txd[51]} {xgmii_txd[52]} {xgmii_txd[53]} {xgmii_txd[54]} {xgmii_txd[55]} {xgmii_txd[56]} {xgmii_txd[57]} {xgmii_txd[58]} {xgmii_txd[59]} {xgmii_txd[60]} {xgmii_txd[61]} {xgmii_txd[62]} {xgmii_txd[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 64 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {mac_0/xgmii_crc_int[0]} {mac_0/xgmii_crc_int[1]} {mac_0/xgmii_crc_int[2]} {mac_0/xgmii_crc_int[3]} {mac_0/xgmii_crc_int[4]} {mac_0/xgmii_crc_int[5]} {mac_0/xgmii_crc_int[6]} {mac_0/xgmii_crc_int[7]} {mac_0/xgmii_crc_int[8]} {mac_0/xgmii_crc_int[9]} {mac_0/xgmii_crc_int[10]} {mac_0/xgmii_crc_int[11]} {mac_0/xgmii_crc_int[12]} {mac_0/xgmii_crc_int[13]} {mac_0/xgmii_crc_int[14]} {mac_0/xgmii_crc_int[15]} {mac_0/xgmii_crc_int[16]} {mac_0/xgmii_crc_int[17]} {mac_0/xgmii_crc_int[18]} {mac_0/xgmii_crc_int[19]} {mac_0/xgmii_crc_int[20]} {mac_0/xgmii_crc_int[21]} {mac_0/xgmii_crc_int[22]} {mac_0/xgmii_crc_int[23]} {mac_0/xgmii_crc_int[24]} {mac_0/xgmii_crc_int[25]} {mac_0/xgmii_crc_int[26]} {mac_0/xgmii_crc_int[27]} {mac_0/xgmii_crc_int[28]} {mac_0/xgmii_crc_int[29]} {mac_0/xgmii_crc_int[30]} {mac_0/xgmii_crc_int[31]} {mac_0/xgmii_crc_int[32]} {mac_0/xgmii_crc_int[33]} {mac_0/xgmii_crc_int[34]} {mac_0/xgmii_crc_int[35]} {mac_0/xgmii_crc_int[36]} {mac_0/xgmii_crc_int[37]} {mac_0/xgmii_crc_int[38]} {mac_0/xgmii_crc_int[39]} {mac_0/xgmii_crc_int[40]} {mac_0/xgmii_crc_int[41]} {mac_0/xgmii_crc_int[42]} {mac_0/xgmii_crc_int[43]} {mac_0/xgmii_crc_int[44]} {mac_0/xgmii_crc_int[45]} {mac_0/xgmii_crc_int[46]} {mac_0/xgmii_crc_int[47]} {mac_0/xgmii_crc_int[48]} {mac_0/xgmii_crc_int[49]} {mac_0/xgmii_crc_int[50]} {mac_0/xgmii_crc_int[51]} {mac_0/xgmii_crc_int[52]} {mac_0/xgmii_crc_int[53]} {mac_0/xgmii_crc_int[54]} {mac_0/xgmii_crc_int[55]} {mac_0/xgmii_crc_int[56]} {mac_0/xgmii_crc_int[57]} {mac_0/xgmii_crc_int[58]} {mac_0/xgmii_crc_int[59]} {mac_0/xgmii_crc_int[60]} {mac_0/xgmii_crc_int[61]} {mac_0/xgmii_crc_int[62]} {mac_0/xgmii_crc_int[63]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {mac_0/xgmii_txd_crc[0]} {mac_0/xgmii_txd_crc[1]} {mac_0/xgmii_txd_crc[2]} {mac_0/xgmii_txd_crc[3]} {mac_0/xgmii_txd_crc[4]} {mac_0/xgmii_txd_crc[5]} {mac_0/xgmii_txd_crc[6]} {mac_0/xgmii_txd_crc[7]} {mac_0/xgmii_txd_crc[8]} {mac_0/xgmii_txd_crc[9]} {mac_0/xgmii_txd_crc[10]} {mac_0/xgmii_txd_crc[11]} {mac_0/xgmii_txd_crc[12]} {mac_0/xgmii_txd_crc[13]} {mac_0/xgmii_txd_crc[14]} {mac_0/xgmii_txd_crc[15]} {mac_0/xgmii_txd_crc[16]} {mac_0/xgmii_txd_crc[17]} {mac_0/xgmii_txd_crc[18]} {mac_0/xgmii_txd_crc[19]} {mac_0/xgmii_txd_crc[20]} {mac_0/xgmii_txd_crc[21]} {mac_0/xgmii_txd_crc[22]} {mac_0/xgmii_txd_crc[23]} {mac_0/xgmii_txd_crc[24]} {mac_0/xgmii_txd_crc[25]} {mac_0/xgmii_txd_crc[26]} {mac_0/xgmii_txd_crc[27]} {mac_0/xgmii_txd_crc[28]} {mac_0/xgmii_txd_crc[29]} {mac_0/xgmii_txd_crc[30]} {mac_0/xgmii_txd_crc[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list mac_0/crc_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list eth_send]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets pcs_pma_0/ten_gig_eth_pcs_pma_core_i/U0/ten_gig_eth_pcs_pma_shared_clock_reset_block/coreclk_out]

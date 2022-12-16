create_clock -period 20.000 -name clk [get_ports clk]

set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS15} [get_ports clk]
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS15} [get_ports reset_n]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports uart_txd]


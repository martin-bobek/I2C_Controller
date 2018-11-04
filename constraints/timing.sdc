create_clock -name clk -period 10.000 -waveform {0.000 5.000} [get_ports {clk}]
derive_clock_uncertainty

set_false_path -from * -to [get_ports {buttons[0]}]
set_false_path -from * -to [get_ports {buttons[1]}]

set_false_path -from * -to [get_ports {leds[0]}]
set_false_path -from * -to [get_ports {leds[1]}]

set_false_path -from * -to [get_ports {sda}]
set_false_path -from * -to [get_ports {scl}]


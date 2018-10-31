library ieee;
use ieee.std_logic_1164.all;

entity top_level is
  port (
    button_1: in    std_logic;
    button_2: inout std_logic;
    led_1   : out   std_logic
  );
end;

architecture rtl of top_level is
begin
  button_2 <= '0' when (button_1 = '0') else 'Z';
  led_1 <= not button_2;
end;
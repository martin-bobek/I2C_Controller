library ieee;
use ieee.std_logic_1164.all;

entity top_level is
  port (
    button_1: in  std_logic;
    button_2: in  std_logic;
    led_1:    out std_logic;
    led_2:    out std_logic
  );
end;

architecture rtl of top_level is
begin
  led_1 <= button_1;
  led_2 <= button_2;
end;
library ieee;
use ieee.std_logic_1164.all;

entity top_level is
  port (
    button_1: in    std_logic;
    button_2: in    std_logic;
    sda:      inout std_logic;
    scl:      inout std_logic
  );
end;

architecture rtl of top_level is
begin
  sda <= '0' when (button_1 = '0') else 'Z';
  scl <= '0' when (button_2 = '0') else 'Z';
end;
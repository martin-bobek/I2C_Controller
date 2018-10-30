library ieee;
use ieee.std_logic_1164.all;

entity top_level_tb is end;

architecture rtl of top_level_tb is 
  constant period: time := 10ns;
  
  signal button_1, button_2: std_logic;
  signal led_1, led_2: std_logic;
begin
  uut: entity work.top_level
    port map (
      button_1 => button_1,
      button_2 => button_2,
      led_1    => led_1,
      led_2    => led_2
    );

  process begin
    button_1 <= '0';
    button_2 <= '0';
    wait for period;
    
    button_1 <= '0';
    button_2 <= '1';
    wait for period;
    
    button_1 <= '1';
    button_2 <= '1';
    wait for period;
    
    button_1 <= '1';
    button_2 <= '0';
    wait for period;
  end process;
end;
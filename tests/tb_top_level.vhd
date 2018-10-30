library ieee;
use ieee.std_logic_1164.all;

entity top_level_tb is end;

architecture rtl of top_level_tb is 
  constant period: time := 10ns;
  
  signal a: std_logic;
  signal b: std_logic;
  signal c: std_logic;
begin
  uut: entity work.top_level
    port map (
      a => a,
      b => b,
      c => c
    );

  process begin
    a <= '0';
    b <= '0';
    wait for period;
    
    a <= '0';
    b <= '1';
    wait for period;
    
    a <= '1';
    b <= '1';
    wait for period;
    
    a <= '1';
    b <= '0';
    wait for period;
  end process;
end;
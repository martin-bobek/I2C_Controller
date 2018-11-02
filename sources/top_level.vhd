library ieee;
use ieee.std_logic_1164.all;

entity top_level is
  port (
    clk     : in    std_logic;
    buttons : in    std_logic_vector(1 downto 0);
    leds    : out   std_logic_vector(1 downto 0);
    sda     : inout std_logic;
    scl     : inout std_logic
  );
end;

architecture rtl of top_level is
  signal sda_out, scl_out : std_logic;
begin
  i2c: entity work.i2c
    port map (
      clk     => clk,
      sda_in  => sda,
      sda_out => sda_out,
      scl_in  => scl,
      scl_out => scl_out
    );
  
  application: entity work.application
    port map (
      clk     => clk,
      buttons => buttons
    );
  
  sda <= '0' when (sda_out = '0') else 'Z';
  scl <= '0' when (scl_out = '0') else 'Z';
  
  leds <= sda_out & scl_out;
end;
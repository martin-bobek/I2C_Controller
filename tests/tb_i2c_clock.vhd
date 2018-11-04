library ieee;
use ieee.std_logic_1164.all;

entity tb_i2c_clock is end;

architecture rtl of tb_i2c_clock is
  constant clk_period : time    := 20ns;
  constant divs       : integer := 4;
  
  signal clk    : std_logic := '1';
  signal reset  : std_logic := '1';
  signal output : std_logic;
begin
  uut: entity work.i2c_clock
    generic map (
      divs => divs
    )
    port map (
      clk    => clk,
      reset  => reset,
      output => output
    );
    
    reset <= '0' after 5*clk_period/2;
    clk <= not clk after clk_period/2;
end;
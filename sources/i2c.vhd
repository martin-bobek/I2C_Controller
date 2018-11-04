library ieee;
use ieee.std_logic_1164.all;

entity i2c is
  port (
    clk     : in  std_logic;
    sda_in  : in  std_logic;
    sda_out : out std_logic;
    scl_in  : in  std_logic;
    scl_out : out std_logic
  );
end;

architecture rtl of i2c is
  signal slow_clk : std_logic;
  signal sda_i    : std_logic := '1';
begin
  i2c_clk: entity work.i2c_clock
    generic map (
      divs => 8
    )
    port map (
      clk    => clk,
      reset  => '0',
      output => slow_clk
    );
  
  process (clk) begin
    if rising_edge(clk) and (slow_clk = '1') then
      sda_i <= not sda_i;
    end if;
  end process;
  
  sda_out <= sda_i;
  scl_out <= '1';
end;
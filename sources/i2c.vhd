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
begin
  sda_out <= '1';
  scl_out <= '1';
end;
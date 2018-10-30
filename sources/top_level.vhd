library ieee;
use ieee.std_logic_1164.all;

entity top_level is 
  port (
    a: in  std_logic;
    b: in  std_logic;
    c: out std_logic
  );
end;

architecture rtl of top_level is
begin
  c <= a and b;
end;
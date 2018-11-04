  library ieee;
use ieee.std_logic_1164.all;

entity i2c_clock is
  generic (
    divs : integer
  );
  port (
    clk    : in  std_logic;
    reset  : in  std_logic;
    output : out std_logic
  );
end;

architecture rtl of i2c_clock is
  constant regs_reset : std_logic_vector(divs downto 1) := (1 => '0', others => '1');

  signal enables : std_logic_vector(divs + 1 downto 2);
  signal regs    : std_logic_vector(divs downto 1) := regs_reset;
begin
  process (clk, reset) begin
    if (reset = '1') then
      regs <= regs_reset;
    elsif rising_edge(clk) then
      regs(1) <= not regs(1);
      
      for i in enables'low to regs'high loop
        if (enables(i) = '1') then
          regs(i) <= not regs(i);
        end if;
      end loop;
    end if;
  end process;
  
  enables_loop: for i in enables'low to enables'high - 1 generate
    enables(i + 1) <= enables(i) and regs(i);
  end generate;
  
  enables(2) <= regs(1);
  output <= enables(enables'high);
end;
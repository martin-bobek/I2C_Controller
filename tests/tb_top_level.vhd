library ieee;
use ieee.std_logic_1164.all;

entity tb_top_level is end;

architecture rtl of tb_top_level is 
  constant period : time := 20ns;
  
  signal clk     : std_logic := '1';
  signal buttons : std_logic_vector(1 downto 0);
  signal leds    : std_logic_vector(1 downto 0);
  signal sda     : std_logic;
  signal scl     : std_logic;
begin
  uut: entity work.top_level
    port map (
      clk     => clk,
      buttons => buttons,
      leds    => leds,
      sda     => sda,
      scl     => scl
    );

  process begin
    buttons <= "00";
    wait for 5*period;
    
    buttons <= "01";
    wait for 5*period;
    
    buttons <= "11";
    wait for 5*period;
    
    buttons <= "10";
    wait for 5*period;
  end process;
  
  clk <= not clk after period/2;
end;
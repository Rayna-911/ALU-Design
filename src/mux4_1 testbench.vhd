library ieee;
use ieee.std_logic_1164.all;

entity mux4_1_tb is
end mux4_1_tb;

architecture arch of mux4_1_tb is
signal sel0_tb,sel1_tb,src00_tb,src01_tb,src10_tb,src11_tb,result_tb : std_logic;

begin
DUT: entity work.mux4_1
port map (sel0_tb,sel1_tb,src00_tb,src01_tb,src10_tb,src11_tb,result_tb);

process
begin
sel0_tb <= '0';
sel1_tb <= '0';
src00_tb <= '1';
src01_tb <= '0';
src10_tb <= '0';
src11_tb <= '0';
wait for 10 ns;

sel0_tb <= '1';
sel1_tb <= '1';
src00_tb <= '0';
src01_tb <= '0';
src10_tb <= '0';
src11_tb <= '1';
wait for 10 ns;

sel0_tb <= '0';
sel1_tb <= '1';
src00_tb <= '0';
src01_tb <= '0';
src10_tb <= '1';
src11_tb <= '0';
wait for 10 ns;

sel0_tb <= '1';
sel1_tb <= '0';
src00_tb <= '0';
src01_tb <= '1';
src10_tb <= '0';
src11_tb <= '0';
wait for 10 ns;

end process;
end arch;
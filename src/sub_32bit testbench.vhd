library ieee;
use ieee.std_logic_1164.all;

entity sub_32bit_tb is
end sub_32bit_tb;

architecture arch of sub_32bit_tb is
signal a_tb,b_tb: std_logic_vector (31 downto 0);
signal slt_tb,sltu_tb: std_logic;

begin
DUT: entity work.sub_32bit
port map (a_tb,b_tb,slt_tb,sltu_tb);

process
begin
a_tb <= "00000000000000001111000011110001";
b_tb <= "00000000000000000000000000001111";
wait for 10 ns;

a_tb <= "00000000000000001111000011110001";
b_tb <= "11111111111111111111111111110001";
wait for 10 ns;

a_tb <= "10000000000000001111000011110001";
b_tb <= "00000000000000000000000000001111";
wait for 10 ns;

a_tb <= "10000000000000001111000011110001";
b_tb <= "11111111111111111111111111110001";
wait for 10 ns;

end process;
end arch;
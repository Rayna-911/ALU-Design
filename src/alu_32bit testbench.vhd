library ieee;
use ieee.std_logic_1164.all;

entity alu_32bit_tb is
end alu_32bit_tb;

architecture arch of alu_32bit_tb is
signal a_tb,b_tb: std_logic_vector(31 downto 0);
signal sel0_tb,sel1_tb: std_logic;
signal result_tb: std_logic_vector (31 downto 0);
signal cout_tb:  std_logic;
signal overflow_tb:  std_logic;

begin
DUT: entity work.alu_32bit
port map (a_tb,b_tb,sel0_tb,sel1_tb,result_tb,cout_tb,overflow_tb);

-- sel0  sel1  operation
--  0      0      and
--  0      1      add
--  1      0      or
--  1      1      sub

process
begin
a_tb <= "00000000000000000000000000001111";
b_tb <= "10000000000000000000000000010000";
sel0_tb <= '0';
sel1_tb <= '0'; 
wait for 10 ns;

a_tb <= "00000000000000000000000000001111";
b_tb <= "10000000000000000000000000010000";
sel0_tb <= '0';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= "00000000000000000000000000001111";
b_tb <= "10000000000000000000000000010000";
sel0_tb <= '1';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= "00000000000000000000000000001111";
b_tb <= "10000000000000000000000000010000";
sel0_tb <= '1';
sel1_tb <= '1';
wait for 10 ns;


a_tb <= "11111111111111110000111111111111";
b_tb <= "11110000111100001111000011110000";
sel0_tb <= '0';
sel1_tb <= '0'; 
wait for 10 ns;

a_tb <= "11111111111111110000111111111111";
b_tb <= "11110000111100001111000011110000";
sel0_tb <= '0';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= "11111111111111110000111111111111";
b_tb <= "11110000111100001111000011110000";
sel0_tb <= '1';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= "11111111111111110000111111111111";
b_tb <= "11110000111100001111000011110000";
sel0_tb <= '1';
sel1_tb <= '1';
wait for 10 ns;


end process;
end arch;
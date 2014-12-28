library ieee;
use ieee.std_logic_1164.all;

entity onebit_fulladder_tb is
end onebit_fulladder_tb;

architecture arch of onebit_fulladder_tb is
signal a_tb,b_tb,cin_tb,sum_tb,cout_tb : std_logic;

begin
DUT: entity work.onebit_fulladder
port map(a_tb,b_tb,cin_tb,sum_tb,cout_tb);

process
begin
a_tb <= '0';
b_tb <= '0';
cin_tb <= '0';
wait for 10 ns;

a_tb <= '0';
b_tb <= '0';
cin_tb <= '1';
wait for 10 ns;

a_tb <= '0';
b_tb <= '1';
cin_tb <= '0';
wait for 10 ns;

a_tb <= '0';
b_tb <= '1';
cin_tb <= '1';
wait for 10 ns;


a_tb <= '1';
b_tb <= '0';
cin_tb <= '0';
wait for 10 ns;

a_tb <= '1';
b_tb <= '0';
cin_tb <= '1';
wait for 10 ns;


a_tb <= '1';
b_tb <= '1';
cin_tb <= '0';
wait for 10 ns;

a_tb <= '1';
b_tb <= '1';
cin_tb <= '1';
wait for 10 ns;

end process;
end arch;
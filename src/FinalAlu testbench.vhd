library ieee;
use ieee.std_logic_1164.all;

entity FinalAlu_tb is
end FinalAlu_tb;

architecture arch of FinalAlu_tb is
signal ctrl_tb: std_logic_vector(3 downto 0);
signal A_tb,B_tb: std_logic_vector(31 downto 0);
signal cout_tb, overflow_tb, ze_tb:  std_logic;
signal R_tb: std_logic_vector(31 downto 0); 

begin
DUT: entity work.alu
port map (ctrl_tb,A_tb,B_tb,cout_tb,overflow_tb,ze_tb,R_tb);

--ctrl0		ctrl1	ctrl2	ctrl3	operation
--  0		   0		   0		   0		   and
--	 0		   1		   0		   0		   add
--	 1		   0		   0		   0		   or
--	 1		   1		   0		   0		   sub
--	 x		   x		   0		   1		   slt
--	 x		   x		   1		   0		   sll
--	 x		   x		   1		   1		   sltu

process
begin

ctrl_tb <= "0000";
A_tb <= "00001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0010";
A_tb <= "10001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0010";
A_tb <= "00001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0010";
A_tb <= "10001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0001";
A_tb <= "00001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0011";
A_tb <= "00001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0011";
A_tb <= "00001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0011";
A_tb <= "10001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1000";
A_tb <= "00001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1000";
A_tb <= "10001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1000";
A_tb <= "10001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1000";
A_tb <= "00001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "0100";
A_tb <= "00001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1100";
A_tb <= "00001111000011110000111100001111";
B_tb <= "00000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1100";
A_tb <= "00001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;

ctrl_tb <= "1100";
A_tb <= "10001111000011110000111100001111";
B_tb <= "10000000000000000000000000000100";
wait for 10 ns;
end process;
end arch;
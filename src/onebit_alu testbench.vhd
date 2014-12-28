library ieee;
use ieee.std_logic_1164.all;

entity onebit_alu_tb is
end onebit_alu_tb;

architecture arch of onebit_alu_tb is
signal a_tb,b_tb,invert_tb,cin_tb,sel0_tb,sel1_tb,result_tb,cout_tb: std_logic;

begin 
DUT: entity work.onebit_alu
port map(a_tb,b_tb,invert_tb,cin_tb,sel0_tb,sel1_tb,result_tb,cout_tb);

process
begin
a_tb <= '0';
b_tb <= '0';
invert_tb <='0'; --and
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '0';
b_tb <= '0';
invert_tb <='0'; --add
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '0';
b_tb <= '0';
invert_tb <='1'; --or
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '0';
b_tb <= '0';
invert_tb <='1'; --sub
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '0';
b_tb <= '1';
invert_tb <='0'; --and
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '0';
b_tb <= '1';
invert_tb <='0'; --add
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '0';
b_tb <= '1';
invert_tb <='1'; --or
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '0';
b_tb <= '1';
invert_tb <='1'; --sub
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '1';
b_tb <= '0';
invert_tb <='0'; --and
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '1';
b_tb <= '0';
invert_tb <='0'; --add
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '1';
b_tb <= '0';
invert_tb <= '1'; --or
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '1';
b_tb <= '0';
invert_tb <='1'; --sub
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '1';
b_tb <= '1';
invert_tb <='0'; --and
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '1';
b_tb <= '1';
invert_tb <='0'; --add
cin_tb <= '0';
sel0_tb <= '0';
sel1_tb <= '1';
wait for 10 ns;

a_tb <= '1';
b_tb <= '1';
invert_tb <='1'; --or
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '0';
wait for 10 ns;

a_tb <= '1';
b_tb <= '1';
invert_tb <='1'; --sub
cin_tb <= '1';
sel0_tb <= '1';
sel1_tb <= '1';

wait for 10 ns;

end process;
end arch;

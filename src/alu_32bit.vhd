library ieee;
use ieee.std_logic_1164.all;

entity alu_32bit is
port(
a,b: in std_logic_vector(31 downto 0);
sel0,sel1: in std_logic;
result: out std_logic_vector (31 downto 0);
cout: out std_logic;
overflow: out std_logic
);
end alu_32bit;

-- sel0  sel1  operation
--  0      0      and
--  0      1      add
--  1      0      or
--  1      1      sub

architecture struct of alu_32bit is
signal r,cout_mid: std_logic_vector(31 downto 0);
signal overflow_mid: std_logic;

begin
onebit_alu1: entity work.onebit_alu
port map(a(0),b(0),sel0,sel0,sel0,sel1,r(0),cout_mid(0));

alu: for n in 31 downto 1 generate
        onebit_alu: entity work.onebit_alu 
			port map(a(n), b(n), sel0, cout_mid(n-1), sel0, sel1, r(n), cout_mid(n) );
     end generate;

result <= r;

cout <= cout_mid(31);
 
xor1: entity work.xor_gate
port map(cout_mid(30), cout_mid(31), overflow_mid);
overflow <= overflow_mid;

end struct;
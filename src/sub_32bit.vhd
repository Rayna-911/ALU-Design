library ieee;
use ieee.std_logic_1164.all;

entity sub_32bit is
port(
a,b: in std_logic_vector(31 downto 0);
slt,sltu: out std_logic
);
end sub_32bit;

architecture struct of sub_32bit is
signal result_mid:std_logic_vector(31 downto 0);
signal cout_mid,overflow_mid:std_logic;

begin
sub: entity work.alu_32bit
port map(a,b,'1','1',result_mid,cout_mid,overflow_mid);

xor1: entity work.xor_gate
port map(overflow_mid, result_mid(31),slt);

not1: entity work.not_gate
port map(cout_mid,sltu);
  
end struct;
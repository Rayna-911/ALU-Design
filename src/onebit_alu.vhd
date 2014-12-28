library ieee;
use ieee.std_logic_1164.all;

entity onebit_alu is
port(
a,b,invert,cin,sel0,sel1: in std_logic;
result,cout: out std_logic
);
end onebit_alu;

architecture struct of onebit_alu is
signal bout, result_and, result_or, result_FullAdder : std_logic;
begin
xor1: entity work.xor_gate
port map(b,invert,bout);

and1: entity work.and_gate
port map(a,b,result_and);

or1: entity work.or_gate
port map(a,b,result_or);

FullAdder1: entity work.onebit_fulladder
port map(a,bout,cin,result_FullAdder,cout);

mux41: entity work.mux4_1
port map(sel0, sel1, result_and, result_or, result_FullAdder, result_FullAdder, result);
end struct;
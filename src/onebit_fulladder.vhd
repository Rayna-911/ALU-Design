library ieee;
use ieee.std_logic_1164.all;

entity onebit_fulladder is
port(
a,b,cin: in std_logic;
sum,cout: out std_logic
);
end onebit_fulladder;

architecture struct of onebit_fulladder is
signal x,y,z,m,n: std_logic;
begin
xor1: entity work.xor_gate
port map(a,b,x);

xor2: entity work.xor_gate
port map(x,cin,sum);

and1: entity work.and_gate
port map(cin,a,y);

and2: entity work.and_gate
port map(a,b,z);

and3: entity work.and_gate
port map(cin,b,m);

or1: entity work.or_gate
port map(y,z,n);

or2: entity work.or_gate
port map(m,n,cout);
end struct;
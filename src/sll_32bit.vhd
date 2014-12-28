library ieee;
use ieee.std_logic_1164.all;

entity sll_32bit is
port(
a,b: in std_logic_vector (31 downto 0);
result: out std_logic_vector (31 downto 0)
);
end entity;

architecture struct of sll_32bit is
signal r0,r1,r2,r3,r4: std_logic_vector(31 downto 0);

begin
mux0: entity work.mux
port map(b(0),a(0), '0', r0(0));

mux0N: for n in 31 downto 1 generate
	mux0shift: entity work.mux
	port map(b(0),a(n),a(n-1),r0(n));
	end generate;

mux1: for n in 1 downto 0 generate
	mux1fill0: entity work.mux
	port map(b(1),r0(n),'0',r1(n));
	end generate;
	
mux1N: for n in 31 downto 2 generate
    mux1shift: entity work.mux 
	port map(b(1), r0(n), r0(n-2), r1(n));
    end generate;

mux2: for n in 3 downto 0 generate
	mux2fill0: entity work.mux
	port map(b(2),r1(n),'0',r2(n));
	end generate;
	
mux2N: for n in 31 downto 4 generate
    mux2shift: entity work.mux 
	port map(b(2), r1(n), r1(n-4), r2(n));
    end generate;

mux3: for n in 7 downto 0 generate
	mux3fill0: entity work.mux
	port map(b(3),r2(n),'0',r3(n));
	end generate;
	
mux3N: for n in 31 downto 8 generate
    mux3shift: entity work.mux 
	port map(b(3), r2(n), r2(n-8), r3(n));
    end generate;
	
mux4: for n in 15 downto 0 generate
	mux4fill0: entity work.mux
	port map(b(4),r3(n),'0',r4(n));
	end generate;

mux4N: for n in 31 downto 16 generate
    mux2shift: entity work.mux 
	port map(b(4), r3(n), a(n-16), r4(n));
    end generate;

mux5: for n in 31 downto 0 generate
	mux5fill0: entity work.mux
	port map(b(5),r4(n),'0',result(n));
	end generate;
end struct;
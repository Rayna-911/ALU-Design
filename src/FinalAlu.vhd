library ieee;
use ieee.std_logic_1164.all;

entity alu is
  port (
    ctrl  : in std_logic_vector(3 downto 0);
    A     : in std_logic_vector(31 downto 0);
    B     : in std_logic_vector(31 downto 0);
    cout  : out std_logic;  -- '1' -> carry out
    ovf   : out std_logic;  -- '1'€™ -> overflow 
    ze    : out std_logic;  -- '€˜1'€™ -> is zero
    R     : out std_logic_vector(31 downto 0) -- result
  );
end alu;

architecture struct of alu is
signal result_alu,result_sll,result:std_logic_vector(31 downto 0);
signal slt,sltu: std_logic;
signal zero1: std_logic_vector(15 downto 0);
signal zero2: std_logic_vector(7 downto 0);
signal zero3: std_logic_vector(3 downto 0);
signal zero4: std_logic_vector(1 downto 0);

begin
alu: entity work.alu_32bit
port map(A,B,ctrl(0),ctrl(1),result_alu,cout,ovf);

sll_32bit: entity work.sll_32bit
port map(A,B,result_sll);
  
sub_32bit: entity work.sub_32bit
port map(A,B,slt,sltu);

mux1: entity work.mux4_1
port map(ctrl(2),ctrl(3),result_alu(0),result_sll(0),slt,sltu,result(0));

--ctrl2 ctrl3
--00:alu
--01:slt
--10:sll
--11:sltu

mux1N: for n in 31 downto 1 generate
	mux1full: entity work.mux4_1
	port map(ctrl(2),ctrl(3),result_alu(n),result_sll(n),'0','0',result(n));
    end generate;
	
R <= result;

or1: for n in 15 downto 0 generate
	or_zero1: entity work.or_gate
	port map(result(2*n+1),result(2*n),zero1(n));
	end generate;
	
or2: for n in 7 downto 0 generate
	or_zero2: entity work.or_gate
	port map(zero1(2*n+1),zero1(2*n),zero2(n));
	end generate;
	
or3: for n in 3 downto 0 generate
	or_zero3: entity work.or_gate
	port map(zero2(2*n+1),zero2(2*n),zero3(n));
	end generate;

or4: for n in 1 downto 0 generate
	or_zero4: entity work.or_gate
	port map(zero3(2*n+1),zero3(2*n),zero4(n));
	end generate;
	
nor5: entity work.nor_gate
port map(zero4(0),zero4(1),ze);

end struct;
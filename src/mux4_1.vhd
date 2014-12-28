library ieee;
use ieee.std_logic_1164.all;

entity mux4_1 is 
port(sel0,sel1,src00,src01,src10,src11 : in std_logic; 
result : out std_logic
);
end entity;

architecture struct of mux4_1 is
signal mux0,mux1 : std_logic; 
begin
mux_1: entity work.mux
port map(sel0, src00, src01, mux0);

mux_2: entity work.mux
port map(sel0, src10, src11, mux1);

mux_3: entity work.mux
port map(sel1, mux0, mux1, result);
end struct; 

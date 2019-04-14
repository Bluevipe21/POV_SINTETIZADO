----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:29 04/13/2019 
-- Design Name: 
-- Module Name:    sensor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sensor is
    Port ( sensor : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end sensor;

architecture Behavioral of sensor is

begin
process(sensor)
begin
	if(sensor='0')then
		salida<='1';
	else
		salida<='0';
	end if;
end process;

end Behavioral;


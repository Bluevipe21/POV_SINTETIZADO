----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:03 04/05/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

			
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
	Port(	
			  Clk:		in		std_logic;
			  salida_color: out std_logic_vector(2 downto 0);
			  led : out  std_logic_vector(9 downto 0);
			  sensor:in std_logic
	);
end main;

architecture Behavioral of main is
	
--Declaracion de maquinas de estado

type memoria is array (0 to 2) of std_logic_vector(9 downto 0);
type colores is array (0 to 3) of std_logic_vector(2 downto 0);

--variables para procesos
signal Conteo:integer:=0;
signal cont:integer range 0 to 1109:=0;
signal grado:natural:=0;
signal conteo_color:integer:=0;
signal caracter1,caracter2,caracter3,caracter4:memoria;

constant color:colores:=(0=>"100",
							  1=>"010",
						     2=>"001",
						     3=>"011");
							  
constant A:memoria:=(0=>"1111111111",--Primer tanda
						 1=>"1111111111",
						 2=>"1111111111");
						 
constant L:memoria:=(0=>"1111111111",
							1=>"1111111111",
							2=>"1100000000");
						
constant uno:memoria:=(
							0=>"1100000000",
							1=>"1100001000",
							2=>"1100001100");
							
constant mas:memoria:=(
							0=>"0000110000",
							1=>"0000110000",
							2=>"0000110000");
												
begin

reloj_general:process(clk)
begin
	if(rising_edge(clk))then
		if(Conteo<9*11999999)then
			Conteo<=Conteo+1;
			caracter1<=A;
			caracter2<=L;
			caracter3<=uno;
			caracter4<=mas;
			if(conteo_color>3)then
				conteo_color<=0;
			end if;
			salida_color<=color(conteo_color);
		else
			Conteo<=0;
			conteo_color<=conteo_color+1;
		end if;
	end if;
end process;

divider:process(clk,sensor)
begin
	if(clk'event and clk = '1')then
		if(cont=1108)then
			cont<=0;
			grado<=grado+1;
			if(sensor='0')then
				grado<=0;
			end if;
		else
			cont<=cont+1;
		end if;
	end if;
end process;
--Proceso para el control de la maquina de estado del mensaje a mostrar
display:process(grado,caracter1,caracter2,caracter3,caracter4)
begin
	if(grado>0 and grado<60)then--Caracter 1
		led<=caracter1(0);
	elsif(grado>60 and grado<120)then
		led<=caracter1(1);
	elsif(grado>120 and grado<180)then
		led<=caracter1(2);
	elsif(grado>280 and grado<340)then--Caracter 2
		led<=caracter2(0);
	elsif(grado>340 and grado<400)then
		led<=caracter2(1);
	elsif(grado>400 and grado<460)then
		led<=caracter2(2);
	elsif(grado>560 and grado<620)then--Caracter 3
		led<=caracter3(0);
	elsif(grado>620 and grado<680)then
		led<=caracter3(1);
	elsif(grado>680 and grado<740)then
		led<=caracter3(2);
	elsif(grado>840 and grado<900)then--Caracter 4
		led<=caracter4(0);
	elsif(grado>900 and grado<960)then
		led<=caracter4(1);
	elsif(grado>960 and grado<1020)then
		led<=caracter4(2);
	else
		led<="0000000000";
	end if;
end process;

end Behavioral;

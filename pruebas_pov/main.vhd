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
type colores is array (0 to 4) of std_logic_vector(2 downto 0);
type mensaje is array(0 to 42) of memoria;
--variables para procesos
signal Conteo:integer:=0;
signal cont:integer range 0 to 1109:=0;
signal grado:natural:=0;
signal conteo_color:integer:=0;
signal conteo_caracteres:integer:=0;

constant color:colores:=(0=>"100",
							  1=>"010",
						     2=>"001",
						     3=>"011",
							  4=>"110");
							  
constant A:memoria:=(0=>"1111111111",--Primer tanda
						 1=>"1111111111",
						 2=>"1111111111");
						 
constant L:memoria:=(0=>"1111111111",
							1=>"1000000000",
							2=>"1000000000");
						
constant uno:memoria:=(
							0=>"1100000100",
							1=>"1111111111",
							2=>"1100000000");
							
constant mas:memoria:=(
							0=>"0000110000",
							1=>"0011111100",
							2=>"0000110000");

constant igual:memoria:=(--Segunda tanda
							0=>"0000101000",
							1=>"0000101000",
							2=>"0000101000");
							
constant division:memoria:=(
							0=>"0000110000",
							1=>"0100110010",
							2=>"0000110000");
							
constant siete:memoria:=(
							0=>"0000000011",
							1=>"0000000011",
							2=>"1111111111");
							
constant cero:memoria:=(
							0=>"1111111111",
							1=>"1100000011",
							2=>"1111111111");
							
constant n:memoria:=(--tercera tanda
							0=>"0111111111",
							1=>"0000000011",
							2=>"1111111111");
							
constant c:memoria:=(
							0=>"1111111111",
							1=>"1100000011",
							2=>"1100000011");

constant t:memoria:=(
							0=>"0111111111",
							1=>"1000001000",
							2=>"0100001000");		

constant e:memoria:=(
							0=>"1111111111",
							1=>"1100110011",
							2=>"1100110011");

constant p:memoria:=(--cuarta tanda
							0=>"0000000110",
							1=>"0000000101",
							2=>"1111111111");

constant d:memoria:=(
							0=>"0100000000",
							1=>"1010000000",
							2=>"1111111111");		

constant i:memoria:=(
							0=>"1100000011",
							1=>"1111111111",
							2=>"1100000011");			

constant j:memoria:=(
							0=>"1100000011",
							1=>"1111111111",
							2=>"0000000011");	

constant cuatro:memoria:=(--quinta tanda
							0=>"0000000111",
							1=>"0000000100",
							2=>"1111111111");

constant dos:memoria:=(
							0=>"1111100001",
							1=>"1000100001",
							2=>"1100111111");		

constant seis:memoria:=(
							0=>"1111111111",
							1=>"1100100011",
							2=>"1111100011");			

constant ocho:memoria:=(
							0=>"1111111111",
							1=>"1100110011",
							2=>"1111111111");
							
constant ene:memoria:=(--sexta tanda
							0=>"1111110011",
							1=>"0000110011",
							2=>"1111110011");

constant f:memoria:=(
							0=>"1111111111",
							1=>"0000011011",
							2=>"0000011011");		

constant x:memoria:=(
							0=>"0001001000",
							1=>"0000110000",
							2=>"0001001000");			

constant g:memoria:=(
							0=>"1111111111",
							1=>"1100000011",
							2=>"1111110011");

constant h:memoria:=(--septima tanda
							0=>"1111111111",
							1=>"0000110000",
							2=>"1111111111");

constant jmin:memoria:=(
							0=>"1100000000",
							1=>"1111110011",
							2=>"0000000000");		

constant z:memoria:=(
							0=>"0011001100",
							1=>"0011101100",
							2=>"0011011100");			

constant flecha:memoria:=(
							0=>"1100000010",
							1=>"1111111111",
							2=>"1100000010");

constant dos_puntos:memoria:=(--octava tanda
							0=>"0100010000",
							1=>"1010101000",
							2=>"0100010000");

constant coma:memoria:=(
							0=>"0000000100",
							1=>"0000101010",
							2=>"0000111100");		

constant cuadrado:memoria:=(
							0=>"0001111000",
							1=>"0001111000",
							2=>"0001111000");			

constant rectangulo:memoria:=(
							0=>"1111111111",
							1=>"1111111111",
							2=>"1111111111");

constant emin:memoria:=(--novena tanda
							0=>"0011111111",
							1=>"0011001001",
							2=>"0011001111");

constant flor:memoria:=(
							0=>"0000110000",
							1=>"1111001111",
							2=>"0000110000");		

constant dmay:memoria:=(
							0=>"0001111000",
							1=>"0001001000",
							2=>"0000100000");			

constant triangulo:memoria:=(
							0=>"0111111110",
							1=>"0100000001",
							2=>"0111111110");							
							
constant u:memoria:=(--decima tanda
							0=>"1111111111",
							1=>"1100000000",
							2=>"1111111111");

constant casita:memoria:=(
							0=>"0011111110",
							1=>"0011000001",
							2=>"0011111110");		

constant cinco:memoria:=(
							0=>"1100111111",
							1=>"1100110011",
							2=>"1111110011");			

constant encendido:memoria:=(
							0=>"0110000000",
							1=>"0110011110",
							2=>"0110000000");
							
constant diagonal:memoria:=(--onceava tanda
							0=>"0000001000",
							1=>"0000110000",
							2=>"0001000000");

constant llave:memoria:=(
							0=>"0000000010",
							1=>"0111111101",
							2=>"0010000010");		

constant hmin:memoria:=(
							0=>"1111111111",
							1=>"0000110000",
							2=>"1111110000");			
						

signal caracteres:mensaje:=(0=>A,
					1=>L,
					2=>uno,
					3=>mas,
					4=>igual,
					5=>division,
					6=>siete,
					7=>cero,
					8=>n,
					9=>c,
					10=>t,
					11=>e,
					12=>p,
					13=>d,
					14=>i,
					15=>j,
					16=>cuatro,
					17=>dos,
					18=>seis,
					19=>ocho,
					20=>ene,
					21=>f,
					22=>x,
					23=>g,
					24=>h,
					25=>jmin,
					26=>z,
					27=>flecha,
					28=>dos_puntos,
					29=>coma,
					30=>cuadrado,
					31=>rectangulo,
					32=>flor,
					33=>emin,
					34=>dmay,
					35=>triangulo,
					36=>u,
					37=>casita,
					38=>cinco,
					39=>encendido,
					40=>diagonal,
					41=>llave,
					42=>hmin
					);
signal caracter1,caracter2,caracter3,caracter4:memoria;												
begin

reloj_general:process(clk)
begin
	if(rising_edge(clk))then
		if(Conteo<9*11999999)then
			Conteo<=Conteo+1;
			if(conteo_caracteres=38)then
				conteo_caracteres<=0;
			end if;
			if(conteo_color>=4)then
				conteo_color<=0;
			end if;
			salida_color<=color(conteo_color);
			caracter1<=caracteres(conteo_caracteres);
			caracter2<=caracteres(conteo_caracteres+1);
			caracter3<=caracteres(conteo_caracteres+2);
			caracter4<=caracteres(conteo_caracteres+3);
		elsif(Conteo>6*11999999 and Conteo<77999993)then
			caracter1(0)<="0000000000";
			caracter2(0)<="0000000000";
			caracter3(0)<="0000000000";
			caracter4(0)<="0000000000";
		elsif(Conteo>77999993 and Conteo<83999993)then
			caracter1(1)<="0000000000";
			caracter2(1)<="0000000000";
			caracter3(1)<="0000000000";
			caracter4(1)<="0000000000";
		elsif(Conteo>83999993 and Conteo<89999993)then
			caracter1(2)<="0000000000";
			caracter2(2)<="0000000000";
			caracter3(2)<="0000000000";
			caracter4(2)<="0000000000";
		else
			Conteo<=0;
			conteo_color<=conteo_color+1;
			conteo_caracteres<=conteo_caracteres+1;
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

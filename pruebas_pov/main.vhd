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
			  led : out  std_logic_vector(5 downto 0);
			  movled:out std_logic_vector(3 downto 0);
			  sensor:in std_logic
	);
end main;

architecture Behavioral of main is
	
--Declaracion de maquinas de estado
type memoria is array (0 to 3) of std_logic_vector(5 downto 0);
type colores is array (0 to 4) of std_logic_vector(2 downto 0);
type mensaje is array(0 to 41) of memoria;
type efecto is array (0 to 1) of std_logic_vector(3 downto 0);
--variables para procesos
signal Conteo:integer:=0;
signal cont:integer range 0 to 1109:=0;
signal grado:natural:=0;
signal conteo_color:integer:=0;
signal conteo_caracteres:integer:=0;
signal move1,move2:std_logic_vector(3 downto 0);
constant mover:efecto:=(0=>"1001",
								1=>"0110");

constant color:colores:=(0=>"100",
							  1=>"010",
						     2=>"001",
						     3=>"011",
							  4=>"110");
							  
constant A:memoria:=(--Primer tanda
						 0=>"111111",
						 1=>"001011",
						 2=>"001011",
						 3=>"111111");
						 
constant L:memoria:=(
						 0=>"100000",
						 1=>"100000",
						 2=>"100000",
						 3=>"111111");
						
constant uno:memoria:=(
							0=>"000100",
							1=>"100110",
							2=>"111111",
							3=>"100000");
							
constant mas:memoria:=(
							0=>"001100",
							1=>"111111",
							2=>"111111",
							3=>"001100");

constant igual:memoria:=(--Segunda tanda
							0=>"110011",
							1=>"110011",
							2=>"110011",
							3=>"110011");
							
constant division:memoria:=(
							0=>"001100",
							1=>"101101",
							2=>"101101",
							3=>"001100");
							
constant siete:memoria:=(
							0=>"000001",
							1=>"000001",
							2=>"000001",
							3=>"111111");
							
constant cero:memoria:=(
							0=>"111111",
							1=>"100001",
							2=>"100001",
							3=>"111111");
							
constant n:memoria:=(--tercera tanda
							0=>"111111",
							1=>"000001",
							2=>"000001",
							3=>"111111");
							
constant c:memoria:=(
							0=>"100001",
							1=>"100001",
							2=>"100001",
							3=>"111111");

constant t:memoria:=(
							0=>"000000",
							1=>"000001",
							2=>"111111",
							3=>"000001");		

constant e:memoria:=(
							0=>"100111",
							1=>"100101",
							2=>"100101",
							3=>"111111");

constant p:memoria:=(--cuarta tanda
							0=>"000010",
							1=>"000101",
							2=>"000101",
							3=>"111111");

constant d:memoria:=(
							0=>"010000",
							1=>"101000",
							2=>"101000",
							3=>"111111");		

constant i:memoria:=(
							0=>"000000",
							1=>"000000",
							2=>"111101",
							3=>"000000");			

constant j:memoria:=(
							0=>"000000",
							1=>"100000",
							2=>"100000",
							3=>"111101");	

constant cuatro:memoria:=(--quinta tanda
							0=>"000111",
							1=>"000101",
							2=>"000101",
							3=>"111111");

constant dos:memoria:=(
							0=>"001001",
							1=>"001101",
							2=>"001011",
							3=>"001001");		

constant seis:memoria:=(
							0=>"111111",
							1=>"101001",
							2=>"101001",
							3=>"111001");			

constant ocho:memoria:=(
							0=>"111111",
							1=>"101101",
							2=>"101101",
							3=>"111111");
							
constant ene:memoria:=(--sexta tanda
							0=>"111111",
							1=>"000001",
							2=>"000001",
							3=>"111111");

constant f:memoria:=(
							0=>"111111",
							1=>"000101",
							2=>"000101",
							3=>"000101");		

constant x:memoria:=(
							0=>"001001",
							1=>"000110",
							2=>"000110",
							3=>"001001");			

constant g:memoria:=(
							0=>"111111",
							1=>"100001",
							2=>"101001",
							3=>"111001");

constant h:memoria:=(--septima tanda
							0=>"111111",
							1=>"001100",
							2=>"001100",
							3=>"111111");

constant jmin:memoria:=(
							0=>"000000",
							1=>"100001",
							2=>"111111",
							3=>"000001");		

constant z:memoria:=(
							0=>"000000",
							1=>"110001",
							2=>"101001",
							3=>"100111");			

constant flecha:memoria:=(
							0=>"000000",
							1=>"100010",
							2=>"111111",
							3=>"100010");

constant dos_puntos:memoria:=(--octava tanda
							0=>"000000",
							1=>"010010",
							2=>"101101",
							3=>"010010");

constant coma:memoria:=(
							0=>"000000",
							1=>"100010",
							2=>"100101",
							3=>"111111");		

constant cuadrado:memoria:=(
							0=>"001111",
							1=>"001001",
							2=>"001111",
							3=>"000000");			

constant rectangulo:memoria:=(
							0=>"001111",
							1=>"001001",
							2=>"001001",
							3=>"001111");

constant emin:memoria:=(--novena tanda
							0=>"111111",
							1=>"100101",
							2=>"100101",
							3=>"100111");

constant flor:memoria:=(
							0=>"001100",
							1=>"101101",
							2=>"101101",
							3=>"001100");		

constant dmay:memoria:=(
							0=>"111110",
							1=>"100010",
							2=>"010100",
							3=>"001000");			

constant triangulo:memoria:=(
							0=>"110000",
							1=>"101111",
							2=>"101111",
							3=>"110000");							
							
constant u:memoria:=(--decima tanda
							0=>"111111",
							1=>"100000",
							2=>"100000",
							3=>"111111");

constant casita:memoria:=(
							0=>"000000",
							1=>"111100",
							2=>"100010",
							3=>"111100");		

constant cinco:memoria:=(
							0=>"100111",
							1=>"100101",
							2=>"100101",
							3=>"111101");			

constant encendido:memoria:=(
							0=>"000000",
							1=>"010000",
							2=>"101011",
							3=>"010000");
							
constant diagonal:memoria:=(--onceava tanda
							0=>"001000",
							1=>"000100",
							2=>"000010",
							3=>"000001");

constant llave:memoria:=(
							0=>"000000",
							1=>"010010",
							2=>"101111",
							3=>"010000");				
						

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
					41=>llave
					);
signal caracter1,caracter2,caracter3,caracter4:memoria;
										
begin

reloj_general:process(clk)
begin
	if(rising_edge(clk))then
		if(Conteo<8*11999999)then
			Conteo<=Conteo+1;
			if(conteo_caracteres=37)then
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
		elsif(Conteo>6*11999999 and Conteo<7*11999999)then
			move1<=mover(0);
			move2<=mover(1);
		elsif(Conteo>7*11999999 and Conteo<8*11999999)then
			move1<=mover(1);
			move2<=mover(0);
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
display:process(grado,caracter1,caracter2,caracter3,caracter4,move1,move2)
begin
	if(grado>0 and grado<45)then--Caracter 1
		led<=caracter1(0);
		movled<=move1;
	elsif(grado>45 and grado<90)then
		led<=caracter1(1);
		movled<=move2;
	elsif(grado>90 and grado<135)then
		led<=caracter1(2);
	elsif(grado>135 and grado<180)then
		led<=caracter1(3);
	elsif(grado>280 and grado<325)then--Caracter 2
		led<=caracter2(0);
	elsif(grado>325 and grado<370)then
		led<=caracter2(1);
	elsif(grado>370 and grado<415)then
		led<=caracter2(2);
	elsif(grado>415 and grado<460)then
		led<=caracter2(3);
	elsif(grado>560 and grado<605)then--Caracter 3
		led<=caracter3(0);
	elsif(grado>605 and grado<650)then
		led<=caracter3(1);
	elsif(grado>650 and grado<695)then
		led<=caracter3(2);
	elsif(grado>695 and grado<740)then
		led<=caracter3(3);
	elsif(grado>840 and grado<885)then--Caracter 4
		led<=caracter4(0);
	elsif(grado>885 and grado<930)then
		led<=caracter4(1);
	elsif(grado>930 and grado<975)then
		led<=caracter4(2);
	elsif(grado>975 and grado<1020)then
		led<=caracter4(3);
	else
		led<="000000";
		movled<="0000";
	end if;
end process;

end Behavioral;

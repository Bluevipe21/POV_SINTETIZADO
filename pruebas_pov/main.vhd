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
			  movled:out std_logic_vector(2 downto 0);
			  sensor:in std_logic
	);
end main;

architecture Behavioral of main is
	
--Declaracion de maquinas de estado
type memoria is array (0 to 3) of std_logic_vector(5 downto 0);
type colores is array (0 to 4) of std_logic_vector(2 downto 0);
type mensaje is array(0 to 49) of memoria;
--variables para procesos

signal counting: integer range 0 to 12000;
signal flag:	std_logic;
signal contador:natural;
signal unidades:	integer range 0 to 9:=0;
signal decenas:	integer range 0 to 9:=0;
signal centenas:	integer range 0 to 9:=0;

signal Conteo:integer:=0;
signal cont:integer range 0 to 1109:=0;
signal grado:natural:=0;
signal conteo_color:integer:=0;
signal conteo_caracteres:integer:=0;


constant color:colores:=(0=>"001",
								1=>"011",
								2=>"100",
								3=>"110",
								4=>"011");
							  
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
							0=>"000000",
							1=>"100000",
							2=>"111111",
							3=>"100010");
							
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
							0=>"111111",
							1=>"000001",
							2=>"000001",
							3=>"000000");
							
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
							1=>"111101",
							2=>"100000",
							3=>"100000");	

constant cuatro:memoria:=(--quinta tanda
							0=>"111111",
							1=>"000100",
							2=>"000100",
							3=>"000111");

constant dos:memoria:=(
							0=>"100111",
							1=>"100101",
							2=>"100101",
							3=>"111101");		

constant seis:memoria:=(
							0=>"111001",
							1=>"101001",
							2=>"101001",
							3=>"111111");			

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
							0=>"111001",
							1=>"101001",
							2=>"100001",
							3=>"111111");

constant h:memoria:=(--septima tanda
							0=>"111111",
							1=>"001100",
							2=>"001100",
							3=>"111111");

constant jmin:memoria:=(
							0=>"000001",
							1=>"111111",
							2=>"100001",
							3=>"100000");		
			

constant flecha:memoria:=(
							0=>"000000",
							1=>"100010",
							2=>"111111",
							3=>"100010");

constant z:memoria:=(--octava tanda
							0=>"100011",
							1=>"100101",
							2=>"101001",
							3=>"110001");

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
							0=>"001100",
							1=>"010010",
							2=>"100001",
							3=>"111111");			
						
							
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
							0=>"111101",
							1=>"100101",
							2=>"100101",
							3=>"100111");			

constant r:memoria:=(
							0=>"000000",
							1=>"111111",
							2=>"000010",
							3=>"000010");
							
constant tres:memoria:=(--Onceava tanda
							0=>"111111",
							1=>"101101",
							2=>"101101",
							3=>"000000");
constant nueve:memoria:=(
							0=>"111111",
							1=>"000101",
							2=>"000101",
							3=>"000010");

signal caracteres:mensaje:=(0=>i,--Arreglo que contiene los caracteres en el orden a mostrar
					1=>n,
					2=>i,
					3=>c,
					4=>i,
					5=>cero,
					6=>dmay,
					7=>e,
					8=>c,
					9=>cero,
					10=>n,
					11=>t,
					12=>A,
					13=>dmay,
					14=>cero,
					15=>r,
					16=>cero,
					17=>uno,
					18=>dos,
					19=>tres,
					20=>cuatro,
					21=>cinco,
					22=>seis,
					23=>siete,
					24=>ocho,
					25=>nueve,
					26=>e,
					27=>L,
					28=>e,
					29=>c,
					30=>t,
					31=>r,
					32=>cero,
					33=>n,
					34=>i,
					35=>c,
					36=>A,
					37=>tres,
					38=>u,
					39=>division,
					40=>casita,
					41=>flor,
					42=>emin,
					43=>rectangulo,
					44=>cuadrado,
					45=>coma,
					46=>g,
					47=>flecha,
					48=>p,
					49=>j
					);
signal caracter1,caracter2,caracter3,caracter4:memoria;
										
begin

reloj_general:process(clk)
begin
	if(rising_edge(clk))then
		if(Conteo<8*11999999)then--Cada 8 segundos cambia de letra y color
			Conteo<=Conteo+1;
			if(Conteo>5*11999999 and Conteo<6*11999999)then
				movled<="111";
			elsif(Conteo>6*11999999 and Conteo<7*11999999)then
				movled<="110";
			elsif(Conteo>7*11999999 and Conteo<8*11999998)then
				movled<="100";
			else
				movled<="000";
			end if;
			if(conteo_caracteres=48)then
				conteo_caracteres<=0;
			end if;
			if(conteo_color>=4)then
				conteo_color<=0;
			end if;
			salida_color<=color(conteo_color);--conteo_color es el encargado de señalar que color mostrar
			caracter1<=caracteres(conteo_caracteres);--conteo_caracteres es el encargado de ir en orden mostrando caracteres
			caracter2<=caracteres(conteo_caracteres+1);
		else
			Conteo<=0;
			conteo_color<=conteo_color+1;
			conteo_caracteres<=conteo_caracteres+1;
		end if;
	end if;
end process;


frecuenciometro:	process(clk,sensor)--Mostrar la frecuencia a la que se mueve y despliega los caracteres
		begin
		if(rising_edge(clk)) then
					if(counting = 2999) then
						counting <= 0;
						if(sensor = '1') then
							flag <= '1';
								if (contador>12*11999999) then
								flag<='0';
							else
							contador<=contador;
							end if;
							
						end if;
					else
						counting <= counting + 1;
						contador<=contador+1;
					end if;
					
					if(sensor = '0' and flag = '1') then
						flag <= '0';
						if(unidades <= 8) then
							unidades <= unidades + 1;
						else
							unidades <= 0;
							
							if(decenas <= 8) then
								decenas <= decenas + 1;
							else
								decenas <= 0;
								
								if(centenas <= 8) then
									centenas <= centenas + 1;
								else
									unidades <= 0;
									decenas <= 0;
									centenas <= 0;
								end if;
							end if;
						end if;
					end if;
		end if;
end process;
--Proceso para mostrar las unidades y decenas medidas por frecuenciometro
preparar_numeros:process(unidades,decenas)
begin
	case(unidades)is
		when 0 =>
			caracter3<=cero;
		when 1=>
			caracter3<=uno;
		when 2=>
			caracter3<=dos;
		when 3=>
			caracter3<=tres;
		when 4=>
			caracter3<=cuatro;
		when 5=>
			caracter3<=cinco;
		when 6=>
			caracter3<=seis;
		when 7=>
			caracter3<=siete;
		when 8=>
			caracter3<=ocho;
		when 9=>
			caracter3<=nueve;
		when others=>
			null;
	end case;
	case(decenas)is
		when 0 =>
			caracter4<=cero;
		when 1=>
			caracter4<=uno;
		when 2=>
			caracter4<=dos;
		when 3=>
			caracter4<=tres;
		when 4=>
			caracter4<=cuatro;
		when 5=>
			caracter4<=cinco;
		when 6=>
			caracter4<=seis;
		when 7=>
			caracter4<=siete;
		when 8=>
			caracter4<=ocho;
		when 9=>
			caracter4<=nueve;
		when others=>
			null;
	end case;
end process;

--Divisor de frecuencia para llevar control de la posicion de los led´s
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
	if(grado>0 and grado<45)then--Caracter 1
		led<=caracter1(0);
	elsif(grado>45 and grado<90)then
		led<=caracter1(1);
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
		led<=z(0);
	elsif(grado>605 and grado<650)then
		led<=z(1);
	elsif(grado>650 and grado<695)then
		led<=z(2);
	elsif(grado>695 and grado<740)then
		led<=z(3);
	elsif(grado>840 and grado<885)then--Caracter 4
		led<=h(0);
	elsif(grado>885 and grado<930)then
		led<=h(1);
	elsif(grado>930 and grado<975)then
		led<=h(2);
	elsif(grado>975 and grado<1020)then
		led<=h(3);
	elsif(grado>1120 and grado<1165)then--Caracter 5
		led<=caracter3(0);
	elsif(grado>1165 and grado<1210)then
		led<=caracter3(1);
	elsif(grado>1210 and grado<1255)then
		led<=caracter3(2);
	elsif(grado>1255 and grado<1300)then
		led<=caracter3(3);
	elsif(grado>1350 and grado<1395)then--Caracter 6
		led<=caracter4(0);
	elsif(grado>1395 and grado<1440)then
		led<=caracter4(1);
	elsif(grado>1440 and grado<1485)then
		led<=caracter4(2);
	elsif(grado>1485 and grado<1530)then
		led<=caracter4(3);
	else
		led<="000000";
	end if;
end process;

end Behavioral;

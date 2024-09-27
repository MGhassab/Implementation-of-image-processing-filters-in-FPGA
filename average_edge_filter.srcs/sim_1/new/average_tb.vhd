library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity average_tb is
--  Port ( );
end average_tb;

architecture average_tb_beh of average_tb is
constant    T       :   time    :=  10 ns;
   signal clk, rst: std_logic;
   signal start   : std_logic ;
   signal input   : std_logic_vector(7 downto 0);
   signal row     : std_logic_vector(7 downto 0);
   signal column  : std_logic_vector(7 downto 0);
   signal output_avrg  : std_logic_vector(7 downto 0);
   signal output_edge  : std_logic_vector(7 downto 0);
begin
   avrage:     entity  work.average(average_beh)
               Port map(
                     clk    => clk,
                     rst    => rst,
                     start  => start,
                     input  => input,
                     row    => row,
                     column => column,
                     output => output_avrg 
              );
          
    edge:      entity  work.edge(edge_beh)
               Port map(
                     clk    => clk,
                     rst    => rst,
                     start  => start,
                     input  => input,
                     row    => row,
                     column => column,
                     output => output_edge 
              );      
          
 -- Clock process definitions
 clk_process :process
 begin
 clk <= '0';
 wait for T/2;
 clk <= '1';
 wait for T/2;
 end process;
 
 
 -- Stimulus process
 stim_proc: process
 begin
 start  <= '0';
  rst <= '1';
  wait for  T;
   -- hold reset state for 10 ns.
  rst <= '0';
  wait for  T;
  start  <= '1';
  row    <= std_logic_vector(to_unsigned(5,8));
  column <= std_logic_vector(to_unsigned(14,8));
  
  ---------------    RED INPUT  -----------------
  wait for  T;
   start  <= '0';
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(52,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(52,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  
  
    wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(198,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(165,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  
  
   wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(129,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(52,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  
  
     wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(92,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(92,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  
  
     wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(52,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(0,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(165,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
  wait for  T;
  input <= std_logic_vector(to_unsigned(231,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   input <= std_logic_vector(to_unsigned(0,8));
   wait for  T;
   wait for  T;
   wait for  T;
   wait for  T;
   wait for  T;
   wait for  T;
  -------------------- END -------------------------
  
  
  ---------------    GREEN INPUT  -----------------
--   wait for  T;
--   start  <= '0';
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(119,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(77,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
  
  
--    wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(77,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
  
  
--   wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(31,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(77,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
  
  
--     wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(98,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
  
  
--     wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(119,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(0,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(138,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   wait for  T;
--   wait for  T;
--   wait for  T;
--   wait for  T;
--   wait for  T;
   -------------------- END -------------------------
   
   
   ---------------    BLUE INPUT  -----------------
--    wait for  T;
--   start  <= '0';
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(98,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(51,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
  
  
--    wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(140,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(119,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
  
  
--   wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(51,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(51,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
  
  
--     wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(75,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
  
  
--     wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(98,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(160,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(119,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--  wait for  T;
--  input <= std_logic_vector(to_unsigned(24,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   input <= std_logic_vector(to_unsigned(0,8));
--   wait for  T;
--   wait for  T;
--   wait for  T;
--   wait for  T;
--   wait for  T;
--   wait for  T;
   -------------------- END -------------------------
  end process;
end average_tb_beh;

 
 
--------------------------------------------------------
-- Image procesing Edge filter
-- Create by Mahdi Ghassab and Alireza Alizade
-- Final Project 
-- FPGA_FALL
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity edge is
port ( 	
    clk	        : 	in std_logic;
		rst		      : 	in std_logic;
		start      	:	  in std_logic;
		input 	    :	  in std_logic_vector(7 downto 0);
		row   	    :	  in std_logic_vector(7 downto 0);
		column 	    :	  in std_logic_vector(7 downto 0);
		output    	:	  inout std_logic_vector(7 downto 0)		
);
end edge;

architecture edge_beh of edge is
  type ram_type is array (0 to 999) of std_logic_vector (7 downto 0);      -- define 100x8 bit RAM Type        
  type    state_type  is  (idle,start_rows,proces);                        -- State = idle  ,  start_rows  ,  proces                     
  signal state_reg , state_next     : state_type;                          -- state register
  signal in_ram                     : ram_type;                            -- input Ram for save inputs(4 rows)
  signal out_edge_ram               : ram_type;                            -- output Ram for save output 
  signal data_out_1                 : std_logic_vector(7 downto 0) := in_ram(0);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_2                 : std_logic_vector(7 downto 0) := in_ram(1);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_3                 : std_logic_vector(7 downto 0) := in_ram(2);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_4                 : std_logic_vector(7 downto 0) := in_ram(3);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_5                 : std_logic_vector(7 downto 0) := in_ram(4);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_6                 : std_logic_vector(7 downto 0) := in_ram(5);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_7                 : std_logic_vector(7 downto 0) := in_ram(6);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_8                 : std_logic_vector(7 downto 0) := in_ram(7);       -- use for compute filter output . GET pixel value form input RAM
  signal data_out_9                 : std_logic_vector(7 downto 0) := in_ram(8);       -- use for compute filter output . GET pixel value form input RAM
  signal data_in                    : std_logic_vector(7 downto 0);                    -- Input Port RAM_IN
  signal data_outram                : std_logic_vector(15 downto 0);                   -- out   Port RAM_OUT
  signal row_cnt_reg , row_cnt_next : std_logic_vector(7 downto 0) := (others => '0');       -- row counter register
  signal counter_reg , counter_next : std_logic_vector(7 downto 0) := "00000001";            -- counter register (use for counting column)
  signal add_inram_reg , add_inram_next : std_logic_vector(7 downto 0) := (others => '0');   -- Address RAM_IN
  signal add_outram_reg , add_outram_next : std_logic_vector(7 downto 0) := (others => '0'); -- Address RAM_OUT
  signal row_up_reg , row_up_next         : std_logic_vector(7 downto 0) := (others => '0'); -- use for determine up pixels position
  signal row_center_reg , row_center_next : std_logic_vector(7 downto 0) := (others => '0'); -- use for determine center pixels position
  signal row_down_reg , row_down_next     : std_logic_vector(7 downto 0) := (others => '0'); -- use for determine down pixels position
  signal one  : std_logic_vector(7 downto 0) := "00000001";  -- make constant 1 for multiplexer
  signal four : std_logic_vector(7 downto 0) := "00000100";  -- make constant 4 for multiplexer
  signal temp4 , temp1 : std_logic_vector(15 downto 0);  -- temporary signal
begin
   -- registers
  process (clk,rst)
  begin
    if (rst = '1')  then                    -- determine reset values
      state_reg <=  idle;                   --  reset state
      row_cnt_reg <= (others => '0');       -- determine reset values
      add_inram_reg <= (others => '0');     -- determine reset values
      add_outram_reg <= (others => '0');    -- determine reset values
      counter_reg <= ("00000001");          -- determine reset values     
      row_up_reg <= (others => '0');        -- determine reset values
      row_center_reg <= (others => '0');    -- determine reset values
      row_down_reg <= (others => '0');      -- determine reset values
      
    elsif (clk'event and clk='1') then      -- update RAM and registers in HIGH_EDGE_CLOCK
      state_reg <=  state_next;             -- state register
      row_cnt_reg <= row_cnt_next;          -- row counter
      add_inram_reg <= add_inram_next;      -- IN_RAM address
      add_outram_reg <= add_outram_next;    -- OUT_RAM address
      counter_reg <= counter_next;          -- column counter
      
      row_up_reg <= row_up_next;            -- high pixels position row
      row_center_reg <= row_center_next;    -- middle pixels position row
      row_down_reg <= row_down_next;        -- low pixels position row
      
      in_ram(to_integer(unsigned(add_inram_reg))) <= data_in;                         -- write new data on IN_RAM
      out_edge_ram(to_integer(unsigned(add_outram_reg))) <= data_outram(7 downto 0);  -- write new data on OUT_RAM
      
        data_out_1 <= in_ram(to_integer((unsigned(row_up_reg)*unsigned(column))+unsigned(counter_reg)-1));
        data_out_2 <= in_ram(to_integer((unsigned(row_up_reg)*unsigned(column))+unsigned(counter_reg)));
        data_out_3 <= in_ram(to_integer((unsigned(row_up_reg)*unsigned(column))+unsigned(counter_reg)+1));
        
        data_out_4 <= in_ram(to_integer((unsigned(row_center_reg)*unsigned(column))+unsigned(counter_reg)-1));
        data_out_5 <= in_ram(to_integer((unsigned(row_center_reg)*unsigned(column))+unsigned(counter_reg))); --center house
        data_out_6 <= in_ram(to_integer((unsigned(row_center_reg)*unsigned(column))+unsigned(counter_reg)+1));
        
        data_out_7 <= in_ram(to_integer((unsigned(row_down_reg)*unsigned(column))+unsigned(counter_reg)-1));
        data_out_8 <= in_ram(to_integer((unsigned(row_down_reg)*unsigned(column))+unsigned(counter_reg)));
        data_out_9 <= in_ram(to_integer((unsigned(row_down_reg)*unsigned(column))+unsigned(counter_reg)+1));
        
       
     end if;
   end process;

    -- next_state / output logic
    process(state_reg,start,input,column,row,row_cnt_reg,add_inram_reg,counter_reg,row_down_reg,row_center_reg,row_up_reg,add_outram_reg,temp4,temp1)
    begin
      case state_reg is       -- determine state
      
      
      when    idle    =>                            -- 1)IDLE state : wait for start
          if (start = '1') then                     -- wait for start command
              state_next     <= start_rows;         -- next state
              row_cnt_next   <= (others => '0');    -- set row counter
              add_inram_next <= (others => '0');    -- set address IN_RAM 
              add_outram_next <= (others => '0');   -- set address OUT_RAM
          end if;
          
                 
       when   start_rows    =>                        -- 2)START_ROWS state : get first 3 rows from INPUT
          if(add_inram_reg = std_logic_vector(unsigned(column)+unsigned(column)+unsigned(column)-1)) then    -- Diagnostic 3 rows     
                  state_next <= proces;               -- next state
                  row_cnt_next    <= "00000100";      -- set row counter = 4
                  counter_next    <= "00000001";      -- set counter = 1 for determin the 1,1 house
                  add_outram_next <= (others => '0'); -- set address OUT_RAM            
                  row_up_next     <= "00000000";      -- set row_up = 0
                  row_center_next <= "00000001";      -- set row_center = 1     
                  row_down_next   <= "00000010";      -- set row_down = 2 
                  data_in <= input;                   -- for write new data
                  add_inram_next <= std_logic_vector(unsigned(add_inram_reg) + 1);    -- increment address IN_RAM      
          else
                  data_in <= input;       -- for write new data
                  add_inram_next <= std_logic_vector(unsigned(add_inram_reg) + 1);    -- increment address IN_RAM 
                  
          end if;
          
         
       when   proces    =>                            -- 3)PROCES state : compute and generate filter OUT and GET new data from input port
           if(row_cnt_reg = std_logic_vector(unsigned(row) + 2)) then   -- for determin end of process
               state_next <= idle;      -- go to idle state in end
           else                 
              
              if (counter_reg < std_logic_vector(unsigned(column)-1)) then           -- for go to column-1 pixel 
                      counter_next <= std_logic_vector(unsigned(counter_reg) + 1);   -- increment conter   
                      temp4 <= std_logic_vector(unsigned(data_out_5)*unsigned(four));
                      temp1 <= std_logic_vector(unsigned(data_out_2)*unsigned(one)+unsigned(data_out_6)*unsigned(one)+unsigned(data_out_8)*unsigned(one)+unsigned(data_out_4)*unsigned(one));
                      -- for set output between 0 and 255 and sure that not negetive
                      if (temp4 > temp1) then
                          data_outram <= std_logic_vector(unsigned(temp4) - unsigned(temp1));
                      else
                          data_outram <= (others => '0');
                      end if;
                      add_outram_next <= std_logic_vector(unsigned(add_outram_reg) + 1);   -- increment address OUT_RAM
              end if;
              
              if(counter_reg = std_logic_vector(unsigned(column)-2)) then             -- for get last house input
                  counter_next <= "00000001";                                         -- set counter = 1
                       
                  row_down_next   <= std_logic_vector(unsigned(row_down_reg) + 1);    -- increment row_down
                  row_center_next <= std_logic_vector(unsigned(row_center_reg) + 1);  -- increment row_center
                  row_up_next     <= std_logic_vector(unsigned(row_up_reg) + 1);      -- increment row_up
                  row_cnt_next <= std_logic_vector(unsigned(row_cnt_reg) + 1);        -- increment row_counter
                  
                  if(row_down_reg = "00000011") then            -- becaude we have 4 row(0 to 3)
                      row_down_next <= "00000000";              -- and the memory read and write
                  elsif(row_center_reg = "00000011") then       -- is circular
                      row_down_next <= "00000000";              -- we should set zero
                  elsif(row_up_reg = "00000011") then           -- the rows counter
                      row_up_next <= "00000000";                                       
                  end if;
                    
              end if;
                 
              
              if(add_inram_reg = std_logic_vector((unsigned(column)+unsigned(column)+unsigned(column)+unsigned(column))-1)) then      -- address IN_RAM = 4xcolumn - 1          
                  data_in <= input;
                  add_inram_next <= (others => '0');    -- becaude we have 4 row(0 to 3) and the memory read and write is circular we should set zero addre
                  
              else         -- address IN_RAM < 4xcolumn - 1 
                  data_in <= input;     -- write new input
                  add_inram_next <= std_logic_vector(unsigned(add_inram_reg) + 1);    -- increment add_inram
              end if;
           end if;
              
       end case;
    end process;
    output <= data_outram(7 downto 0);    -- assign the output


end edge_beh;

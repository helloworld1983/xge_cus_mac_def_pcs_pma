------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 05/24/2016 04:21:29 PM
---- Design Name: 
---- Module Name: mac_packet_generator - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity mac_packet_generator is
--    port (
--        clk_156                       : in  std_logic;
--        eth_send                      : in  std_logic;
--        src_addr                      : in  std_logic_vector(47 downto 0);
--        dest_addr                     : in  std_logic_vector(47 downto 0);
--        xgmii_txd                     : out std_logic_vector(63 downto 0);
--        xgmii_txc                     : out std_logic_vector(7 downto 0)
--    );
--end mac_packet_generator;

--architecture Behavioral of mac_packet_generator is

--constant eth_prem               : std_logic_vector(63 downto 0) := x"55555555555555D5";
--type eth_type_t is array (0 to 3) of std_logic_vector(15 downto 0);
--constant eth_type               : eth_type_t := (x"0800", x"0806", x"8100", x"86DD");

--begin
--    tx_dispatch: process(clk_156)
--        variable eth_send_st          : boolean := false;
--        variable count                : integer := 0;
--        variable byte_0               : integer := 02;
--        variable byte_1               : integer := 03;
--        variable byte_2               : integer := 04;
--        variable byte_3               : integer := 05;
--        variable byte_4               : integer := 06;
--        variable byte_5               : integer := 07;
--        variable byte_6               : integer := 00;
--        variable byte_7               : integer := 01;
--    begin
--        if (clk_156'event AND clk_156 = '1') then
--            if (eth_send = '1' AND eth_send_st = false) then
--                eth_send_st := true;
--                count       := 8;

--                xgmii_txd( 7 downto  0) <= eth_prem(63 downto 56);
--                xgmii_txd(15 downto  8) <= eth_prem(55 downto 48);
--                xgmii_txd(23 downto 16) <= eth_prem(47 downto 40);
--                xgmii_txd(31 downto 24) <= eth_prem(39 downto 32);
--                xgmii_txd(39 downto 32) <= eth_prem(31 downto 24);
--                xgmii_txd(47 downto 40) <= eth_prem(23 downto 16);
--                xgmii_txd(55 downto 48) <= eth_prem(15 downto  8);
--                xgmii_txd(63 downto 56) <= eth_prem( 7 downto  0);
--                xgmii_txc   <= x"FF";
--            elsif (eth_send_st = true) then
--                if (count = 8) then
--                    xgmii_txd( 7 downto  0) <= dest_addr(47 downto 40);
--                    xgmii_txd(15 downto  8) <= dest_addr(39 downto 32);
--                    xgmii_txd(23 downto 16) <= dest_addr(31 downto 24);
--                    xgmii_txd(31 downto 24) <= dest_addr(23 downto 16);
--                    xgmii_txd(39 downto 32) <= dest_addr(15 downto  8);
--                    xgmii_txd(47 downto 40) <= dest_addr( 7 downto  0);
--                    xgmii_txd(55 downto 48) <= src_addr(47 downto 40);
--                    xgmii_txd(63 downto 56) <= src_addr(39 downto 32);
--                    xgmii_txc               <= x"FF";
--                elsif (count = 16) then
--                    xgmii_txd( 7 downto  0) <= src_addr(31 downto 24);
--                    xgmii_txd(15 downto  8) <= src_addr(23 downto 16);
--                    xgmii_txd(23 downto 16) <= src_addr(15 downto  8);
--                    xgmii_txd(31 downto 24) <= src_addr( 7 downto  0);
--                    xgmii_txd(39 downto 32) <= eth_type(0)(15 downto  8);
--                    xgmii_txd(47 downto 40) <= eth_type(0)( 7 downto  0);
--                    xgmii_txd(55 downto 48) <= std_logic_vector(to_unsigned(byte_6, 8));
--                    xgmii_txd(63 downto 56) <= std_logic_vector(to_unsigned(byte_7, 8));
--                    xgmii_txc               <= x"FF";
--                elsif (count < 72) then
--                    xgmii_txd( 7 downto  0) <= std_logic_vector(to_unsigned(byte_0, 8));
--                    xgmii_txd(15 downto  8) <= std_logic_vector(to_unsigned(byte_1, 8));
--                    xgmii_txd(23 downto 16) <= std_logic_vector(to_unsigned(byte_2, 8));
--                    xgmii_txd(31 downto 24) <= std_logic_vector(to_unsigned(byte_3, 8));
--                    xgmii_txd(39 downto 32) <= std_logic_vector(to_unsigned(byte_4, 8));
--                    xgmii_txd(47 downto 40) <= std_logic_vector(to_unsigned(byte_5, 8));
--                    xgmii_txd(55 downto 48) <= std_logic_vector(to_unsigned(byte_6, 8));
--                    xgmii_txd(63 downto 56) <= std_logic_vector(to_unsigned(byte_7, 8));
--                    xgmii_txc               <= x"FF";

--                    byte_0                  := byte_0 + 8;
--                    byte_1                  := byte_1 + 8;
--                    byte_2                  := byte_2 + 8;
--                    byte_3                  := byte_3 + 8;
--                    byte_4                  := byte_4 + 8;
--                    byte_5                  := byte_5 + 8;
--                    byte_6                  := byte_6 + 8;
--                    byte_7                  := byte_7 + 8;
--                else
--                    xgmii_txd               <= x"0000000000000000";
--                    xgmii_txc               <= x"00";

--                    byte_0                  := 02;
--                    byte_1                  := 03;
--                    byte_2                  := 04;
--                    byte_3                  := 05;
--                    byte_4                  := 06;
--                    byte_5                  := 07;
--                    byte_6                  := 00;
--                    byte_7                  := 01;
--                end if;

--                if (count = 96) then
--                    eth_send_st             := false;
--                    count                   := 0;
--                else
--                    count                   := count + 8;
--                end if;
--            else
--                eth_send_st := false;
--                count       := 0;

--                xgmii_txd   <= x"0000000000000000";
--                xgmii_txc   <= x"00";
--            end if;
--        end if;
--    end process;

--end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2016 04:21:29 PM
-- Design Name: 
-- Module Name: mac_packet_generator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mac_packet_generator is
    port (
        clk_156                       : in  std_logic;
        eth_send                      : in  std_logic;
        src_addr                      : in  std_logic_vector(47 downto 0);
        dest_addr                     : in  std_logic_vector(47 downto 0);
--        oload_crc                     : in  std_logic_vector(31 downto 0);
        xgmii_txd                     : out std_logic_vector(63 downto 0);
        xgmii_txc                     : out std_logic_vector(7 downto 0)
    );
end mac_packet_generator;

architecture Behavioral of mac_packet_generator is

component crc32_i64
    port (
        clk                           : in  std_logic;
        rst                           : in  std_logic;
        crc_en                        : in  std_logic;
        data_in                       : in  std_logic_vector(63 downto 0);
        crc_out                       : out std_logic_vector(31 downto 0)
    );
end component;

constant eth_prem               : std_logic_vector(63 downto 0) := x"FB555555555555D5";
type eth_type_t is array (0 to 3) of std_logic_vector(15 downto 0);
constant eth_type               : eth_type_t := (x"0800", x"0806", x"8100", x"86DD");

signal xgmii_txd_int                  : std_logic_vector(63 downto 0);
signal xgmii_txc_int                  : std_logic_vector(7 downto 0);
signal xgmii_crc_int                  : std_logic_vector(63 downto 0);
signal xgmii_txd_crc                  : std_logic_vector(31 downto 0);
signal alt_xgmii                      : std_logic;
signal crc_en                         : std_logic;

attribute mark_debug                  : string;
attribute mark_debug of xgmii_crc_int : signal is "true";
attribute mark_debug of crc_en        : signal is "true";
attribute mark_debug of xgmii_txd_crc : signal is "true";

begin
    tx_dispatch: process(clk_156)
        variable eth_send_st          : boolean := false;
        variable count                : integer := 0;
        variable byte_0               : integer := 02;
        variable byte_1               : integer := 03;
        variable byte_2               : integer := 04;
        variable byte_3               : integer := 05;
        variable byte_4               : integer := 06;
        variable byte_5               : integer := 07;
        variable byte_6               : integer := 00;
        variable byte_7               : integer := 01;
        variable trail                : boolean := true;
    begin
        if (clk_156'event AND clk_156 = '1') then
            if (eth_send = '1' AND eth_send_st = false) then
                eth_send_st := true;
                count       := 0;

                xgmii_txd_int <= x"0707070707070707";
                xgmii_txc_int   <= x"FF";                
                
                trail       := false;
                                    
                alt_xgmii               <= '0';

                crc_en                  <= '0';
            elsif (eth_send_st = true) then
                if (count = 0) then
                    xgmii_txd_int( 7 downto  0) <= eth_prem(63 downto 56);
                    xgmii_txd_int(15 downto  8) <= eth_prem(55 downto 48);
                    xgmii_txd_int(23 downto 16) <= eth_prem(47 downto 40);
                    xgmii_txd_int(31 downto 24) <= eth_prem(39 downto 32);
                    xgmii_txd_int(39 downto 32) <= eth_prem(31 downto 24);
                    xgmii_txd_int(47 downto 40) <= eth_prem(23 downto 16);
                    xgmii_txd_int(55 downto 48) <= eth_prem(15 downto  8);
                    xgmii_txd_int(63 downto 56) <= eth_prem( 7 downto  0);
                    xgmii_txc_int               <= x"01";
                                        
                    alt_xgmii               <= '0';

                    crc_en                  <= '0';
                elsif (count = 8) then
                    xgmii_txd_int( 7 downto  0) <= dest_addr(47 downto 40);
                    xgmii_txd_int(15 downto  8) <= dest_addr(39 downto 32);
                    xgmii_txd_int(23 downto 16) <= dest_addr(31 downto 24);
                    xgmii_txd_int(31 downto 24) <= dest_addr(23 downto 16);
                    xgmii_txd_int(39 downto 32) <= dest_addr(15 downto  8);
                    xgmii_txd_int(47 downto 40) <= dest_addr( 7 downto  0);
                    xgmii_txd_int(55 downto 48) <= src_addr(47 downto 40);
                    xgmii_txd_int(63 downto 56) <= src_addr(39 downto 32);
                    xgmii_txc_int               <= x"00";
                                        
                    alt_xgmii               <= '0';
                    
                    crc_en                  <= '1';
                elsif (count = 16) then
                    xgmii_txd_int( 7 downto  0) <= src_addr(31 downto 24);
                    xgmii_txd_int(15 downto  8) <= src_addr(23 downto 16);
                    xgmii_txd_int(23 downto 16) <= src_addr(15 downto  8);
                    xgmii_txd_int(31 downto 24) <= src_addr( 7 downto  0);
                    --xgmii_txd(39 downto 32) <= eth_type(0)(15 downto  8);
                    --xgmii_txd(47 downto 40) <= eth_type(0)( 7 downto  0);
                    xgmii_txd_int(39 downto 32) <= x"00";
                    xgmii_txd_int(47 downto 40) <= x"3A";
                    xgmii_txd_int(55 downto 48) <= std_logic_vector(to_unsigned(byte_6, 8));
                    xgmii_txd_int(63 downto 56) <= std_logic_vector(to_unsigned(byte_7, 8));
                    xgmii_txc_int               <= x"00";
                    
                    byte_6                  := byte_6 + 8;
                    byte_7                  := byte_7 + 8;
                                        
                    alt_xgmii               <= '0';
                    
                    crc_en                  <= '1';
                elsif (count < 80) then
                    xgmii_txd_int( 7 downto  0) <= std_logic_vector(to_unsigned(byte_0, 8));
                    xgmii_txd_int(15 downto  8) <= std_logic_vector(to_unsigned(byte_1, 8));
                    xgmii_txd_int(23 downto 16) <= std_logic_vector(to_unsigned(byte_2, 8));
                    xgmii_txd_int(31 downto 24) <= std_logic_vector(to_unsigned(byte_3, 8));
                    xgmii_txd_int(39 downto 32) <= std_logic_vector(to_unsigned(byte_4, 8));
                    xgmii_txd_int(47 downto 40) <= std_logic_vector(to_unsigned(byte_5, 8));
                    xgmii_txd_int(55 downto 48) <= std_logic_vector(to_unsigned(byte_6, 8));
                    xgmii_txd_int(63 downto 56) <= std_logic_vector(to_unsigned(byte_7, 8));
                    xgmii_txc_int               <= x"00";

                    byte_0                  := byte_0 + 8;
                    byte_1                  := byte_1 + 8;
                    byte_2                  := byte_2 + 8;
                    byte_3                  := byte_3 + 8;
                    byte_4                  := byte_4 + 8;
                    byte_5                  := byte_5 + 8;
                    byte_6                  := byte_6 + 8;
                    byte_7                  := byte_7 + 8;
                    
                    alt_xgmii               <= '0';
                    
                    crc_en                  <= '1';
                else
                    if(trail = false) then
--                        xgmii_txd           <= x"a27bee8b00000000";
--                        xgmii_txc           <= x"F0";
                        xgmii_txd_int( 7 downto  0) <= x"6F";
                        xgmii_txd_int(15 downto  8) <= x"2C";
                        xgmii_txd_int(23 downto 16) <= x"7E";
                        xgmii_txd_int(31 downto 24) <= x"D8";
--                        xgmii_txd_int(7 downto 0)   <= xgmii_txd_crc(31 downto 24);
--                        xgmii_txd_int(15 downto 8)  <= xgmii_txd_crc(23 downto 16);
--                        xgmii_txd_int(23 downto 16) <= xgmii_txd_crc(15 downto 8);
--                        xgmii_txd_int(31 downto 24) <= xgmii_txd_crc(7 downto 0);
                        xgmii_txd_int(39 downto 32) <= x"FD";
                        xgmii_txd_int(63 downto 40) <= x"070707";
                        xgmii_txc_int               <= x"F0";

                        alt_xgmii                   <= '1';
                        
                        trail               := true;
                    else
                        xgmii_txd_int           <= x"0707070707070707";
                        xgmii_txc_int           <= x"FF";

                        byte_0                  := 02;
                        byte_1                  := 03;
                        byte_2                  := 04;
                        byte_3                  := 05;
                        byte_4                  := 06;
                        byte_5                  := 07;
                        byte_6                  := 00;
                        byte_7                  := 01;
                                            
                        alt_xgmii               <= '0';
                    end if;

                    crc_en                  <= '0';
                end if;

                if (count = 104 and trail = true) then
                    eth_send_st             := false;
                    count                   := 0;
                elsif (count < 104) then
                    count                   := count + 8;
                end if;
            else
                eth_send_st := false;
                count       := 0;

                xgmii_txd_int <= x"0707070707070707";
                xgmii_txc_int <= x"FF";
                                    
                alt_xgmii               <= '0';

                crc_en                  <= '0';
            end if;

            if (alt_xgmii = '1') then
--                xgmii_txd(7 downto 0)   <= xgmii_txd_crc(31 downto 24);
--                xgmii_txd(15 downto 8)  <= xgmii_txd_crc(23 downto 16);
--                xgmii_txd(23 downto 16) <= xgmii_txd_crc(15 downto 8);
--                xgmii_txd(31 downto 24) <= xgmii_txd_crc(7 downto 0);
--                xgmii_txd( 7 downto  0) <= x"35";
--                xgmii_txd(15 downto  8) <= x"7B";
--                xgmii_txd(23 downto 16) <= x"55";
----                xgmii_txd(31 downto 24) <= x"4C";
--                xgmii_txd( 7 downto  0) <= oload_crc(31 downto 24);
--                xgmii_txd(15 downto  8) <= oload_crc(23 downto 16);
--                xgmii_txd(23 downto 16) <= oload_crc(15 downto  8);
--                xgmii_txd(31 downto 24) <= oload_crc( 7 downto  0);
--                xgmii_txd(31 downto  0) <= oload_crc;
                xgmii_txd(31 downto 0)  <= not xgmii_txd_crc;
                xgmii_txd(39 downto 32) <= x"FD";
                xgmii_txd(63 downto 40) <= x"070707";
                xgmii_txc               <= x"F0";
            else
                xgmii_txd <= xgmii_txd_int;
                xgmii_txc <= xgmii_txc_int;
            end if;
        end if;
    end process;

--xgmii_crc_int(63 downto 56) <= xgmii_txd_int( 7 downto  0);
--xgmii_crc_int(55 downto 48) <= xgmii_txd_int(15 downto  8);
--xgmii_crc_int(47 downto 40) <= xgmii_txd_int(23 downto 16);
--xgmii_crc_int(39 downto 32) <= xgmii_txd_int(31 downto 24);
--xgmii_crc_int(31 downto 24) <= xgmii_txd_int(39 downto 32);
--xgmii_crc_int(23 downto 16) <= xgmii_txd_int(47 downto 40);
--xgmii_crc_int(15 downto  8) <= xgmii_txd_int(55 downto 48);
--xgmii_crc_int( 7 downto  0) <= xgmii_txd_int(63 downto 56);
xgmii_crc_int <= xgmii_txd_int;

crc32_i: crc32_i64
    port map(
        clk                 => clk_156,
        rst                 => eth_send,
        crc_en              => crc_en,
        data_in             => xgmii_crc_int,
        crc_out             => xgmii_txd_crc
    );

end Behavioral;

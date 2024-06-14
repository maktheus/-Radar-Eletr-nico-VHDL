library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;

entity dsf_datareg is
  port (
    enable   : in  bit;
    areset   : in  bit;
    load_en  : in  bit;
    clk      : in  bit;
    data     : in  integer range 0 to 15;
    q        : out integer range 0 to 15 := 0
  );
end dsf_datareg;

architecture datareg_a of dsf_datareg is
  constant MAX_DATA : integer := 15;

  function reset_q (enable : bit; q : integer) return integer is
    variable reg : integer range 0 to MAX_DATA := 0;
  begin
    if (enable = '1') then
      reg := 0;
    else
      reg := q;
    end if;
    return reg;
  end reset_q;

  function load_q (enable : bit; load_en : bit; data : integer; q : integer) return integer is
    variable reg : integer range 0 to MAX_DATA := 0;
  begin
    if (enable = '1') and (load_en = '1') then
      reg := data;
    else
      reg := q;
    end if;
    return reg;
  end load_q;

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if areset = '1' then
        q <= reset_q(enable, q);
      else
        q <= load_q(enable, load_en, data, q);
      end if;
    end if;
  end process;
end datareg_a;

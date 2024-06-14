library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;

entity dsf_compare is
  port (
    enable  : in  bit;
    dataa   : in  integer range 0 to 15;
    datab   : in  integer range 0 to 15;
    gtin    : in  bit := '0';
    ltin    : in  bit := '0';
    eqin    : in  bit := '1';
    gtout   : out bit;
    ltout   : out bit;
    eqout   : out bit
  );
end dsf_compare;

architecture compare_a of dsf_compare is
  signal glein   : bit_vector(2 downto 0);
  signal gleout  : bit_vector(2 downto 0);
begin
  glein <= gtin & ltin & eqin;
  gtout <= gleout(2);
  ltout <= gleout(1);
  eqout <= gleout(0);
  
  gleout <= compare(dataa, datab, glein) when (enable = '1') else
            (others => '0');
end compare_a;

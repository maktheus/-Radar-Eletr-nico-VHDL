library ieee;
use ieee.numeric_bit.all;
use work.dsf_std.all;

entity dsf_integer_constant is
  port (
    enable               : in bit;
    integer_constant     : out integer range 0 to 15
  );
end dsf_integer_constant;

architecture dsf_integer_constant_a of dsf_integer_constant is
  constant LEN_INTEGER : integer := 4;
  constant LEN_INTEGER_VALUE : integer := 7;

  function integer_const (enable : bit; LEN_INTEGER_VALUE : integer) return integer is
    variable integer_value : integer range 0 to 2**LEN_INTEGER - 1 := 0;
  begin
    if (enable = '1') then
      integer_value := LEN_INTEGER_VALUE;
    else
      integer_value := 0;
    end if;
    return integer_value;
  end integer_const;

begin
  integer_constant <= integer_const(enable, LEN_INTEGER_VALUE);
end dsf_integer_constant_a;

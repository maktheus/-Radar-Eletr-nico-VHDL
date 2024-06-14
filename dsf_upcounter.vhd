-- ############################################################################
-- @copyright   Miguel Grimm <miguelgrimm@gmail>
--
-- @brief       Função digital contador crescente.
--
-- @file        dsf_upcounter.vhd
-- @version     1.0
-- @date        27 Julho 2020
--
-- @section     HARDWARES & SOFTWARES.
--              +compiler     Quartus Web Edition versão 13 sp 1.
--                            Quartus Primer Lite Edition Versão 18.
--              +revisions    Versão (data): Descrição breve.
--                            ++ 1.0 (27 Julho 2020): Versão inicial.
--
-- @section     AUTHORS & DEVELOPERS.
--              +institution  UFAM - Universidade Federal do Amazonas.
--              +courses      Engenharia da Computação / Engenharia Elétrica.
--              +teacher      Miguel Grimm <miguelgrimm@gmail.com>
--
--                            Compilação e Simulação:
-- 				 +student	   Kevin Guimarães <kevin.guimaraes37@gmail.com> 
--
-- @section     LICENSE
--
--              GNU General Public License (GNU GPL).
--
--              Este programa é um software livre; Você pode redistribuí-lo
--              e/ou modificá-lo de acordo com os termos do "GNU General Public
--              License" como publicado pela Free Software Foundation; Seja a
--              versão 3 da licença, ou qualquer outra versão posterior.
--
--              Este programa é distribuído na esperança de que seja útil,
--              mas SEM QUALQUER GARANTIA; Sem a garantia implícita de
--              COMERCIALIZAÇÃO OU USO PARA UM DETERMINADO PROPÓSITO.
--              Veja o site da "GNU General Public License" para mais detalhes.
--
-- @htmlonly    http://www.gnu.org/copyleft/gpl.html
--
-- @section     REFERENCES.
--              + CHU, Pong P. RTL Hardware Design Using VHDL. 2006. 669 p.
--              + AMORE, Robert d'. VHDL - Descrição e Síntese de Circuitos
--                Digitais. 2. ed. Rio de Janeiro : LTC, 2012. 292 p.
--              + PEDRONI, Volnei A. Eletrônica Digital Moderna e VHDL.
--                Rio de Janeiro : Elsevier, 2010. 619 p.
--              + TOCCI, Ronald J., WIDNER, Neal S. & MOSS, Gregory.
--                Sistemas Digitais - Princípios e Aplicações, 12. ed.
--                São Paulo : Person Education do Brasil, 2018. 1034 p.
--
-- ############################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ----------------------------------------------------------------------------
-- @brief      Contador crescente pré-ajustável.
--
-- Esta função digital realiza a contagem de 0 a LEN_MODULE-1, incrementando o
-- valor de 1. Quando a contagem atinge o valor LEN_MODULE-1, o próximo
-- valor é 0.
--
-- @param[in]  enable   -  1, habilita todas as operações da função digital e
--                         0, desabilita em caso contrário.
--
-- @param[in]  areset   -  1, zera o valor do contador de forma assíncrona e
--                         0, em caso contrário.
--
--             count_en -  1, habilita a contagem (modo contagem) e
--                         0, desabilita a contagem (modo memória).
--
--             clk      -  sinal de sincronismo ativa na transição de subida.
--
-- @param[out] q        -  LEN_MODULE-1..0 (decimal), valor atual da contagem.
-- ----------------------------------------------------------------------------
entity dsf_upcounter is
  port (
    -- Controles assíncronos.
    enable    : in  std_logic;
    areset    : in  std_logic;

    -- Controles síncronos.
    count_en  : in  std_logic;
    clk       : in  std_logic;
	
    -- Resultado da contagem: 4 bits
    q         : out std_logic_vector(3 downto 0)
  );
end dsf_upcounter;

architecture upcounter_a of dsf_upcounter is
  -- --------------------------------------------------------------------------
  --                   CONSTANTES GLOBAIS DA ARQUITETURA                     --
  -- --------------------------------------------------------------------------

  -- Parâmetro: Módulo de contagem do contador.
  constant  LEN_MODULE  : integer := 16;

  -- Limites dos valores do contrador.
  constant  MAX_COUNT   : integer := LEN_MODULE - 1;

  signal count_val : std_logic_vector(3 downto 0) := (others => '0');
  
  -- --------------------------------------------------------------------------
  --                     FUNÇÕES GLOBAIS DA ARQUITETURA                      --
  -- --------------------------------------------------------------------------

  function reset_q (enable : std_logic) return std_logic_vector is
    variable cnt : std_logic_vector(3 downto 0) := (others => '0');
  begin
    if (enable = '1') then
      -- Modo limpa.
      cnt := (others => '0');
    end if;
    return cnt;
  end reset_q;

  function inc_q (enable, count_en : std_logic; q : std_logic_vector) return std_logic_vector is
    variable cnt : std_logic_vector(3 downto 0);
  begin
    if (enable = '1' and count_en = '1') then
      -- Modo contagem.
      if q = std_logic_vector(to_unsigned(MAX_COUNT, 4)) then
        cnt := (others => '0');
      else
        cnt := std_logic_vector(unsigned(q) + 1);
      end if;
    else
      -- Modo memória.
      cnt := q;
    end if;
    return cnt;
  end inc_q;

begin
  process(clk, areset)
  begin
    if areset = '1' then
      count_val <= reset_q(enable);
    elsif rising_edge(clk) then
      count_val <= inc_q(enable, count_en, count_val);
    end if;
  end process;
  
  q <= count_val;

end upcounter_a;
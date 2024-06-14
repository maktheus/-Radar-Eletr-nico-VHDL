--############################################################################
-- @copyright   Miguel Grimm <miguelgrimm@gmail>
--
-- @brief       Função do microsserviço limpa, carga e conta.
--
-- @file        rlc_microservice.vhd
-- @version     1.0
-- @date        31 Maio 2024
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
-- 	            +student    Grupo do Júlio
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
use ieee.numeric_bit.all;
use work.dsf_std.all;


-- ----------------------------------------------------------------------------
-- @brief      Geração do microsserviço limpa, carrega e conta.
--
-- @param[in]  enable  -  1, habilita todas as operações da função e
--                        0, desabilita a função.
--
--             areset  -  1, coloca o microsserviço no estado inicial e
--                        0, nenhuma operação.
--
--             start   -  0 => 1 => 0, dá a partida do início das operações e
--                        caso contrário, não tem nenhum efeito.
--
--             clk     -  sinal de sincronismo, ativo na transição de descida.
--
-- @param[out] reset_o -  1, operação limpa ativada e
--                        0, nenhuma operação.
--
--             load_o  -  1, operação carga ativada e
--                        0, nenhuma operação.
--
--             count_o -  1, operação de contagem ativada e
--                        0, nenhuma operação.
--
--             state   -  0, estado corrente wait4start_s,
--                        1, estado corrente reset_s,
--                        2, estado corrente load_s,
--                        3, estado corrente count_s e
--                        4, estado de sinalização de erro.
-- ----------------------------------------------------------------------------
entity rlc_microservice is

  port (
  
    -- Entradas assíncronas de controle da camada device.
    enable     :    in        bit;
    areset     :    in        bit;

    -- Entradas síncronas de controle da camada device.
    start      :    in        bit;
    clk        :    in        bit;
	
    -- Saídas de controle da camada logic.
    reset_o    :    buffer    bit  :=  '0';
    window_o     :    buffer    bit  :=  '0';
    store_o    :    buffer    bit  :=  '0';

    -- Saída do número do estado de depuração: máximo de 8 estados.
	error      :    buffer    bit                       :=  '0';
    state      :    buffer    integer range 7 downto 0  :=  0

  );
  
end rlc_microservice;



architecture rlc_microservice_a of rlc_microservice is

  -- --------------------------------------------------------------------------
  -- @detail           CONSTANTES E TIPOS GLOBAIS DA ARQUITETURA             --
  -- --------------------------------------------------------------------------

  -- Limite de estados do microsserviço.
  constant  MAX_STATE  :  integer  :=  state'high;

  -- Estados do microsserviço.
  type  state_t is (wait4start_s, -- 0, Espera o sinal start ser ativado.
						  rst_in_s,
                    reset_s,      -- 1, Operação limpa o contador e registrador.
                    window_s,       -- 2, Operação de carga do registrador.
                    store_s,      -- 3, Operação de incremento do contador.
					error_s,      -- 4, Sinalização de erro.
					noise_s);     


  -- --------------------------------------------------------------------------
  -- @detail                FUNÇÕES GLOBAIS DA ARQUITETURA                   --
  -- --------------------------------------------------------------------------

  function next_state (reset : bit; signal clk : bit; start : bit; state : state_t) return state_t is

    -- Próximo estado da máquina: modo memória.
	variable  nx_state    :  state_t  :=  state;

  begin

    if (reset = '1') then
	  
      -- Modo reset.
	  nx_state := rst_in_s;

	elsif high2low(clk) then
	  
      -- Encontra o próximo estado.
      case state is
		
		when rst_in_s => nx_state := wait4start_s;

	   when wait4start_s => -- Modo espera o início da partida.
                           if (start = '1') then

                             -- Modo partindo.
	                         nx_state := reset_s;

                           end if;

	   when reset_s    =>   -- Modo conta.
                           nx_state := window_s;

      when window_s     =>   -- Modo conta.
                           if (start = '0') then

                             -- Modo partindo.
	                         nx_state := store_s;

                           end if;

	  when store_s    =>   -- Modo carga.
                           nx_state := wait4start_s;

	  when error_s    =>   -- Modo reinício automático.
                           nx_state := rst_in_s;

      when others     =>   -- Estado de erro devido a ruído.
		                   nx_state := error_s;

      end case;

    end if;  -- reset & clk.

	return nx_state;

  end next_state;



  function get_out (reset : bit; target, current : state_t) return bit is

    -- Próxima saída: modo memória.
	variable  nx_out  :  bit;

  begin

	if (reset = '1') then

      -- Modo limpa.
      nx_out := '0';	  

    else

      if (current = target) then

        -- Modo ativado.
        nx_out := '1';

      else

        -- Modo desativado.
        nx_out := '0';

      end if;

    end if;

    return nx_out;

  end get_out;



  function check_error (enable, reset, error : bit; state : state_t)  return bit is

    -- Próxima saída: modo memória.
    variable  nx_error  :  bit  :=  error;

  begin

    if (enable = '1') and (reset = '1') then

      -- Modo limpa.
	  nx_error := '0';

    elsif (state = error_s) then

      -- Modo ativado.
      nx_error := '1';

    end if;

    return nx_error;

  end check_error;



  function get_state (current : state_t) return integer is

    -- Número do estado do microsserviço.
	variable   state  :  integer range  MAX_STATE downto 0;

  begin

    -- Encontra o próximo estado.
    case current is

	  when rst_in_s =>  -- Espera ativação do sinal start.
                            state := 0;
	  when wait4start_s =>  -- Espera ativação do sinal start.
                            state := 1;

	  when reset_s      =>  -- Operação limpa do contador e registrador da lógica.
                            state := 2;

      when window_s       =>  -- Operação carga do registrador da lógica
                            state := 3;

      when store_s      =>  -- Operação incremento do contador da lógica.
                            state := 4;
	  
      when others       =>  -- Sinalização de erro.
                            state := 5;

    end case;

	return state;

  end get_state; 



  -- --------------------------------------------------------------------------
  -- @detail                BUFFERS LOCAIS DA ARQUITETURA                    --
  -- --------------------------------------------------------------------------

  -- Estado simbólico do microsserviço.
  signal   current   :   state_t   :=   wait4start_s;

begin

  -- OP1. Próximo estado.
  current <= next_state(areset, clk, start, current) when (enable = '1');

  -- OP2. Operação limpa.
  reset_o <= get_out(areset, reset_s, current) when (enable = '1');

  -- OP3. Operação carga.
  window_o  <= get_out(areset, window_s, current) when (enable = '1'); 

  -- OP4. Operação conta.
  store_o <= get_out(areset, store_s, current) when (enable = '1');

  -- OP5. Sinalização de erro.
  error   <= check_error(enable, areset, error, current);

  -- OP6. Estado corrente.
  state   <= get_state(current);

end rlc_microservice_a;
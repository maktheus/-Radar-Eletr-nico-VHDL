-- ############################################################################
--
-- @copyright   Miguel Grimm <miguelgrimm@gmail>
--
-- @brief       Pacote acadêmico de sistemas digitais com os tipos bases
--              bit e integer.
--
-- @file        dsf_std.vhd
-- @version     1.0
-- @date        27 Julho 2020
--
-- @section     HARDWARES & SOFTWARES
--              +compiler     Quartus Web Edition versão 13 sp 1
--              +revisions    Versão (data): Descrição breve.
--                             ++ 1.0 (27 Julho 2020): Versão inicial.
--
-- @section     AUTHORS & DEVELOPERS
--              +institution  UFAM - Universidade Federal do Amazonas
--              +courses      Engenharia da Computação / Engenharias Elétricas
--              +teacher      Miguel Grimm <miguelgrimm@gmail.com>
--
--                            Compilação:
-- 				 +student	   Hítalo Perseu <hitaloperseu@gmail.com>   
--                            Kevin Guimarães <kevin.guimaraes37@gmail.com>  
-- @section     LICENSE
--
--              GNU General Public License (GNU GPL).
--
--              Este programa é um software livre; Você pode redistribuí-lo
--              e/ou modificá-lo de acordo com os termos do "GNU General Public
--              License" como publicado pela Free Software Foundation; Seja a
--              versão 3 da licença, ou qualquer versão posterior.
--
--              Este programa é distribuído na esperança de que seja útil,
--              mas SEM QUALQUER GARANTIA; Sem a garantia implícita de
--              COMERCIALIZAÇÃO OU USO PARA UM DETERMINADO PROPÓSITO.
--              Veja o site da "GNU General Public License" para mais detalhes.
--
-- @htmlonly    http://www.gnu.org/copyleft/gpl.html
--
-- ############################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package dsf_std is

-- ############################################################################
-- #                                                                          #
-- #                      DEFINIÇÃO DOS TIPOS GLOBAIS.                        #
-- #                                                                          #
-- ############################################################################
  
  -- Tipos de vetor de bits com faixa decrescente (tipo base bit).
  subtype bvec2_t  is bit_vector (1  downto 0);  --  2 bits.
  subtype bvec3_t  is bit_vector (2  downto 0);  --  3 bits.
  subtype bvec4_t  is bit_vector (3  downto 0);  --  4 bits.
  subtype bvec5_t  is bit_vector (4  downto 0);  --  5 bits.
  subtype bvec6_t  is bit_vector (5  downto 0);  --  6 bits.
  subtype bvec7_t  is bit_vector (6  downto 0);  --  7 bits.
  subtype bvec8_t  is bit_vector (7  downto 0);  --  8 bits.
  subtype bvec9_t  is bit_vector (8  downto 0);  --  9 bits.
  subtype bvec10_t is bit_vector (9  downto 0);  --  10 bits.

  -- Tipos de números integers com faixa decrescente.
  subtype uint1_t  is integer range 1   downto 0;  --  1 bit.
  subtype uint2_t  is integer range 3   downto 0;  --  2 bits.
  subtype uint3_t  is integer range 7   downto 0;  --  3 bits.
  subtype uint4_t  is integer range 15  downto 0;  --  4 bits.
  subtype uint5_t  is integer range 31  downto 0;  --  5 bits.
  subtype uint6_t  is integer range 63  downto 0;  --  6 bits.
  subtype uint7_t  is integer range 127 downto 0;  --  7 bits.
  subtype uint8_t  is integer range 255 downto 0;  --  8 bits.

  -- Tipos de vetor de bits com faixa decrescente (tipo base std_logic).
  subtype slvec4_t is std_logic_vector (3 downto 0);  --  4 bits.
  subtype slvec8_t is std_logic_vector (7 downto 0);  --  8 bits.


-- ############################################################################
-- #                                                                          #
-- #                INTERFACE DAS FUNÇÕES ESCALARES GERAIS                    #
-- #                                                                          #
-- ############################################################################

  -- --------------------------------------------------------------------------
  -- @brief      Converte um número integer em um vetor de N bits.
  --
  -- Esta função escalar converte um valor integer em um vetor de bits, sendo
  -- o tamanho do vetor.
  --
  -- @param[in]  uint      - 0..N, valor inteiro a ser convertido.
  --
  --             size_bvec - tamanho do vetor de bits. DEVE SER MAIOR QUE 1.   
  --
  -- @return     valor do vetor de bits convertido. OCORRE TRUNCAMENTO DO VALOR
  --             INTEIRO SE O TAMANHO DO VETOR DE BITS NÃO SUPORTAR O TAMANHO
  --             DO NÚMERO INTEIRO.
  --                          vetor de bits não suportar o valor integer.
  --
  -- @detail     size_bvec -  Deve possui maior que 1.
  -- --------------------------------------------------------------------------
  function uint2bvec (uint : integer; size_bvec : integer) return bit_vector;


  -- --------------------------------------------------------------------------
  -- @brief      Converte um vetor de bits em um número inteiro.
  --
  -- Esta função escalar converte um número integer em um vetor de bits, sendo
  -- o tamanho do vetor.
  --
  -- @param[in]  bvec - valor do vetor de bits. DEVE SER MAIOR QUE 1.
  --
  --             size_bvec - tamanho do vetor de bits. DEVE SER MAIOR QUE 1.
  --
  -- @return     valor do integer convertido. OCORRE TRUNCAMENTO DO NÚMERO 
  --             INTEIRO SE O TAMANHO DO VETOR DE BITS NÃO SUPORTAR O TAMANHO
  --             NÚMERO DO INTEIRO.
  -- --------------------------------------------------------------------------
  function bvec2uint (bvec : bit_vector; size_uint : integer) return integer;


  -- --------------------------------------------------------------------------
  -- @brief      Detecta a transição de subida.
  --
  -- Esta função escalar detecta a transição de subida de sinal do tipo bit.
  --
  -- @param[in]  clk - valor do sinal para detecção de transição.
  --
  -- @return     true, se ocorreu a transição de subida do parâmetro clk e
  --             false, em caso contrário.
  -- --------------------------------------------------------------------------
  function low2high (signal clk : bit) return boolean;


  -- --------------------------------------------------------------------------
  -- @brief      Detecta a transição de descida.
  --
  -- Esta função escalar detecta a transição de descida de sinal do tipo bit.
  --
  -- @param[in]  clk - valor do sinal para detecção de transição.
  --
  -- @return     true, se ocorreu a transição de descida do parâmetro clk e
  --             false, em caso contrário.
  -- --------------------------------------------------------------------------
  function high2low (signal clk : bit) return boolean;


-- ############################################################################
-- #                                                                          #
-- #             INTERFACE DAS FUNÇÕES ESCALARES ESPECÍFICAS                  #
-- #                                                                          #
-- ############################################################################


  -- --------------------------------------------------------------------------
  -- @brief      Extrai um bit de dado binário.
  --
  -- Esta função escalar retorna o i-ésimo nibble (4 bits) do tipo base integer.
  --
  -- @param[in]  data   - 0..N, valor do dado.
  --
  --             number - 0, bit ZERO da direita para a esquerda do dado,
  --                      1, bit UM da direita para a esquerda do dado,
  --                      2, bit DOIS a direita para a esquerda do dado, 
  --                      ...
  --
  -- @return     0..15, valor do nibble indicado.
  -- --------------------------------------------------------------------------
  function extract_bit (data : integer; number : integer) return integer;
  
    -- --------------------------------------------------------------------------
  -- @brief      Extrai um nibble (4 bits) de dado binário
  --
  -- Esta função escalar retorna o i-ésimo nibble (4 bits) do tipo base integer.
  --
  -- @param[in]  data   - 0..N, valor do dado.
  --
  --             number - 0, o nibble ZERO da direita para a esquerda do dado,
  --                      1, o nibble UM da direita para a esquerda do dado,
  --                      2, o nibble DOIS da direita para a esquerda do dado,
  --                      ...
  --
  -- @return     0..15, valor do nibble indicado.
  -- --------------------------------------------------------------------------
  function extract_bcd (data : integer; number : integer) return integer;


  -- --------------------------------------------------------------------------
  -- @brief      Extrai um nibble (4 bits) de dado binário
  --
  -- Esta função escalar retorna o i-ésimo nibble (4 bits) do tipo base integer.
  --
  -- @param[in]  data   - 0..N, valor do dado.
  --
  --             number - 0, o nibble ZERO da direita para a esquerda do dado,
  --                      1, o nibble UM da direita para a esquerda do dado,
  --                      2, o nibble DOIS da direita para a esquerda do dado,
  --                      ...
  --
  -- @return     0..15, valor do nibble indicado.
  -- --------------------------------------------------------------------------
  function extract_nibble (data : integer; number : integer) return integer;



  -- --------------------------------------------------------------------------
  -- @brief      Extrai um nibble (4 bits) de dado binário
  --
  -- Esta função escalar retorna o i-ésimo nibble (4 bits) do tipo base integer.
  --
  -- @param[in]  data   - 0..N, valor do dado.
  --
  --             number - 0, o nibble ZERO da direita para a esquerda do dado,
  --                      1, o nibble UM da direita para a esquerda do dado,
  --                      2, o nibble DOIS da direita para a esquerda do dado,
  --                      ...
  --
  -- @return     0..15, valor do nibble indicado.
  -- --------------------------------------------------------------------------
  function extract_lastbits (data : integer; number : integer) return integer;



  -- --------------------------------------------------------------------------
  -- @brief      Conta o número de 1's.
  --
  -- Esta função escalar conta a quantidade de bits em 1 em um vetor de bits.
  --
  -- @param[in]  data - vetor de bits de dados.
  --
  -- @return:    O número de 1's no vetor de bits de dados.
  -- --------------------------------------------------------------------------
  function count_1s (data : bit_vector) return integer;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se um valor está na faixa.
  --
  -- Esta função escalar verifica se o valor fornecido está entre os valores
  -- mínimo e máximo definidos, incluindo os valores.
  --
  -- @param[in]  value - 0..N (decimal), valor a ser comparado.
  --
  --             min   - 0..N (decimal), valor mínimo da faixa de comparação.
  --
  --             max   - 0..N (decimal), valor mínimo da faixa de comparação.
  --
  -- @return     1, se o valor fornecido está na faixa definida ou
  --             0, em caso contrário.
  -- --------------------------------------------------------------------------
  function is_range (data : integer; min, max : integer) return bit;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se é um código One-hot.
  --
  -- Esta função escalar verifica se um valor fornecido corresponde a um
  -- valor do código onehot.
  --
  -- @param[in]  data - vetor de bits de dados.
  --
  -- @return:    1, se o valor é um código One-Hot válido, aonde somente um bit
  --                está em 1 por vez.
  --             0, em caso contrário.
  -- --------------------------------------------------------------------------
  function is_onehot (data : bit_vector) return bit;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se ocorreu um vai apaga.
  --
  -- Esta função escalar verifica se existe um transporte de vai apaga.
  --
  -- @param[in]  hexa - 0..15 (decimal), valor do código Hexadecimal.
  --
  --             cin  - 0..1, valor do vem branco de entrada.
  --
  -- @return     1, se ocorreu um vai branco ou
  --             0, em caso contrário.
  -- --------------------------------------------------------------------------
  function cout_hexa (hexa : integer; cin : bit) return bit;


  -- --------------------------------------------------------------------------
  -- Esta função escalar realiza comparação de dados com cascateamento.
  --
  -- @param[in] a      - 0..15 (decimal), o valor do código binário de a.
  --
  --            b      - 0..15 (decimal), o valor do código binário de b.
  --
  --            gle    - 1XX, o bit g (greast) possui maior prioridade,
  --                     01X, o bit l (less) possui prioridade intermediária,
  --                     001, o bit e (equal) possui menor prioridade,
  --                     000, sem sinalização.
  --
  -- @return             100, para a > b,
  --                     010, para a < b,
  --                     001, para a = b ou
  --                     000, função desabilitada
  -- --------------------------------------------------------------------------
  function compare (a, b : integer; gle : bit_vector) return bvec3_t;


  -- --------------------------------------------------------------------------
  -- Esta função escalar gera a paridade para 8 bits de dados.
  --
  -- @param[in]  data      - 0..LEN_DATA (hexa), valor do dado para a geração.
  --
  --             odd_even  - 1, gera a paridade ímpar ou
  --                         0, gera a paridade par.
  --
  -- @return                 0..1, o valor do bit da paridade gerado.
  -- --------------------------------------------------------------------------
  function parity_generator (data : bit_vector; odd_even : integer) return bit;


  -- --------------------------------------------------------------------------
  -- @brief      Incrementa o contador.
  --
  -- Esta função escalar incrementa de 1 o valor do contador até atingir o
  -- limite máximo. Quando contagem atinge o valor limite do parâmetro max,
  -- o valor da contagem muda para zero.
  --
  -- @param[in]  count  -  Valor da contagem atual.
  --
  --             max    -  Número constante da contagem máxima.
  --
  -- @return               O valor da contagem incrementada.
  -- --------------------------------------------------------------------------
  function increment (count : integer; max : integer) return integer;


  -- --------------------------------------------------------------------------
  -- @brief      Decrementa o contador.
  --
  -- Esta função escalar decrementa de 1 o valor do contador até atingir o
  -- valor limite zero. Quando contagem atinge o valor limite, o valor da
  -- contagem muda para o valor constante do parâmetro max.
  --
  -- @param[in]  count -  Valor da contagem atual.
  --
  --             max   -  Número constante da contagem máxima.
  --
  -- @return              O valor da contagem decrementada.
  -- --------------------------------------------------------------------------
  function decrement (count : integer; max : integer) return integer;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se valores são iguais.
  --
  -- Esta função escalar verifica se o valor de um dado é igual a um outro dado.
  --
  -- @param[in]  data1  -  o valor do dado 1.
  --
  --             data2  -  o valor do dado 2.
  --
  -- @return:              1, o dado e o número são iguais ou
  --                       0, em caso contrário.
  -- --------------------------------------------------------------------------
  function is_equal (data1, data2 : integer) return bit;

end dsf_std;

 
package body dsf_std is

-- ############################################################################
-- #                                                                          #
-- #                   CORPO DAS FUNÇÕES ESCALARES GERAIS.                    #
-- #                                                                          #
-- ############################################################################
  
  
  -- --------------------------------------------------------------------------
  -- @brief      Detecta a transição de subida.
  -- --------------------------------------------------------------------------
  function low2high (signal clk : bit) return boolean is
  begin

    -- Detecção da transição de subida.
    return (clk'event) and (clk = '1');
  
  end low2high;


  -- --------------------------------------------------------------------------
  -- @brief      Detecta a transição de descida.
  -- --------------------------------------------------------------------------
  function high2low (signal clk : bit) return boolean is
  begin

    -- Detecção da transição de descida.
    return (clk'event) and (clk = '0');
  
  end high2low;


  -- --------------------------------------------------------------------------
  -- @brief      Converte um integer em um vetor de N bits.
  -- --------------------------------------------------------------------------
  function uint2bvec (uint : integer; size_bvec : integer) return bit_vector is

    -- Valor máximo do número integer.
    constant  MAX         :  integer  :=  uint'high;

    -- Valor integer de conversão.
    variable  uint_value  :  integer range MAX downto 0 := uint;
  
    -- Resultado da conversão.
    variable  bvec        :  bit_vector(size_bvec-1 downto 0);
  
  begin

    -- Laço para gerar o vetor de bits.
    for i in 0 to (size_bvec-1)
    loop
  
      -- Verifica o resto da divisão do uint_value por 2.
	  if ((uint_value mod 2) = 0) then
	    
	    -- O resto da divisão por 2 é zero.
	    bvec(i) := '0';
	  
	  else

        -- O resto da divisão por 2 é um.
        bvec(i) := '1';

	  end if;

      -- Gera o próximo valor de conversão. Desloca um bit p/ a direita (rol 1)
      uint_value := uint_value / 2;
 
    end loop;
  
    return bvec;

  end uint2bvec;


  -- --------------------------------------------------------------------------
  -- @brief      Converte um vetor de N bits em um integer.
  -- --------------------------------------------------------------------------
  function bvec2uint (bvec : bit_vector; size_uint : integer) return integer is

    -- Valor máximo do índice do vetor de bits.
    constant  LEN  : integer := bvec'length;
    constant  MAX  : integer := LEN - 1;

    -- Dado a ser convertido.
    variable  uint    :  integer range size_uint-1 downto 0  :=  0;
  
    -- Peso da posição do bit - posição 0.
    variable  weight  :  integer range 2**LEN-1 downto 0    :=  1;

  begin

    -- Laço para gerar o valor integer.
    for i in 0 to MAX
    loop
  
      -- Verifica o i-ésimo valor do bit do vetor.
	  if (bvec(i) = '1') then
	    
	    -- Soma do peso do bit i-ésimo.
	    uint := uint + weight;
	  
	  end if;
	
	  -- Gera o próximo valor do peso 2**i: 2, 4, 8, 16, ...
	  weight := weight * 2;
	  
    end loop;
	
    return uint;

  end bvec2uint;


-- ############################################################################
-- #                                                                          #
-- #               CORPO DAS FUNÇÕES ESCALARES DE ESPECÍFICAS.                #
-- #                                                                          #
-- ############################################################################

  -- --------------------------------------------------------------------------
  -- @brief      Extrai um bit de dado binário.
  -- --------------------------------------------------------------------------
  function extract_bit (data : integer; number : integer) return integer is

    -- Valor máximo do índice do vetor de bits.
    constant  MAX_DT  :  integer  :=  data'high;

    -- Bit menos significativo a ser obtido.
    variable  resto   :  integer range MAX_DT downto 0;
    variable  valor   :  uint1_t;

  begin
    
    -- Retira os bits a direita do bit desejado.
    if (number = 0) then
      resto := data;
    else
      resto := data / (2 ** number);   
    end if;
   
    -- Adquire o bit desejado.
    valor := resto mod 2;
   
    -- Retorna o bit desejado.
    return valor;

  end extract_bit;
  
 -- ----------------------------------------------------------------------------
 -- @brief      Extrai um BCD de dado binário.
 -- ----------------------------------------------------------------------------
function extract_bcd (data : integer; number : integer) return integer is

  -- Valor máximo do índice do vetor de bits.
  constant  MAX_DT  :  integer  :=  data'high;

  -- Resto a esquerda do i-ésimo BCD, incluindo o i-ésimo.
  variable  resto   :  integer range MAX_DT downto 0;
  
  -- BCD da i-ésima posição.
  variable  bcd  :  uint4_t;

begin

  -- Retira os bcd's a direita do i-ésimo bcd.
  if (number = 0) then
  
    resto := data;
	 
  else 
  
    resto := data / (10**number);
	 
  end if;
  
  -- Adquire o i-ésimo BCD.
  bcd := resto mod 10;
  
  -- Retorno do BCD indicado.
  return bcd;
  

end extract_bcd;


  -- --------------------------------------------------------------------------
  -- @brief      Extrai um nibble de dado binário.
  -- --------------------------------------------------------------------------
  function extract_nibble (data : integer; number : integer) return integer is

    -- Valor máximo do número integer.
    constant  MAX_DT    :  integer  :=  data'high;

    -- Nibble a ser obtido.
    variable  resto  :  integer  range MAX_DT downto 0;
    variable  valor  :  uint4_t;

  begin

    -- Retira os nibbles a direita do nibble desejado.
    if (number = 0) then
  
      resto := data;
	
    else
  
      resto := data / (16 ** number);
	
    end if;
   
    -- Adquire o nibble desejado.
    valor := resto mod 16;
   
    -- Retorno do nibble indicado.
    return valor;

  end extract_nibble;


  -- --------------------------------------------------------------------------
  -- @brief      Extrai os últimos bits de dados da direita.
  -- --------------------------------------------------------------------------
  function extract_lastbits(data : integer; number : integer) return integer is

    -- Valor máximo do número integer.
    constant  MAX_DT  :  integer  :=  data'high;

    -- Nibble a ser obtido.
    variable  valor   :  integer  range MAX_DT downto 0;

begin

    -- Retira os number bits a direita do dado.
    valor := data mod (2 ** number);

    -- Retorno do nibble indicado.
    return valor;

  end extract_lastbits;


  -- --------------------------------------------------------------------------
  -- @brief      Conta o número de 1's.
  -- --------------------------------------------------------------------------
  function count_1s (data : bit_vector) return integer is

    -- Tamanho e índice máximo do vetor de bits.
    constant  LEN_DT   : integer := data'length;
    constant  MAX_CNT  : integer := 2**LEN_DT - 1;

    -- Conta o número de 1's.
    variable  cont  :  integer range MAX_CNT downto 0  :=  0;

  begin

    -- Conta o número de 1's do vetor de bits de dados.
    for i in 0 to (LEN_DT - 1)
    loop
    
	  if (data(i) = '1') then
	
	    cont := cont + 1;
	
	  end if;
	
    end loop;

    -- Retorna o número de 1's.
    return cont;
  
  end count_1s;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se um valor está na faixa.
  -- --------------------------------------------------------------------------
  function is_range (data : integer; min, max : integer) return bit is

    -- Sinalização do código BCD simples.
    variable  flag  :  bit;

  begin

    if (data >= min) and (data <= max) then

      -- O valor fornecido está na faixa.
	  flag := '1';

    else 
  
	  -- O valor fornecido NÃO está na faixa.
      flag := '0';

    end if;
 
    return flag;

  end is_range;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se é um código One-hot.
  -- --------------------------------------------------------------------------
  function is_onehot (data : bit_vector) return bit is

    -- Tamanho e limites do dado e resultado.
    constant  LEN_DT   :  integer  :=  data'length;
    constant  MAX_CNT  :  integer  :=  2**LEN_DT - 1;

    -- Conta o número de 1's.
    variable  count  :  integer range MAX_CNT downto 0;

    -- Sinalização do código One-hot.
    variable  flag   :  bit;

  begin

    -- Conta o números de 1's de data.
    count := count_1s (data);

    -- Verifica se data é um código One-hot.
    if (count = 1) then
  
      -- É um código One-hot.
	  flag := '1';
  
    else
  
      -- NÃO é um código One-hot.
      flag := '0';

    end if;
  
    -- Retorna a sinalização da verificação.
    return flag;

  end is_onehot;


  -- --------------------------------------------------------------------------
  -- @brief      Verifica se ocorreu um vai apaga.
  -- --------------------------------------------------------------------------
  function cout_hexa (hexa : integer; cin : bit) return bit is

    -- Transporte de vai branco.
    variable  cout  :  bit;

  begin

    if (hexa = 0) and (cin = '1') then

      -- Existe o transporte de vai branco.
	  cout := '1';

    else 
  
      -- NÃO existe o transporte de vai branco.
      cout := '0';

    end if;
 
    return cout;

  end cout_hexa;

  -- --------------------------------------------------------------------------
  -- Compara a magnitude de dois valores.
  -- --------------------------------------------------------------------------
  function compare (a, b : integer; gle : bit_vector) return bit_vector is

    -- Novo código de comparação.
    variable  code  :  bvec3_t;

  begin

    if (gle(2) = '1') then
  
      -- O bit '' (greastest then) possui maior prioridade.
	  code := "100";
  
    elsif (gle(1) = '1') then
    
      -- O bit 'l' (less then) possui prioridade intermediária.
	  code := "010";
	
    elsif (gle(0) = '1') then
  
      -- O bit 'e' (equal) possui menor prioridade.
	
      if (a > b) then

        -- O dado 'a' é maior que o dado 'b'.
	    code := "100";
  
      elsif (a < b) then

        -- O dado 'a' é menor que o dado 'b'.
	    code := "010";

      else

        -- O dado 'a' é igual ao dado 'b'.
	    code := "001";

	  end if;
	  
    else
  
      -- Desabilitado.
	  code := "000";
	
    end if;

    -- Retorno do novo código de comparação.
    return code;

  end compare;


  -- --------------------------------------------------------------------------
  --    Gera a paridade par/ímpar.
  -- --------------------------------------------------------------------------
  function parity_generator(data : bit_vector; odd_even : integer) return bit is

    -- Limite de bits de dados da entrada.
    constant MAX_DT   :  integer := data'high;

    -- Contagem do números de 1's.
    variable  count   :  integer range  MAX_DT downto 0;

    -- Paridade gerada.
    variable  parity  :  bit;

  begin

    -- Conta o número de 1's do dado.
    count := count_1s (data);

    -- Geração da paridade par.
    if ( (count mod 2) = 0) then

      -- Número de 1's em data é par.
	  parity := '0';

    else

      -- Número de 1's em data é ímpar.
      parity := '1';

    end if;

    -- Geração da paridade ímpar.
    if (odd_even = 1) then

      -- Geração da paridade ímpar.
	  parity := not (parity);

    end if;

    -- Retorna a paridade gerada.
    return parity;

  end parity_generator;

-- ----------------------------------------------------------------------------
-- @brief      Incrementa o contador.
-- ----------------------------------------------------------------------------
function increment (count : integer; max : integer) return integer is

  -- Limite da contagem.
  constant  MAX_CNT     :  integer := count'high;
  
  -- Próximo valor da contagem.
  variable  next_count  :  integer range MAX_CNT downto 0;
  
begin

  -- Condição do passo base de operação.
  if (count = max) then
  
    -- Passo base de operação.
	next_count := 0;
	
  else
  
    -- Passo de indução de operação.
    next_count := count + 1;
	
  end if;
  
  return next_count;

end increment;



-- ----------------------------------------------------------------------------
-- @brief      Decrementa o contador.
-- ----------------------------------------------------------------------------
function decrement (count : integer; max : integer) return integer is

  -- Limite da contagem.
  constant  MAX_CNT     :  integer  :=  count'high;
  
  -- Próximo valor da contagem.
  variable  next_count  :  integer range MAX_CNT downto 0;
  
begin

  -- Condição do passo base de operação.
  if (count = 0) then
  
    -- Passo base de operação.
	next_count := max;
	
  else
  
    -- Passo de indução de operação.
    next_count := count - 1;
	
  end if;
  
  return next_count;

end decrement;



-- ----------------------------------------------------------------------------
-- @brief      Verifica se valores são iguais.
-- ----------------------------------------------------------------------------
function is_equal (data1, data2 : integer) return bit is

  -- Sinalização de igualdade.
  variable  flag  :  bit;
  
begin

  -- Condição do passo base de operação.
  if (data1 = data2) then
  
    -- Passo base de operação.
	flag := '1';
	
  else
  
    -- Passo de indução de operação.
    flag := '0';
	
  end if;
  
  return flag;

end is_equal;


end dsf_std;

# RLC Microservice Project

## Overview

This project implements a microservice that integrates with a logic layer and a device layer to measure and process vehicle speeds. The system performs operations such as counting pulses, storing speed values, and controlling LEDs based on the speed.

## Architecture

The project is divided into three main layers:

1. **Logic Layer**
2. **Microservice Layer**
3. **Device Layer**

### Logic Layer

#### UpCounter

- **Description:** The UpCounter is reset when `areset` is high (1). It counts pulses related to the vehicle's speed when `count_en` is enabled (1).
- **Ports:**
  - `enable` : `in std_logic`
  - `areset` : `in std_logic`
  - `count_en` : `in std_logic`
  - `clk` : `in std_logic`
  - `q` : `out std_logic_vector(3 downto 0)`

#### DataRegister

- **Description:** The DataRegister stores the speed count value when `load_en` is enabled (1).
- **Ports:**
  - `load_en` : `in std_logic`
  - `clk` : `in std_logic`
  - `data` : `in std_logic_vector(3 downto 0)`
  - `q` : `out std_logic_vector(3 downto 0)`

#### Compare

- **Description:** Comparators to check if the speed is greater or equal to 8 or less or equal to 4.
- **Ports:**
  - `dataa` : `in std_logic_vector(3 downto 0)`
  - `datab` : `in std_logic_vector(3 downto 0)`
  - `gt` : `out std_logic`
  - `eq` : `out std_logic`
  - `lt` : `out std_logic`

#### LED Control

- **Description:** Controls LEDs based on speed conditions.
- **Ports:**
  - `speed` : `in std_logic_vector(3 downto 0)`
  - `red` : `out std_logic`
  - `green` : `out std_logic`
  - `blue` : `out std_logic`

### Microservice Layer

#### RLC Microservice

- **Description:** Manages the logic and device layers, initializing the system, handling start signals, measuring pulse width, and controlling outputs.
- **Ports:**
  - `enable` : `in std_logic`
  - `areset` : `in std_logic`
  - `start` : `in std_logic`
  - `clk` : `in std_logic`
  - `reset_o` : `out std_logic`
  - `load_o` : `out std_logic`
  - `count_o` : `out std_logic`
  - `error` : `out std_logic`
  - `state` : `out integer range 0 to 7`

### Device Layer

#### Device Simulation

- **Description:** Simulates the speed sensor and detects the presence of a vehicle.
- **Ports:**
  - `clk` : `in std_logic`
  - `reset` : `in std_logic`
  - `S` : `in std_logic`
  - `pulse` : `out std_logic`

## Usage

1. **Compilation and Simulation:**
   - Use Quartus Web Edition version 13 sp 1 or Quartus Prime Lite Edition Version 18 for compilation and simulation.

2. **Initialization:**
   - The microservice initializes the system by generating pulses on `rst_on` and `reset`.
   - Waits for the `start` signal to begin measurements.

3. **Operation:**
   - Measures pulse width to simulate vehicle speed.
   - Stores the speed count value in the DataRegister.
   - Controls LEDs based on speed: RED for speed >= 8, GREEN for speed <= 4, BLUE for 4 < speed < 8.

## Framework

- Use the provided digital functions from the framework.
- Define new digital functions using similar solutions from the repository if needed.
- Avoid rewriting existing functions to prevent losing points.

## References

- CHU, Pong P. RTL Hardware Design Using VHDL. 2006. 669 p.
- AMORE, Robert d'. VHDL - Descrição e Síntese de Circuitos Digitais. 2. ed. Rio de Janeiro : LTC, 2012. 292 p.
- PEDRONI, Volnei A. Eletrônica Digital Moderna e VHDL. Rio de Janeiro : Elsevier, 2010. 619 p.
- TOCCI, Ronald J., WIDNER, Neal S. & MOSS, Gregory. Sistemas Digitais - Princípios e Aplicações, 12. ed. São Paulo : Person Education do Brasil, 2018. 1034 p.

## License

This project is licensed under the GNU General Public License (GNU GPL).

## Authors & Developers

- **Teacher:** Miguel Grimm <miguelgrimm@gmail.com>
- **Students:** Grupo do Júlio


# Mini SoC

A simple **Mini System-on-Chip (SoC)** implemented using Verilog HDL. The project integrates a 4-bit counter, a 2-bit ALU, and a 2:1 multiplexer to demonstrate basic RTL design and module integration.

## Architecture

The Mini SoC consists of three main modules:

- **Counter:** A 4-bit synchronous counter with reset. It increments on every rising edge of the clock and wraps around to zero after reaching 15.
- **ALU:** A 2-bit Arithmetic Logic Unit that performs addition or subtraction based on the `ALUSelect` input.
- **MUX:** A 2:1 multiplexer that selects either the upper two bits of the counter or the ALU result based on `MUXSel`.

### Module Interconnection

The counter output is divided into two 2-bit inputs:
- `a = count[3:2]`
- `b = count[1:0]`

The ALU operates on these inputs, and the multiplexer selects between `count[3:2]` and the ALU result to produce the final 2-bit `SOCOut`.

## Project Structure

```text
mini_soc/
├── counter.v
├── alu.v
├── mux.v
├── mini_soc.v
├── mini_soc_tb.v
├── run.sh
└── README.md
```

## Simulation Tools

- Verilog HDL
- Verilator
- GTKWave
- Ubuntu / WSL

## Running the Simulation

The project includes a shell script (`run.sh`) to automate compilation, simulation, and waveform viewing.

### 1. Make the script executable

```bash
chmod +x run.sh
```

### 2. Run the script

```bash
./run.sh
```

The script performs the following steps:

1. Compiles the Verilog source files using Verilator.
2. Generates the simulation executable in `obj_dir/`.
3. Runs the testbench executable (`Vmini_soc_tb`).
4. Generates the waveform file (`mini_soc.vcd`).
5. Opens the waveform in GTKWave.

### Manual Simulation

Alternatively, the simulation can be performed manually:

```bash
verilator --binary -j 0 --Wall counter.v alu.v mux.v mini_soc.v mini_soc_tb.v --top mini_soc_tb --timing --CFLAGS "-std=c++20" --trace

cd obj_dir
./Vmini_soc_tb
gtkwave mini_soc.vcd
```

## Testbench

The testbench generates a clock with a 10-time-unit period and applies reset, ALU selection, and multiplexer selection inputs at different simulation times. It also:

- Displays simulation values using `$monitor`.
- Dumps signal activity into `mini_soc.vcd`.
- Uses `$finish` to terminate the simulation.

## Future Improvements

- Extend the ALU with additional arithmetic and logical operations.
- Add more registers and functional blocks.
- Explore more complex SoC interconnections and control logic.


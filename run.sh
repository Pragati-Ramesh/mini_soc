
#!/bin/bash

# Stop if any command fails
set -e

# Build the Verilator simulation
verilator --binary -j 0 --Wall counter.v alu.v mux.v mini_soc.v mini_soc_tb.v --top mini_soc_tb --timing --CFLAGS "-std=c++20" --trace

# Move into the generated build directory
cd obj_dir

# Run the simulation
./Vmini_soc_tb

# Open the waveform in GTKWave
gtkwave mini_soc.vcd

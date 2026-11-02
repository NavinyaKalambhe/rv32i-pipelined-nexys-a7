# Simulation / software build for the RV32I cores (Icarus Verilog + RISC-V GCC)
.SILENT:
IVERILOG ?= iverilog
VVP      ?= vvp
RTL  := rtl/alu.v rtl/imm_gen.v rtl/regfile.v rtl/control.v rtl/riscv_single.v \
        rtl/riscv_pipe.v rtl/imem.v rtl/dmem.v rtl/vga_fb.v rtl/soc.v
B    := build
SEEDS := 1 2 3 4 5 6

.PHONY: all test mem random clean test-led test-prog test-diff test-vga test-bounce test-interactive

all: test

# ---- assemble programs (needs riscv64-unknown-elf-gcc) ----
mem:
	cd sw && for p in program full_test hazard_test vga_demo bounce interactive; do ./build.sh $$p.S; done

random:
	for s in $(SEEDS); do python3 scripts/gen_random_test.py $$s 900 sw/random_$$s.S && (cd sw && ./build.sh random_$$s.S); done

# ---- simulations ----
$(B):
	mkdir -p $(B)

test: test-led test-prog test-diff test-vga test-bounce test-interactive
	@echo "==== all simulations finished ===="

test-led: | $(B)
	$(IVERILOG) -g2005 -o $(B)/led_p -Ptb_soc.PIPELINED=1 $(RTL) tb/tb_soc.v
	$(IVERILOG) -g2005 -o $(B)/led_s -Ptb_soc.PIPELINED=0 $(RTL) tb/tb_soc.v
	cd sw && $(VVP) ../$(B)/led_p | grep -E "core|PASS|FAIL"
	cd sw && $(VVP) ../$(B)/led_s | grep -E "core|PASS|FAIL"

test-prog: | $(B)
	$(IVERILOG) -g2005 -o $(B)/prog_p -Ptb_prog.PIPELINED=1 $(RTL) tb/tb_prog.v
	$(IVERILOG) -g2005 -o $(B)/prog_s -Ptb_prog.PIPELINED=0 $(RTL) tb/tb_prog.v
	for p in full_test hazard_test; do \
	  $(VVP) $(B)/prog_p +prog=sw/$$p.mem | grep -E "PASS|FAIL" | sed -E "s/ +/ /g"; \
	  $(VVP) $(B)/prog_s +prog=sw/$$p.mem | grep -E "PASS|FAIL" | sed -E "s/ +/ /g"; done

test-diff: | $(B)
	$(IVERILOG) -g2005 -o $(B)/diff $(RTL) tb/tb_diff.v
	for s in $(SEEDS); do $(VVP) $(B)/diff +prog=sw/random_$$s.mem | grep -E "PASS|FAIL" | sed -E "s/ +/ /g"; done

test-vga: | $(B)
	$(IVERILOG) -g2005 -o $(B)/vga $(RTL) tb/tb_vga.v
	cd sw && $(VVP) ../$(B)/vga | grep -E "PASS|FAIL"

test-bounce: | $(B)
	$(IVERILOG) -g2005 -o $(B)/bounce $(RTL) tb/tb_bounce.v
	cd sw && $(VVP) ../$(B)/bounce | grep -E "PASS|FAIL"

test-interactive: | $(B)
	$(IVERILOG) -g2005 -o $(B)/inter $(RTL) tb/tb_interactive.v
	cd sw && $(VVP) ../$(B)/inter | grep -E "PASS|FAIL"

clean:
	rm -rf $(B) frame.txt

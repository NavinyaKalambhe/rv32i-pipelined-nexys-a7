# Publishing checklist

1. **Test on the board first.** Confirm the bitstream runs, then take a photo / short video of the VGA screen.
2. **Fill in the numbers** in README "Results" from Vivado: Reports > Report Utilization and
   Report Timing Summary (note LUT, FF, BRAM and worst negative/positive slack at 50 MHz).
3. **Edit placeholders:** `YOUR NAME` in `LICENSE`, `YOUR_USERNAME` in the README badge URLs.
4. **Add media:** put the photo/GIF in `docs/`, show it at the top of the README (replace the simulated pictures
   or keep them under a "simulated" caption).
5. **Create the repo** on github.com (New repository, name `rv32i-pipelined-nexys-a7`, public, no README/licence
   because they already exist), then from the project folder:
   ```
   git init
   git add .
   git commit -m "5-stage pipelined RV32I core with VGA output for Nexys A7"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/rv32i-pipelined-nexys-a7.git
   git push -u origin main
   ```
6. **Check CI:** the Actions tab should show a green run (it runs `make mem random` and `make test`).
7. **Repository settings:** add a one-line description, website/video link, and topics such as
   `risc-v`, `fpga`, `verilog`, `cpu`, `pipeline`, `vga`, `nexys-a7`, `computer-architecture`.
8. **Release:** Releases > Draft new release, tag `v1.0`, attach `top.bit` (from
   `vivado_project/riscv_v3.runs/impl_1/`) so others can program the board without Vivado.
9. **Commit history:** later changes in small commits with clear messages (`add forwarding unit`, `fix JALR target alignment`).
10. **Pin the repo** on your GitHub profile and link it on your resume with 1 to 2 measured numbers (CPI, MHz).

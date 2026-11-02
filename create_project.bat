@echo off
rem Double-click to build the Vivado project (needs "vivado" on the PATH,
rem otherwise open Vivado and use the Tcl console as described in README.md)
cd /d "%~dp0"
call vivado -source create_project.tcl

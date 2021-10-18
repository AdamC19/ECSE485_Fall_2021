#! /bin/bash

iverilog -o alu_tb.o adder.v arithmetic.v logic.v shifter.v conditional.v alu_tb.v
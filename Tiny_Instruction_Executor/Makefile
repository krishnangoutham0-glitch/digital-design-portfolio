# Tiny Instruction Executor Makefile

.PHONY: sim synth sta pd clean

sim:
	./scripts/simulate.sh

synth:
	./scripts/synth.sh

sta:
	./scripts/sta.sh

pd:
	./scripts/openroad.sh

clean:
	rm -rf sim/*.vvp
	rm -rf waveforms/*.vcd
	rm -rf synth/*
	rm -rf reports/simulation/*
	rm -rf reports/synthesis/*
	rm -rf reports/sta/*
	rm -rf Physical_Design/results/*
	rm -rf Physical_Design/reports/*
	rm -rf Physical_Design/gds/*
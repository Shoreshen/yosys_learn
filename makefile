# yosys =========================================================================================
build:
	-mkdir build
	cd build && make -f ../yosys/Makefile ENABLE_DEBUG=1 -j16
build_rls:
	-mkdir build_rls
	cd build_rls && make -f ../yosys/Makefile -j16
run:
	./build/yosys ./sv/test.ys
PHONY += build run
# Clean =========================================================================================
clean:
	-rm ./sv/*.json ./sv/*.rtlil
PHONY += clean
# GitHub ========================================================================================
sub_pull:
	git submodule foreach --recursive 'git pull'
commit:clean
	git add -A
	@echo "Please type in commit comment: "; \
	read comment; \
	git commit -m"$$comment"
sync: sub_pull commit 
	git push -u origin main

PHONY += commit sync
# PHONY =========================================================================================
.PHONY: $(PHONY)
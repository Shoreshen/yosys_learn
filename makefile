# GitHub ========================================================================================
sub_pull:
	git submodule foreach --recursive 'git pull'
commit:
	git add -A
	@echo "Please type in commit comment: "; \
	read comment; \
	git commit -m"$$comment"
sync: sub_pull commit 
	git push -u origin main

PHONY += commit sync
# PHONY =========================================================================================
.PHONY: $(PHONY)
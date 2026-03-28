.PHONY: update-all

update:
	$(MAKE) fmt
	nix build .#darwinConfigurations.macbook.system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#macbook

update-all:
	nix flake update
	$(MAKE) update

fmt:
	nix fmt

check-fmt:
	nix fmt -- --check

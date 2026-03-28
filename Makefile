.PHONY: update update-all

update:
	nix build .#darwinConfigurations.macbook.system
	./result/sw/bin/darwin-rebuild switch --flake .#macbook

update-all:
	nix flake update
	$(MAKE) update

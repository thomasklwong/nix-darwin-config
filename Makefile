.PHONY: all update clean update-nix update-brew update-mise _update-mise clean-nix clean-brew clean-mise fmt check-all
.DEFAULT_GOAL := all

all:
	$(MAKE) update
	$(MAKE) clean

update:
	nix flake update
	$(MAKE) _update-nix
	$(MAKE) _update-brew
	$(MAKE) _update-mise

clean:
	$(MAKE) clean-nix
	$(MAKE) clean-brew
	$(MAKE) clean-mise

update-nix:
	$(MAKE) _update-nix
	$(MAKE) clean-nix

update-brew:
	$(MAKE) _update-brew
	$(MAKE) clean-brew

update-mise:
	$(MAKE) _update-mise
	$(MAKE) clean-mise

_update-nix:
	$(MAKE) fmt
	nix build .#darwinConfigurations.macbook.system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#macbook

_update-brew:
	brew upgrade

_update-mise:
	mise upgrade --bump

clean-nix:
	rm -f result
	nix-collect-garbage --delete-older-than 7d

clean-brew:
	brew cleanup --prune=all

clean-mise:
	mise prune -y

fmt:
	nix fmt

check-all:
	$(MAKE) fmt
	nix build .#darwinConfigurations.macbook.system --dry-run

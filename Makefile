.PHONY: all update update-packages update-nix update-brew update-mas update-mise _update-nix _update-brew _update-mas _update-mise clean clean-nix clean-brew clean-mise fmt check-all
.DEFAULT_GOAL := all

BREW_PATH := /opt/homebrew/bin/brew
export PATH := /opt/homebrew/bin:$(PATH)

all: bootstrap
	$(MAKE) update
	$(MAKE) clean

# Fast update: apply local configuration changes without upgrading external package managers
update: bootstrap
	$(MAKE) _update-nix

# Full update: upgrade all package management systems (Nix flake inputs, Homebrew, MAS, Mise)
update-packages: bootstrap
	nix flake update
	$(MAKE) _update-nix
	$(MAKE) _update-brew
	$(MAKE) _update-mas
	$(MAKE) _update-mise
	$(MAKE) clean

clean: bootstrap
	$(MAKE) clean-nix
	$(MAKE) clean-brew
	$(MAKE) clean-mise

update-nix: bootstrap
	nix flake update
	$(MAKE) _update-nix
	$(MAKE) clean-nix

update-brew: bootstrap
	$(MAKE) _update-brew
	$(MAKE) clean-brew

update-mas: bootstrap
	$(MAKE) _update-mas

update-mise:
	$(MAKE) _update-mise
	$(MAKE) clean-mise

_update-nix:
	$(MAKE) fmt
	nix build .#darwinConfigurations.macbook.system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#macbook

_update-brew:
	HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_ENV_HINTS=1 $(BREW_PATH) upgrade

_update-mas:
	@if command -v mas >/dev/null 2>&1; then \
		echo "Upgrading Mac App Store apps..."; \
		mas upgrade; \
	fi

_update-mise:
	mise upgrade --bump

clean-nix:
	rm -f result
	nix-collect-garbage --delete-older-than 7d

clean-brew:
	$(BREW_PATH) cleanup --prune=all

clean-mise:
	mise prune -y

fmt:
	nix fmt

check-all:
	$(MAKE) fmt
	nix build .#darwinConfigurations.macbook.system --dry-run

bootstrap:
	@if [ ! -f $(BREW_PATH) ]; then \
		echo "Homebrew not found. Installing..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed."; \
	fi

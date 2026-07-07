.PHONY: install adopt uninstall restow brew apt

PACKAGES := ghostty nvim starship shell
STOW ?= stow
STOW_TARGET ?= $(HOME)

install:
	$(STOW) -t $(STOW_TARGET) --restow $(PACKAGES)

adopt:
	$(STOW) -t $(STOW_TARGET) --adopt $(PACKAGES)
	$(STOW) -t $(STOW_TARGET) --restow $(PACKAGES)
	@printf 'Review and commit the adopted files before continuing.\n'

uninstall:
	$(STOW) -t $(STOW_TARGET) -D $(PACKAGES)

restow:
	$(STOW) -t $(STOW_TARGET) --restow $(PACKAGES)

brew:
	brew zsh-autocomplete install stow neovim tmux ripgrep btop node ccache fzf starship \
		pre-commit stylua shfmt shellcheck gitleaks clang-format prettier

# Neovim variable definitions
apt: NVIM_ARCH := $(shell uname -m | sed 's/aarch64/arm64/')
apt: NVIM_URL := https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$(NVIM_ARCH).tar.gz
apt: NVIM_DIR := /opt/nvim-linux-$(NVIM_ARCH)
apt:
	sudo apt update && sudo apt install -y zsh-autosuggestions stow tmux zsh ripgrep btop ccache fzf \
		pre-commit shfmt shellcheck clang-format fonts-firacode python3 python3-venv unzip zsh-syntax-highlighting -y
	sudo apt install nodejs npm -y
	sudo npm install -g prettier
	curl -sS https://starship.rs/install.sh | sh

	# Latest Neovim from official release tarball
	curl -fL -o /tmp/nvim-linux-$(NVIM_ARCH).tar.gz $(NVIM_URL)
	sudo rm -rf $(NVIM_DIR)
	sudo tar -C /opt -xzf /tmp/nvim-linux-$(NVIM_ARCH).tar.gz
	sudo ln -sf $(NVIM_DIR)/bin/nvim /usr/local/bin/nvim

	# csharpier (optional, for C# format-on-save): `dotnet tool install -g csharpier`

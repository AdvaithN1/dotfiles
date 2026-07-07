.PHONY: install adopt uninstall restow brew apt

PACKAGES := ghostty nvim starship
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

apt:
	sudo apt update && sudo apt install -y zsh-autosuggestions stow tmux zsh ripgrep btop ccache fzf \
		pre-commit shfmt shellcheck clang-format fonts-firacode -y
	sudo apt install nodejs npm -y
	sudo npm install -g prettier
	curl -sS https://starship.rs/install.sh | sh

	# Neovim installation	
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt install neovim

	# csharpier (optional, for C# format-on-save): `dotnet tool install -g csharpier`

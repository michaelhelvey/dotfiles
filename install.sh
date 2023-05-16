#!/usr/bin/env bash

set -e

# NOTE: assumes that you already have an ssh key and have set up that with
# github.

# Set up other common tools prior to installing dotfiles
function ensure_exists() {
	if command -v $1 >> /dev/null; then
		echo "$1 found.  continuing";
	else
		echo "error: $1 not found.  exiting."
		exit 1
	fi
}

# xcode command line tools
# xcode-select --install
ensure_exists git
# package manager for everything else
# https://brew.sh/
ensure_exists brew

# See output of `brew list`
brew install stow
brew install wget
brew install curl
brew install tree
brew install amethyst
brew install dbeaver-community
brew install neovim
brew install bat
brew install fzf
brew install tmux
brew install tree-sitter
brew install rbenv
brew install --cask amethyst
brew install --cask dbeaver-community
brew install --cask wireshark

brew tap homebrew/cask-fonts && brew install --cask font-caskaydia-cove-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-fira-code-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-blex-mono-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-iosevka-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-iosevka-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-noto-nerd-font
brew tap homebrew/cask-fonts && brew install --cask font-ubuntu-mono-nerd-font

# Common language toolchains:

# NVM / Node:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
nvm install 18  # latest LTS as of 12/3/22
nvm alias default 18
npm i -g yarn
npm i -g pnpm

pnpm setup
pnpm i -g alacritty-themes
alacritty-themes Astromouse

# Python:
curl https://pyenv.run | bash
pyenv install 3.11.0
pyenv global 3.11.0
pip install pipenv

# Rust:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
rustup component add rust-src
rustup component add rust-analyzer
ln -s $(rustup which --toolchain stable rust-analyzer) $HOME/.cargo/bin

# common rust-based command line tools:
cargo install fd-find
cargo install exa
cargo install hyperfine
cargo install lsd
cargo install ripgrep

echo -e "Common other tools that you need that are hard to download by script:\nGo language\nJetbrains Mono Font\nVisual Studio Code\nAlacritty Terminal Emulator\n"

# Set up some common directories & dotfiles:
mkdir -p $HOME/dev/
git clone https://github.com/michaelhelvey/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles
stow .
cd -

echo "I have done my best to install a variety of common tools that you use.  Good luck."

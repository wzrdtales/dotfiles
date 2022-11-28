#!/bin/bash


printf "Installing necessary software and dependencies"

sudo pacman -Sy --noconfirm curl wget unzip python python3 xsel

if [ ! -f ~/.local/share/fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ]; then
  printf "${BLUE}Downloading Sauce Code Pro Nerd Fonts to ~/.local/share/fonts folder...${NORMAL}\n"
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts && \
    curl -sfLo "SourceCodePro.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/SourceCodePro.zip && \
    unzip -o SourceCodePro.zip && rm SourceCodePro.zip
fi

sudo pacman -S --noconfirm python-{neovim,pip} neovim the_silver_searcher git zsh powerline{,-{common,fonts}} ripgrep jq tmux

./install_2.sh


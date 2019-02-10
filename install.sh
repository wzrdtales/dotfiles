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

sudo pacman -S --noconfirm python{,2}-{neovim,pip} neovim the_silver_searcher git zsh powerline{,-{common,fonts}}

printf "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

printf "Setup config"
cp ohmyzsh/.zshrc $HOME/.zshrc
sed -i "s,/home/tobi,$HOME," $HOME/.zshrc
mkdir $HOME/.config
cp -R nvim $HOME/.config/
ln -s $HOME/.config/init.vim $HOME/.nvimrc

wget https://github.com/clvv/fasd/tarball/1.0.1 -O- | tar xz
cd clvv-fasd-*
sudo make install
cd ../
rm -Rf clvv-fasd-*

export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

printf "Adding plugins to zsh"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
mkdir $ZSH_CUSTOM/plugins/nvmng
wget https://github.com/wzrdtales/oh-my-zsh/blob/17391759ab4c6eb1e75c8648c4fdaf1a7be1bc1d/plugins/nvmng/nvmng.plugin.zsh -P $ZSH_CUSTOM/plugins/nvmng
wget https://github.com/wzrdtales/oh-my-zsh/blob/17391759ab4c6eb1e75c8648c4fdaf1a7be1bc1d/plugins/nvmng/README.md -P $ZSH_CUSTOM/plugins/nvmng/
wget https://github.com/wzrdtales/oh-my-zsh/blob/17391759ab4c6eb1e75c8648c4fdaf1a7be1bc1d/plugins/nvmng/_nvm -P $ZSH_CUSTOM/plugins/nvmng

printf "Adding python dependencies"
pip2 install yamllint

printf "Add neovim plugin manager"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



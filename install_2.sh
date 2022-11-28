#!/bin/zsh

printf "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

printf "Add nvm ng"
curl -o- https://raw.githubusercontent.com/wzrdtales/nvm-ng/v0.40.0/install.sh | bash


# Set NVM_DIR if it isn't already defined
[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"

# Load nvm if it exists
[[ -f "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --fast-reuse

nvm install 14
export PNPM_HOME="/home/tobi/.local/share/pnpm"
npm i -g pnpm prettier prettier-eslint-cli
pnpm i -g db-migrate neovim node-extension @seneca/repl eslint eslint_d conventional-changelog-cli aurelia-cli pino-pretty pdf2json nuxt typescript typescript-language-server fuge gitlab-time-tracker javascript-typescript-langserver markdown-pdf

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
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
curl -fLo "${ZSH_CUSTOM}/plugins/nvmng/nvmng.plugin.zsh" https://raw.githubusercontent.com/wzrdtales/oh-my-zsh/nvmng-plugin/plugins/nvmng/nvmng.plugin.zsh --create-dirs
curl -fLo "${ZSH_CUSTOM}/plugins/nvmng/README.md" https://raw.githubusercontent.com/wzrdtales/oh-my-zsh/nvmng-plugin/plugins/nvmng/README.md --create-dirs
curl -fLo "${ZSH_CUSTOM}/plugins/nvmng/_nvm" https://raw.githubusercontent.com/wzrdtales/oh-my-zsh/nvmng-plugin/plugins/nvmng/_nvm --create-dirs

printf "Adding python dependencies"
# pip2 install yamllint

printf "Add neovim plugin manager"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless +'echoerr 1' +'PlugInstall --sync' +qa
nvim +UpdateRemotePlugins +qa

printf "Success, please close and start your console again!"

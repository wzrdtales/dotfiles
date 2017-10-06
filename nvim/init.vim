" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'

" Theme
Plug 'iCyMind/NeoSolarized'

" Syntax
Plug 'sheerun/vim-polyglot'

" Display keymap
Plug 'hecal3/vim-leader-guide'

" Tab to completion
Plug 'ervandew/supertab'

" Syntax checker
" Plug 'w0rp/ale'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal', { 'branch': 'develop' }
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'moll/vim-node'

" JS

Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
Plug 'heavenshell/vim-jsdoc'

" snippets

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'alexbyk/vim-ultisnips-js-testing'

" search and replace
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'rking/ag.vim'
Plug 'taiansu/nerdtree-ag'
Plug 'eugen0329/vim-esearch'
Plug 'https://github.com/will133/vim-dirdiff.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" web

Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'jaxbot/browserlink.vim'

" vim

Plug 'Shougo/neco-vim'


" Themes

Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'sickill/vim-monokai'
Plug 'jpo/vim-railscasts-theme'
Plug 'nlknguyen/papercolor-theme'
Plug 'joshdick/onedark.vim'
Plug 'endel/vim-github-colorscheme'
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'

" Session

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Register

Plug 'sjl/gundo.vim'
Plug 'vim-scripts/YankRing.vim'

" Formatter

Plug 'sbdchd/neoformat', { 'do': 'npm install -g prettier prettier-eslint-cli' } 

" webdevicons must be loaded last
Plug 'ryanoasis/vim-devicons'

" Auto Matching
Plug 'jiangmiao/auto-pairs'

" Initialize plugin system
call plug#end()

source ~/.config/nvim/settings.vim
source ~/.config/nvim/map.vim



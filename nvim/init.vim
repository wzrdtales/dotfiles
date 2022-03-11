" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 Plug 'Shougo/deoplete-lsp'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'neovim/nvim-lsp'
Plug 'Shougo/echodoc.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Folding Optimization needed for auto format
Plug 'Konfekt/FastFold'


" Markdown

Plug 'junegunn/goyo.vim'


" Theme
Plug 'iCyMind/NeoSolarized'


" Debugging

Plug 'vim-vdebug/vdebug', { 'for': ['php', 'python', 'ruby', 'perl'] }

" Syntax
" GraphQL

Plug 'sheerun/vim-polyglot', { 'commit' : 'e521ba3ae205b2c79df9030a3db767405caf0457' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'statico/vim-javascript-sql', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jparise/vim-graphql'

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

" C

Plug 'Shougo/deoplete-clangx', { 'for': ['c', 'cpp'] }

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
Plug 'brooth/far.vim'
Plug 'https://github.com/will133/vim-dirdiff.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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


" Macro management
Plug 'vim-scripts/marvim'


" Initialize plugin system
call plug#end()

:lua << EOF
  local skeleton = require 'lspconfig/configs'
  local util = require 'lspconfig/util'
  local lsp = vim.lsp

  local server_name = "jsserver"
  local bin_name = "typescript-language-server"

  skeleton[server_name] = {
    default_config = {
      cmd = {bin_name,  "--stdio"};
      filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"};
      root_dir = util.root_pattern("package.json");
      log_level = lsp.protocol.MessageType.Warning;
      settings = {};
    };
    on_new_config = function(new_config)
      new_config.cmd = {bin_name, "--stdio"}
    end;
    docs = {
      description = [[
  https://github.com/theia-ide/typescript-language-server
  `typescript-language-server` can be installed via `:LspInstall tsserver` or by yourself with `npm`:
  ```sh
  npm install -g typescript-language-server
  ```
  ]];
      default_config = {
        root_dir = [[root_pattern("package.json")]];
        on_init = [[function to handle changing offsetEncoding]];
        capabilities = [[default capabilities, with offsetEncoding utf-8]];
      };
    };
  }

EOF

lua << EOF
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.dockerls.setup{}
  require'lspconfig'.clangd.setup{}
EOF
" require'lspconfig'.tsserver.setup{}

call deoplete#custom#option('num_processes', 4)

source ~/.config/nvim/settings.vim
source ~/.config/nvim/map.vim

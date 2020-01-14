syntax on
let mapleader=','
let g:neosolarized_vertSplitBgTrans = 0
let g:gitgutter_override_sign_column_highlight = 0
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround " round indent to a multiple of 'shiftwidth'
set dir=~/.swap-files
set diffopt+=vertical
set clipboard+=unnamedplus
set expandtab
filetype indent on
set backspace=indent,eol,start
if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
  highlight default link CompletePlaceHolder Comment
	highlight default link CompletePlaceHolderEnds Comment
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " No `bg` setting
end
colorscheme onedark

let g:nerdtree_tabs_autofind=1
let g:NERDTreeShowHidden=1
set laststatus=2
" Do not open preview on completion
set completeopt-=preview

" SuperTab go from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Emmet settings

let g:user_emmet_leader_key='<C-Z>'
let g:neoformat_enabled_yaml = ['prettier']
" Airline settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#format = 1

" Leader guide settings
let g:leaderGuide_max_size = 20

let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
au BufNewFile,BufRead Jenkinsfile setf groovy

" Neomake check after open and write
autocmd! BufWritePost,BufEnter * silent! Neomake

let g:neomake_open_list = 2

cabbrev gitv Gitv
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 1
" Do not use Editor config with remote files
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']



" JS

let g:deoplete#enable_at_startup = 1
let g:tern_show_signature_in_pum = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_request_timeout = 1

set foldmethod=syntax
let g:javascript_plugin_jsdoc = 1
set foldlevelstart=99
set foldlevel=99
set nofoldenable

" snippet

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"

" Search

set wildignore+=**/node_modules/**
set wildignore+=**/*.log
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
let g:far#source = 'agnvim'
let g:webdevicons_enable_ctrlp = 1
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

let g:esearch#out#win#open = 'enew'

" YAML

let g:neomake_yaml_enabled_makers = ['yamllint']

" C

let g:neomake_c_enabled_makers = ['gcc', 'clang']

" undo settings

" use presistent undo files
set undofile
" set a directory to store the undo history
set undodir=~/.config/nvim/undo/

" True color

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
  endif
endif

" Session

let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autoload = 'yes'


" Formatter

let g:neoformat_enabled_javascript = [ 'prettiereslint' ]
let g:neoformat_enabled_json = [ 'prettier' ]
augroup fmt
 autocmd!
 autocmd BufWritePre * undojoin | Neoformat
augroup END



" DevIcons

"NERDTree highlight
let s:blue = "689FB6"
let s:git_orange = 'F54D27'
let s:green = "8FAA54"
let s:red = "AE403F"
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['webpack.config.js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.git'] = ''
let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.gitconfig'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['.git'] = s:git_orange
let g:NERDTreeExactMatchHighlightColor['webpack.config.js'] = s:blue
let g:NERDTreeExactMatchHighlightColor['node_modules'] = s:red
let g:NERDTreeExactMatchHighlightColor['test'] = s:green
let g:NERDTreeExactMatchHighlightColor['tests'] = s:green
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Enable powerline font
let g:airline_powerline_fonts=1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" ack settings

let g:ackprg = 'rg --vimgrep --no-heading'
let g:grepprg='rg --vimgrep'
let g:rg_find_command = 'rg --files --follow  -g "!{.config,etc,node_modules,.git,target}/*"'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#files('.', {'source': g:rg_find_command}, 0) 

" FZF config

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF() " Floating FZF Windows
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines - (&lines * 2 / 10))
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&number', 0)
  setlocal signcolumn=no
endfunction

" User space functionality

set exrc
set secure

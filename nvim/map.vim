"Map

" Change background
map <F5> :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" NERDTree settings
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader><leader>f :NERDTreeFind<CR>

" toggle poslist

nnoremap <leader>t :lclose<CR>

command! Cnext try | cnext | catch | cfirst | catch | endtry
command! Cprev try | cprev | catch | clast | catch | endtry
command! Lnext try | lnext | catch | lfirst | catch | endtry
command! Lprev try | lprev | catch | llast | catch | endtry
nnoremap <leader>n :Cnext<CR>
nnoremap <leader>l :Lnext<CR>
nnoremap <leader>+ :vertical resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>
nnoremap <leader><leader>+ :resize +5<cr>
nnoremap <leader><leader>- :resize -5<cr>
nnoremap <leader><space> :noh<cr>

" Buffers
nnoremap <leader>T :enew<cr>
nnoremap gy :bnext<CR>
nnoremap gt :bprevious<cr>
nnoremap gm :bdelete<cr>
nnoremap <leader>q :q<CR>

" Press Enter on completion does a new line
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Move line up and down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Encode/Decode base64
vnoremap <leader>64e c<c-r>=system('base64',@")<cr><esc>
vnoremap <leader>64d c<c-r>=system('base64 --decode',@")<cr><esc>

"Leader guide
map <leader>. <Plug>leaderguide-global
nnoremap <silent> <leader> :<c-u>LeaderGuide ','<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual ','<CR>

" Fugitive mapping
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gpl :Gpull<CR>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gc :Gcommit -sv -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gbl :Gblame<CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gm :Gmerge<CR>
map <F11> [c " <F11> moves to previous change location
map <F12> ]c " <F12> moves to next change location

" Merginal
nmap <leader><leader>m :MerginalToggle<CR>

" Git
nmap <leader><leader>v :Gitv<CR>
nmap <leader><leader>V :Gitv!<CR>
vmap <leader><leader>V :Gitv!<CR>

" JS

" autocmd FileType javascript nnoremap <leader>jb :call JsBeautify()<cr>
autocmd FileType javascript nnoremap <leader>jd :TernDef<cr>
autocmd FileType javascript nnoremap <leader>jr :TernRefs<cr>
autocmd FileType javascript nnoremap <leader>jn :TernRename<cr>
autocmd FileType javascript nnoremap <leader>jt :TernType<cr>
autocmd FileType javascript inoremap <F1> :TernDocBrowse<cr>
autocmd FileType javascript nnoremap <F1> :TernDocBrowse<cr>
inoremap <expr> <C-Space> deoplete#manual_complete()

" Search

nnoremap <leader>P :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>o :CtrlPCmdPalette<cr>
nnoremap <leader>p :FZF<cr>
" Start esearch prompt autofilled with one of g:esearch.use initial patterns
call esearch#map('<leader>ee', 'esearch')
" Start esearch autofilled with a word under the cursor
call esearch#map('<leader>ew', 'esearch-word-under-cursor')


nnoremap <Leader>" ciw""<Esc>P
nnoremap <Leader>' ciw''<Esc>P
nnoremap <Leader>{ ciw{}<Esc>P
nnoremap <Leader>[ ciw[]<Esc>P

"inoremap { {<CR>}<Esc>ko
"inoremap [ []<Esc>ha

" Replacing

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" sudo

cmap w!! w !sudo tee > /dev/null %

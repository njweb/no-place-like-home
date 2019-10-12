execute pathogen#infect()

" setup tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType pug setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType stylus setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" setup linenumbers
set number
set relativenumber
set cursorline

" setup wildmode
set wildmode=longest,list,full
set wildmenu

" set splits to open to the right/below
set splitright
set splitbelow

" allow split navgation using ctrl+h/j/k/l
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"set leader to ,
let mapleader=","

" show whitespace characters (trailing spaces)
set list listchars=trail:·

" opening files (turned off for now. buftype bug was showing up_
" set autochdir " set path to current file dir
"
" goto files in a new tab
nmap gf <c-w>gf
set suffixesadd+=.js
set suffixesadd+=.jsx

"enable "stamp"ing yanked text with S key
nmap S "_diwP

" paste from yank buffer
nnoremap <leader>p "0p<CR>
nnoremap <leader>P "0P<CR>

" configure netrw without banner and tree view liststyle by default
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" allow setting cwd to current file path with :Cd
command Cd cd %:p:h

" add js comment to the beginning of all selected lines
vmap <leader>c :s/^/\/\//<CR>
vmap <leader>u :s/^\/\///<CR>

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" gruvbox config
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" adds cursor column highlight when not in insert mode
set cursorcolumn
:autocmd InsertEnter,InsertLeave * set cuc!

nmap <leader>t :r<space>~/.vim/templates/

" clear trailing whitespace on file save
autocmd BufWritePre * :%s/\s\+$//e

" lightline config
set noshowmode " disables vim's default way of showing insert status
let g:lightline = { 'colorscheme': 'wombat' }

" (disabled for now)configure folding by indent
" set foldmethod=indent
" set foldlevelstart=2
" don't open folds during text searches
set foldopen-=search

" create folds across matching brackets
nmap z{ [{v%zf
nmap z} [{v%zf
nmap z[ [[v%zf
nmap z] [[v%zf
nmap z( [(v%zf
nmap z) [(v%zf

" configure using ag instead of ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    nmap <leader>a :Ack!<space>
endif

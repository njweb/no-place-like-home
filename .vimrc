execute pathogen#infect()

" setup tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" setup linenumbers
set number
set relativenumber
set cursorline

" adds cursor column highlight when not in insert mode
set cursorcolumn
:autocmd InsertEnter,InsertLeave * set cuc!

" show whitespace characters (trailing spaces)
set list listchars=trail:·

" sets cwd to opened file location (turned off for now. buftype bug was showing up)
" set autochdir " set path to current file dir

" goto files in a new tab
nmap gf <c-w>gf
set suffixesadd+=.js
set suffixesadd+=.jsx

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

" clear trailing whitespace on file save
autocmd BufWritePre * :%s/\s\+$//e

" lightline config
set noshowmode " disables vim's default way of showing insert status
let g:lightline = { 'colorscheme': 'wombat' }

" configure folding by indent
set foldmethod=indent
set foldlevelstart=1
" don't open folds during text searches
set foldopen-=search

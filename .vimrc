execute pathogen#infect()

" setup tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType pug setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType stylus setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" setup linenumbers
set number
" set relativenumber
set cursorline

" adds cursor column highlight when not in insert mode
set cursorcolumn
:autocmd InsertEnter,InsertLeave * set cuc!

" setup wildmode
set wildmode=longest,list,full
set wildmenu

" lightline config
set noshowmode " disables vim's default way of showing insert status
let g:lightline = { 'colorscheme': 'wombat' }

" show whitespace characters (trailing spaces)
set list listchars=trail:·

" clear trailing whitespace on file save
autocmd BufWritePre * :%s/\s\+$//e

" set splits to open to the right/below
set splitright
set splitbelow

" goto files in a new tab
nmap gf <c-w>gf
set suffixesadd+=.js
set suffixesadd+=.jsx

" add some scroll offset
set so=8

" allow split navgation using ctrl+h/j/k/l
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" allow setting cwd to current file path with :Cd
command Cd cd %:p:h

" opening files (turned off for now. buftype bug was showing up)
" set autochdir " set path to current file dir
"
"set leader to ,
let mapleader=","

" allow quick resize of veritcal splits
nnoremap <leader>vr :vertical resize<space>

" jump to tab by number
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt

" open file explorer quickly
nnoremap - :Ex<CR>

" open file explorer in a new tab
nmap <leader>t :Tex<CR>

" open a vertical split
nmap <leader>s :vsp<CR>

" prepare to insert template
nmap <leader>m :r<space>~/.vim/templates/

" enable "stamp"ing yanked text with S key
nmap S "_diwP

" rerun last macro with Q key
nmap Q @@

" clear search hightlight by hitting Esc twice
nnoremap <silent> <Esc><Esc> :noh<CR>

" paste from yank buffer
nnoremap <leader>p "0p<CR>
nnoremap <leader>P "0P<CR>
vmap <leader>p d"0P<CR>

" copy current seletion to the clipboard
if executable('xsel')
    vmap <leader>c y:call system("xsel --clipboard --input", @")<CR>
endif

" enable fzf
if executable('fzf')
    set rtp+=~/.fzf
    nmap <leader>f :FZF<CR>
endif

" configure ALE linting
let b:ale_linters = ['eslint']
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

" configure netrw without banner and tree view liststyle by default
let g:netrw_banner = 0
let g:netrw_liststyle = 3

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

" yank whole line without newline
nmap <leader>y ^v$hy

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

" configure lf to manage files
if executable('lf')
    function! LF()
        let temp = tempname()
        exec 'silent !lf -selection-path=' . shellescape(temp)
        if !filereadable(temp)
            redraw!
            return
        endif
        let names = readfile(temp)
        if empty(names)
            redraw!
            return
        endif
        exec 'edit ' . fnameescape(names[0])
        for name in names[1:]
            exec 'argadd ' . fnameescape(name)
        endfor
        redraw!
    endfunction
    command! -bar LF call LF()
    nmap <leader>- :LF<CR>
endif

execute pathogen#infect()

" syntax
filetype plugin indent on
syntax enable

" better backspace
set bs=2
set backspace=indent,eol,start

" display
colorscheme SpacegrayEighties
set background=dark
set nu
set nocompatible
set autoindent
set smartindent
set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

" word wrap
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" tab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" syntax specific indentation
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" swap, backup, etc
set noswapfile

" extra: allow abbreviating of current dir
cabbr <expr> %% expand('%:p:h')

" plugin: airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_nr=1
" theme
let g:airline_theme='bubblegum'
" straight tabs
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" plugin: NERDTree
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTREEType") && b:NERDTreeType == "primary") | q | en

" plugin: indent-guides
let g:indent_guides_auto_colors=0
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd ctermbg=10
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
autocmd FileType sass :let g:indent_guides_guide_size=2

" plugin: vim-rspec
let g:rspec_command = "!clear && zeus rspec {spec}"
let g:rspec_runner = "os_x_iterm"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" plugin: vim-better-whitespace
highlight ExtraWhitespace ctermbg=10
autocmd BufWritePre * StripWhitespace

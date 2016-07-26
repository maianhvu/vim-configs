execute pathogen#infect()

" syntax
filetype plugin indent on
syntax on

" better backspace
set bs=2
set backspace=indent,eol,start

" display
set background=dark
colorscheme solarized8_dark_high
set relativenumber
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
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" syntax specific indentation
autocmd FileType rust setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType sass setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType asm setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" swap, backup, etc
set noswapfile

" extra: allow abbreviating of current dir
cabbr <expr> %% expand('%:p:h')

" plugin: airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_nr=1
let g:airline_theme='solarized'
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
let g:rspec_runner = "os_x_iterm2"
autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>

" plugin: vim-better-whitespace
highlight ExtraWhitespace ctermbg=10
autocmd BufWritePre * StripWhitespace

" plugin: Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" plugin: goyo and limelight
map <Leader>g :Goyo<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" plugin: The NERD Commenter
let NERDSpaceDelims=1

" plugin: NEOCOMPLETE
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" plugin: Tagbar
nmap <C-g> :TagbarToggle<CR>

" plugin: vim-racer
set hidden
let g:racer_cmd=$HOME."/.cargo/bin/racer"

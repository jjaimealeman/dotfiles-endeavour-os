" Thu Nov  4 12:31:26 AM MDT 2021
" Wed Nov  3 11:35:03 PM MDT 2021
" /home/jaime/.config/nvim/init.im

let mapleader = "/"


" https://github.com/junegunn/vim-plug#usage
" Specify a directory for plugins
" call plug#begin()
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" For example:
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"let g:termguicolors = true  Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Initialize plugin system
Plug 'Mofiqul/dracula.nvim'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color.git'
call plug#end()


" let g:termguicolors = true
" let g:dracula_show_end_of_buffer = true  " default false, Turn on or off EndOfBuffer symbol
" let g:dracula_transparent_bg = true " default false, enables transparent background
colorscheme dracula


" Remap Ctrl + s to save
" https://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>


nnoremap <esc><esc> :nohlsearch<cr>     " Un-highlight by pressing ESCAPE twice
" nnoremap <leader>s :w!<cr>              " Fast Saving
nnoremap ss :w!<cr>              " Fast Saving
" nnoremap <leader>q :q!<cr>              " Fast Quit
nnoremap qq :q!<cr>              " Fast Quit
nnoremap <leader>v :vsplit<cr>          " Split v
nnoremap <leader>h :split<cr>           " Split h
nnoremap cf :let @* = expand("%")<cr>   " Copy current filename: init.vim
nnoremap cp :let @* = expand("%:p")<cr> " Copy current filepath: /home/jaime/.config/nvim/init.vim
nnoremap td :-r !date<cr>               " Insert TimeDate stamp


if (has("termguicolors"))
    set termguicolors
endif


" What colorscheme?
" :colorscheme [space] [Ctrl+d]
" Shows available colorschemes


" SOURCE https://dev.to/matrixersp/how-to-use-fzf-with-ripgrep-to-selectively-ignore-vcs-files-4e27
"command! -bang -nargs=*  All
"  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{node_modules/*,.git/*}"', 'down': '40%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))
"nnoremap <silent> <leader>o :All<cr>
"" Plug '~/.fzf'
"" Plug 'junegunn/fzf.vim'



" CODE FOLDING, hit 'za' IN NORMAL! {{{
" https://learnvimscriptthehardway.stevelosh.com/chapters/18.html
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


" AUTOMATICALLY RELOAD CONFIG ON SAVE. {{{
" https://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2403926#2403926
augroup myvimrc
    au!
    au BufWritePost init.vim,.vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" }}}


filetype plugin on
filetype on
set autochdir                           " Your working directory will always be the same as your working directory
set autoindent                          " indent a new line the same amount as the line just typed
" set background=dark                     " tell vim what the background color looks like
set cc=200                              " set an 80 column border for good coding style
set clipboard=unnamed,unnamedplus               " Copy paste between vim and everything else
set cmdheight=2                         " More space for displaying messages
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline                          " highlight current cursor line
set encoding=utf-8                      " The encoding displayed
set expandtab                           " converts tabs to white space
set fileencoding=utf-8                  " The encoding written to file
set formatoptions-=cro                  " Stop newline continution of comments
"set guifont=FiraCode\ Nerd\ Font\ Mono:h13
set hidden                              " Required to keep multiple buffers open multiple buffers
set hlsearch                            " highlight search 
set ignorecase                          " case insensitive 
set incsearch                           " incremental search
set iskeyword+=-                      	" treat dash separated words as a word text object"
set laststatus=2                        " Show the status line
set mouse=a                             " enable mouse click
set mouse=v                             " middle-click paste with 
set nobackup                            " This is recommended by coc
set nocompatible                        " disable compatibility to old-time vi
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
"set nowrap                              " Display long lines as just one line
set nowritebackup                       " This is recommended by coc
set number                              " add line numbers
set pumheight=10                        " Makes popup menu smaller
set ruler              			        " Show the cursor position all the time
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set scrolloff=10                        " ALWAYS SHOW 10 LINES ABOVE AND BELOW THE CURSOR
set shortmess+=c                        " Don't pass messages to ins-completion-menu.
set showmatch                           " show matching 
set showtabline=2                       " Always show tabs
set smartindent                         " Makes indenting smart
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set softtabstop=4                       " see multiple spaces as tabstops so <BS> does the right thing
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
" STATUSLINE {{{
set statusline+=\ %y                    " FileType of the file
set statusline+=\ %F                    " Full path to the file
set statusline+=%=                      " Align to Right
set statusline+=[%c:%l/%L]                      " Current Lline
set statusline+=\ [%p%%]
" }}}
set t_Co=256                            " Support 256 colors
set tabstop=4                           " number of columns occupied by a tab 
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set ttyfast                             " Speed up scrolling in Vim
set updatetime=300                      " Faster completion
set wildmode=longest,list               " get bash-like tab completions
syntax enable                           " Enables syntax highlighing
syntax on                               " syntax highlighting


" SOURCES
" https://learnvimscriptthehardway.stevelosh.com/ 
" https://shapeshed.com/vim-statuslines/
" https://marioyepes.com/vim-setup-for-modern-web-development/
" https://github.com/kyoz/neovim
" https://www.reddit.com/r/vim/comments/p4tlux/what_are_the_most_useful_lines_in_your_vimrc/
" https://neovim.io/doc/user/



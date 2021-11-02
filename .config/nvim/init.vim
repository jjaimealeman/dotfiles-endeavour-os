" Tue Nov  2 10:20:32 AM MDT 2021
"
"                          __  ___       _   ________  ___
"                         /  |/  /_ __  | | / /  _/  |/  /
"                        / /|_/ / // /  | |/ // // /|_/ / 
"                       /_/  /_/\_, /   |___/___/_/  /_/  
"                              /___/                      
"
"--------------------------------------------------------------------------------------------------

" CODE FOLDING, hit 'za' IN NORMAL! {{{
" https://learnvimscriptthehardway.stevelosh.com/chapters/18.html
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}


if (has("termguicolors"))
    set termguicolors
endif


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
set background=dark                     " tell vim what the background color looks like
set cc=200                              " set an 80 column border for good coding style
set clipboard=unnamed,unnamedplus               " Copy paste between vim and everything else
set cmdheight=3                         " More space for displaying messages
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline                          " highlight current cursorline
set encoding=utf-8                      " The encoding displayed
set expandtab                           " converts tabs to white space
set fileencoding=utf-8                  " The encoding written to file
set formatoptions-=cro                  " Stop newline continution of comments
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
set nowrap                              " Display long lines as just one line
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

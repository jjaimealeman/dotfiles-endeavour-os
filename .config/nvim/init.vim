call plug#begin('~/.local/share/nvim/plugged')
"Using vim-plug https://github.com/junegunn/vim-plug

    " FILE EXPLORER WITH ICON SUPPORT
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}    " FILE NAVIGATION
    Plug 'ryanoasis/vim-devicons'                           " FILE NAVIGATION ICONS
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}       " INSTALL FUZZY FINDER
    Plug 'junegunn/fzf.vim'                                 " ENABLE FUZZY FINDER
    Plug 'neoclide/coc.nvim', {'branch': 'release'}         " INTELLISENSE

    Plug 'vim-airline/vim-airline'
    Plug 'jiangmiao/auto-pairs'
    Plug 'dracula/vim'
    Plug 'sheerun/vim-polyglot'                             " syntax highlighting
    Plug 'mhinz/vim-startify'
    Plug 'valloric/matchtagalways'                          " ALWAYS HIGHLIGHT ENCLOSING TAGS

"may 22 2022
"installing new plugins
    " https://github.com/romgrk/barbar.nvim
"    Plug 'kyazdani42/nvim-web-devicons'
 "   Plug 'romgrk/barbar.nvim'


call plug#end()


if (has("termguicolors"))
    set termguicolors
endif


let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
"nnoremap <silent> <C-b> :NERDTreeToggle<CR>
"nnoremap <C-p> :Files<cr>
nmap <F3> :NERDTreeToggle<CR>


if has("nvim-0.5.0") || has("patch-8.1.1564")             " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=number                                     " Recently vim can merge signcolumn and number column into one
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')


" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" This will install the tsserver (for javascript), json, html, css, php and python extensions. 
" Also will install a diagnostic extension that can take care of linting and formating using external tools.
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-python',
	\ 'coc-diagnostic'
    \]








colorscheme dracula

filetype plugin indent on               " allow auto-indenting depending on file type
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
set laststatus=0                        " Always display the status line
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
set scrolloff=25                        " ALWAYS SHOW 10 LINES ABOVE AND BELOW THE CURSOR
set shortmess+=c                        " Don't pass messages to ins-completion-menu.
set showmatch                           " show matching 
set showtabline=2                       " Always show tabs
set smartindent                         " Makes indenting smart
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set softtabstop=4                       " see multiple spaces as tabstops so <BS> does the right thing
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " number of columns occupied by a tab 
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set ttyfast                             " Speed up scrolling in Vim
set tw=80                               " text wrap
set updatetime=300                      " Faster completion
set wildmode=longest,list               " get bash-like tab completions
syntax enable                           " Enables syntax highlighing
syntax on                               " syntax highlighting


" https://marioyepes.com/vim-setup-for-modern-web-development/
" https://github.com/kyoz/neovim
" https://www.reddit.com/r/vim/comments/p4tlux/what_are_the_most_useful_lines_in_your_vimrc/
" https://neovim.io/doc/user/


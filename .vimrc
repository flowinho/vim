"
" ▒█▀▀▀ █░░ █▀▀█ █▀▀█ ░▀░ █▀▀█ █▀▀▄ 　 ▒█▀▀▀█ █▀▀ █░░█ █░░█ ▀▀█▀▀ ▀▀█▀▀ █░█ █▀▀█ █░░░█ █▀▀ █░█ ░▀░ 
" ▒█▀▀▀ █░░ █░░█ █▄▄▀ ▀█▀ █▄▄█ █░░█ 　 ░▀▀▀▄▄ █░░ █▀▀█ █░░█ ░░█░░ ░░█░░ █▀▄ █░░█ █▄█▄█ ▀▀█ █▀▄ ▀█▀ 
" ▒█░░░ ▀▀▀ ▀▀▀▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀░░▀ 　 ▒█▄▄▄█ ▀▀▀ ▀░░▀ ░▀▀▀ ░░▀░░ ░░▀░░ ▀░▀ ▀▀▀▀ ░▀░▀░ ▀▀▀ ▀░▀ ▀▀▀
"
"                   █░█ █ █▀▄▀█   █▀█ █░█ █▄░█   █▀▀ █▀█ █▀▄▀█ █▀▄▀█ ▄▀█ █▄░█ █▀▄ █▀
"                   ▀▄▀ █ █░▀░█   █▀▄ █▄█ █░▀█   █▄▄ █▄█ █░▀░█ █░▀░█ █▀█ █░▀█ █▄▀ ▄█
" 
"                          Copyright 2023 Florian Schuttkowski, Licensed GPL3
"                    For additional information, visit https://github.com/flowinho
"
" ======================%%========================%%==========================%%=====================
"
" Compability with VI can cause unexpected issues.
set nocompatible

" VIM will try to detect the type of the file in use.
filetype on

" If available, enable plugins based on the detected filetype.
filetype plugin on

" If available, load file-type specific indentation.
filetype indent on

" Enable syntax-highlighting
syntax on

" Display Line-Numbers on the left side of VIM
set number

" Display a vertial line that helps with spotting the cursor
set cursorcolumn

" Display a horizontal line that helps with spotting the cursor
set cursorline

" Shift width is equal to four spaces
set shiftwidth=4

" Tab width is equal to four spaces
set tabstop=4

" Pressing tab replaces tab with four spaces
set expandtab

" Do not save backup files - living on the edge.
set nobackup

" Do not wrap lines.
set nowrap

" While searching a file using /, highlight matching keywords
set incsearch

" Ignore case while searching
set ignorecase

" Smartcases enables search for specific capital letters
set smartcase

" Display last typed command in the line of the screen
set showcmd

" Display mode VIM is currently operating in on the last line.
set showmode

" Show matching words during a search
set showmatch
set scrolloff=10

" Use highlighting when performing a search.
set hlsearch

" Set command history to 1000. - Default is 20.
set history=1000

" Enable auto completion menu after pressing TAB
set wildmenu

" Wildmenu should behave like bash completion for consistency
set wildmode=list:longest

" COLORS ----- {{{
" See also section VIMSCRIPT - code is added to support 24bit color depth
" inside VIM - this is needed for onedark to be displayed appropriately.
colorscheme onedark
" }}}

" PLUGINS --------------------------------------------------------------------------- {{{
" 
" Plugin-Manager of my choise atm is VIM-Plug. Install it on macOS / Linux using 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" To enable plugins, function calls need to be placed in this section.
" After adding lines here, install Plugins using command
" :PlugInstall
call plug#begin('~/.vim/plugged')

    " Asynchronous Lint Engine
    Plug 'dense-analysis/ale'
    " NerdTree, a file-browser sidebar
    Plug 'preservim/nerdtree'

call plug#end()
" }}}

" VIMSCRIPT ------------------------------------------------------------------------- {{{
"
" This will enable code folding.
" Commands are:
" - zo to open fold under cursor.
" - zc to close fold under cursor.
" - zR to open all folds.
" - zM to close all folds.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

" Enable 24bit colors support inside VIM
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" }}}

" STATUSLINE ------------------------------------------------------------------------ {{{
hi StatusLine ctermbg=3 ctermfg=4
set laststatus=2
set statusline+=%#DiffAdd#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
" }}}

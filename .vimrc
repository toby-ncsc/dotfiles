
" Pathogen
execute pathogen#infect()


" Color scheme
"let base16colorspace=256
syntax on
"set background=dark
let g:molokai_original=1
set t_Co=256
"colorscheme solarized
"colorscheme base16-default


" Set tabs to 4 spaces
set cursorline
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 
set smarttab


" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" line numbers
set number
"highlight LineNr ctermfg=DarkGray


" Highlight searching
set incsearch
set showmatch
set hlsearch


" Highlight line width
"highlight ColorColumn ctermbg=magenta 
"call matchadd('ColorColumn', '\%81v', 100)


" Disable the arrow keys to force good vim practice
"no <down> <Nop>
"no <left> <Nop>
"no <right> <Nop>
"no <up> <Nop>
"ino <down> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
"ino <up> <Nop>


" NERDTree toggle key
map <C-n> :NERDTreeToggle<CR>


" Map jj to escape insert mode, its quicker
imap jj <Esc>


" Filetype stuff
filetype plugin on 
filetype indent on


" Get rid of anoying files
set nobackup " do not keep backups after close
set nowritebackup " do not keep a backup while working
set noswapfile " don't keep swp files either


" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2





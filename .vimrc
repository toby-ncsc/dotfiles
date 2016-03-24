
" Set tabs to 4 spaces
set number
set cursorline
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 
set smarttab

" Highlight searching
set incsearch
set showmatch
set hlsearch

" Highlight line width
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

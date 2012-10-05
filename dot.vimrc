runtime! debian vim
:syntax on
:set nocp
:set autoindent
":set autowrite
":ab #d #define
":ab #i #include
":ab #c /****************************************
":ab #e <Space>****************************************/
":ab #l /*-------------------------------------------- */
":ab #n McKinnley R Workman
:set shiftwidth=4
:set hlsearch
:set number
:set incsearch
:set textwidth=80
:set cmdheight=2
:set showcmd
:set showmode
:set showmatch
:set smartcase
:set hidden             " Hide buffers when they are abandoned
":set mouse=a		" Enable mouse usage (all modes) " NOT GOOD
:set report=0
:set winheight=9999
:set so=5
:set laststatus=2
:set statusline=%<%F\ %h%m%r%w%=%-14.(%l,%c%)\ %P

"Make C header file template
"http://www.math.technion.ac.il/Site/computing/docs/vim/autocmd.html#BufNewFile for awesome information
autocmd bufnewfile *.c so /home/mckinnley/dotfiles/Templates/c_header.txt
autocmd bufnewfile *.c exe "1," . 10 . "g/File Name:.*/s//File Name: " .expand("%")
autocmd bufnewfile *.c exe "1," . 10 . "g/Creation Date:.*/s//Creation Date: " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 10 . "g/Last Modified:.*/s/Last Modified:.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

"Make html header file template --> autocmd {event} {pattern} {cmd}
autocmd bufnewfile *.html so /home/mckinnley/dotfiles/Templates/html_header.txt

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

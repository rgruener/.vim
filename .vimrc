syntax on
set nu
set tabstop=4|set shiftwidth=4|set expandtab
set softtabstop=4
set listchars=tab:>-,eol:↵
set list
autocmd BufEnter * match Todo /\s\+$\| \+\ze\t/
filetype plugin indent on
filetype plugin on
au FileType skh,xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim
call pathogen#infect()
map <C-D> :cal SetSyn("htmldjango")<Enter>
let g:pep8_map='<F6>'

syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

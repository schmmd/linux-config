"
" Maintainer: Michael Schmitz
"
"

set expandtab
set shiftwidth=4
set tabstop=4

" indent/format entire file, retaining cursor position
" http://stackoverflow.com/q/7933015/568393
nnoremap <LEADER>i mmgg=G'm^
nnoremap <LEADER>f mmgggqG'm^

" remove trailing spaces
nnoremap <silent> <LEADER>s :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
call plug#end()

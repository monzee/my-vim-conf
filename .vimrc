call pathogen#infect()

syntax on

set nu
set showcmd
set ignorecase
set smartcase
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=2
set smarttab
set incsearch
set hlsearch
set t_Co=256
set hidden
set wildmenu
set splitbelow
set splitright
colo mustang
set completeopt=longest,menuone
set scrolloff=5
"for vim 7.3+
set cc=81

"match ErrorMsg /\%81v.\+/
map <space> <PageDown>
map j gj
map k gk
map Y y$

"window movement
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-S-Left> <C-w>h
nnoremap <C-S-Right> <C-w>l
nnoremap <C-S-Up> <C-w>k
nnoremap <C-S-Down> <C-w>j
"indent in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv
"clear search
nnoremap <silent> <leader><space> :let @/=''<CR>
"emacs movement keys
noremap b B
noremap f E
noremap d dw
inoremap <M-b> <S-Left>
inoremap f <S-Right>
inoremap d <Esc>ldwi

"save on alt-tab
"au FocusLost * :wa

au BufRead,BufNewFile *.phtml setl ts=2 sw=2 sts=2
au FileType python setl tabstop=2 shiftwidth=2 softtabstop=2
au FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2
au FileType javascript setl tabstop=2 shiftwidth=2 softtabstop=2
au FileType html   setl tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
if exists('loaded_taglist')
	nmap <silent> <F8> :TlistToggle<CR>
endif
"buffer selection
noremap <C-j> <Esc>:bn<CR>
noremap <C-k> <Esc>:bp<CR>
noremap <C-h> <Esc>:bp<CR>
noremap <C-l> <Esc>:bn<CR>
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionType = "context"

function! s:ExecuteInShell(command, bang)
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^' . _ . '$')
        silent! execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'
        let s:lastShell = bufnr('%')
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
        silent! :%d
        let message = 'Executing ' . _ . '...'
        call append(0, message)
        echo message
        silent! 2d | resize 1 | redraw
        silent! execute 'silent! %!'. _
        silent! execute 'resize ' . line('$')
"        silent! execute 'syntax on'
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'autocmd BufLeave <buffer> execute "resize " . min([5, line("$")])'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
"        silent! syntax on
    endif
endfunction

function! RerunLastShell()
    if s:lastShell > 0
        call s:ExecuteInShell(s:_, '')
    endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
let s:lastShell = -1
nnoremap <silent> <leader>r :call RerunLastShell()<cr>

let g:ctrlp_working_path_mode = 2
set wildignore+=*/.git/*,*/.git/*,*/.svn/*,.*.swp

nnoremap <leader>f :FufFile<cr>
nnoremap <leader>t :FufBuffer<cr>

nnoremap <leader>o :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1

" turns 'lambda' to the greek char
au VimEnter * syntax keyword Statement lambda conceal cchar=λ
au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2

au FileType scheme setl tabstop=2 shiftwidth=2 softtabstop=2
au FileType scala setl tabstop=2 shiftwidth=2 softtabstop=2

set cursorline
hi! link ColorColumn CursorColumn
set go=aegit
set guifont=Cousine\ 9

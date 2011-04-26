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
colo mustang
set completeopt=longest,menuone

nmap <space> <PageDown>

au FileType python setl tabstop=2 shiftwidth=2 softtabstop=2

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
if exists('loaded_taglist')
	nmap <silent> <F8> :TlistToggle<CR>
endif

"imap <C-f> <C-x><C-o>
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"\ "\<lt>C-n>" :
"\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>
"inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : ""

noremap <C-j> <Esc>:bn<CR>
noremap <C-k> <Esc>:bp<CR>
noremap <C-h> <Esc>:bp<CR>
noremap <C-l> <Esc>:bn<CR>
noremap <C-f><C-f> :FufFile<CR>
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

"let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionType = "context"

"dein Scripts-----------------------------
if &compatible
  set nocompatible " Be iMproved
endif

augroup MyAutoCmd
    " initializing
    " prevent from duplicate command definition at reloading
    autocmd!
    " when entering buffer on the terminal mode, switch to the terminal mode
    au BufEnter term://* startinsert
augroup END

" pyenv support
" assume that the environment 'neovim' has already been created with pyenv virtualenv
" $ pyenv virtualenv 3.6.1 neovim
" $ pyenv activate neovim
" $ pip install neovim jedi
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'


" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  let s:toml_dir = '~/.config/nvim/'
  call dein#load_toml(s:toml_dir . 'dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . 'dein_lazy.toml', {'lazy': 1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" set shiftwidth=4
set number
set ruler
set undofile
set matchpairs& matchpairs+=<:>
set hidden  " allow not to save the buffer before switch the buffer

" disable to switch the mode when select with the mouse
set mouse-=a

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
		\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap ,f :Denite -mode=normal file_mru<cr><esc>
nnoremap ,b :Denite -mode=normal buffer<cr><esc>
nnoremap ,l :Denite -mode=normal file<cr><esc>
nnoremap ,d :Denite -mode=normal directory_mru<cr>
nnoremap ,g :Denite -mode=normal ghq<cr>
nnoremap ,/ :Denite -mode=normal grep<cr>

" define the command to reload init.vim
command! R source ~/.config/nvim/init.vim

" deoplete-jedi
" https://github.com/zchee/deoplete-jedi#options
let g:deoplete#sources#jedi#python_path = $PYENV_ROOT . '/versions/neovim/bin/python'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete key mapping
inoremap <silent><expr><Up>     pumvisible() ? "\<C-p>"  : "\<Up>"
inoremap <silent><expr><Down>   pumvisible() ? "\<C-n>"  : "\<Down>"
inoremap <silent><expr><Tab>    pumvisible() ? "\<C-n>".deoplete#mappings#close_popup() : "\<Tab>"

" neoterm
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'

" Ctrl + O : switch the terminal mode to normal mode
tnoremap <silent> <C-o> <C-\><C-n>
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
" C-z : to background
tnoremap <C-z> <C-\><C-N><C-z>
tnoremap <C-f> <C-\><C-N>:Denite -mode=normal file_mru<cr><esc>
tnoremap <C-b> <C-\><C-N>:Denite -mode=normal buffer<cr><esc>
tnoremap <C-d> <C-\><C-N>:Denite -mode=normal directory_mru<cr>
tnoremap <C-g> <C-\><C-N>:Denite -mode=normal ghq<cr>
tnoremap <C-u> <C-\><C-N><C-b>

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

" command! -nargs=1 -complete=dir Tcd call TBcd("<args>")
" tnoremap <C-i> <C-\><C-N> :Tcd 

" Useful maps
nnoremap <silent> ,to :Topen<cr>
nnoremap <silent> ,tt :Ttoggle<cr>
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
" command! Troutes :T rake routes
" command! -nargs=+ Troute :T rake routes | grep <args>
" command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

" change the window size
nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" gtags
nnoremap <C-s> :Gtags

" jedi-vim
" let g:jedi#completions_command = '<Tab>'
" let g:jedi#popup_select_first = 0
" let g:jedi#popup_on_dot = 0

" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0

" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif

" let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" set runtimepath+=~/.config/nvim/neoterm-cd

" typescript
" https://github.com/leafgarland/typescript-vim#indenting
let g:typescript_indent_disable = 1

" markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

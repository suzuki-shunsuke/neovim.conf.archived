"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

augroup MyAutoCmd
    " 初期化
    " リロードした際に２重でコマンドが定義されないようにする
    autocmd!
    " terminal モードのバッファに入ったら自動でterminalモードになるようにする
    au BufEnter term://* startinsert
augroup END

" pyenv support
" pyenv virtualenv で neovimというenvを作っている前提
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

" set shiftwidth=4  " 自動インデントでずれる幅。タブキーで入力されるスペースの数
set number  " 行番号の表示
set ruler  " カーソルが何行目の何列目に置かれているか表示
set undofile
set matchpairs& matchpairs+=<:>  " 対応括弧に'<'と'>'のペアを追加
set hidden  " bufferを切り替える時に編集中ファイルを保存しなくても良くする

" マウスで選択時にモードが切り替わるのを無効にする
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

" init.vimを再読み込みするコマンド
command! R source ~/.config/nvim/init.vim

" let res = webapi#http#get("http://localhost:3000/posts/1")
" let obj = webapi#json#decode(res["content"])
" echo obj["title"]

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" deoplete key mapping
inoremap <silent><expr><Up>     pumvisible() ? "\<C-p>"  : "\<Up>"
inoremap <silent><expr><Down>   pumvisible() ? "\<C-n>"  : "\<Down>"
inoremap <silent><expr><Tab>    pumvisible() ? "\<C-n>".deoplete#mappings#close_popup() : "\<Tab>"

" neoterm
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'

" Ctrl + O で TerminalモードからNomalモードに切り替える
" 最初 esc を割り当てていたが、
" Zsh Line Editorのモード切替とバッティングするため変更
tnoremap <silent> <C-o> <C-\><C-n>
" normalモードに切り替えなくてもterminalモードのまま
" 他のウィンドウに移動できるようにする
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
" C-zでバックグランドにする
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

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w>><CR>
nnoremap <S-Right> <C-w><<CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" gtags
nnoremap <C-s> :Gtags

" jedi-vim
" let g:jedi#completions_command = "<Tab>"  " 補完キー
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

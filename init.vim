"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" pyenv support
" let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
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

" unite.vim, denite.nvim のキーバインド
nnoremap ,f :Unite file_mru
nnoremap ,b :Unite buffer
nnoremap ,l :Unite file

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

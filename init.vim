"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/shunsuke/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/shunsuke/.local/share/dein')
  call dein#begin('/Users/shunsuke/.local/share/dein')
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

set shiftwidth=4  " 自動インデントでずれる幅。タブキーで入力されるスペースの数
set number  " 行番号の表示
set ruler  " カーソルが何行目の何列目に置かれているか表示
set undofile

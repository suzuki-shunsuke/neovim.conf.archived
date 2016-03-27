" 自動コマンド: ファイル読み書きやバッファを開いたりした際に実行されるコマンド
" 自動コマンドをグループにまとめる
" グループ単位で実行したり削除したり出来る
" 全ての自動コマンドを MyAutoCmd で定義する
augroup MyAutoCmd
    " 初期化
    " リロードした際に２重でコマンドが定義されないようにする
    autocmd!
augroup END

if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('scrooloose/syntastic')  " 構文チェック
call dein#add('Shougo/unite.vim')
call dein#add('thinca/vim-quickrun')  " 適切なプログラムを選択実行
call dein#add('tpope/vim-surround')  " 通り囲んでいるものを操作
call dein#add('mattn/webapi-vim')  " Web API のインタフェース
call dein#add('tyru/open-browser.vim')  " ブラウザで URI を開く
call dein#add('Shougo/neomru.vim')  " MRU plugin includes unite.vim MRU sources
call dein#add('Shougo/vimshell.vim')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('vim-scripts/Align')  " テキスト整形
call dein#add('godlygeek/tabular')  " テキストフィルタリングと整形
" call dein#add('vim-scripts/YankRing.vim')  " ヤンクの履歴の保持、変更、削除
" call dein#add('thinca/vim-template')
" call dein#add('mattn/gist-vim')  " Gist に投稿
" call dein#add('Shougo/neosnippet')  " スニペットを用いた補完
" call dein#add('Shougo/neosnippet-snippets')  " neosnippet の標準的なスニペットリポジトリ
" call dein#add('honza/vim-snippets')  " スニペットリポジトリ
" call dein#add('aklt/plantuml-syntax')  " PlantUML のシンタクスハイライト
" call dein#add('basyura/twibill.vim')  " basyura/TweetVim が依存
" call dein#add('h1mesuke/unite-outline')  " basyura/TweetVim が依存
" call dein#add('basyura/bitly.vim')  " basyura/TweetVim が依存
" call dein#add('mattn/favstar-vim')  " basyura/TweetVim が依存
" call dein#add('basyura/TweetVim')
" call dein#add('sudo.vim')
" call dein#add('revolunet/sublimetext-markdown-preview')
" call dein#add('kannokanno/previm')

call dein#end()

filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" JavaScript
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_javascript_gjslint_args = '--strict --disable 0110'
" Python
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_python_pep8_args = ''
let g:syntastic_python_pep8_args = "--ignore E501,E402"

" VimShell
" 動的プロンプト
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser',
\   },
\ }

colorscheme ron
syntax enable     " 構文ハイライトを有効化
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する

" エンコード
" hateblo.vim でブログを投稿する際の文字化け防止
set fileencoding=UTF-8
set termencoding=UTF-8

" 検索関係
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" 編集関係
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start  " バックスペースでなんでも消せるようにする

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard& clipboard+=unnamedplus
    set clipboard& clipboard+=unnamedplus,unnamed
else
    " set clipboard& clipboard+=unnamed,autoselect
    set clipboard& clipboard+=unnamed
endif

set nowritebackup  " ファイルの上書きの前にバックアップを作らない
set nobackup       " 既存のファイルに(追加でなく)書き込む前にバックアップを生成しない
set noswapfile     " スワップファイルを作成せずに新しいバッファを開く

" 表示関係
set number       " 行番号の表示
set wrap         " 長いテキストの折り返し
set textwidth=0  " 自動的に改行が入るのを無効化
set ruler        " カーソルが何行目の何列目に置かれているか表示

set t_vb=  " エラー時に音もフラッシュも使わない

" マクロおよびキー設定

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" ヘルプを垂直に分割して開く
cnoremap vh vertical help

nnoremap ,uf :Unite file_mru
nnoremap ,ub :Unite buffer

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

vnoremap v $h " vを二回で行末まで選択

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" ファイル管理関係
" vim-templateによるテンプレートファイルの使用

" テンプレート中に含まれる特定文字列を置き換える
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction
" move the cursor to <+CURSOR+> included in the template.
autocmd MyAutoCmd User plugin-template-loaded
    \   if search('<+CURSOR+>')
    \ |   silent! execute 'normal! "_da>'
    \ | endif

" save the undo history.
set undodir=~/.vimundo
set undofile

" neosnippet Configuration
" Plugin key-mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" For snippet_complete marker.
" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif

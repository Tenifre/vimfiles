"" 基本設定
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set laststatus=2   " ステータス行を常に表示
set showcmd " 入力中のコマンドを表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set listchars=tab:▸\ ,extends:❯,precedes:❮ " 不可視文字の表示記号指定
set confirm "保存されていないファイルがあるときは終了前に保存確認
set hidden "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread "外部でファイルに変更がされた場合は読みなおす
set nobackup "ファイル保存時にバックアップファイルを作らない
set noswapfile "ファイル編集中にスワップファイルを作らない
set hlsearch "検索文字列をハイライトする
set incsearch "インクリメンタルサーチを行う
set ignorecase "大文字と小文字を区別しない
set smartcase "大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan "最後尾まで検索を終えたら次の検索で先頭に移る
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set showmatch matchtime=1 "括弧の対応表示時間
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P "ステータスラインに文字コードと改行文字を表示する

"" プラグイン関連
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'basyura/TweetVim'
  NeoBundle 'mattn/webapi-vim'
  NeoBundle 'daisuzu/facebook.vim'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'taichouchou2/html5.vim'
  NeoBundle 'taichouchou2/vim-javascript'
  NeoBundle 'basyura/twibill.vim'
  NeoBundle 'h1mesuke/unite-outline'
  NeoBundle 'basyura/bitly.vim'
  NeoBundle 'yuratomo/gmail.vim'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'modsound/gips-vim'
  NeoBundle 'Jinja'
  NeoBundle 'ocim/htmljinja.vim'

  " solarized カラースキーム
  NeoBundle 'altercation/vim-colors-solarized'
  " mustang カラースキーム
  NeoBundle 'croaker/mustang-vim'
  " wombat カラースキーム
  NeoBundle 'jeffreyiacono/vim-colors-wombat'
  " jellybeans カラースキーム
  NeoBundle 'nanotech/jellybeans.vim'
  " lucius カラースキーム
  NeoBundle 'vim-scripts/Lucius'
  " zenburn カラースキーム
  NeoBundle 'vim-scripts/Zenburn'
  " mrkn256 カラースキーム
  NeoBundle 'mrkn/mrkn256.vim'
  " railscasts カラースキーム
  NeoBundle 'jpo/vim-railscasts-theme'
  " pyte カラースキーム
  NeoBundle 'therubymug/vim-pyte'
  " molokai カラースキーム
  NeoBundle 'tomasr/molokai'

  " カラースキーム一覧表示に Unite.vim を使う
  NeoBundle 'ujihisa/unite-colorscheme'
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#rc(expand('~/.vim/bundle/'))
      call s:LoadBundles()
    catch
      call s:WithoutBundles()
    endtry 
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()

" syntastic
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'active_filetypes': [], 
  \ 'passive_filetypes': ['html', 'javascript'] }
let g:syntastic_auto_loc_list = 1 
let g:syntastic_javascript_checker = 'gjslint'

" Gmail
let g:gmail_user_name = 'tenifre@gmail.com'
let g:gmail_imap = 'imap.gmail.com:993'
let g:gmail_smtp = 'smtp.gmail.com:465'
let g:gmail_signature = 'Yu Arai'

" カーソルキー禁止
let g:gips_reading_txt = '$HOME/.vim/template/gips-message.txt'

"シンタックスハイライトを有効にする
if has("syntax")
  syntax on
endif

colorscheme mrkn256

"テンプレート読み込み
autocmd BufNewFile *.php 0r $HOME/.vim/template/php.txt
autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt
autocmd BufNewFile *.css 0r $HOME/.vim/template/css.txt

"補完
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
    if pumvisible()
      return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
       return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
      return "\<c-n>"
    else
      return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" 無限Undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" カーソルを自動的に()の中へ
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap ** **<left>

" 最後の編集位置でファイルを開く
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Twig
autocmd BufNewFile,BufRead *.html.twig set filetype=htmljinja
autocmd BufNewFile,BufRead *.js.twig set filetype=javascript

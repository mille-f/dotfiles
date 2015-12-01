" vi互換モードを解除、及びBackSpaceの機能
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start

" 文字コード
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" フォント
"set guifont=Inconsolata_for_Powerline:h10:cANSI
"let g:Powerline_symbols='fancy'

" Colorscheme
colorscheme landscape

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" 256色を使う
set t_Co=256

" 80列目をハイライト
set colorcolumn=80

" ペーストモード(ONにするとautocomplpopが動かない)
"set paste

" クリップボードにヤンク
set clipboard=unnamed,autoselect

" 色づけをオン
syntax on

" .swapファイルを作らない
set noswapfile

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" 「Vimを使ってくれてありがとう」を消す
set notitle

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" インデント、タブ・シフトの間隔
set autoindent
set smartindent
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

" vim-indent-guidesの設定
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 0
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1

" IndentLineの設定
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
set list listchars=tab:\¦\

" ESC キーを押してから挿入モードを出るまでの時間を短くする
set timeoutlen=100

" 括弧を自動補完 (改造版)
"inoremap <expr><CR> <SID>ExCr()
"function! s:ExCr()
"    if col('.') != col('$')
"        return "\<CR>"
"    endif
"    let l = getline('.')
"    if l =~ '{$'
"        return "\<CR>}\<Up>\<End>\<CR>"
"    elseif l =~ '($'
"        return "\<CR>)\<Up>\<End>\<CR>"
"    elseif l =~ '[$'
"        return "\<CR>]\<Up>\<End>\<CR>"
"    else
"        return "\<CR>"
"    endif
"endfunction
"inoremap [ []<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

" 閉じタグを自動補完
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

" Ctrl+Sで保存など
inoremap <C-s> <Esc>:w<CR>
inoremap <C-q> <Esc>:q<CR>
inoremap <C-v> <Esc>p<CR>
inoremap <C-a> <Esc>ggVG<CR>
inoremap <C-z> <Esc>u<CR>

" jj or jk Escape
inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
"inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ファイルを開いたら前回のカーソル位置へ移動
augroup vimrcEx
 autocmd!
 autocmd BufReadPost *
 \ if line("'\"") > 1 && line("'\"") <= line('$') |
 \   exe "normal! g`\"" |
 \ endif
augroup END

"全モードでマウスを有効化
set mouse=a

" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" タイトルをウインドウ枠に表示する
set title

" 行番号を表示
set number

" 絶対行数を表示
" set relativenumber

" F3キーで絶対行数と普通の行番号をトグル
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

" <Ctrl-T>  タイムスタンプを挿入してinsertモードへ移行
nnoremap <C-T> <ESC>i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>

" Tab、改行を可視化
"set list

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 画面最下行にルーラーを表示する
set ruler

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させるための指定
set laststatus=2

" タブラインを表示
set showtabline=2

" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=0

" ノーマルモードに戻った時に日本語入力をオフにする
set imdisable

" vim_airlineの設定
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" タブラインにもairlineを適用
let g:airline#extensions#tabline#enabled = 1

" （タブが一個の場合）バッファのリストをタブラインに表示する機能をオフ
let g:airline#extensions#tabline#show_buffers = 0

" 0でそのタブで開いてるウィンドウ数、1で左のタブから連番
let g:airline#extensions#tabline#tab_nr_type = 1

" タブに表示する名前（fnamemodifyの第二引数）
let g:airline#extensions#tabline#fnamemod = ':t'

" trailingを表示しない
"let g:airline_detect_whitespace = 0

" tabline symbols
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" vim-gitgutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" lightlineの設定
" mplete);16M
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'date' ],
      \              [ 'percent', 'lineinfo' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'date' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'date': 'Date'
      \ }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" ステータスラインの色
highlight StatusLine term=bold cterm=bold ctermfg=black ctermbg=white

" ステータスラインに日時を表示
function! Date()
    return strftime("%x %H:%M")
endfunction

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan

" コマンドライン補完を拡張モードにする
set wildmenu

" コマンドラインの高さを2行に
set cmdheight=2

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0

" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" カーソルの形状
if has('win32unix')
    let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
    let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
    let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
    let &t_te .= "\e[0 q"  " termcap モードから抜ける
endif

" カーソル行をハイライト
set cursorline

" 括弧にカーソルが移ると対括弧がハイライト表示
set showmatch

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" NormalモードでもEnterで改行
noremap <CR> o<ESC>

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" <F5>キーでSCCompileRun
nmap <F5> :SCCompileRun<cr>

" Rubyを実行
nnoremap <C-r> :!ruby %<cr>

" Java
command! Javac call s:Javac()
nmap <F6> :Javac<CR>

function! s:Javac()
    :w
    let path = expand("%")
    let syn = "javac ".path
    let dpath = split(path,".java$")
    let ret = system(syn)
    if ret == ""
        let syn = "java ".dpath[0]
        let ret = system(syn)
        :echo "====\r\n実行結果:\r\n".ret
    else
        :echo ret
    endif
endfunction

"{{{ Single Compile
if has('win32') || has('win64')
  let $VSINSTALLDIR="C:/Program Files/Microsoft Visual Studio 10.0"
  let $VCINSTALLDIR=$VSINSTALLDIR."/VC"
  let $DevEnvDir=$VSINSTALLDIR."/Common7/IDE;"
  let $PATH=$VSINSTALLDIR."Common7/Tools;".$PATH
  let $PATH=$VCINSTALLDIR."/bin;".$PATH
  let $PATH=$DevEnvDir.";".$PATH
  let $INCLUDE=$VCINSTALLDIR."/include;".$INCLUDE
  let $LIB=$VCINSTALLDIR."/LIB;".$LIB
  let $LIBPATH=$VCINSTALLDIR."/LIB;".$LIBPATH

  " Windows SDK（or Platform SDK？）
  let $WindowsSdkDir="C:/Program Files/Microsoft SDKs/Windows/v7.1"
  let $INCLUDE=$WindowsSdkDir."/include;".$INCLUDE
  let $LIB=$WindowsSdkDir."/lib;".$LIB

  "Boost
  let $INCLUDE="C:/Program Files/boost/boost_1_47;".$INCLUDE
endif
"}}}


" コメントアウトを切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウトを解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)

" 拡張子がmdのファイルをmarkdownとして認識
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" previm の設定
let g:previm_open_cmd = ''
let g:previm_enable_realtime = 1

" autocomplpopの設定
"autocmd FileType * let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i'
"autocmd FileType perl let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/perl.dict'
autocmd FileType cpp :let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/cpp.dict'
autocmd FileType ruby let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/ruby.dict'
autocmd FileType javascript let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/javascript.dict'
"autocmd FileType erlang let g:AutoComplPop_CompleteOption = '.,w,b,u,t,i,k~/.vim/dict/erlang.dict'

"let g:AutoComplPop_IgnoreCaseOption = 1


" ### neocomplcache の設定 ###
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:NeoComplCache_EnableAtStartup = 1
" Use smartcase.
let g:NeoComplCache_SmartCase = 1
" Use camel case completion.
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" Use underbar completion.
let g:NeoComplCache_EnableUnderbarCompletion = 1
inoremap {{ {}<LEFT>
" Set minimum syntax keyword length.
let g:NeoComplCache_MinSyntaxLength = 3
" Set manual completion length.
let g:NeoComplCache_ManualCompletionStartLength = 0

"Print caching percent in statusline.
let g:NeoComplCache_CachingPercentInStatusline = 1

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'   : '',
    \ 'vimshell'  : $HOME.'/.vimshell_hist',
    \ 'scheme'    : $HOME.'/.gosh_completions',
    \ 'scala'     : $HOME.'./.vim/dict/scala.dict',
    \ 'ruby'      : $HOME.'./.vim/dict/ruby.dict',
    \ 'java'      : $HOME.'./.vim/dict/java.dict',
    \ 'javascript': $HOME.'/.vim/dict/javascript.dict',
    \ 'c'         : $HOME.'./.vim/dict/c.dict',
    \ 'cpp'       : $HOME.'./.vim/dict/cpp.dict'
    \ }

" Define keyword.
if !exists('g:NeoComplCache_KeywordPatterns')
    let g:NeoComplCache_KeywordPatterns = {}
endif
let g:NeoComplCache_KeywordPatterns['default'] = '\v\h\w*'

let g:NeoComplCache_SnippetsDir = $HOME.'/snippets'

" ### NeoCompleteの設定 ###
" 補完を有効にする
let g:neocomplete#enable_at_startup = 1
" 補完に時間がかかってもスキップしない
let g:neocomplete#skip_auto_completion_time = ""

" neocomplcacheが強制的に’completefunc’を上書きする
" ただし、プラグインの’completefunc’は使用できなくなる。
let g:neocomplcache_force_overwrite_completefunc = 1

" Define Dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default'   : '',
    \ 'vimshell'  : $HOME.'/.vimshell_hist',
    \ 'scheme'    : $HOME.'/.gosh_completions',
    \ 'scala'     : $HOME.'/.vim/dict/scala.dict',
    \ 'ruby'      : $HOME.'/.vim/dict/ruby.dict',
    \ 'java'      : $HOME.'/.vim/dict/java.dict',
    \ 'javascript': $HOME.'/.vim/dict/javascript.dict',
    \ 'c'         : $HOME.'/.vim/dict/c.dict',
    \ 'cpp'       : $HOME.'/.vim/dict/cpp.dict'
    \ }

" ### javacompleteの設定 ###
"autocmd FileType java :setlocal omnifunc=javacomplete#Complete
"autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

" ### jscomplete の設定 ###
"autocmd FileType javascript
"  \ :setl omnifunc=jscomplete#CompleteJS
" DOMとMozilla関連とES6のメソッドを補完
"let g:jscomplete_use = ['dom', 'moz', 'es6th']
autocmd FileType javascript setlocal omnifunc=tern#Complete

" ### JSHintの設定 ###
"let g:syntastic_javascript_checker = 'jshint'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_mode_map = {
\ "mode" : "active",
\ "active_filetypes" : ["javascript", "json"],
\}

" ### Neosnippetの設定 ###
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

 " Tell Neosnippet about the other snippets
 let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" ### Neobundleの設定 ###
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    endif
    " originalrepos on github
    NeoBundle 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/vimproc'
    NeoBundle 'VimClojure'
    NeoBundle 'Shougo/vimshell'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle "Shougo/neocomplete.vim"
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle "Shougo/neosnippet.vim"
    NeoBundle 'jpalardy/vim-slime'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'itchyny/landscape.vim'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'w0ng/vim-hybrid'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle "slim-template/vim-slim"
    NeoBundle 'nathanaelkane/vim-indent-guides'
    NeoBundle "git://github.com/tyru/caw.vim.git"
    NeoBundle "taku25/vim-visualstudio"
    NeoBundle "git://github.com/vim-ruby/vim-ruby.git"
    NeoBundle "git://github.com/honza/vim-snippets.git"
    NeoBundle "git://github.com/vim-scripts/SingleCompile.git"
    NeoBundle "git://github.com/jdonaldson/vaxe.git"
    NeoBundle 'bling/vim-airline'
    NeoBundle 'git://github.com/vim-scripts/VimCoder.jar'
    NeoBundle 'vim-scripts/javacomplete'
    NeoBundle 'Yggdroot/indentLine'
    NeoBundle 'bronson/vim-trailing-whitespace'
    NeoBundle 'kannokanno/previm'
    NeoBundle 'tyru/open-browser.vim'
    NeoBundle 'mattn/jscomplete-vim'
    NeoBundle 'marijnh/tern_for_vim'
    NeoBundle 'cohama/lexima.vim'
    NeoBundle 'plasticboy/vim-markdown'
    "NeoBundle 'Lokaltog/vim-powerline'
    call neobundle#end()

    filetype plugin on
    filetype indent on

export LANG=ja_JP.UTF-8
export OUTPUT_CHARSET=UTF-8
export TZ=JST-9
export JLESSCHARSET=japanese-sjis
export EDITOR=vim

autoload -U compinit;compinit
autoload -U colors; colors
autoload -Uz vcs_info

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする
setopt nonomatch         # メタ文字が含まれていてもnomatchにしない

# 色を定義
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'

# 時刻更新
TRAPALRM () { zle reset-prompt }
TMOUT=1

# 通常のプロンプト
PROMPT=$BLUE'[%n]%# '$WHITE
# 右側のプロンプト。ここでカレントディレクトリを出す。
RPROMPT=$GREEN'[%~]'$WHITE
setopt transient_rprompt

# gitのbranchを表示
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

### プロンプト指定 ###
PROMPT="
[%n] %{${fg[yellow]}%}%D %*%{${reset_color}%} %1(v|%F{cyan}%1v%f|)
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "

### プロンプト指定（コマンドの続き） ###
PROMPT2='[%n]> '

### もしかして時のプロンプト指定 ###
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < Perhaps %B%r%b %{$fg[red]%}? [('-'*)Yes!(y), ((*'-')('-'*))No!(n),a,e]:${reset_color} "

### 十字キーで補完候補選択
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

### cdとlsの省略 ###
setopt auto_cd
function chpwd() { ls }

### コマンドがからの状態でEnterを押すとlsとgit statusを表示
function my_enter {
    if [[ -n "$BUFFER" ]]; then
        builtin zle .accept-line
        return 0
    fi
    if [ "$WIDGET" != "$LASTWIDGET" ]; then
        MY_ENTER_COUNT=0
    fi
    case $[MY_ENTER_COUNT++] in
        0)
            BUFFER=" ls"
            ;;
        1)
            BUFFER=" ll"
            ;;
        2)
            if [[ -d .svn ]]; then
                BUFFER=" svn status"
            elif git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
                BUFFER=" git status -sb"
            fi
            ;;
        *)
            unset MY_ENTER_COUNT
            ;;
    esac
    builtin zle .accept-line
}
zle -N my_enter
bindkey '^m' my_enter

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

## Screenでのコマンド共有用
## シェルを横断して.zshhistoryに記録
setopt inc_append_history

## ヒストリを共有
setopt share_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

## 補完候補一覧でファイルの種別をマーク表示
setopt list_types

## 補完候補を一覧表示
setopt auto_list

## スペルチェック
setopt correct

# .rvenvディレクトリがあるときだけ設定を追加
if [ -d ${HOME}/.rbenv  ] ; then
    PATH=${HOME}/.rbenv/bin:${PATH}
    export PATH
    eval "$(rbenv init -)"
fi

# XON/XOFF
stty -ixon -ixoff

### suffix alias ###
alias -s rb="ruby"
alias -s py="python"

### alias ###
alias ls='ls --show-control-chars --color=auto'
alias la="ls -a"
alias ll="ls -ltr"
#alias sl="ls"
#alias ks="ls"
alias dc="cd"
alias p="pwd"
alias del="rm -rf"
alias ifconfig="ipconfig | nkf -w"
alias ipconfig="ipconfig | nkf -w"
alias apv='appletviewer -J-Dfile.encoding=UTF-8'
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias jarx='jar -xf'
alias jarc='jar -cvf'
alias jupyter='cd ~/Dropbox/jupyter;jupyter notebook'
alias py='python'
alias winpy='/cygdrive/c/Python27/python.exe'
alias netstat="NETSTAT"
alias open="cygstart"
alias e="emacs"
alias vi="vim"
alias v="vim"
alias viz="vim ~/.zshrc"
alias viv="vim ~/.vimrc"
alias vit="vim ~/.tmux.conf"
alias desk="cd ~/Desktop/"
alias vag="cd ~/Documents/VM/"
alias cent="cd ~/Documents/CentOS6.5_VM"
alias home="cd ~/Dropbox/Home/"
alias topcoder="cd ~/Dropbox/Home/Topcoder/"
alias atcoder="cd ~/Dropbox/Home/atcoder/"
alias aoj="cd ~/Dropbox/Home/AOJ/"
alias CP="cd ~/Dropbox/Documents/M1/CP/s17g470"
alias io="cd ~/Dropbox/Home/HTML/mille-f.github.io"
alias doc="cd ~/Dropbox/Documents/"
alias jpg2eps="sh ~/Dropbox/Home/shell\ script/jpg2eps"
alias tmux="tmux -2"
alias rspec="rspec -c"
alias push="git push origin"
alias amend="git commit --amend"
alias ci="git commit -m"
alias add="git add"
alias co="git checkout"
alias st="git status"
alias lo="git log"
alias br="git branch"
alias be="git branch"
alias rpw0="ssh mille@192.168.1.10"

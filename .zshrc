export LANG=ja_JP.UTF-8
export OUTPUT_CHARSET=UTF-8
export TZ=JST-9
export JLESSCHARSET=japanese-sjis
export EDITOR=vim

autoload -U compinit;compinit
autoload -U colors; colors

setopt no_beep           # �r�[�v����炳�Ȃ��悤�ɂ���
setopt auto_cd           # �f�B���N�g�����̓��݂͂̂ňړ�����
setopt auto_pushd        # cd���Ƀf�B���N�g���X�^�b�N��pushd����
setopt correct           # �R�}���h�̃X�y�����������
setopt magic_equal_subst # =�ȍ~���⊮����(--prefix=/usr�Ȃ�)
setopt prompt_subst      # �v�����v�g��`���ŕϐ��u����R�}���h�u��������
setopt notify            # �o�b�N�O���E���h�W���u�̏�ԕω��𑦎��񍐂���
setopt equals            # =command��`which command`�Ɠ��������ɂ���

# �F���`
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;m%}'

# �����X�V                                                                                          
TRAPALRM () { zle reset-prompt }
TMOUT=1

# �ʏ�̃v�����v�g
PROMPT=$BLUE'[%n]%# '$WHITE
# �E���̃v�����v�g�B�����ŃJ�����g�f�B���N�g�����o���B
RPROMPT=$GREEN'[%~]'$WHITE
setopt transient_rprompt

### �v�����v�g�w�� ###
PROMPT="
[%n] %{${fg[yellow]}%}%D %*%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "

### �v�����v�g�w��i�R�}���h�̑����j ###
PROMPT2='[%n]> '

### ���������Ď��̃v�����v�g�w�� ###
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < Perhaps %B%r%b %{$fg[red]%}? [('-'*)Yes!(y), ((*'-')('-'*))No!(n),a,e]:${reset_color} "

### �\���L�[�ŕ⊮���I��
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

### cd��ls�̏ȗ� ###
setopt auto_cd
function chpwd() { ls }

### �R�}���h������̏�Ԃ�Enter��������ls��git status��\��
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

# �����t�@�C���̕ۑ���
export HISTFILE=${HOME}/.zsh_history

## Screen�ł̃R�}���h���L�p
## �V�F�������f����.zshhistory�ɋL�^
setopt inc_append_history

## �q�X�g�������L
setopt share_history

# �������ɕۑ�����闚���̌���
export HISTSIZE=1000

# �����t�@�C���ɕۑ�����闚���̌���
export SAVEHIST=100000

# �d�����L�^���Ȃ�
setopt hist_ignore_dups

# �J�n�ƏI�����L�^
setopt EXTENDED_HISTORY

## �⊮���ꗗ�Ńt�@�C���̎�ʂ��}�[�N�\��
setopt list_types

## �⊮�����ꗗ�\��
setopt auto_list

## �X�y���`�F�b�N
setopt correct

# .rvenv�f�B���N�g��������Ƃ������ݒ��ǉ�
if [ -d ${HOME}/.rbenv  ] ; then
    PATH=${HOME}/.rbenv/bin:${PATH}
    export PATH
    eval "$(rbenv init -)"
fi

# XON/XOFF
stty -ixon -ixoff

### alias ###
alias ls='ls -F --show-control-chars --color=auto'
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -ltr"
alias sl="ls"
alias ks="ls"
alias dc="cd"
alias del="rm -rf"
alias ipconfig="ipconfig | nkf -w"
alias apv='appletviewer -J-Dfile.encoding=UTF-8'
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias jarx='jar -xf'
alias jarc='jar -cvf'
alias netstat="NETSTAT"
alias ifconfig="ipconfig"
alias vi="vim"
alias v="vim"
alias open="cygstart"
alias viz="vim ~/.zshrc"
alias viv="vim ~/.vimrc"
alias topcoder="cd ~/Dropbox/Home/Topcoder/"
alias atcoder="cd ~/Dropbox/Home/atcoder/"
alias desk="cd ~/Desktop/"
alias home="cd ~/Dropbox/Home/"
alias doc="cd ~/Dropbox/Documents/"
alias oopl="cd ~/Dropbox/Documents/B3/OOPL"
alias aoj="cd ~/Dropbox/Home/AOJ/"
alias vag="cd ~/Documents/VM/"
alias master="git push -u origin master"

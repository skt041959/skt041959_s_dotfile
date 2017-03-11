#created by skt
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

#. /usr/share/zsh/site-contrib/powerline.zsh
source $HOME/.zsh.d/skt_define.zsh

#autoload colors
#colors

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#bindkey '^f' emacs-forward-word  # Alt-Right
#bindkey '^b' emacs-backward-word # Alt-Left

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done

#setopt prompt_subst
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' actionformats \
#    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats       \
#    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
#zstyle ':vcs_info:*' enable git,svn

#vcs_info_wrapper() {
#  vcs_info
#  if [ -n "$vcs_info_msg_0_" ]; then
#    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
#  fi
#}

FINISH="%{$terminfo[sgr0]%}"

RPROMPT=$(echo "$_RED%D %T$FINISH")

if [[ $USERNAME == "root" ]] ; then
    PROMPT=$(echo "$CYAN%n@$YELLOW%M:$GREEN%/$_YELLOW---[%j]\n>>#$FINISH ")
else
    PROMPT=$(echo "$CYAN%n@$YELLOW%M:$GREEN%/ ")$'$(git_super_status)'$(echo "$_YELLOW %(1j.%j.)\n>>>$FINISH ")
fi

case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
    precmd () { print -Pn "\e]0;%n@%M//%/\a" }
    preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
    ;;
esac

export EDITOR=nvim
export TERM=screen-256color

#关于历史纪录的配置 {{{
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
#}}}

setopt No_Beep
setopt noflowcontrol

#杂项 {{{
#允许在交互模式中使用注释  例如：
#cmd #这是注释
setopt INTERACTIVE_COMMENTS

#扩展路径
#/v/c/p/p => /var/cache/pacman/pkg
# setopt complete_in_word

limit coredumpsize 0

#Emacs风格 键绑定
bindkey -e
#bindkey -v
#设置 [DEL]键 为向后删除
#bindkey "\e[3~" delete-char

#vim 编辑当前命令
autoload edit-command-line
zle -N edit-command-line
bindkey -M viins '^u' edit-command-line

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
#}}}

##行编辑高亮模式 {{{
# Ctrl+@ 设置标记，标记和光标点之间为 region
zle_highlight=(region:bg=magenta special:bold isearch:underline)
#}}}

##在命令前插入 sudo {{{
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line                 #光标移动到行末
}
zle -N sudo-command-line
#定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}

alias run-help >&/dev/null && unalias run-help
autoload run-help
autoload run-help-git

#补全 ssh scp sftp 等
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

function timeconv { date -d @$1 +"%Y-%m-%d %T" }

zmodload zsh/mathfunc
autoload -U zsh-mime-setup
zsh-mime-setup
setopt EXTENDED_GLOB
#autoload -U promptinit
#promptinit
#prompt redhat

# adopt orphan process
# zmodload zsh/subreap
#subreap

setopt correctall
autoload compinstall

setopt extended_glob
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace' '(')

#{{{
recolor-cmd()
{
    region_highlight=()
    colorize=true
    start_pos=0
    for arg in ${(z)BUFFER}; do
        ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        ((end_pos=$start_pos+${#arg}))
        if $colorize; then
            colorize=false
            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            case $res in
                'sudo'*)             style="fg=red,bold";;
                *'reserved word'*)   style="fg=magenta,bold";;
                *'alias for'*)       style="fg=cyan,bold";;
                *'shell builtin'*)   style="fg=yellow,bold";;
                *'shell function'*)  style='fg=green,bold';;
                *"$arg is"*)
                    [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                *)                   style='none,bold';;
            esac
            region_highlight+=("$start_pos $end_pos $style")
        fi
        [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
        start_pos=$end_pos
    done
}
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
#}}}

#zle -N self-insert check-cmd-self-insert
#zle -N backward-delete-char check-cmd-backward-delete-char

fc -R $HOME/.directory_history/$(pwd -P)/history

## END OF FILE #################################################################


fpath=($HOME/.fpath $fpath)

export ANDROID_HOME=$HOME/Android

export MANPAGER="nvim -c 'set ft=man' -"
export GOPATH=$HOME/code/go
export NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH=$NPM_PACKAGES/lib/node_modules

export PYTHONSTARTUP=$HOME/.pythonstartup
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export PATH=$HOME/.local/bin:$HOME/code/go/bin:$NPM_PACKAGES/bin:$PATH
export MANPATH=$NPM_PACKAGES/share/man:$MANPATH

export LM_LICENSE_FILE=$HOME/.local/share/microsemi/Linux_Licensing_Daemon/License.dat
export SNPSLMD_LICENSE_FILE=$LM_LICENSE_FILE
export SYNPLCTYD_LICENSE_FILE=$LM_LICENSE_FILE

#{{{
source $HOME/.zsh.d/autojump.plugin.zsh
source $HOME/.zsh.d/rsync.plugin.zsh
source $HOME/.zsh.d/per-directory-history.zsh
source $HOME/.zsh.d/compl.zsh
source $HOME/.zsh.d/zsh-git-prompt/zshrc.sh
source $HOME/.zsh.d/bd.zsh
source $HOME/.zsh.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.vim/plugged/neoman.vim/scripts/nman.zsh
#}}}

#{{{
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
#}}}

#eval $(thefuck --alias)

zhisall()
{
    case $1 in
        '-a')
            find $HOME/.zsh_history -name 'zhistory' -print0|xargs -0 -l -i cat '{}'|grep '^:'|sort|\
                sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |\
                awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print}';;
        '-d')
            find "$HOME/.directory_history$(pwd -P)" -name 'history' -print0|xargs -0 -l -i cat '{}'|grep '^:'|sort|\
                sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |\
                awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print}'|tail -$2;;
        *)
            find $HOME/.zsh_history -name 'zhistory' -print0|xargs -0 -l -i cat '{}'|grep '^:'|sort|\
                sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' |\
                awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print}'|tail -$@;;
    esac
}

calcu()
{
    python -c "import math;print($1)"
}

cadence_env()
{
    #Cadence SPB environment
    export CDS_AUTO_64BIT ALL
    export CDS_INST_DIR=/media/sda6/cadence/Cadence_SPB
    export CDS_LIC_FILE=/usr/local/flexlm/licenses/license.dat
    export CDS_DIR=$CDS_INST_DIR
    export CONCEPT_INST_DIR=$CDS_DIR
    export CDS_SITE=$CDS_DIR/share/local/
    export LD_LIBRARY_PATH=/lib:/usr/lib:$CDS_INST_DIR/tools.lnx86/lib:$CDS_INST_DIR/tools.lnx86/mainwin520/mw/lib-linux_optimized/
    export CDSDOC_PROJECT=$CDS_INST_DIR/doc
    export PATH=$PATH:$CDS_INST_DIR/tools.lnx86/jre/bin:$CONCEPT_INST_DIR/tools.lnx86/bin:$CONCEPT_INST_DIR/tools.lnx86/pcb/bin:$CONCEPT_INST_DIR/tools.lnx86/fet/bin:$CONCEPT_INST_DIR/tools.lnx86/specctra/bin/:$CONCEPT_INST_DIR/tools.lnx86/plot/bin:$CONCEPT_INST_DIR/stream_mgt/bin/:$CONCEPT_INST_DIR/tools.lnx86/fet/concept/bin:$CONCEPT_INST_DIR/tools.lnx86/dfII/bin:$CONCEPT_INST_DIR/tools.lnx86/spectre/bin
}

mil2mm()
{
    python -c "print($1*0.0254)"
}

mm2mil()
{
    python -c "print($1/0.0254)"
}

pressh()
{
    eval $(ssh-agent)
    ssh-add
}

google()
{
    #echo oqtgcrhaxfogagou;
    echo vavtnpzbvandyquu;
}

gt()
{
    nvidia-smi -q -d TEMPERATURE | grep Gpu | cut -c35-38;
    return 0;
}

wlt()
{
    #set -x;
    if [ -n "$1" ]
    then
        echo "port $1"
        curl -c /tmp/wlt "http://wlt.ustc.edu.cn/cgi-bin/ip?cmd=login&name=zz04195&password=yizhandui" > /dev/null && \
            curl -b /tmp/wlt "http://wlt.ustc.edu.cn/cgi-bin/ip?cmd=set&type=$1&exp=50400" > /dev/null && \
            rm -f /tmp/wlt ;
    else
        echo "port 3"
        curl -c /tmp/wlt "http://wlt.ustc.edu.cn/cgi-bin/ip?cmd=login&name=zz04195&password=yizhandui" > /dev/null && \
            curl -b /tmp/wlt "http://wlt.ustc.edu.cn/cgi-bin/ip?cmd=set&type=3&exp=50400" > /dev/null && \
            rm -f /tmp/wlt ;
    fi
}

lgh()
{
    if [ -n "$1" ]
    then
        curl -s -d "account_in=8522&password_in=290071" "http://192.168.16.216/auth/Sea/checkin.php";
    else
        curl -s -d "account_in=8522&password_in=290071" "http://192.168.16.216/auth/Sea/checkin.php" > /dev/null;
    fi
    print "sucess"
}

clip()
{
    qdbus org.kde.klipper /klipper  'setClipboardContents'  $1
}

vbox()
{
    set -x;
    sudo modprobe vboxdrv;
    sudo modprobe vboxnetflt;
    sudo modprobe vboxnetadp;
    sudo modprobe vboxpci;
}

vbox_prewin8()
{
    set -x;
    sudo modprobe vboxdrv;
    sudo modprobe vboxnetflt;
    sudo modprobe vboxnetadp;
    sudo modprobe vboxpci;
    sudo umount /dev/sda2;
    sudo umount /dev/sda3;
    sudo chmod 666 /dev/sda*
}

emu()
{
    set -x
    qemu-system-arm  -cpu cortex-m3 -S -s -singlestep -nographic -m 513 -monitor null -serial null -semihosting -kernel $1
}

# Set colors for man pages
#man() {
#    env \
    #        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    #        LESS_TERMCAP_md=$(printf "\e[1;31m") \
    #        LESS_TERMCAP_me=$(printf "\e[0m") \
    #        LESS_TERMCAP_se=$(printf "\e[0m") \
    #        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    #        LESS_TERMCAP_ue=$(printf "\e[0m") \
    #        LESS_TERMCAP_us=$(printf "\e[1;32m") \
    #        nvim -c "Man $1 $2" -c 'silent only'
#}

proxy()
{
    if [ -n "$1" ]
    then
        case $1 in
            goagent)
                export http_proxy=http://127.0.0.1:8087;
                export https_proxy=https://127.0.0.1:8087;
                ;;
            polipo)
                export http_proxy=http://127.0.0.1:8123;
                export https_proxy=https://127.0.0.1:8123;
                ;;
        esac
    fi
}

uproxy()
{
    unset http_proxy
    unset https_proxy
}

dirtree()
{
    find . -print 2>/dev/null|awk '!/\.$/ {for (i=1;i<NF;i++){d=length($i);if ( d < 5 && i != 1 )d=5;printf("%"d"s","|")}print "---"$NF}' FS='/'
}

y()
{
    trans $1;
    ydcv $1;
    sdcv -n $1;
    #ydcv --color=never $1;
}

# Memory overview
memusage()
{
    ps aux |grep $1|grep -v grep| awk '{print $5;
    if (NR > 1) print "+"}
    END { print "p" }' | dc
}

# print hex value of a number
hex()
{
    emulate -L zsh
    if [[ -n "$1" ]]; then
        printf "%x\n" $1
    else
        print 'Usage: hex <number-to-convert>'
        return 1
    fi
}

digitalocean()
{
    echo "&I^$%TKIUGAGITHUB-c28da474"
}

killqq()
{
    set -x
    pkill -x -e QQ.exe
    pkill -x -e qq
    pkill -x -e services.exe
    pkill -x -e winedevice.exe
    pkill -x -e plugplay.exe
    pkill -x -e explorer.exe
    pkill -x -e TXPlatform.exe
    pkill -x -e wineserver

    pkill -f -e MLogin
}

up()
{
    cd `expr "$PWD" : "^\(.*$1[^/]*\)"`
}

dns()
{
    # Generated by NetworkManager
    echo "search ustc.edu.cn"
    echo "nameserver 202.38.64.56"
    echo "nameserver 202.38.64.17"
}

back_sys()
{
    set -x
    sudo rsync -aAXvu $@ --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/home/*","/media/*","/var/log/*","/var/cache/*","/var/tmp/*","/lost+found"} /* /run/media/skt/arch_bak
}

back_home()
{
    rsync -aAXvu $@ --exclude="view/" $HOME/.vim /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.nvim /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.zsh_plugin /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.zshrc /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.tmux.conf /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.directory_history /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.gitconfig /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.xprofile /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ $HOME/.kde4 /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ --exclude="chromium/" $HOME/.config /run/media/skt/arch_bak/home/skt/
    rsync -aAXvu $@ --exclude={"Zeal","cache","baloo"} $HOME/.local /run/media/skt/arch_bak/home/skt/

    pacman -Q > /run/media/skt/arch_bak/home/skt/pacman.lst
}

rsync_afms()
{
    rsync -avzu -e "ssh -p 22718 -o StrictHostKeyChecking=no " --exclude={"*.swp","*.pri"} --progress \
        $HOME/code/tunicorn/afms/AFMS \
        127.0.0.1:$HOME/afms/
}

pic2jpg()
{
    find -name "*.$1"|xargs -l -i basename {} .$1|xargs -l -i convert {}.$1 {}.jpg
}

lmgrd()
{
    $HOME/.local/bin/wine_subreap.py wine lmgrd.exe -z -c "C:\\Cadence\\LicenseManager\\license.dat" -l "C:\\Cadence\\LicenseManager\\debug.log"
}

function list_all() {
    emulate -L zsh
    ls --color=auto
}

chpwd_functions=(${chpwd_functions[@]} "list_all")
#命令别名 {{{
alias cp='cp -i -v'
alias mv='mv -i -v'
alias ln='ln -v'
alias rm='rm -i -v --one-file-system'
alias l='ls -F --group-directories-first --time-style=+"%F %T" --color=auto'
alias ls='ls -F --group-directories-first --time-style=+"%F %T" --color=auto'
alias ll='ls -l -h -F --group-directories-first --time-style=+"%F %T" --color=auto'
alias h='htop'
alias b='bilidan'
alias xo='xdg-open'
alias bbs='luit -encoding gbk telnet 202.38.64.3'
alias wl='wc -l'
alias feh='/home/skt/.local/bin/feh.sh'
alias pgrep='nocorrect pgrep -lf'
alias ppy='ptpython'
alias ppy2='ptpython2'
alias vim='nvim'
alias vims='nvim -S Session.vim'
alias vimrc='nvim /home/skt/.vim/vimrc'
alias viminit='nvim /home/skt/.vim/init.vim'
alias vimz='nvim /home/skt/.zsh_plugin/skt_define.zsh'
alias grep='nocorrect grep --color=auto'
alias sudo='nocorrect sudo'
alias ctls='setxkbmap -option ctrl:swapcaps'
alias reblue='sudo systemctl restart bluetooth'
alias teamon='sudo systemctl start teamviewerd'
alias teamoff='sudo systemctl stop teamviewerd'
alias teamre='sudo systemctl restart teamviewerd'
alias printer_on='sudo systemctl start org.cups.cupsd.service'
alias ycm_gen='/home/skt/.vim/plugged/YCM-Generator/config_gen.py'
alias rez='source /home/skt/.zsh_plugin/skt_define.zsh'
alias restart_kde='kbuildsycoca5 && kquitapp plasmashell && kstart plasmashell'
alias arc='tar zcvf config.tar.gz .vim/ .ptpython/ .zsh_plugin/ .pandoc/ .zshrc .tmux.conf --exclude="*.git" --exclude="racer"'
#alias -g DASH='-ex "dashboard -output $(tmux splitw -d -h -P -F \"#{pane_tty}\")"'
#}}}

#路径别名 {{{
#进入相应的路径时只要 cd ~xxx
#}}}


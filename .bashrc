#!/bin/bash
iatest=$(expr index "$-" i)

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# EXPORTS
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export PATH="$PATH:/opt/nvim-linux64/bin"
export HISTCONTROL=erasedups:ignoredups:ignorespace
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

stty werase undef
bind '"\C-w": backward-kill-word'

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# Replace batcat with cat on Fedora as batcat is not available as a RPM in any form
if command -v lsb_release >/dev/null; then
    DISTRIBUTION=$(lsb_release -si)

    if [ "$DISTRIBUTION" = "Fedora" ]; then
        alias cat='bat'
    else
        alias cat='batcat --theme=Nord'
    fi
fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export FZF_DEFAULT_OPTS="-i --keep-right --filepath-word --height=50% --layout=reverse --info=right --border=sharp --no-scrollbar --marker='+' --header-first --color='dark,fg:white,fg+:cyan,bg+:-1,hl:red,hl+:red,info:black,separator:black,border:black,label:black,prompt:yellow,pointer:cyan,marker:cyan,spinner:black'"

# GENERAL ALIAS'S
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias nala='sudo nala'
alias docker='sudo docker'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='nvim'
alias svi='sudo nvim'
alias vis='nvim "+set si"'
alias mx='tmux -u'
alias mxa='tmux -u a'
alias mxd='tmux -u detach'
alias mxkillall='tmux kill-server'
alias mxkill='tmux kill-session -t'
alias lf='lflayer'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"'
alias rmd='/bin/rm  -rf -v'
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -lcrh'               # sort by change time
alias lu='ls -lurh'               # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              #alphabetical sort
alias ldir="ls -l | egrep '^d'"   # directories only
alias mod='chmod a+x'
alias unmod='chmod -x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
alias openports='netstat -nape --inet'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias mountedinfo='df -hT'
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias logs="sudo find /var/log -type f -exec file {} \; | rg 'text' | cut -d' ' -f1 | sed -e's/:$//g' | rg -v '[0-9]$' | xargs tail -f"
alias sha1='openssl sha1'
alias za='zoxide add'
alias zq='zoxide query'
alias zqi='zoxide query -i'
alias zr='zoxide remove'

# SPECIAL FUNCTIONS
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
            *.tar.bz2) tar xvjf $archive ;;
            *.tar.gz) tar xvzf $archive ;;
            *.bz2) bunzip2 $archive ;;
            *.rar) rar x $archive ;;
            *.gz) gunzip $archive ;;
            *.tar) tar xvf $archive ;;
            *.tbz2) tar xvjf $archive ;;
            *.tgz) tar xvzf $archive ;;
            *.zip) unzip $archive ;;
            *.Z) uncompress $archive ;;
            *.7z) 7z x $archive ;;
            *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Searches for text in all files in the current folder
ftext() {
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$1" . | less -r
}

# Show the current distribution
distribution() {
    local dtype
    # Assume unknown
    dtype="unknown"

    # First test against Fedora / RHEL / CentOS / generic Redhat derivative
    if [ -r /etc/rc.d/init.d/functions ]; then
        source /etc/rc.d/init.d/functions
        [ zz$(type -t passed 2>/dev/null) == "zzfunction" ] && dtype="redhat"

    # Then test against SUSE (must be after Redhat,
    # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
    elif [ -r /etc/rc.status ]; then
        source /etc/rc.status
        [ zz$(type -t rc_reset 2>/dev/null) == "zzfunction" ] && dtype="suse"

    # Then test against Debian, Ubuntu and friends
    elif [ -r /lib/lsb/init-functions ]; then
        source /lib/lsb/init-functions
        [ zz$(type -t log_begin_msg 2>/dev/null) == "zzfunction" ] && dtype="debian"

    # Then test against Gentoo
    elif [ -r /etc/init.d/functions.sh ]; then
        source /etc/init.d/functions.sh
        [ zz$(type -t ebegin 2>/dev/null) == "zzfunction" ] && dtype="gentoo"

    # For Mandriva we currently just test if /etc/mandriva-release exists
    # and isn't empty (TODO: Find a better way :)
    elif [ -s /etc/mandriva-release ]; then
        dtype="mandriva"

    # For Slackware we currently just test if /etc/slackware-version exists
    elif [ -s /etc/slackware-version ]; then
        dtype="slackware"

    fi
    echo $dtype
}

# Show the current version of the operating system
ver() {
    local dtype
    dtype=$(distribution)

    if [ $dtype == "redhat" ]; then
        if [ -s /etc/redhat-release ]; then
            cat /etc/redhat-release && uname -a
        else
            cat /etc/issue && uname -a
        fi
    elif [ $dtype == "suse" ]; then
        cat /etc/SuSE-release
    elif [ $dtype == "debian" ]; then
        lsb_release -a
        # sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
    elif [ $dtype == "gentoo" ]; then
        cat /etc/gentoo-release
    elif [ $dtype == "mandriva" ]; then
        cat /etc/mandriva-release
    elif [ $dtype == "slackware" ]; then
        cat /etc/slackware-version
    else
        if [ -s /etc/issue ]; then
            cat /etc/issue
        else
            echo "Error: Unknown distribution"
            exit 1
        fi
    fi
}

open() {
    f="$1"
    case $(file --mime-type "$f" -bL) in
    text/* | application/json | inode/x-empty) nvim "$f" ;;
    application/x-executable) "$f" ;;
    *) xdg-open "$f" ;;
    esac
}

fd() {
    local dir
    if [ -z "$1" ]; then
        dir="."
    else
        dir="$1"
    fi
    dir=$(
        fdfind . "$dir" --type d -H -E .git -E node_modules | fzf --border-label="find directory"
    ) && cd "$dir"
}

ff() {
    local dir
    if [ -z "$1" ]; then
        dir="."
    else
        dir="$1"
    fi
    dir=$(
        fdfind . "$dir" --type f -H -E .git -E node_modules | fzf --border-label="find files"
    ) && open "$dir"
}

gcom() {
    git add .
    git commit -m "$1"
}

lazyg() {
    git add .
    git commit -m "$1"
    git push
}

cpp() {
    g++ "$1" -o cpptmp && ./cpptmp
}

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(starship init bash)"
eval "$(zoxide init bash)"

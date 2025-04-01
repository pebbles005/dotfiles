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

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='ln=01;36:or=31;01:tw=34:ow=34:st=01;34:di=01;34:pi=33:so=01;35:bd=33;01:cd=33;01:su=01;32:sg=01;32:ex=01;32:fi=00:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.webp=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
fzf_defaults="-i --margin 5% --keep-right --filepath-word --height 100% --scroll-off 0 --info right --no-scrollbar --prompt '▌ ' --color='dark,fg:bright-black,fg+:green,bg+:-1,hl:yellow,hl+:yellow,info:bright-black,separator:bright-black,border:bright-black,prompt:magenta,pointer:green,marker:green,spinner:bright-black'"
export FZF_DEFAULT_OPTS="$fzf_defaults"
export _ZO_FZF_OPTS="$fzf_defaults"

# GENERAL ALIAS'S
alias cat='batcat --theme=base16'
alias cal="ncal -C"
alias cp='cp -i -v'
alias mv='mv -i -v'
alias rm='rm -i -v'
alias mkdir='mkdir -p -v'
alias ps='ps auxf'
alias ping='ping -c 10'
alias cls='clear'
alias nala='sudo nala'
alias docker='sudo docker'
alias vi='nvim'
alias svi='sudo nvim'
alias mx='tmux -u'
alias mxa='tmux -u a'
alias mxd='tmux detach'
alias mxkillall='tmux kill-server'
alias mxkill='tmux kill-session -t'
alias mxs='tmux-sessionizer'
alias lf='lflayer'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"'
alias rmd='rm -rf -v'
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lk='ls -lSrh'               # sort by size
alias lr='ls -lRh'                # recursive ls
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
alias countsize="du -sh ."
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias gs='git status'

# SPECIAL FUNCTIONS
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
            *.zip) unzip $archive ;;
            *.tar) tar xvf $archive ;;
            *.rar) rar x $archive ;;
            *.7z) 7z x $archive ;;
            *.gz) gunzip $archive ;;
            *.bz2) bunzip2 $archive ;;
            *.tar.bz2) tar xvjf $archive ;;
            *.tar.gz) tar xvzf $archive ;;
            *.tbz2) tar xvjf $archive ;;
            *.tgz) tar xvzf $archive ;;
            *.Z) uncompress $archive ;;
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

fd() {
    local dir="${1:-.}"
    dir=$(fdfind . "$dir" --type d -H -E .git -E node_modules | fzf --border-label="find directory") && cd "${dir#./}"
}

ff() {
    local file="${1:-.}"
    file=$(fdfind . "$file" --type f -H -E .git -E node_modules | fzf --border-label="find files") && open "${file#./}"
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
    g++ "$1" -o /tmp/cpp_tmp && /tmp/cpp_tmp
}

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

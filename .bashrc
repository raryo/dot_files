# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

rp(){
    printf "%*s" $COLUMNS $(date "+%H:%M:%S")
}

PS1='\[$(tput sc; rp; tput rc)\]${debian_chroot:+($debian_chroot)}@\h \[\033[0;97m\]\w\[\033[00m\]\n\[\033[0;32m\]>>>\[\033[00m\] '

# some more ls aliases
alias ls='ls -G'
alias ll='ls -G -alhF'
alias lh='ls -G -lh'
alias la='ls -G -A'
alias l='ls -G -CF'
alias sl='ls'

alias lns='ln -s'

alias less='less -N' 
alias rm='rm -i'
alias pd='pushd'
alias vim='nvim'

alias vmd='/Applications/VMD\ 1.9.3.app/Contents/vmd/vmd_MACOSXX86'
alias chimera='/Applications/Chimera.app/Contents/MacOS/chimera'
alias pymol='/Applications/PyMOL.app/Contents/MacOS/MacPyMOL'


alias tmt='tmux a -t'

alias syayoi='ssh yayoi'
alias snezu='ssh nezu'
alias sdarth='ssh darth'
alias sbush='ssh rb'

stty werase undef
bind "\C-w":unix-filename-rubout

function md2pdf() {
    command pandoc $1 -o $2.pdf -V documentclass=ltjarticle -V geometry:margin=1in --latex-engine=lualatex --listings -H ~/listings_set.tex
}


export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home)
PATH=$PATH:$JAVA_HOME/bin
export PATH


export PATH=/usr/local/bin:/usr/local/opt/flex:/usr/bin:/usr/sbin:/bin:sbin:/opt/X11/bin:/usr/local/share/dotnet:/Library/Frameworks/Mono.frameworks/Versions/Current/Commands:/Library/Tex/texbin:~/bin:~/apps/solvate_1.0:~/apps/ncbi-blast-2.6.0+/bin:~/apps:/Users/rshimura/src/kotlin-native-macos-0.9.3/bin:$PATH

# pyenv,pyenv-virtualenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export TERM='xterm-256color'
#
# Amber16
#
export AMBERHOME=/Users/rshimura/apps/amber16
source /Users/rshimura/apps/amber16/amber.sh

#
# gmx
#
source /Users/rshimura/apps/gmx2016_3/bin/GMXRC.zsh

#
# my path
#
export hp1adata='/Users/rshimura/works/md/hp1a/data'

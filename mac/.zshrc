#
# ~/.bash_profile
#

eval `dircolors ~/.dir_colors`

# option completion
autoload -U compinit
compinit -u
setopt COMPLETE_IN_WORD
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*:default' menu select=1
autoload -Uz colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin 


# prompt
colors
PROMPT='%F{255}@%M %~%f 
%F{154}|>%f '
PROMPT2='... '
RPROMPT='%*'

# histry
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=100000
export SAVEHIST=10000000
setopt EXTENDED_HISTORY
setopt share_history
bindkey "^r" history-incremental-search-backward
#bindkey "^R" history-incremental-search-forward

# alias
alias vim='nvim'
alias plot='gnuplot'
alias ls='ls -G'
alias ll='ls -G -alhF '
alias lh='ls -G -lh '
alias la='ls -G -A '
alias l='ls -G -CF '
alias sl='ls '
alias lns='ln -s'
alias less='less -N' 
alias rm='rm -i'
alias tmt='tmux a -t'
alias pd='pushd'
alias ssh='ssh -A'
alias vmd='/Applications/VMD\ 1.9.3.app/Contents/vmd/vmd_MACOSXX86'
alias chimera='/Applications/Chimera.app/Contents/MacOS/chimera'
alias pymol='/Applications/PyMOL.app/Contents/MacOS/MacPyMOL'
alias crysol='/Applications/ATSAS/bin/crysol'
alias alac='/Applications/Alacritty.app/Contents/MacOS/alacritty'

function pdbget(){
    wget https://files.rcsb.org/download/$1.pdb
}

# word def
export WORDCHARS="*?_-.[]~&!#$%^<>"

# various setting
setopt AUTO_CD
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_KEYS
setopt NO_BEEP
setopt NUMERIC_GLOB_SORT
setopt NOCLOBBER

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

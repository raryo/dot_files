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

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# prompt
colors
PROMPT='%F{255}@%M %~%f 
%F{154}|>%f '
PROMPT2='... '
RPROMPT='%*'

# histry
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt EXTENDED_HISTORY
bindkey "^r" history-incremental-search-backward
#bindkey "^R" history-incremental-search-forward

# alias
alias vim='nvim'
alias plot='gnuplot'
alias ls='ls -G -CF'
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
alias alac='/Applications/Alacritty.app/Contents/MacOS/alacritty'
alias julia='/Applications/Julia-1.1.app/Contents/Resources/julia/bin/julia'

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

export PATH=~/local/bin:/usr/local/bin:/usr/local/opt/flex:/usr/bin:/usr/sbin:/bin:sbin:/opt/X11/bin:/usr/local/share/dotnet:/Library/Frameworks/Mono.frameworks/Versions/Current/Commands:/Library/Tex/texbin:~/bin:~/apps/solvate_1.0:~/apps/ncbi-blast-2.6.0+/bin:~/apps:/Users/rshimura/src/kotlin-native-macos-0.9.3/bin:$PATH


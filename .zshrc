# The Zoomer SHell configuration

autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats '%b'

setopt PROMPT_SUBST

precmd() {
    psvar=()
    vcs_info

    psvar[1]=$vcs_info_msg_0_
    RPROMPT='%F{blue}%*%f [%(1V.%F{green}${psvar[1]}%f.%F{red}none%f)]'
    # 1V checks if psvar[1] is set
}

# Single quotes are necessary here or else vcs_info doesn't work for
# some dumb reason, idfk
PROMPT='[%F{blue}%n%f@%F{green}%~%f] %0(?..%F{red}!%?! %f)>%# '

HISTSIZE=10000
SAVEHIST=10000

# basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# edit line in vim with <C-e>
# autoload -z edit-command-line
# zle -N edit-commant-line
# bindkey -M vicmd '^e' edit-command-line

alias ls="ls -F --color=auto"   # improve ls
alias ll="ls -lF --color=auto"  # list list
alias la="ls -laF"
alias lt="ls -hs1SF"            # sort files by size
alias gh="history | grep"       # search history

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux/:$PATH"


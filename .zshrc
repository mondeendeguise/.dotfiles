# the zoomer shell config'

# enable colors and change prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# history in cache directory
HISTSIZE=10000
SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history

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

# edit line in vim with ctrl-e
autoload -z edit-command-line
zle -N edit-commant-line
bindkey -M vicmd '^e' edit-command-line

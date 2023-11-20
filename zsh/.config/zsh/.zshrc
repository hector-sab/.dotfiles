HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_CACHE_HOME/zsh/history"

autoload -U colors && colors

setopt autocd                    # Automatically cd into the typed directory
setopt interactive_comments      # Ignore lines starting with `#` in an interactive shell
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_ignore_all_dups      # Ignore duplicated entries

# Enable Vi mode
bindkey -v
export KEYTIMEOUT=1

# Exports
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Aliases
## Colorizes grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias df='df -h'
alias ls='ls --color=auto'


source $XDG_CONFIG_HOME/zsh/vi-mode/vi-improved.zsh
source $XDG_CONFIG_HOME/zsh/lfcd.zsh

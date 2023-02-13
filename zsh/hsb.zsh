# Adds USER binaries to the path
if [[ "$PATH" != *"$HOME/.local/bin"* ]]; then
        export PATH="$PATH:$HOME/.local/bin"
fi


# Specify configurations specific to Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	:
# Specify configurations specific to MacOs
elif [[ "$OSTYPE" == "darwin"* ]] then
	source $HOME/.config/zsh/macos.zsh
# Unknown OS
else
	echo "Unknown OS. Your ZSH configuration might not work properly."
fi

##########
# History in cache directory
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

autoload -U colors && colors
# TODO(hector): How to make it colored based on the terminal theme?
#   If set up like this, when changing color scheme, it will not adapt.
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

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


source $HOME/.config/zsh/vi-improved.zsh
source $HOME/.config/zsh/lfcd.zsh

source $HOME/.config/zsh/vi-mode-cursor.zsh

# Edit line in vim with ctrl+e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line      # Enabled in insert mode
bindkey -a '^e' edit-command-line   # Enabled in normal mode

# Allow delete (backspace) text after insert->normal->insert mode
# Not enabled in normal mode as it reflects the vim default behavior.
# https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode/533685#533685
bindkey '^?' backward-delete-char

# Allows delete text
# - https://stackoverflow.com/questions/43249043/bind-delete-key-in-vi-mode
bindkey '^[[3~' delete-char      # Enabled in insert mode
bindkey -a '^[[3~' delete-char   # Enabled in normal mode

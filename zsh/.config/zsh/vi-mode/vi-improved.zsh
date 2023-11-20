source $XDG_CONFIG_HOME/zsh/vi-mode/cursors.zsh

# Edit line in vim with ctrl+e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line      # Enabled in insert mode
bindkey -a '^e' edit-command-line   # Enabled in normal mode

# Allow delete (backspace) all text after insert->normal->insert mode
# Not enabled in normal mode as it reflects the vim default behavior.
# https://superuser.com/questions/476532/how-can-i-make-zshs-vi-mode-behave-more-like-bashs-vi-mode/533685#533685
bindkey '^?' backward-delete-char
# Enables deletion in insert mode as in vim
bindkey '^w' backward-kill-word
bindkey '^h' backward-delete-char
bindkey '^u' backward-kill-line

# Allows delete text using the delete key
# - https://stackoverflow.com/questions/43249043/bind-delete-key-in-vi-mode
bindkey '^[[3~' delete-char      # Enabled in insert mode
bindkey -a '^[[3~' delete-char   # Enabled in normal mode

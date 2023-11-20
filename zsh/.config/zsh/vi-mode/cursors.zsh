# Change cursor shape for different vi modes.
# - Taken from https://github.com/LukeSmithxyz/voidrice/blob/e0331ad0e76dcbcfcc08cb991d9e7f99382517db/.config/zsh/.zshrc
# - Information on how to change the cursor style from https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
#
# Cursor styles:
# 1 -> blinking block
# 2 -> solid block
# 3 -> blinking underscore
# 4 -> solid underscore
# 5 -> blinking vertical bar
# 6 -> solid vertical bar
#
# To change the cursor style we need to modify `\e[# q` where `#` is the cursor style.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # block
        viins|main) echo -ne '\e[6 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

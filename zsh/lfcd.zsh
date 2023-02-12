# Use lf to switch directories
# https://github.com/gokcehan/lf/issues/140
# https://github.com/gokcehan/lf/blob/530ab2c40a9fdc41afa6efb6b78d2fb61c57565e/etc/lfcd.sh
# https://github.com/LukeSmithxyz/voidrice/blob/e0331ad0e76dcbcfcc08cb991d9e7f99382517db/.config/zsh/.zshrc
lf () {
        export _LF_CURRENT_PWD="$(pwd)"
        tmp="$(mktemp)"
        command lf -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
                dir="$(cat "$tmp")"
                rm -f "$tmp"
                [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
        fi
}

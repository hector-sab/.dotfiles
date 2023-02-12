function add_wezterm_to_path_macos {
	WEZTERM_ROOT_PATH=/Applications/WezTerm.app
	if [[ -d "$WEZTERM_ROOT_PATH" && "$PATH" != *"$WEZTERM_ROOT_PATH"* ]]
	then
		export PATH="$PATH:$WEZTERM_ROOT_PATH/Contents/MacOS"
	fi
}

# MacOS ncurses version is old and does not contain the terminfo used by
# tmux. This function makes sure that the terminfo for tmux is present,
# assuming we have added it. For more info, look at
# https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
function add_tmux_terminfo_macos {
	CUSTOM_TERMINFO="$HOME/.local/share/terminfo"
	if [[ -d "$CUSTOM_TERMINFO" ]]; then
		export TERMINFO_DIRS="$TERMINFO_DIRS:$CUSTOM_TERMINFO"
	fi
}

# Dotfiles

This repo contains all my configurations for an awesome development experience.

# How does it work

This repo is expected to be cloned at `$HOME/.dotfiles`.

## ZSH
The default shell used in this configuration is zsh. For loading the default settings, it is required to link them as follows.

```bash
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
```

## Wezterm

The default terminal emulator used is `wezterm`. The configurations for this terminal should be linked as below:

```bash
ln -s $HOME/.dotfiles/wezterm $HOME/.config/wezterm
```

## Tmux

Setting up tmux requires a similar process as wezterm.

```bash
ln -s $HOME/.dotfiles/tmux $HOME/.config/tmux
```

## Git

```bash
ln -s $HOME/.dotfiles/git $HOME/.config/git
```

## Neovim

For the sake of keeping a stable setting, it is recommended to download the pre-compiled release for 0.8.2; these files can be downloaded from the [release section of nvim github repo](https://github.com/neovim/neovim/releases). For installing it you can follow these instructions:

### For Linux
```bash
# Extracts
tar xzvf nvim-linux64.tar.gz
# Move to a place were the os can use it
mv ./nvim-linux64 $HOME/.local/share
# Link binary so that it can be added in the $PATH easily
ln -s $HOME/.local/share/nvim-linux64/bin/nvim $HOME/.local/bin/nvim
```

### For MacOs
```bash
# Avoids "unknown developer" warning
xattr -c ./nvim-macos.tar.gz
# Extracts
tar xzvf nvim-macos.tar.gz
# Move to a place were the os can use it
mv ./nvim-macos $HOME/.local/share
# Link binary so that it can be added in the $PATH easily
ln -s $HOME/.local/share/nvim-macos/bin/nvim $HOME/.local/bin/nvim
```

## lf
Make sure to install the lf Terminal File Manager.

```bash
ln -s $HOME/.dotfiles/lf $HOME/.config/lf
```

# Others
Good dotfiles from others:
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles)
- [LukeSmith](https://github.com/LukeSmithxyz/voidrice)
- [Christ](https://github.com/ChristianChiarulli/Machfiles)

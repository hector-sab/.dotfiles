echo `pwd`
# tmux setup
if [ ! -f ~/.tmux.conf ]; then
	ln -s "$(pwd)"/tmux/tmux.conf ~/.tmux.conf
    echo "Tmux configured"
else
    echo "Tmux not configured. Config file aready exists"
fi

# Vim setup
#if [ ! -f ~/.vimrc ]; then
#	#ln -s "$(pwd)"/vim/init.vim ~/.vimrc
#    echo "Vim configured"
#else
#    echo "Vim not configured. Config file aready exists"
#fi

echo ""
# NeoVim setup
if [ ! -f ~/.config/nvim/init.vim ]; then
	if [ ! -d ~/.config/nvim ]; then
		mkdir ~/.config/nvim
	fi
	ln -s "$(pwd)"/vim/init.vim ~/.config/nvim/init.vim
    ln -s "$(pwd)/vim/plug-config" ~/.config/nvim/plug-config
    echo "Nvim configured"
else
    echo "Nvim not configured. Config file aready exists"
fi

# Konsole theme
#echo ""
#if [ ! -f ~/.local/share/konsole/Gruvbox.colorscheme ]; then
#    # We assume that konsole folder exists...
#    ln -s "$(pwd)"/konsole/Gruvbox.colorscheme ~/.local/share/konsole/Gruvbox.colorscheme
#    echo "Konsole Gruvbox colorscheme set"
#else
#    echo "Konsole Gruvbox colorscheme already exists"
#fi

# Plugins
echo ""
echo "Remember to install vim-plug for the plugins!"
echo "https://github.com/junegunn/vim-plug"
echo "Please also remember to read the notes in the (N)Vim plugins"
echo "configurations. Some may require extra steps to make them work"

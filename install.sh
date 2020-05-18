echo `pwd`
# tmux setup
if [ ! -f ~/.tmux.conf ]; then
	ln -s "$(pwd)"/tmux/tmux.conf ~/.tmux.conf
    echo "Tmux configured"
else
    echo "Tmux not configured. Config file aready exists"
fi

# Vim setup
if [ ! -f ~/.vimrc ]; then
	#ln -s "$(pwd)"/vim/init.vim ~/.vimrc
    echo "Vim configured"
else
    echo "Vim not configured. Config file aready exists"
fi

# NeoVim setup
if [ ! -f ~/.config/nvim/init.vim ]; then
	if [ ! -d ~/.config/nvim ]; then
		mkdir ~/.config/nvim
	fi
	ln -s "$(pwd)"/vim/init.vim ~/.config/nvim/init.vim
    echo "Nvim configured"
else
    echo "Nvim not configured. Config file aready exists"
fi

# Plugins
echo "Remember to install vim-plug for the plugins!"
echo "https://github.com/junegunn/vim-plug"
echo "\nPlease also remember to read the notes in the (N)Vim plugins"
echo "configurations. Some may require extra steps to make them work"

echo `pwd`
# tmux setup
if [ ! -f ~/.tmux.conf ]; then
	ln -s "$(pwd)"/tmux/tmux.conf ~/.tmux.conf
fi
# Vim setup
if [ ! -f ~/.vimrc ]; then
	ln -s "$(pwd)"/vim/vimrc ~/.vimrc
fi
# NeoVim setup
if [ ! -f ~/.config/nvim/init.vim ]; then
	if [ ! -d ~/.config/nvim ]; then
		mkdir ~/.config/nvim
	fi
	ln -s "$(pwd)"/vim/vimrc ~/.config/nvim/init.vim
fi

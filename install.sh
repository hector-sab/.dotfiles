echo `pwd`
# tmux setup
if [ ! -f ~/.tmux.conf ]; then
 ln -s "$(pwd)"/tmux/tmux.conf ~/.tmux.conf
fi
# Vim setup
if [ ! -f ~/.vimrc ]; then
  ln -s "$(pwd)"/vim/vimrc ~/.vimrc
fi

echo "source ~/dotfiles/.vim/.vimrc" >> ~/.vimrc
echo "source ~/dotfiles/.zsh.d/.zshrc" >> ~/.zshrc
echo "source-file ~/dotfiles/.tmux.conf" >> ~/.tmux.conf
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/dotfiles/.zsh.d/.oh-my-zsh
# chsh -s /bin/zsh
mkdir -p ~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim
mkdir -p ~/tmp/vim

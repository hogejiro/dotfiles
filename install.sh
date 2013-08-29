echo "source ~/dotfiles/.vim/.vimrc" >> ~/.vimrc
echo "source ~/dotfiles/.zsh.d/.zshrc" >> ~/.zshrc
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/dotfiles/.zsh.d/.oh-my-zsh
chsh -s /bin/zsh
mkdir ~/dotfiles/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim.git ~/dotfiles/.vim/bundle/neobundle.vim
mkdir -p ~/tmp/vim
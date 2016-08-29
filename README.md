# config, the following instructions are for mac
# first install command line tool

# git
ln -s ~/.config/gitconfig ~/.gitconfig

# brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# karabiner
brew install Cask/caskoom/karabiner  
sh ~/.config/karabiner.sh

# fish
brew install fish  
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells  
chsh -s /usr/local/bin/fish

# vim
brew install vim --override-system-vi --without-python --with-python3  
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.config/vimrc ~/.vimrc

# tmux
brew install tmux
ln -s ~/.tmux ~/.tmux.conf

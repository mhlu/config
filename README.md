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

# python
brew install python3
# pyvenv ~/venv
# source ~/venv/bin/activate.fish 
# pip install readline
# pip install ipython
# pip install numpy
# pip install pandas

# vim
brew install vim --override-system-vi --without-python --with-python3
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.config/vimrc ~/.vimrc

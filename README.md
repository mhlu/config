# Config, the following instructions are for mac

## Git
```
ln -s ~/.config/gitconfig ~/.gitconfig
```

## Homebrew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Karabiner elements
configs are already setup

## Fish
```
brew install fish  
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

## Neovim
```
brew install neovim
brew install python3
pip3 install neovim --upgrade
```

## Tmux
```
brew install tmux
ln -s ~/.tmux ~/.tmux.conf
```

## Ruby
```
brew install rbenv
rbenv init
brew install rbenv-bundler
```

#!/bin/sh

echo "Setting up your Linux..."

source ~/.profile


# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=~/.dotfiles/BrewfileLinux



# Install global Composer packages
composer global require laravel/installer laravel/valet statamic/cli

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg


######TERMINAL STUFF
sudo apt install zsh
chsh -s "$(brew --prefix)/bin/zsh"



sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



#####SNAPS
sudo apt install snapd

sudo snap install code --classic
sudo snap install phpstorm --classic
sudo snap install spotify
sudo snap install enpass





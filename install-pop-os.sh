#!/bin/sh

echo "Setting up your Linux..."

#source ~/.profile

git config --global user.name "jurnskie"
git config --global user.email "jurnskie@gmail.com"


# SSH setup
ssh-keygen -t rsa -b 4096 -C "jurnskie@gmail.com"

#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.profile
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo apt-get install build-essential


# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=~/.dotfiles/BrewfileLinux


#php-cli
sudo apt-get install -y php-cli


# Install global Composer packages
composer global require laravel/installer cpriego/valet-linux statamic/cli

#install valet dependancies
sudo apt-get install jq xsel 
sudo apt-get install libnss3-tools

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg


echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bash_aliases
echo 'exec zsh' >> ~/.bash_aliases

echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.3/bin:$PATH"' >> ~/.profile
echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.3/sbin:$PATH"' >> ~/.profile



# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

#####SNAPS
sudo apt install snapd

sudo snap install code --classic
sudo snap install phpstorm --classic
sudo snap install spotify


#https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/
sudo echo "deb https://apt.enpass.io/ stable main" > \
  /etc/apt/sources.list.d/enpass.list

wget -O - https://apt.enpass.io/keys/enpass-linux.key | tee /etc/apt/trusted.gpg.d/enpass.asc

sudo apt-get update
sudo apt-get install enpass


######TERMINAL STUFF



chsh -s "$(brew --prefix)/bin/zsh"



sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"






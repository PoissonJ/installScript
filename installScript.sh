#!/bin/bash

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# Install Curl
echo "Installing Curl"
sudo apt-get -y install curl

# Git
echo "Installing Git"
sudo apt-get -y install git

# Zsh
echo "Installing Zsh"
sudo apt-get -y install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Vim
echo "Installing Vim"
sudo apt-get -y install Vim

# Setup Dotfiles
echo "Setting up Dotfiles"
rm ~/.gitconfig
rm ~/.zshrc
git clone https://github.com/PoissonJ/dotfiles.git
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

# Google Chrome
echo "Installing Google Chrome"
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo apt-get -y install google-chrome-stable

# Spotify
echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get -y install spotify-client

# Docker & Docker-Compose
echo "Installing Docker"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get -y --force-yes update
sudo apt-get -y install docker-engine
sudo apt-get -y install docker-compose
sudo usermod -aG docker ${USER}

# VLC
echo "Installing VLC"
sudo apt-get -y install vlc browser-plugin-vlc

# Redshift
echo "Installing Redshift"
sudo apt-get -y install redshift redshift-gtk

# NVM
echo "Installing Nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm install node
nvm use node

# Visual Studio Code
echo "Installing Visual Studio Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get -y update
sudo apt-get -y install code
mkdir ~/.config/Code
touch ~/.config/Code/User
cat >~/.config/Code/User <<EOL
// Place your settings in this file to overwrite the default settings
{
      "vim.insertModeKeyBindings": [
       {
           "before": ["j", "k"],
           "after": ["<Esc>"]
       }
  ]
,
"window.zoomLevel": 0.5,
"editor.tabSize": 2,
"vsicons.projectDetection.autoReload": true,
"workbench.iconTheme": "vscode-icons"
}
EOL



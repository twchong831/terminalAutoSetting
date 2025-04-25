#!/bin/zsh

# install zsh
sudo apt-get install zsh

# convert bash to zsh
chsh -s /usr/bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
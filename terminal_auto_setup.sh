# install zsh
sudo apt-get install zsh

# convert bash to zsh
chsh -s /usr/bin/zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# insatll zsh-plugin
# 1. auto complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 2. syntax Highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# insatll powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

source ~/.zshrc

# install "lsd"
# 1. package tool
sudo apt-get install cargo

# 2. install lsd
cargo install lsd

# 3. insert path
sudo cp ~/.cargo/bin/lsd /usr/bin

# 4. ~/.zshrc
alias ls='lsd'

# 5. source zshrc
source ~/.zshrc
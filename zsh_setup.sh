#!/bin/zsh

# 플러그인 설치
echo "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# .zshrc에 플러그인 추가
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
  sed -i 's/^plugins=(/&zsh-autosuggestions /' ~/.zshrc
fi

if ! grep -q "zsh-syntax-highlighting" ~/.zshrc; then
  sed -i 's/^plugins=(/&zsh-syntax-highlighting /' ~/.zshrc
fi

# powerlevel10k 설치 및 적용
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
if ! grep -q "powerlevel10k.zsh-theme" ~/.zshrc; then
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
fi

# lsd 설치
echo "Installing lsd via cargo..."
sudo apt-get update
sudo apt-get install -y cargo

if cargo install lsd; then
  echo "✅ lsd installed successfully"
  echo "Linking lsd to /usr/bin..."
  sudo cp ~/.cargo/bin/lsd /usr/bin

  # alias 등록
  if ! grep -q "alias ls='lsd'" ~/.zshrc; then
    echo "alias ls='lsd'" >> ~/.zshrc
  fi
else
  echo "⚠️ Failed to install lsd. Skipping alias and linking."
fi

# 적용
echo "Reloading zsh config..."
source ~/.zshrc

echo "🎉 Zsh plugins and powerlevel10k setup complete!"

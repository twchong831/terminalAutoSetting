#!/bin/zsh

add_plugin_to_zshrc() {
  local plugin_name=$1
  if grep -q "^plugins=" ~/.zshrc; then
    if ! grep "^plugins=" ~/.zshrc | grep -q "$plugin_name"; then
      sed -i "s/^plugins=(\(.*\))/plugins=(\1 $plugin_name)/" ~/.zshrc
      echo "✅ $plugin_name added to plugins in .zshrc"
    fi
  else
    echo "plugins=($plugin_name)" >> ~/.zshrc
    echo "✅ plugins=($plugin_name) added to .zshrc"
  fi
}

# 예: zsh-autosuggestions와 zsh-syntax-highlighting 추가
add_plugin_to_zshrc zsh-autosuggestions
add_plugin_to_zshrc zsh-syntax-highlighting

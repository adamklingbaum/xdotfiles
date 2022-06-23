#! /bin/bash

set -e

# Install oh-my-zsh

echo "λ Installing oh-my-zsh"

if [ -d ~/.oh-my-zsh ]; then
  echo "Found ~/.oh-my-zsh - skipping this step"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "✅ Installed oh-my-zsh."

# Install homebrew

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "λ Configuring homebrew"
  if ! which brew > /dev/null; then
    echo ">> Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi;

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "✅ Configured homebrew."
fi

# Clear local vim config

echo "λ Clearing local vim config"
if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi

if [ -f ~/.vimrc ]; then
  rm -f ~/.vimrc
fi

echo "✅ Cleared local vim config."

# Link dotfilees

echo "λ Linking dotfiles"

dotfiles=(.zshrc .vimrc .gitignore_global .gitconfig)

for file in "${dotfiles[@]}"
do
  echo "λ Linking ${file}"
  rm -f ~/$file
  ln -s ~/dotfiles/config/$file ~/$file
done

echo "✅ Linked dotfiles."

# Install ripgrep

echo "λ Installing ripgrep"

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo '>> Installing via homebrew'
  brew install ripgrep
else
  echo '>> Installing via apt-get'
  sudo apt-get install -y ripgrep
fi

echo "✅ Installed ripgrep."

# Install plug

echo "λ Installing plug"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "✅ Installed plug."

# Install neovim

echo "λ Installing neovim"

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo '>> Installing via homebrew'
  brew install neovim
else
  echo '>> Installing via apt-get'
  sudo apt-get install neovim
fi

echo "✅ Installed neovim."

# Link neovim config

echo "λ Linking neovim config"

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

echo "✅ Linked neovim config."

echo "✅ Installation complete."

#! /bin/bash

set -e

# Install oh-my-zsh
echo "(1/4) λ Installing oh-my-zsh"
if [ -d ~/.oh-my-zsh ]; then
  echo "Found ~/.oh-my-zsh - skipping this step"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
echo "(1/4) ✅ Installed oh-my-zsh."

# Clear local vim config
echo "(2/4) λ Clearing local vim config"
if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi

if [ -f ~/.vimrc ]; then
  rm -f ~/.vimrc
fi

echo "(2/4) ✅ Cleared local vim config."

# Install ripgrep
echo "(3/4) λ Installing ripgrep"
if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! which brew > /dev/null; then
    echo ">> Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi;

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  echo ">> Installing via brew"
  brew install ripgrep
else
  echo '>> Installing via apt-get'
  sudo apt-get install -y ripgrep
fi

echo "(3/4) ✅ Insatlled ripgrep."

# Link dotfiles
echo "(4/4) λ Linking dotfiles"
dotfiles=(.zshrc .vimrc)
for file in "${dotfiles[@]}"
do
  echo "λ Linking ${file}"
  rm -f ~/$file
  ln -s ~/dotfiles/config/$file ~/$file
done
echo "(4/4) ✅ Linked dotfiles."

echo "✅ Installation complete."

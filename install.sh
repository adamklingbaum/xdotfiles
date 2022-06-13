#! /bin/bash

set -e

# Install oh-my-zsh
echo "(1/5) λ Installing oh-my-zsh"
if [ -d ~/.oh-my-zsh ]; then
  echo "Found ~/.oh-my-zsh - skipping this step"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
echo "(1/5) ✅ Installed oh-my-zsh."

# Clear local vim config
echo "(2/5) λ Clearing local vim config"
if [ -d ~/.vim ]; then
  rm -rf ~/.vim
fi

if [ -f ~/.vimrc ]; then
  rm -f ~/.vimrc
fi
echo "(2/5) ✅ Cleared local vim config."

# Install vim-pluf
echo "(3/5) λ vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "(3/5) ✅ Installed vim-plug."

# Link dotfiles
echo "(4/5) λ Linking dotfiles"
dotfiles=(.zshrc .vimrc)
for file in "${dotfiles[@]}"
do
  echo "λ Linking ${file}"
  rm -f ~/$file
  ln -s ~/dotfiles/config/$file ~/$file
done
echo "(4/5) ✅ Linked dotfiles."

# Install ripgrep
echo "(5/5) λ Installing ripgrep"
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

echo "(5/5) ✅ Installed ripgrep."

echo "✅ Installation complete."

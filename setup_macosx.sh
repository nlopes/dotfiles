#!/bin/sh

echo "Set up ssh: ssh-keygen -t rsa -b 4096 -C "email@email.com"
echo "This script sets up homebrew in a terrible way. Check script."
exit 1

echo "Set computer hostname: "
sudo scutil --set HostName
# Careful with this:
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

xcode-select --install

# Install git first because cask needs git
brew install git
brew install emacs --with-cocoa --with-ctags --with-imagemagick --with-librsvg --devel
brew install htop zsh wget ag nvm rbenv rust csshX python
brew install postgresql --with-python
brew install Caskroom/cask/alfred \
             Caskroom/cask/caffeine \
             Caskroom/cask/iterm2 \
             Caskroom/cask/firefox \
             Caskroom/cask/google-chrome \
             Caskroom/cask/skype \
             Caskroom/cask/vagrant \
             Caskroom/cask/virtualbox \
             Caskroom/cask/apache-directory-studio \
             Caskroom/cask/java \
             Caskroom/cask/spotify \
             Caskroom/cask/slack \
             Caskroom/cask/shiftit \
             Caskroom/cask/dropbox \
             Caskroom/cask/boot2docker

# chef deps
brew install rbenv
# rbenv install 2.0.0-p353
# rbenv global 2.0.0-p353
# gem install bundle

# set up zsh as default shell
sudo dscl . change /Users/$USER UserShell /bin/bash /usr/local/bin/zsh

# set up folders
mkdir -p ~/Repos/{Personal,Internal,External}

# set up zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Downloading Powerline fonts
pushd ~/Repos/External
git clone git@github.com:powerline/fonts.git
pushd fonts
sh ./install.sh
popd
popd

# install theme
pushd ~/.zprezto/modules/prompt/external
git clone https://github.com/bhilburn/powerlevel9k.git
pushd ~/.zprezto/modules/prompt/functions
ln -s ../external/powerlevel9k/powerlevel9k.zsh-theme prompt_powerlevel9k_setup
popd
popd

# install dotfiles
pushd ~/Repos/Personal
git clone git@github.com:nlopes/dotfiles.git
popd

# set up zprezto files
for file in $(ls .zprezto/runcoms/); do echo 'source ~/.zprezto/runcoms/$file' > .${file}; done

echo "Copy your personal dotfiles over"
echo "Set up your github token"
echo "Select the Liberation font in iTerm"
echo "Download lastpass and install it (after you open your browsers)"

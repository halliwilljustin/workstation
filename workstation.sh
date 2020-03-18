#!/bin/bash
# TODO check if things are installed first
# TODO run vim-update on startup
# TODO run bash-it update on startup
# TODO run brew update && brew upgrade on startup
# TODO check for errors and print error messages
set -e

## INSTALL BREW
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/\
install/master/install)"
brew update
# brew upgrade

## Cask
# brew upgrade brew-cask
brew cask install iterm2 google-chrome firefox flycut shiftit soundflower\
 soundflowerbed audio-hijack coconutbattery keeweb spotify the-unarchiver\
 visual-studio-code wine-devel xquartz inkscape gimp flux dropbox sketch\
 google-drive-file-stream
 # sococo for Admins
 # applepi-baker arduino atom lmms macvim mixxx textmate tunnelblick

## Non-homebrew installs
# adobe cc (muse, illustrator, photoshop, xd)

## Browser add-ons
# ghostery lastpass okta
# ansel for Admins

## BASH
# update Preferences to include `Command: /usr/local/bin/bash --login`
# brew install bash
# echo $HOME/.bashrc << EOF
#  export EDITOR=vim
# EOF

## FISH
brew install fish

## GIT
brew instal git
echo $HOME/.gitconfig << EOF
  [user]
    email = justin.halliwill@gmail.com
    name = Justin Halliwill
  [alias]
    st = status
    co = checkout
    ci = commit
EOF

## OTHER TOOLS
brew install python
brew install direnv
echo 'eval "$(direnv hook bash)"' >> $HOME/.bashrc
brew install csshx
brew install ag
brew install tree
brew install htop
brew install z
echo '. `brew --prefix`/etc/profile.d/z.sh' >> ~/.bashrc

### other other tools
# c-ares chruby elixir erlang exiftool glib gmp gnutls htop-osx httrack
# icu4c intltool jansson jemalloc jpeg libev libevent libffi libgcrypt
# libgpg-error libidn2 libmaxminddb libpng libsmi libssh libtasn1 libtiff
# libunistring libyaml lua@5.1 nettle nghttp2 nmap node openssl openssl@1.1
# p11-kit pidof postgresql ruby ruby-install socat unbound wireshark wxmac
# zlib

## BASHIT (install and move autocomplete files)
# git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
# yes | $HOME/.bash_it/install.sh

# echo $HOME/.bash_profile << EOF
# Source .bashrc and .bash_profile
# if [ -f $HOME/.bashrc ]; then
#  source $HOME/.bashrc
# fi
# EOF

# bash-it enable completion git brew

## GO
brew install go
mkdir -p $HOME/go/bin $HOME/go/src $HOME/go/pkg
pushd $HOME/go
  echo export GOPATH=$HOME/go > .envrc
  echo export PATH=$HOME/go/bin:$PATH >> .envrc
  GOPATH=$HOME/go go get -u github.com/onsi/ginkgo/ginkgo
  GOPATH=$HOME/go go get -u github.com/FiloSottile/gvt
popd

## VIM
brew uninstall ctags
brew tap universal-ctags/universal-ctags
brew instal universal-ctags --HEAD
brew install python3
brew install vim --with-lua --with-python3
curl vimfiles.luan.sh/install | FORCE=1 bash
vim-update
vim-update

## Cleanup
brew upgrade && brew cask upgrade
brew cleanup && brew cask cleanup

## Config reminders
# make chrome open incognito w/ applescript app
# config firefox w/ profile sync
# keyboard shortcuts for pdf + open in preview
# custom text replacement for ¯\_(ツ)_/¯
# hot-corner screenlock
# custom screensaver?
# vpn config
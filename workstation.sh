#!/bin/bash
# TODO check if things are installed first
# TODO run vim-update on startup
# TODO run bash-it update on startup
# TODO run brew update && brew upgrade on startup
# TODO check for errors and print error messages
# TODO look into installing the following
#   - shiftit
#   - iterm
#   - chrome
#   - firefox
#   - flycut
#   - ...

## INSTALL BREW
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

## BASH
# update Preferences to include `Command: /usr/local/bin/bash --login`
brew install bash
echo $HOME/.bashrc << EOF
  export EDITOR=vim
EOF

## GIT
brew instal git
echo $HOME/.gitconfig << EOF
  [user]
    email = corbin.halliwill@gmail.com
    name = Corbin Halliwill
  [alias]
    st = status
    co = checkout
    ci = commit
EOF

## OTHER TOOLS
brew install direnv
echo 'eval "$(direnv hook bash)"' >> $HOME/.bashrc
brew install csshx
brew install ag
brew install tree
brew install z
echo '. `brew --prefix`/etc/profile.d/z.sh' >> ~/.bashrc

## BASHIT (install and move autocomplete files)
git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME/.bash_it
yes | $HOME/.bash_it/install.sh
echo $HOME/.bash_profile << EOF
# Source .bashrc
if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi
EOF
bash-it enable completion git brew

## VIM
brew uninstall ctags
brew tap universal-ctags/universal-ctags
brew instal universal-ctags --HEAD
brew install python3
pip3 install neovim
brew install neovim/neovim/neovim
ln -s /usr/local/bin/nvim /usr/local/bin/vim
curl vimfiles.luan.sh/install | FORCE=1 bash
vim-update

## GO
brew install go
mkdir -p $HOME/go/bin $HOME/go/src $HOME/go/pkg
pushd $HOME/go
  echo export GOPATH=$HOME/go > .envrc
  echo export PATH=$HOME/go/bin:$PATH >> .envrc
  GOPATH=$HOME/go go get -u github.com/onsi/ginkgo/ginkgo
  GOPATH=$HOME/go go get -u github.com/FiloSottile/gvt
popd


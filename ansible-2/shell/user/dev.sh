#!/bin/bash

dir=$HOME/resources

mkdir -p $HOME/.local/src

msg "Installing NVM / NodeJS"
mkdir -p $HOME/.nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash
$HOME/.nvm/nvm.sh install node
$HOME/.nvm/nvm.sh alias default node

#{{{ vim
  msg "Configuring VIM"
  mkdir -p $HOME/.vim/swap $HOME/.vim/backup
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  mkdir -p $HOME/.vim/bundle-post/vim-airline-themes/autoload/airline/themes
  cp -rv $dir/config/dotfiles/.vim/bundle-post/ $HOME/.vim/bundle
  # cp -v $HOME/.vimrc* $backup
  cp -v $dir/config/dotfiles/.vimrc $HOME
  cp -rv $dir/config/dotfiles/.vim/colors  $HOME/.vim
  cp -rv $dir/config/dotfiles/.vim/after $HOME/.vim
  cp -rv $dir/config/dotfiles/.vim/ftdetect $HOME/.vim
  cp -rv $dir/config/dotfiles/.vim/syntax $HOME/.vim
  vim --not-a-term +PluginInstall +qall
  vim --not-a-term +GoInstallBinaries +qall
#}}}

#{{{ ruby (benv)
  cd ~
  git clone git://github.com/sstephenson/rbenv.git .rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  exec $SHELL

  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

  # sudo plugin so we can run Metasploit as root with "rbenv sudo msfconsole"
  git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo

  exec $SHELL

  RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
  rbenv install $RUBYVERSION
  rbenv global $RUBYVERSION
  ruby -v
#}}}

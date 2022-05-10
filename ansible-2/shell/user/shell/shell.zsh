#!/usr/bin/zsh

# DIR=${pwd}
DIR="$HOME/resources"
backup="$HOME/tmp/shell-backup-$(date +%Y-%M-%d.%H.%m)"
export ZSH="$HOME/.oh-my-zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.shell/.oh-my-zsh

# {{{ neovim
  sudo apt-get install libtool-bin
  mkdir -p ${HOME}/.local/src && cd ~{$HOME}/.local/src
  git clone https://github.com/neovim/neovim.git  && cd neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
# }}}

# {{{ external plugins
git clone --single-branch --branch next https://github.com/bhilburn/powerlevel9k.git \
	$ZSH/custom/themes/powerlevel9k-next

git clone https://github.com/zsh-users/zsh-completions \
	$ZSH/custom/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
	$ZSH/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions \
	$ZSH/custom/plugins/zsh-autosuggestions

git clonehttps://github.com/djui/alias-tips \
	$ZSH/custom/plugins/alias-tips

git clone https://github.com/svenXY/timewarrior \
	$ZSH/custom/plugins/timewarrior

git clone https://github.com/djui/alias-tips.git \
  $ZSH/custom/plugins/alias-tips

git clone https://github.com/b4b4r07/enhancd.git \
  $ZSH/custom/plugins/enhancd

git clone --recursive https://github.com/liangguohuan/zsh-dircolors-solarized \
	$ZSH/custom/plugins/zsh-dircolors-solarized
# }}}
#
# {{{ fonts
# TODO: select specific fonts instead of massive install
cd $HOME/.local/src
git clone https://github.com/gabrielelana/awesome-terminal-fonts
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh DejaVusansMono
# }}}

mkdir -p $backup

# cp -rv $HOME/.shell $backup
cp -rv $DIR/dotfiles/.shell $HOME
cp -rv $DIR/dotfiles/.shell/.config $HOME

# cp -v $HOME/.* $backup
cp -v $DIR/dotfiles/.* $HOME
mv -v $HOME/.shell/.zshrc.replacer $HOME/.zshrc
cp -v $HOME/.shell/.zshrc.local $HOME

cp -rv $DIR/bin $HOME

# cp -v $HOME/.tmux.conf $backup
cp -v $DIR/dotfiles/.tmux.conf $HOME

# copy to customize colors
mkdir -p $HOME/.config/colorls
cp $(dirname $(gem which colorls))/yaml/dark_colors.yaml \
	$HOME/.config/colorls/

# chsh -s /usr/bin/zsh $USER

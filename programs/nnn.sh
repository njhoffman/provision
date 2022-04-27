#!/bin/bash

NNN_PLUG_PERSONAL='g:personal/convert2zoom;p:personal/echo'
NNN_PLUG_WORK='j:work/prettyjson;d:work/foobar'
NNN_PLUG_INLINE='e:!go run $nnn*'
NNN_PLUG_DEFAULT='1:ipinfo;p:preview-tui;o:fzz;b:nbak'
NNN_PLUG="$NNN_PLUG_PERSONAL;$NNN_PLUG_WORK;$NNN_PLUG_DEFAULT;$NNN_PLUG_INLINE"

BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
NNN_THEME_NORD="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
NNN_THEME_ONE_DARK="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

export NNN_FCOLORS="$NNN_THEME_NORD"

export NNN_FIFO=/tmp/nnn.fifo
# export NNN_PLUG='m:-!|mediainfo $nnn;t:-!|tree -ps;l:-!|ls -lah --group-directories-first'
# plugin finder can be invoked with the keybind ;f, fzopen can be run with ;o and so on...
# The key vs. plugin pairs are shown in the help and config screen.
# export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'
# export NNN_PLUG=-P

alias nnn="nnn -P -o "
alias nnn-plugin-update="curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh"

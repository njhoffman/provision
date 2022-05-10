#!/bin/bash

git-clone git://github.com/rocky/zshdb.git
cd zshdb
./autogen.sh  # Add configure options. See ./configure --help

make && make test

# ./zshdb /etc/zsh/zshrc # substitute .../zshrc with any other zsh script

source path-to-zshdb/zshdb/dbg-trace.sh
# work, work, work.

_Dbg_debugger
# start debugging here

# Above, the directory path-to_zshdb should be replaced with the directory that dbg-trace.sh is located in. This can also be from the source code directory zshdb or from the directory dbg-trace.sh gets installed directory. The "source" command needs to be done only once somewhere in the code prior to using _Dbg_debugger.

# If the result is satisfactory and make test above has worked, install via:
sudo make install

sudo apt-get install zshdb

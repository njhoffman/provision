#!/usr/bin/env bash

# https://github.com/cheat/cheat
go install github.com/cheat/cheat/cmd/cheat@latest

asdf add plugin cheat
asdf install cheat

cd /tmp &&
  wget https://github.com/cheat/cheat/releases/download/4.4.2/cheat-linux-amd64.gz &&
  gunzip cheat-linux-amd64.gz &&
  chmod +x cheat-linux-amd64 &&
  sudo mv cheat-linux-amd64 /usr/local/bin/cheat

git clone https://github.com/cheat/cheatsheets \
  $HOME/.config/cheat/cheatsheets/community

# https://github.com/gnebbia/kb
# https://github.com/denisidoro/navi
# https://github.com/srsudar/eg
# https://devhints.io/
# https://github.com/command-line-interface-pages
# cargo install
# tealdeer v1.6.1:
# tldr

# https://github.com/chubin/cheat.sh
# https://github.com/dbeniamine/cheat.sh-vim
# # no syntax highlighting
# curl "cht.sh/lua/merge+tables\?T"

# cht.sh --standalone-install

curl cheat.sh/tar
curl cht.sh/curl
curl https://cheat.sh/rsync
curl https://cht.sh/tr
curl cht.sh/go/Pointers
curl cht.sh/scala/Functions
curl cht.sh/python/lambda

# PATH_DIR="$HOME/bin"  # or another directory on your $PATH
# mkdir -p "$PATH_DIR"
# curl https://cht.sh/:cht.sh > "$PATH_DIR/cht.sh"
# chmod +x "$PATH_DIR/cht.sh"

# curl cht.sh/go/:list
# Almost each programming language has a special page named :learn that describes the language basics (that's a direct mapping from the "Learn X in Y" project). It could be a good starting point if you've just started learning a language.
#
# If there is no cheat sheet for a programming language query (and it is almost always the case), it is generated on the fly, based on available cheat sheets and answers on StackOverflow. Of course, there is no guarantee that the returned cheat sheet will be a 100% hit, but it is almost always exactly what you are looking for.
#
# Try these (and your own) queries to get the impression of that, what the answers look like:
#
#    curl cht.sh/go/reverse+a+list
#    curl cht.sh/python/random+list+elements
#    curl cht.sh/js/parse+json
#    curl cht.sh/lua/merge+tables
#    curl cht.sh/clojure/variadic+function
# If you don't like an answer for your queries, you can pick another one. For that, repeat the query with an additional parameter /1, /2 etc. appended:
#
#    curl cht.sh/python/random+string
#    curl cht.sh/python/random+string/1
#    curl cht.sh/python/random+string/2

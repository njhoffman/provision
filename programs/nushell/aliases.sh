#!/bin/bash
# https://www.nushell.sh/book/cheat_sheet.html

42 | describe
30day / 1sec # How many seconds in 30 days?
open people.txt | lines | split column "|" | str trim
open "Cargo.toml" | inc package.version --minor | save "Cargo_new.toml"
http get https://blog.rust-lang.org/feed.xml
open mydb.sql
open mydb.sql | get FieldName
open mydb.sql | query db "select * from Artist ar join Album al on ar.ArtistId = al.ArtistId limit 5"
ls /usr/share/nvim/runtime/ | get name | ^grep tutor | ^ls -la $i
ls | sort-by size
ls | sort-by size | first 5 | skip 2
date now | date to-table
sys | get host.sessions.name
[one, two, three, four, five, six] | reduce {|curr, max|
  if ($curr | str length) > ($max | str length) {
    $curr
    } else {
    $max
  }
}
help commands

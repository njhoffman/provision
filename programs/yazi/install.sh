#!/bin/bash

# https://github.com/AnirudhG07/awesome-yazi
cargo install --locked yazi-fm yazi-cli

# themes:https://github.com/yazi-rs/flavors

### plugins
# https://github.com/mikavilpas/easyjump.yazi
# https://github.com/boydaihungst/thunar-bulk-rename.yazi
# https://github.com/orhnk/system-clipboard.yazi
# https://github.com/josephschmitt/auto-layout.yazi
# https://github.com/Rolv-Apneseth/starship.yazi
# ya pack -a wylie102/duckdb
#   add to yazi.toml
#   [plugin]
#   prepend_previewers = [
#     { name = "*.csv", run = "duckdb" },
#     { name = "*.tsv", run = "duckdb" },
#     { name = "*.json", run = "duckdb" },
#     { name = "*.parquet", run = "duckdb" },
#     { name = "*.txt", run = "duckdb" },
#     { name = "*.xlsx", run = "duckdb" },
#     { name = "*.db", run = "duckdb" },
#     { name = "*.duckdb", run = "duckdb" }
#   ]

#   prepend_preloaders = [
#     { name = "*.csv", run = "duckdb", multi = false },
#     { name = "*.tsv", run = "duckdb", multi = false },
#     { name = "*.json", run = "duckdb", multi = false },
#     { name = "*.parquet", run = "duckdb", multi = false },
#     { name = "*.txt", run = "duckdb", multi = false },
#     { name = "*.xlsx", run = "duckdb", multi = false }
#   ]
#   keymap.toml
#   [[manager.prepend_keymap]]
#   on = "H"
#   run = "plugin duckdb -1"
#   desc = "Scroll one column to the left"
#
#   [[manager.prepend_keymap]]
#   on = "L"
#   run = "plugin duckdb +1"
#   desc = "Scroll one column to the right"
#
#   [[manager.prepend_keymap]]
#   on = ["g", "o"]
#   run = "plugin duckdb -open"
#   desc = "open with duckdb"
#
#   [[manager.prepend_keymap]]
#   on = ["g", "u"]
#   run = "plugin duckdb -ui"
#   desc = "open with duckdb ui"
#   # init.lua
#   -- DuckDB plugin configuration
#   require("duckdb"):setup()

# ya pack -a yazi-rs/plugins:mime-ext
# [[plugin.prepend_fetchers]]
# id   = "mime"
# name = "*"
# run  = "mime-ext"
# prio = "high"

# ya pack -a yazi-rs/plugins:smart-paste
# [[manager.prepend_keymap]]
# on   = "p"
# run  = "plugin smart-paste"
# desc = "Paste into the hovered directory or CWD"

# ya pack -a yazi-rs/plugins:full-border
# require("full-border"):setup({
#   -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
#   type = ui.Border.ROUNDED,
# })

# ya pack -a yazi-rs/plugins:smart-enter
# [[manager.prepend_keymap]]
# on   = "l"
# run  = "plugin smart-enter"
# desc = "Enter the child directory, or open the file"
# require("smart-enter"):setup {
# 	open_multi = true,
# }

# ya pack -a yazi-rs/plugins:smart-filter
# [[manager.prepend_keymap]]
# on   = "F"
# run  = "plugin smart-filter"
# desc = "Smart filter"

# ya pack -a yazi-rs/plugins:piper
# ~/.config/yazi/yaiz.toml
# [[plugin.prepend_previewers]]
# name = "*"
# run  = 'piper -- echo "$1"'
## Preview tarballs with tar
# [[plugin.prepend_previewers]]
# name = "*.tar*"
# run  = 'piper --format=url -- tar tf "$1"'
## In this example, --format=url tells piper to parse the tar output as file URLs, so you'll be able to get a list of files with icons.
## Preview CSV with bat
# [[plugin.prepend_previewers]]
# name = "*.csv"
# run  = 'piper -- bat -p --color=always "$1"'
## Note that certain distributions might use a different name for bat, like Debian and Ubuntu uses batcat instead, so please adjust accordingly.
## Preview Markdown with glow
# [[plugin.prepend_previewers]]
# name = "*.md"
# run  = 'piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"'
## Note that there's a bug in Glow v2.0 that causes slight color differences between tty and non-tty environments.
## Preview directory tree with eza
# [[plugin.prepend_previewers]]
# name = "*/"
# run  = 'piper -- eza -TL=3 --color=always --icons=always --group-directories-first --no-quotes "$1"'
# Use hexyl as fallback previewer
# Yazi defaults to using file -bL "$1" if there's no matched previewer.
## This example uses hexyl as a fallback previewer instead of file.
# [[plugin.append_previewers]]
# name = "*"
# run  = 'piper -- hexyl --border=none --terminal-width=$w "$1"'
#
# ya pack -a yazi-rs/plugins:vcs-files
# keymap.toml
# [[manager.prepend_keymap]]
# on   = [ "g", "c" ]
# run  = "plugin vcs-files"
# desc = "Show Git file changes"#

# ya pack -a yazi-rs/plugins:mount
# [[manager.prepend_keymap]]
# on  = "M"
# run = "plugin mount"

## Available keybindings:
##
## Key binding	Alternate key	Action
## q	-	Quit the plugin
## k	↑	Move up
## j	↓	Move down
## l	→	Enter the mount point
## m	-	Mount the partition
## u	-	Unmount the partition
## e	-	Eject the disk

# ya pack -a GianniBYoung/rsync
# [[manager.prepend_keymap]]
# on   = "R"
# run  = "plugin rsync"
# desc = "Copy files using rsync"

# ya pack -a "Sonico98/exifaudio"
# [plugin]
# prepend_previewers = [
#     { mime = "audio/*",   run = "exifaudio"}
# ]

# ya pack -a 'pirafrank/what-size'
# [manager]
# prepend_keymap = [
#   { on   = [ ".", "s" ], run  = "plugin what-size", desc = "Calc size of selection or cwd" },
# ]

# ya pack -a llanosrocas/yaziline
# require("yaziline"):setup({
#   color = "#98c379", -- main theme color
#   default_files_color = "darkgray", -- color of the file counter when it's inactive
#   selected_files_color = "white",
#   yanked_files_color = "green",
#   cut_files_color = "red",
#
#   separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
#   separator_open = "",
#   separator_close = "",
#   separator_open_thin = "",
#   separator_close_thin = "",
#   separator_head = "",
#   separator_tail = "",
#
#   select_symbol = "",
#   yank_symbol = "󰆐",
#
#   filename_max_length = 24, -- truncate when filename > 24
#   filename_truncate_length = 6, -- leave 6 chars on both sides
#   filename_truncate_separator = "..." -- the separator of the truncated filename
# })

# ya pack -a lpnh/fr
# [[manager.prepend_keymap]]
# on = ["f", "r"]
# run = "plugin fr rg"
# desc = "Search file by content (rg)"
# [[manager.prepend_keymap]]
# on = ["f", "a"]
# run = "plugin fr rga"
# desc = "Search file by content (rga)"
## this plugin provides the following custom fzf keybindings:
##
## ctrl-r: reload the search
## ctrl-s: toggle the matching method (rg, fzf)
## ctrl-]: toggle the preview window size (66%, 80%)
## ctrl-\: toggle the preview window position (top, right
# require("fr"):setup {
#     fzf = [[--info-command='echo -e "$FZF_INFO 💛"' --no-scrollbar]],
#     rg = "--colors 'line:fg:red' --colors 'match:style:nobold'",
#     bat = "--style 'header,grid'",
#     rga = {
#         "--follow",
#         "--hidden",
#         "--no-ignore",
#         "--glob",
#         "'!.git'",
#         "--glob",
#         "!'.venv'",
#         "--glob",
#         "'!node_modules'",
#         "--glob",
#         "'!.history'",
#         "--glob",
#         "'!.Rproj.user'",
#         "--glob",
#         "'!.ipynb_checkpoints'",
#     },
#     rga_preview = {
#         "--colors 'line:fg:red'"
#             .. " --colors 'match:fg:blue'"
#             .. " --colors 'match:bg:black'"
#             .. " --colors 'match:style:nobold'",
#     },
# }

# ya pack -a 'gesellkammer/audio-preview'
# [plugin]
# prepend_previewers = [
#   { mime = "audio/*", run = "audio-preview" },
# ]
# prepend_preloaders = [
#   { mime = "audio/*", run = "audio-preview" },
# ]

# ya pack -a Rolv-Apneseth/bypass
# [[manager.prepend_keymap]]
# on = [ "l" ]
# run = "plugin bypass"
# desc = "Recursively enter child directory, skipping children with only a single subdirectory"
# [[manager.prepend_keymap]]
# on = [ "h" ]
# run = "plugin bypass reverse"
# desc = "Recursively enter parent directory, skipping parents with only a single subdirectory"

# https://github.com/BBOOXX/file-actions.yazi

#!/usr/bin/env bash

# https://github.com/moustacheful/glimmer
# cargo build && cargo run

cargo install glimmer

# glimmer --styles=./path/to/your/theme.css

# supported css properties by GTK:
# https://docs.gtk.org/gtk3/css-properties.html
#
# #box {
#   background: rgba(255, 200, 0, 0.2);
#   transition: background 2s ease, margin 0.2s ease;
#   margin: 10px;
# }
#
# .animate #box {
#   background: transparent;
#   margin: 0px;
# }
#
# #label {
#   opacity: 0; /* Hide the label */
# }

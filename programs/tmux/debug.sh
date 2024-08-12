#!/usr/bin/env bash

# make alias for turning debugginig on and off with SIGUSR
#
# Did you set $LIBRARY_PATH or $LD_LIBRARY_PATH?
# If you suspect that it's an issue with environment variables, try running
# "env -i HOME=$HOME PATH=$PATH make"
#
# Here is a script that shows how it can happen that gcc links against one
# shared library, but the dynamic linker uses another one:
#
# cat > test.c <<EOF
# #include <stdio.h>
# extern char lib();
# int main() { printf("%c\n", lib()); }
# EOF
# for dir in a b
# do
# mkdir -p "$dir"
# (
# cd "./$dir"
# cat > lib.c <<- EOF
# char lib() { return '$dir'; }
# EOF
# cc -c lib.c -shared -fpic -o liblib.o
# cc -shared liblib.o -o liblib.so
# )
# done
# LIBRARY_PATH=$PWD/a cc test.c -llib
# LD_LIBRARY_PATH=$PWD/b ./a.out # prints "b"
#
# Running gcc with -v will show the library paths it uses (-L),
# those should be consistent with the output of "ldd `which tmux`"
# 
# Reply all
# 
# Reply to author

#!/bin/bash

# https://github.com/bchretien/Gdbinit/blob/master/README.markdown
#  https://github.com/cyrus-and/gdb-dashboard
# https://github.com/hugsy/gef/blob/main/docs/api/gef.md
#  https://github.com/wcampbell0x2a/heretek
# https://www.mkdynamics.net/Sections/Cybersecurity/SLAE64/Modules/Module_1/Section_3_GDB_Test/section_3_GDB_test.html
# https://github.com/jfoote/exploitable/
# https://github.com/snare/voltron

# gdb installation
$ sudo apt-get update
$ sudo apt-get install gdb

$ wget "http://ftp.gnu.org/gnu/gdb/gdb-7.11.tar.gz"
$ tar -xvzf gdb-7.11.tar.gz
$ cd gdb-7.11
gdb-7.11$ ./configure
gdb-7.11$ make
$ make install


# zshdb debugger
# https://zshdb.readthedocs.io/en/latest/commands.html

$ git clone git://github.com/rocky/zshdb.git
$ cd zshdb && ./autogen.sh
 make && make test
sudo make install
./zshdb -L /etc/zsh/zshrc # substitute  ~/.zshrc

# inline zshdb debugging
source path-to-zshdb/zshdb/dbg-trace.sh
_Dbg_debugger
 # Add configure options. See ./configure --help

#───────────────────────────────────────────────────────────────────────────────────────────────────

# GEF dashboard
# https://hugsy.github.io/gef/commands/aliases/
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

$ gdb -q /path/to/my/bin
gef➤ gef help

# remote debugging
remote:~ $ gdbserver 0.0.0.0:1234 /path/to/file
Running as PID: 666

local:~ $ gdb -q
gef➤ gef-remote -t your.ip.address:1234 -p 666

# updating within python
$ python ~/.gdbinit-gef.py --update
Updated

# gef user extensions

# using the automated way
## via the install script
$ bash -c "$(wget https://github.com/hugsy/gef/raw/main/scripts/gef-extras.sh -O -)"

# or manually
## clone the repo
$ git clone --branch main https://github.com/hugsy/gef-extras.git

## then specify gef to load this directory
$ gdb -ex 'gef config gef.extra_plugins_dir "/path/to/gef-extras/scripts"' -ex 'gef save' -ex quit
gef➤ tmux-setup
# [+] Configuration saved

# disabling gef
cat ~/.gdbinit
source /my/path/to/gef.py
# Will become:
cat ~/.gdbinit
# source /my/path/to/gef.

# configuration: ~/.gef.rc : generate config file and edit
gdb -ex 'gef save' -ex quit
command gef config

# prevent segfaults by settings gef.readline_compat to  True
# [gef]
# readline_compat = True

gef➤  gef config <Module>.<ModuleSetting>  <Value>


# showroom: https://hugsy.github.io/gef/screenshots/
#Embedded hexdump view (hexdump  command)
# Dereferencing data or registers  (dereference) command, (registers) command
# Heap analysis#
# testing, linting


python -m pip install -r tests/requirements.txt --user -U#
cd ~/git/gvf
python3 -m pylint --rcfile .pylintrc
pytest -k benchmark


# in place debugging
# Search for class NopCommand(GenericCommand), go to do_invoke method and insert:
import pdb; pdb.set_trace()
# Open a gdb session -> start -> nop
git clone https://github.com/hugsy/gef-extras
# Add syscall_args and libc_function_args to context layout:
gef➤  pi gef.config['context.layout'] += ' syscall_args'
gef➤  pi gef.config['context.layout'] += ' libc_function_args'

# Add the path to the external scripts to GEF's config:
gef➤  gef config gef.extra_plugins_dir /path/to/gef-extras/scripts

# And same for the structures (to be used by pcustom command):
gef➤  gef config pcustom.struct_path /path/to/gef-extras/structs

# And for the syscall tables:
gef➤  gef config syscall-args.path /path/to/gef-extras/syscall-tables

# And finally for the glibc function call args definition: gef➤  gef config context.libc_args True
gef➤  gef config context.libc_args_path /path/to/gef-extras/glibc-function-args

# And don't forget to save your settings.

gef➤ gef save
# Note that it is possible to specify multiple directories, separating the paths with a semi-colon:
# gef➤  gef config gef.extra_plugins_dir /path/to/dir1;/path/to/dir2
# Now run and enjoy all the fun!
# Automatic detection of UaF during runtime
# Display ELF information (elf) command
# Security settings (checksec) command
# ~/git/gef/tests/commands/new_command.py
# Automatic vulnerable string detection
# Code emulation with Unicorn-Engine (x86-64) (emu 2) command
# Comprehensive address space layout display (vmap) command
# Defining arbitrary custom structures (dt elf64_t 0x00000aaaaaaaa000)
# Highlight custom strings (hll) command
# heap chunks view (heap chunks) command
# context view (ctx stack) command

# container debugging: get PID of process running in host
docker top <container ID> -o pid | awk '!/PID/' | xargs -I'{}' pstree -psa {}



cat << EOF > test-example.py
"""
$(my-command) command test module
$(my-command) command test module
"""
from tests.utils import RemoteGefUnitTestGeneric

class MyCommandCommand(RemoteGefUnitTestGeneric):
  """$(my-command) command test module"""

  def setUp(self) -> None:
      # By default, tests will be executed against the default.out binary
      # You can change this behavior in the $(setUp) function
      self._target = debug_target("my-custom-binary-for-tests")
      return super().setUp()

  def test_cmd_my_command(self):
      # some convenience variables
      root, gdb, gef = self._conn.root, self._gdb, self._gef

      # You can then interact with any command from gdb or any class/function/variable from gef
      # For instance:

      # * tests that  $(my-command) is expected to fail if the session is not active
      output = gdb.execute("my-command", to_string=True)
      assert output == ERROR_INACTIVE_SESSION_MESSAGE

      # * $(my-command) must print "Hello World" message when executed in running context
      gdb.execute("start")
      output = gdb.execute("my-command", to_string=True)
      assert "Hello World" == output


  # from tests.utils import RemoteGefUnitTestGeneric
  class MyCommandCommand(RemoteGefUnitTestGeneric):
      """$(my-command) command test module"""

      def setUp(self) -> None:
# By default, tests will be executed against the default.out binary
          # You can change this behavior in the $(setUp) function
          self._target = debug_target("my-custom-binary-for-tests")
          return super().setUp()

      def test_cmd_my_command(self):
          # some convenience variables
          root, gdb, gef = self._conn.root, self._gdb, self._gef

          # You can then interact with any command from gdb or any class/function/variable from gef
          # For instance:

          # * tests that  $(my-command) is expected to fail if the session is not active
          output = gdb.execute("my-command", to_string=True)
          assert output == ERROR_INACTIVE_SESSION_MESSAGE

          # * $(my-command) must print "Hello World" message when executed in running context
          gdb.execute("start")
          output = gdb.execute("my-command", to_string=True)
          assert "Hello World" == output
  t -v -k "not benchmark" tests

"""
EOF

# #shellcheck disable:
# testing remotely
# $ gdb -q -nx
# (gdb) source /path/to/gef/gef.py
gef➤  source /path/to/gef/scripts/remote_debug.py
gef➤  pi start_rpyc_service(4444)
Here RPyC will be started on the local host, and bound to the TCP port 4444. We can now connect using a regular Python REPL:

>>> import rpyc
>>> c = rpyc.connect("localhost", 4444)
>>> gdb = c.root.gdb
>>> gef = c.root.gef
# We can now fully control the remote GDB
>>> gdb.execute("file /bin/ls")
>>> gdb.execute("start")
>>> print(hex(gef.arch.pc))
0x55555555aab0
>>> print(hex(gef.arch.sp))
0x7fffffffdcf0

 # When running your test, you can summon pytest with the
 # `--pdb` flag to enter the python testing environment
 # to help you get more information about the reason of failure.


#!/bin/bash

# install and enable ssh server
sudo apt install openssh-server
sudo systemctl enable ssh
sudo ufw allow ssh

ssh-keygen -t rsa
ssh sheena@192.168.0.11 "chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"
ssh-copy-id user@somedomain
scp .ssh/id_rsa.pub user@somedomain:~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
#
#### .bashrc method #####
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval "$(ssh-agent)"
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

#### user sservice method #####
# ~/.config/systemd/user/ssh-agent.service:
cat << END
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
END

# .profile, .zprofile
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
systemctl --user enable ssh-agent
systemctl --user start ssh-agent

#### keychain method ####
sudo apt-get install keychain
eval "$(keychain --agents ssh,gpg --eval id_rsa)"
# -q Quiet mode
# --noask Don't ask for the password upon start, but on demand when ssh key is actually used.

#### client ####
# ~/.ssh/config
# his will instruct the ssh client to always add the key to a running agent
AddKeysToAgent yes

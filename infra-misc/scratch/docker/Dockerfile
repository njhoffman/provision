##########################################
# 863 MB
FROM ubuntu:20.10 AS base

RUN apt-get update && apt-get install -y \
  openssh-server sudo locales locales-all libreadline-dev

# set up locales
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# set up ssh
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i '/PermitRootLogin /d' /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
# RUN sed -i '/^LogLevel /d' /etc/ssh/sshd_config
# RUN echo 'LogLevel DEBUG3' >> /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# unminimize packed distribution
RUN yes | unminimize

RUN apt-get autoremove && apt-get clean

##########################################
# 1.14 GB
FROM base AS ansible-base
COPY ./ /root/.dotfiles/
RUN apt-get install -y \
    ansible git python3-apt apt-utils

WORKDIR /root/.dotfiles/scripts
RUN ./bootstrap

RUN apt-get autoremove && apt-get clean

##########################################
# 3.59 GB
FROM ansible-base AS ansible-shell

WORKDIR /root/.dotfiles/.provision
RUN ./start-ansible.sh zsh && \
    ./start-ansible.sh fonts && \
    ./start-ansible.sh termite && \
    ./start-ansible.sh tmux && \
    ./start-ansible.sh cleanup

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

##########################################
# 9.57 GB
FROM ansible-base AS ansible-devtools
WORKDIR /root/.dotfiles/.provision
RUN ./start-ansible.sh aws && \
    ./start-ansible.sh docker && \
    ./start-ansible.sh kubernetes && \
    ./start-ansible.sh misc-dev && \
    ./start-ansible.sh neovim && \
    ./start-ansible.sh terraform && \
    ./start-ansible.sh twilio && \
    ./start-ansible.sh cleanup

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

##########################################
# 5.88 GB
FROM ansible-base AS ansible-systemtools

WORKDIR /root/.dotfiles/.provision
RUN ./start-ansible.sh audio && \
    ./start-ansible.sh video && \
    ./start-ansible.sh files && \
    ./start-ansible.sh network && \
    ./start-ansible.sh system-monitors && \
    ./start-ansible.sh virtualization && \
    ./start-ansible.sh cleanup

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

##########################################
# 1.14 GB
FROM ansible-base AS ansible-services

WORKDIR /root/.dotfiles/.provision
RUN ./start-ansible.sh influxdb && \
    ./start-ansible.sh telegraf && \
    ./start-ansible.sh grafana && \
    ./start-ansible.sh kibana && \
    ./start-ansible.sh elasticsearch && \
    ./start-ansible.sh logstash && \
    ./start-ansible.sh postgres && \
    ./start-ansible.sh cleanup

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

##########################################
# 2.53 GB
FROM ansible-base AS ansible-window-management

WORKDIR /root/.dotfiles/.provision
RUN ./start-ansible.sh conky && \
    ./start-ansible.sh compton && \
    ./start-ansible.sh i3 && \
    ./start-ansible.sh polybar && \
    ./start-ansible.sh rofi && \
    ./start-ansible.sh cleanup

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

##########################################
FROM ansible-base AS ansible-all

WORKDIR /root/.dotfiles/.provision
RUN ./start-ansible.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

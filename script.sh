#!/bin/bash

# update package
echo 'update package'
sudo apt-get update

# install openssh-server
echo 'install openssh-server'
sudo apt-get install openssh-server

SSH_PORT=22
sudo read -p "whitch port will use for ssh server? default[22] : "$SSH_PORT

if [ $SSH_PORT = 22 ]; then
    echo 'SSH PORT = '$SSH_PORT
    sudo echo  'Port '$SSH_PORT >> /etc/ssh/sshd_config
else
    echo 'SSH PORT '$SSH_PORT
    sudo echo  'Port '$SSH_PORT >> /etc/ssh/sshd_config
fi

ROOT_LOGIN=n
sudo read -p "allow root login? yes [y], no [n] : "$ROOT_LOGIN

if [ $ROOT_LOGIN = n ]; then
    echo 'disable root login'
    sudo echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
elif [ $ROOT_LOGIN = y ]; then
    echo 'enable root login'
    sudo echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
else
    echo 'unknow char: disable root login'
    sudo echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
fi






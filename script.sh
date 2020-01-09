#!/bin/bash

# open root
echo 'change to root user'
sudo su

# update package
echo 'update package'
apt-get update

# install openssh-server
echo 'install openssh-server'
apt-get install openssh-server

SSH_PORT=22
read -p "whitch port will you use to ssh server? default[22] : " $SSH_PORT

if [ $SSH_PORT = 22 ]; then
    echo 'SSH PORT = '$SSH_PORT
    echo  'Port '$SSH_PORT >> /etc/ssh/sshd_config
else
    echo 'SSH PORT '$SSH_PORT
    echo  'Port '$SSH_PORT >> /etc/ssh/sshd_config
fi

ROOT_LOGIN=n
read -p "allow root login? yes [y], no [n] : " $ROOT_LOGIN

if [ $ROOT_LOGIN = n ]; then
    echo 'disable root login'
    echo 'PermitRootLogin no'
elif [ $ROOT_LOGIN = y ]
    echo 'enable root login'
    echo 'PermitRootLogin yes'
else
    echo 'unknow char: disable root login'
    echo 'PermitRootLogin no'
fi






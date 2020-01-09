#!/bin/bash

# update package
echo 'update package'
apt-get update

# install openssh-server
echo 'install openssh-server'
apt-get install openssh-server

read -p "whitch port will use for ssh server? default[22] : " SSH_PORT

echo 'ssh port configured to '$SSH_PORT
echo  'Port '$SSH_PORT >> /etc/ssh/sshd_config

read -p "allow root login? yes [y], no [n] : " ROOT_LOGIN

if [ $ROOT_LOGIN = n ]; then
    echo 'disable root login'
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
elif [ $ROOT_LOGIN = y ]; then
    echo 'enable root login'
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
else
    echo 'unknow char: disable root login'
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
fi






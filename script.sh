#!/bin/bash

echo 'this script mush be run with sudo or root user'

# update package
echo 'update package'
apt-get update -y

# install openssh-server
echo 'install openssh-server'
apt-get install openssh-server -y

read -p "whitch port will use for ssh server? default[22] : " SSH_PORT

if [ $SSH_PORT -ne 22 ]; then
    echo 'ssh port set to '$SSH_PORT
    echo 'Port '$SSH_PORT >> /etc/ssh/sshd_configelse
else
    echo 'ssh port set to default port 22'
    echo 'Port 22' >> /etc/ssh/sshd_config
fi

read -p "allow root login default[n]? yes [y], no [n] : " ROOT_LOGIN

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

read -p 'allow password authentication, default[y] ? yes[y], no[n] : ' PASS_AUTH

if [ $PASS_AUTH = y ]; then
    echo 'password authentication set to yes'
    echo 'PasswordAuthenticaton yes '$PASS_AUTH  >> /etc/ssh/sshd_config
elif [ $PASS_AUTH = n ]; then
    echo 'password authentication set to no'
    echo 'PasswordAuthenticaton no '$PASS_AUTH  >> /etc/ssh/sshd_config
else
    echo 'password authentication set to default yes'
    echo 'PasswordAuthenticaton yes '$PASS_AUTH  >> /etc/ssh/sshd_config
fi



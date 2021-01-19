# Docker Preparation

docker run --rm -it ubuntu /bin/bash

apt update
apt-add-repository --yes --update ppa:ansible/ansible
apt install sudo software-properties-common openssh-server sshpass
apt install ansible

ansible all --ask-pass -m ping

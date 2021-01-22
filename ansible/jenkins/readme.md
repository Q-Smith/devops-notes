# Docker Preparation

docker run --rm -it ubuntu /bin/bash

apt update
apt-add-repository --yes --update ppa:ansible/ansible
apt install sudo nano software-properties-common
apt install openssh-server sshpass
apt install ansible

# Test Ping

ansible all -i "localhost," --ask-pass -m ping
ansible all --inventory "localhost," --module-name debug --args "msg='Hello Ansible'"

http://lifuzu.com/blog/2016/03/06/playing-with-ansible-to-manage-build-pool/
https://github.com/jenkins-zh/jenkins-cli

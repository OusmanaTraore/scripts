#!/bin/bash
echo installaion of Ansible
sudo apt update
echo "Configuration of sudo user >>"
echo "sysops ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sysops
echo " upgrade of ubuntu"
sudo apt upgrade -y
echo " rebooting the system"
sudo reboot
echo "Installation of dependencies and configure Ansible Repository"
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
echo "update the repository"
sudo apt update
sudo apt install -y ansible
echo " Check the version of ansible"
ansible --version
echo "Generate the ssh-key"
ssh-keygen -t ed25519 -N '' -f ~/.ssh/ansible
echo " adding host to the host file"
read -p " enter the node IP" node
sudo sed -i "$a$nodeIP $nodeName" /etc/hosts
read -p " enter the node hostname" nodeName
echo " copy the ssh-key to the node"
ssh-copy-id nodeName
echo "Creating ansible cfg and inventory file"
mkdir demo
echo " Copy the default ansible config  to demo folder"
cp /etc/ansible/ansible.cfg ~/demo/
echo " edit the ~/demo/ansible.cfg file (under the default section)"
cat << EOF >> ~/demo/ansible.cfg
inventory      = /home/sysops/demo/inventory
remote_user = sysops
host_key_checking = False
EOF
echo " edit the ~/demo/ansible.cfg file (under the privilege_escalation section)"
cat << EOF >> ~/demo/ansible.cfg
become=True
become_method=sudo
become_user=root
become_ask_pass=False
EOF
vi ~/demo/inventory
[dev]
node1.example.com

[prod]
node2.example.com
export ANSIBLE_CONFIG=/home/sysops/demo/ansible.cfg
echo "export ANSIBLE_CONFIG=/home/sysops/demo/ansible.cfg" >> ~/.profile
cd demo/
ansible --version
echo " Test the connexion to the node (be in demo folder)" 
ansible all -m ping

vi ~/demo/packages.yaml
$ vi packages.yaml
---
- name: Playbook to Install Packages
  hosts:
    - dev
    - prod
  tasks:
  - name: Install php and mariadb
    package:
      name:
        - php
        - mariadb-server
      state: present
echo " Run the playbook"
ansible-playbook packages.yaml
echo "Verify the result"
ansible dev -m shell -a 'dpkg -l | grep -E "php|mariadb"'
ansible prod -m shell -a 'rpm -qa | grep -E "php|mariadb"'

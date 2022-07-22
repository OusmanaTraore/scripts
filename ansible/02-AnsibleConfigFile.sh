#!/bin/bash
echo "|Creating ansible cfg and inventory file >>"
mkdir demo
echo "|Copy the default ansible config to demo folder >>"
sudo cp /etc/ansible/ansible.cfg ~/demo/
echo "|Edit the ~/demo/ansible.cfg file (under the default section) >>"
cat << EOF >> ~/demo/ansible.cfg
[default]
inventory = /home/sysops/demo/inventory
remote_user = sysops
host_key_checking = False
EOF
echo "|Edit the ~/demo/ansible.cfg file (under the privilege_escalation section) >>"
cat << EOF >> ~/demo/ansible.cfg
[privilege_escalation]
become=True
become_method=sudo
become_user=root
become_ask_pass=False
EOF
echo -n "|Edit the ~/demo/invantory file for dev and prod section e.g 
vi ~/demo/inventory
[dev]
node2.example.com
[prod]
node2.example.com
>>"
echo "|Export ansible config >>"
export ANSIBLE_CONFIG=/home/sysops/demo/ansible.cfg
echo "export ANSIBLE_CONFIG=/home/sysops/demo/ansible.cfg" >> ~/.profile
echo "|Checking ansible version >>"
cd demo/
ansible --version

echo "|Test the connexion to the node >>" 
ansible all -m ping

echo "|Creating packages file >>" 
cat << EOF >> packages.yaml
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
EOF

echo "|Running the playbook >>"
ansible-playbook packages.yaml

echo "|Verify the result >> "
ansible dev -m shell -a 'dpkg -l | grep -E "php|mariadb"'
ansible prod -m shell -a 'rpm -qa | grep -E "php|mariadb"'

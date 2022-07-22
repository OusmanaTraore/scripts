#!/bin/bash
echo "|Generate the ssh-key >>"
ssh-keygen -t ed25519 -N '' -f ~/.ssh/ansible
echo "|Eval ssh-agent >>"
eval "$(ssh-agent -s)"
echo "|Adding the ssh-key >>"
ssh-add ~/.ssh/ansible
sleep 1

echo "|Adding host to the host file >>"
read -p "|Enter the number of nodes e.g: 1 or 2 or 4... >> " node
i=1
for i in $node
do
  read -p "|Enter name of machine$node >>" nodeName
  read -p "|Enter IP of $nodeName >>" nodeIP
  echo "|Adding  $nodeName  to  /etc/hosts>> "
  sudo sed -i " 1i $nodeIP $nodeName" /etc/hosts
  cat /etc/hosts
  sleep 2
  echo "|Copy the ssh-key to the node >>"
  ssh-copy-id vagrant@$nodeIP
done

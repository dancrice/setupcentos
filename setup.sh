#!/bin/bash

an=`command -v ansible`

echo "Checking ansible"

if [ $? -eq 0 ]; then
  if [ -z $an ]; then
    sudo yum install -y ansible
  else
    echo ansible is in $an  
  fi
fi

echo "Doing Ansible! Please Waiting!"
sudo ansible-playbook /vagrant/playbook.yml -c local --inventory-file="localhost,"

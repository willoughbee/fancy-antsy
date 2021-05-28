#!/bin/bash
echo 'Do not forget to set the root password'
echo 'Do not forget to change the credentials in hosts.ini'
sleep 8

# Run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
systemctl restart ssh

# Deploy
echo 'Updating..'
bash scripts/update.sh
# Install ansible
echo 'Installing Ansible..'
bash scripts/install-ansible.sh
# Start SSH
echo 'Starting SSH..'
systemctl start ssh
# Start deploying
ansible-playbook deploy_kali.yml -i hosts.ini -e 'ansible_python_interpreter=/usr/bin/python3'

# Replace sshd_config with original
#if [[ $string2 == *"root"* ]]; then
#	if [[ $string1 == *"yes"* ]]; then
#  		echo "All set buddy buddy"
#	else
#		echo "Recovering "$sshd ".."
#		# Recover the old sshd_config file
#		mv $sshd.bk $sshd
#	fi
#fi


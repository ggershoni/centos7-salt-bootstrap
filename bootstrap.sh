#!/bin/bash

echo "Update the system:"
sudo yum update -y
echo "END: Update the system"

echo "Install EPEL repo"
sudo yum install -y epel-release
sudo yum update -y
echo "END: Install EPEL repo"

echo "Install SaltStack repo"
sudo yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
sudo yum clean expire-cache
sudo yum update -y
echo "END:Install SaltStack repo"

echo "Install SaltStack Minion (We are running masterless)"
sudo yum install -y salt-minion
echo "END: Install SaltStack Minion"

echo "Tell Salt to look for files locally"
if sudo grep --silent '^file_client: local' /etc/salt/minion; then
  echo "... /etc/salt/minion already up to date: ignoring"
else
  sudo sed -i '/^#file_client: remote$/a file_client: local' /etc/salt/minion
fi
echo "END: Tell Salt to look for files locally"

echo "Run Salt"
sudo salt-call --file-root=salt --local state.apply
echo "END: Run Salt"

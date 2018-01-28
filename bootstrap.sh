#!/bin/bash

echo "Update the system:"
sudo yum update -y
echo "END: Update the system"

echo "Install EPEL repo"
sudo yum install -y epel-release
sudo yum update -y
echo "END: Install EPEL repo"

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

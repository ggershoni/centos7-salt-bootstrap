#!/bin/bash

echo "Update the system:"
sudo yum update -y
echo "END: Update the system"

echo "Install EPEL repo"
sudo yum install -y epel-release
sudo yum update -y
echo "END: Install EPEL repo"

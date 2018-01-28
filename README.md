# centos7-salt-bootstrap
My bootstrap for getting salt installed and basic config for Centos 7 setup.

## Prereq
You must create a nonroot user with ability to sudo:

```
adduser <username>
# Set a password so user can sudo... we will be disabling password login later
passwd <username>
# Add user to wheel group so they can sudo
usermod -G wheel <username>
```

Now log in as user and setup ssh key login:
```
su - <username>
mkdir .ssh
chmod 700 .ssh
# Paste in .pub key into 
vi .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
```
Now log out of server and make sure you can ssh in without password:
```
ssh <username>@<server>
```

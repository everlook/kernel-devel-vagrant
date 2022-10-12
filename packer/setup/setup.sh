#!/bin/sh

set -ex

if [ ! -d "/home/vagrant" ]; then
  echo "No /home/vagrant folder, something probably went wrong with the preseed items script!"
  exit 1
fi

apt-get update && apt-get upgrade -y

# remove unused locales keeping just one
locale-gen --purge en_US

# Don't show sudo warning
touch /home/vagrant/.sudo_as_admin_successful

# add vagrant to sudoers, no password
echo 'vagrant ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Disable floppy to prevent meaningless errors in console
echo "blacklist floppy" >/etc/modprobe.d/blacklist-floppy.conf

# create base ssh configuration
install -d -o vagrant -g vagrant -m 700 /home/vagrant/.ssh
# add Vagrant insecure ssh key, this is used in vagrant up on first boot
wget --no-check-certificate \
  https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
  -O /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

apt-get install -y build-essential linux-headers-$(uname -r)

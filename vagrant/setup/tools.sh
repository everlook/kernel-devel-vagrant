#!/bin/bash

wget --no-check-certificate -c https://go.dev/dl/go1.17.13.linux-amd64.tar.gz -O - | tar -xz

chown -R vagrant:vagrant /home/vagrant/go

echo "export PATH=$PATH:/home/vagrant/go/bin" >> /home/vagrant/.profile

# kernel build packages
apt-get install -y \
    neovim \
    htop \
    git \
    build-essential \
    libncurses-dev \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    dh-make \
    bc \
    dwarves

# Kernel Development Packer Image

## Build Base Image

```sh
# virtualbox-iso
make build

# Set custom system disk size specified in megabytes. 
# By default the disk will be 15GB, ACCELERATOR is hvf for Mac
ACCELERATOR=kvm DISK_SIZE=20000 DEBUG=1 make build
```

* Import Vagrant box

```bash
$ vagrant box add custom/ubuntu-20.04.1 custom-ubuntu-20.04.1.1.box
```

## TODO

* Ubuntu 20.04 has move the subiquity for automated builds. There are currently issues with 
packer build with subiquity so this build uses a legacy Ubuntu ISO that supports the debian
installer

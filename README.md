vm-install-archetype
====================

# get it
    git clone https://github.com/mit-probabilistic-computing-project/vm-install-archetype
    sudo bash vm-install-archetype/install/install.sh
    source ~/.bashrc

# create a VM
    make full-vm

# import to virtualbox, boot and connect
    source ./settings.sh
    vm-import
    vm-boot
    vm-connect

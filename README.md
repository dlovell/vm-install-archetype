vm-install-archetype
====================

# get it
    git clone https://github.com/mit-probabilistic-computing-project/vm-install-archetype
    sudo bash vm-install-archetype/install/install.sh
    source ~/.bashrc

# define how to build your VM

To define how to build your VM, modify guest-script/{provision_dependencies,provision_project,test_project}.sh

Provisioning dependencies can be a time/network intensive process but fairly stable, so you may want to checkpoint that progress.  Similarly with provisioning the project.  For these reasons, building the VM happens in three stages: provisioning dependencies, provisioning the project, testing the project.  

The packer build process is used to provision project dependencies and upload the scripts to provision the project itself and test the project.  Project provisioning and testing uses only VM facilities.

# create a VM
    make tested-vm

# import to virtualbox, boot and connect
    source ./settings.sh
    vm-import
    vm-boot
    vm-connect

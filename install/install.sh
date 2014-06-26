sudo apt-get install -y virtualbox qemu-utils

# install packer on ubuntu
which_packer=$(which packer)
if [[ -z $which_packer ]]; then
	install_dir=~/packer
	which_zip=0.3.7_linux_amd64.zip
	#
	cd $(dirname $install_dir)
	wget https://dl.bintray.com/mitchellh/packer/$which_zip
	mkdir $install_dir
	cd $install_dir
	unzip ../$which_zip
	cat -- >> ~/.bashrc <<EOF
	export PATH=\$PATH:$install_dir
EOF
fi

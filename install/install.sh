packer_install_dir=~/packer
which_packer_zip=0.3.7_linux_amd64.zip


function install_virtualbox {
	sudo apt-get install -y virtualbox qemu-utils
}

function ensure_wget {
	if [[ -z $(which wget) ]]; then
		sudo apt-get install wget
	fi
}

function install_packer {
	# install packer on ubuntu
	which_packer=$(which packer)
	if [[ -z $which_packer ]]; then
		#
		cd $(dirname $packer_install_dir)
		wget https://dl.bintray.com/mitchellh/packer/$which_packer_zip
		mkdir $packer_install_dir
		cd $packer_install_dir
		unzip ../$which_packer_zip
		cat -- >> ~/.bashrc <<EOF
export PATH=\$PATH:$packer_install_dir
EOF
	fi
}


install_virtualbox
ensure_wget
install_packer

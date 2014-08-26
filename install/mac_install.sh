set -eu


virtualbox_dmg_filename=VirtualBox-4.3.0-89960-OSX.dmg
virtualbox_base_url=http://download.virtualbox.org/virtualbox/4.3.0/
#
packer_base_url=http://dl.bintray.com/mitchellh/packer/
which_packer_zip=0.3.7_darwin_amd64.zip
packer_install_dir=~/packer


function install_virtualbox {
	which_vboxmanage=$(which vboxmanage)
	if [[ -z $which_vboxmanage ]]; then
		cd
		curl -OL -C - $virtualbox_base_url/$virtualbox_dmg_filename
		hdiutil mount $virtualbox_dmg_filename
		sudo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target "/Volumes/Macintosh HD"
		hdiutil unmount /Volumes/VirtualBox
	fi
}


function install_packer {
	which_packer=$(which packer)
	if [[ -z $which_packer ]]; then
		cd $(dirname $packer_install_dir)
		curl -OL -C - $packer_base_url/$which_packer_zip
		mkdir $packer_install_dir
		cd $packer_install_dir
		unzip ../$which_packer_zip
		echo "
export PATH=\$PATH:$packer_install_dir
" >> ~/.bashrc
	fi
}


install_virtualbox
install_packer

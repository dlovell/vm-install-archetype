project_name=vm-install-archetype-virtualbox
osname=ubuntu-12.04.2-server
# preseed filename can't have dashes, '-', to be served up b packer
preseed_filename=config/${osname//-/_}_preseed.cfg
project_dir=$project_name
ovf_full_path="${project_dir}"/"${project_name}".ovf
port_number=2222
username=$(grep '^d-i passwd/username string' $preseed_filename | awk '{print $NF}')
rsa_key_filename=vm_guest_id_rsa
packer_config_filename=config/vbox_${osname}-amd64_packer_config.json


function vm-import {
	# must be NAT on VM creation
	# must specify not to change nat mac;
	#   else mac changes, eth0 doesn't come up and can't get back in via ssh
	vboxmanage import $ovf_full_path --options keepnatmacs
}

function vm-boot {
	type=$1 # gui|headless
	vboxmanage startvm "${project_name}" --type ${type:="headless"}
}

function vm-connect {
	ssh-keygen -f ~/.ssh/known_hosts -R [localhost]:$port_number
	ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost
}

function vm-showinfo {
	vboxmanage showvminfo "${project_name}"
}

function vm-poweroff {
	vboxmanage controlvm "${project_name}" poweroff
}

function vm-unregister-delete {
	# vm must be powered off
	vboxmanage unregistervm "${project_name}" --delete
}

function abort_on_error {
	if [[ $? -ne "0" ]]; then
		echo FAILED: $1
		exit 1
	fi
}

function require_file_exists {
	if [ ! -f $1 ]; then
		echo File doesn't exist: $1
		echo $2
		exit 1
	fi
}

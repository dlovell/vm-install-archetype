set -u
# settings.sh must already be sourced


function vm-import {
	# must be NAT on VM creation
	# must specify not to change nat mac;
	#   else mac changes, eth0 doesn't come up and can't get back in via ssh
	vboxmanage import $ovf_full_path --options keepnatmacs
	# forget ssh key in case there's a conflicting one
	ssh-keygen -f ~/.ssh/known_hosts -R [localhost]:$port_number
}

function vm-boot {
	set +u
	type=$1 # gui|headless
	vboxmanage startvm "${project_name}" --type ${type:="headless"}
	set -u
}

function vm-connect {
	set +u
	ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost $1
	set -u
}

function vm-showinfo {
	vboxmanage showvminfo "${project_name}"
}

function vm-poweroff {
	vboxmanage controlvm "${project_name}" poweroff
}

function vm-export {
	vboxmanage export "${project_name}" --output $1
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
	if [ ! -f $1 ] ; then
		echo "File doesn't exist: $1"
		echo $2
		exit 1
	fi
}

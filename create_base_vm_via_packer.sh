set -u
settings=$1
source $settings
source helpers.sh


options=$(
	echo \
	-var "userpass=$username" \
	-var "guestssh_port=$port_number" \
	-var "project_name=$project_name" \
	-var "keyfile_pub=${rsa_key_filename}.pub" \
	-var "guest_script_dir=${guest_script_dir}" \
	)

function make_rsa_keyfile {
	# creates $keyfile and $keyfile.pub
	rm $rsa_key_filename
	ssh-keygen -t rsa -P "" -f $rsa_key_filename
}

function packer_validate {
	packer validate $options $packer_config_filename
	abort_on_error "Failed to validate $packer_config_filename"
}

function packer_build {
	export PACKER_LOG=1 && packer build $options $packer_config_filename >out 2>err
	abort_on_error "Failed to build $packer_config_filename"
}


task="Packer build of VM"
echo `date`: Starting $task
make_rsa_keyfile
packer_validate
packer_build
echo `date`: Done $task

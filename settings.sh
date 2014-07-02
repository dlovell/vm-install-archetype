project_name=vm-install-archetype-virtualbox
# osname=ubuntu-12.04.2-server
osname=ubuntu-14.04-server
packer_config_filename=config/vbox_${osname}-amd64_packer_config.json
# preseed filename can't have dashes, '-', to be served up by packer
preseed_filename=config/${osname//-/_}_preseed.cfg
username=$(grep '^d-i passwd/username string' $preseed_filename | awk '{print $NF}')
#
project_dir=$project_name
ovf_full_path="${project_dir}"/"${project_name}".ovf
#
port_number=2222
rsa_key_filename=vm_guest_id_rsa

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

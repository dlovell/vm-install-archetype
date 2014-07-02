username=bayesdb
port_number=2222
project_name=vm-install-archetype-virtualbox
rsa_key_filename=vm_guest_id_rsa
#
# osname=ubuntu-12.04.2-server
osname=ubuntu-14.04-server-amd64
packer_config_filename=config/vbox_${osname}_packer_config.json
# preseed filename can't have dashes, '-', to be served up by packer
preseed_template=${osname//-/_}_preseed.cfg
project_dir=$project_name
ovf_full_path="${project_dir}"/"${project_name}".ovf
#

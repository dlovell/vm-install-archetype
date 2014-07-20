username=bigdata
port_number=2222
project_name=vm-install-archetype-virtualbox
rsa_key_filename=vm_guest_id_rsa
guest_script_dir=guest-script
#
# osname=ubuntu-12.04.2-server
osname=ubuntu-14.04-server-amd64
packer_config_filename=config/vbox_${osname}_packer_config.json
# preseed filename can't have dashes, '-', to be served up by packer
preseed_template=config/${osname}_preseed.cfg
output_dir=$project_name
ovf_full_path="${output_dir}"/"${project_name}".ovf
tgz_filename=${project_name}_$(date +%Y%m%d).tgz

# import settings
source ./settings.sh


# ensure key files exist
if [[ ! -f $packer_config_filename ]]; then
	echo "$0: packer_config_filename doesn't exist: $packer_config_filename"
	exit
fi


# build!
bash create_vm_via_packer.sh "$packer_config_filename"
if [[ $? -ne "0" ]]; then
	echo FAILED: bash create_vm_via_packer.sh $packer_config_filename
	exit
fi


# package up for uploading
bash create_tgz.sh $project_name

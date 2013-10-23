# import settings
source ./settings.sh


echo "Starting Packer build of VM"
echo `date`


# packer presumes paths in config are relative to working directory
# so cd to config filename location
config_abs_path=$(readlink -f "$packer_config_filename")
config_abs_dir=$(dirname $config_abs_path)
cd $config_abs_dir


# creates $keyfile and $keyfile.pub
rm $rsa_key_filename
ssh-keygen -t rsa -P "" -f $rsa_key_filename


# validate
packer validate $packer_config_filename
if [[ $? -ne 0 ]]; then
	echo "Failed to validate $packer_config_filename"
	exit 1
fi


# build
export PACKER_LOG=1 && packer build $packer_config_filename >out 2>err
if [[ $? -ne 0 ]]; then
	echo "Failed to build $packer_config_filename"
	exit 1
fi


echo "Done Packer build of VM"
echo `date`

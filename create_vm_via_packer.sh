# import settings
source ./settings.sh


echo "Starting Packer build of VM"
echo `date`


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

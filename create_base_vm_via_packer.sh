# import settings
source ./settings.sh


echo "Starting Packer build of VM"
echo `date`


# creates $keyfile and $keyfile.pub
rm $rsa_key_filename
ssh-keygen -t rsa -P "" -f $rsa_key_filename


# validate
packer validate $packer_config_filename
abort_on_error "Failed to validate $packer_config_filename"

# build
export PACKER_LOG=1 && packer build $packer_config_filename >out 2>err
abort_on_error "Failed to build $packer_config_filename"


echo "Done Packer build of VM"
echo `date`

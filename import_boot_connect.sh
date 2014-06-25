# import settings
source ./settings.sh


# parse input arguments
if [[ ! -z $1 ]]; then
	project_name=$1
fi
if [[ ! -z $2 ]]; then
	project_dir=$2
fi
if [[ ! -z $3 ]]; then
	port_number=$3
fi
if [[ ! -z $4 ]]; then
	username=$4
fi


# ensure key files exist
if [[ ! -f $ovf_full_path ]]; then
	echo "import_boot_connect.sh: ovf file doesn't exist: $ovf_full_path"
	exit
fi
if [[ ! -f $rsa_key_filename ]]; then
	echo "import_boot_connect.sh: rsa key file doesn't exist: $rsa_key_filename"
	exit
fi


vm-import
vm-boot
vm-connect

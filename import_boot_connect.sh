# import settings
source ./settings.sh


# ensure key files exist
require_file_exists $ovf_full_path "import_boot_connect.sh: ovf file doesn't exist"
require_file_exists $rsa_key_filename "import_boot_connect.sh: rsa key file doesn't exist"


vm-import
vm-boot
vm-connect

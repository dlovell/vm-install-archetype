set -e
source settings.sh


function provision_project {
	vm-connect "echo $pass | sudo -S bash provision_project.sh"
}

function import_boot {
	vm-import
	vm-boot
}

function poweroff_export_unregister_delete {
	vm-poweroff
	# must delete files first; not allowed to clobber
	rm $ovf_full_path
	rm ${ovf_full_path%.ovf}-disk*vmdk
	vm-export $ovf_full_path
	vm-unregister-delete
}


import_boot
provision_project
poweroff_export_unregister_delete

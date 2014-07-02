set -e
set -u
source $1
source helpers.sh


function provision_project {
	vm-connect "echo $username | sudo -S bash provision_project.sh"
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


task="provisioning of project in guest"
echo `date`: Starting $task
import_boot
provision_project
poweroff_export_unregister_delete
echo `date`: Done $task

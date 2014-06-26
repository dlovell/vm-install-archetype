set -e
source settings.sh


function test_project {
	vm-connect bash test_project.sh
}

function import_boot {
	vm-import
	vm-boot
}

function poweroff_unregister_delete {
	vm-poweroff
	vm-unregister-delete
}


import_boot
test_project
abort_on_error "execution of guest-script/test_project.sh in guest failed"
poweroff_unregister_delete

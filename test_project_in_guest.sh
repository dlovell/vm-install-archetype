set -e
set -u
source $1
source helpers.sh


function test_project {
	vm-connect "bash test_project.sh"
	abort_on_error "execution of guest-script/test_project.sh in guest failed"
}

function import_boot {
	vm-import
	vm-boot
}

function poweroff_unregister_delete {
	vm-poweroff
	sleep 3
	vm-unregister-delete
}


task="testing of project in guest"
echo `date`: Starting $task
import_boot
test_project
poweroff_unregister_delete
echo `date`: Done $task

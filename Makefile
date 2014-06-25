vm:
	time bash create_vm_via_packer.sh

tgz: vm
	time bash create_tgz.sh

OVF_FULL_PATH := $(shell bash -c 'source settings.sh && echo $$ovf_full_path')
PROJECT_DIR := $(shell bash -c 'source settings.sh && echo $$project_dir')
PROVISIONED := $(PROJECT_DIR)/provisioned


all: tgz

$(OVF_FULL_PATH):
	time bash create_base_vm_via_packer.sh

$(PROVISIONED):
	time bash provision_project_in_guest.sh
	touch $(PROVISIONED)

base-vm: $(OVF_FULL_PATH)

full-vm: $(PROVISIONED)

tgz: full-vm
	time bash create_tgz.sh


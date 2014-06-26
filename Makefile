OVF_FULL_PATH := $(shell bash -c 'source settings.sh && echo $$ovf_full_path')
PROJECT_DIR := $(shell bash -c 'source settings.sh && echo $$project_dir')
PROVISIONED := $(PROJECT_DIR)/provisioned
TESTED := $(PROJECT_DIR)/tested


all: tgz

base-vm: $(OVF_FULL_PATH)

full-vm: $(PROVISIONED)

tested-vm: $(TESTED)

tgz: $(TESTED)
	time bash create_tgz.sh

$(TESTED): $(PROVISIONED)
	time bash test_project_in_guest.sh
	touch $(TESTED)

$(PROVISIONED): $(OVF_FULL_PATH)
	time bash provision_project_in_guest.sh
	touch $(PROVISIONED)

$(OVF_FULL_PATH):
	time bash create_base_vm_via_packer.sh

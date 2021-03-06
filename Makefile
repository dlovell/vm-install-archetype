SETTINGS_DIR := .
SETTINGS_FILENAME := $(SETTINGS_DIR)/settings.sh
#
OVF_FULL_PATH := $(shell bash -c 'set -u && source $(SETTINGS_FILENAME) && echo $$ovf_full_path')
OUTPUT_DIR := $(shell bash -c 'set -u && source $(SETTINGS_FILENAME) && echo $$output_dir')
USERNAME := $(shell bash -c 'set -u && source $(SETTINGS_FILENAME) && echo $$username')
PRESEED_TEMPLATE := $(shell bash -c 'set -u && source $(SETTINGS_FILENAME) && echo $$preseed_template')
TGZ := $(shell bash -c 'set -u && source $(SETTINGS_FILENAME) && echo $$tgz_filename')
#
PROVISIONED := $(OUTPUT_DIR)/provisioned
TESTED := $(OUTPUT_DIR)/tested


all: tgz

base-vm: $(OVF_FULL_PATH)

full-vm: $(PROVISIONED)

tested-vm: $(TESTED)

tgz: $(TGZ)

$(TGZ): $(TESTED)
	time bash create_tgz.sh $(SETTINGS_FILENAME)

$(TESTED): $(PROVISIONED)
	time bash test_project_in_guest.sh $(SETTINGS_FILENAME)
	touch $(TESTED)

$(PROVISIONED): $(OVF_FULL_PATH)
	time bash provision_project_in_guest.sh $(SETTINGS_FILENAME)
	touch $(PROVISIONED)

$(OVF_FULL_PATH):
	perl -pe 's/USERPASS/$(USERNAME)/g' $(PRESEED_TEMPLATE) > config/preseed.cfg
	time bash create_base_vm_via_packer.sh $(SETTINGS_FILENAME)

set -e
source ./settings.sh


tgz_name=${project_name}_$(date +%Y%m%d).tgz


cd $project_dir
cp ../$rsa_key_filename .
cp ../VM_README.md .
tar cvfz ../$tgz_name *

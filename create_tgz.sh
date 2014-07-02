set -u
set -e
source $1


tgz_name=${project_name}_$(date +%Y%m%d).tgz


task="creation of VM tgz"
echo `date`: Starting $task
cd $project_dir
cp ../$rsa_key_filename .
cp ../VM_README.md .
tar cvfz ../$tgz_name *
echo `date`: Done $task

set -u
set -e
source $1


task="creation of VM tgz"
echo `date`: Starting $task
cp VM_README.md $rsa_key_filename $output_dir
tar cvfz $tgz_filename $output_dir
echo `date`: Done $task

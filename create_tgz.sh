set -u
set -e
source $1


task="creation of VM tgz"
echo `date`: Starting $task
cp VM_README.md $rsa_key_filename $output_dir
tar cvfz $tgz_filename -C ${output_dir} $(find ${output_dir} -type f)
echo `date`: Done $task

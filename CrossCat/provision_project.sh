set -e


repo_base_url=https://github.com/mit-probabilistic-computing-project/crosscat
project_name=~/$(basename $repo_base_url)


git clone $repo_base_url $project_name
cd $project_name
python setup.py install
python setup.py build_ext --inplace
if [[ ! -z $SUDO_USER ]]; then
	chown -R $SUDO_USER:$SUDO_USER $project_name
	sleep 4 # else chown doesn't seem to take
fi

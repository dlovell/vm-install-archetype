set -eu


repo_base_url=https://github.com/mit-probabilistic-computing-project/crosscat
project_dir=~/$(basename $repo_base_url)


function get_crosscat {
	git clone $repo_base_url $project_dir
}

function make_crosscat {
	cd $project_dir
	python setup.py install
	python setup.py build_ext --inplace
}

function chown_crosscat {
	if [[ ! -z $SUDO_USER ]]; then
		chown -R $SUDO_USER:$SUDO_USER $project_dir
		sleep 4 # else chown doesn't seem to take
	fi
}


get_crosscat
make_crosscat
chown_crosscat

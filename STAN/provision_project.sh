set -eu


gz_url=https://github.com/stan-dev/stan/archive/v2.3.0.tar.gz
gz_filename=$(basename $gz_url)
extracted_dirname=${gz_filename%.tar.gz}
extracted_dirname="stan-${extracted_dirname#v}"


function get_stan {
	if [ ! -f $gz_filename ] ; then
		wget $gz_url;
	fi
}

function make_stan {
	tar xvfz $gz_filename
	cd $extracted_dirname
	make bin/libstan.a
	make -j2 bin/stanc
	make bin/print
}

function chown_stan {
	if [[ ! -z $SUDO_USER ]]; then
		chown -R $SUDO_USER:$SUDO_USER ~/$extracted_dirname
		sleep 4 # else chown doesn't seem to take
	fi
}


get_stan
make_stan
chown_stan

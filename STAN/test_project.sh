set -eu


gz_url=https://github.com/stan-dev/stan/archive/v2.3.0.tar.gz
gz_filename=$(basename $gz_url)
extracted_dirname=${gz_filename%.tar.gz}
extracted_dirname="stan-${extracted_dirname#v}"


function test_model {
	which_dir=$1
	which_model=$2
	cd ~/$extracted_dirname
	make $which_dir/$which_model
	cd $which_dir
	./$which_model sample data file=${which_model}.data.R
}


test_model src/models/basic_estimators bernoulli
test_model src/models/misc/cluster/lda lda

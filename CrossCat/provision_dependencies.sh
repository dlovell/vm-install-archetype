set -e
set -u


repo_base_url=https://github.com/mit-probabilistic-computing-project/crosscat
branch_name=install_cleanup
raw_url=${repo_base_url}/raw/${branch_name}


apt-get install -y wget git
wget ${raw_url}/scripts/install_scripts/install.sh
wget ${raw_url}/requirements.txt
bash install.sh
pip install -r requirements.txt

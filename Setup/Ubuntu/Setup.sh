#! /bin/bash

# Usage
# In order to install new conda environment uses command: Setup.sh --install env.yml
# In order to install update conda enviroment uses command: Setup.sh --update env.yml
# In order to activate new conda environment uses command: Setup.sh --activate env.yml

# _args1: --install or --update or --activate
_args1=$1

# _args2 is the location to yml file
_args2=$2

_miniconda_dir=$PWD/Miniconda3
read -r a < $_args2

if [ "$_args1" = "--install" ]; then
    if [ -d $_miniconda_dir ]; then
    	rm -rf $_miniconda_dir
    fi
    mkdir $_miniconda_dir
    echo "Please waiting for installation ..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
    bash miniconda.sh -b -u -p $_miniconda_dir
    rm miniconda.sh
    source $_miniconda_dir/etc/profile.d/conda.sh
    conda init
    conda activate
    conda env create --file $_args2
elif [ "$_args1" = "--update" ]; then
    echo "Please waiting for updating ..."
elif [ "$_args1" = "--activate" ]; then
    echo "Please waiting for activation ..."
    source $_miniconda_dir/etc/profile.d/conda.sh
    env_name=(${a// / })
    echo "Miniconda is activated in location $_miniconda_dir"
    conda activate "${env_name[1]}"
fi


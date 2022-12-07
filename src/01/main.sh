#!/bin/bash
. ./moni.sh
. ./check.sh

export path=${1} #первый параметр
export num_folders=${2}
export al_list_folders=${3}
export num_files=${4}
export al_list_files=${5}
export size=${6}

ft_main
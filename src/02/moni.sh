#!/bin/bash

function ft_main {
    touch log.txt
    time_start=$(date +'%s') #$(date +'%s%N')
    #echo ${time_start}
    count_dirs =$(echo $(( 1 + $RANDOM % 100 )))
    #make_dir
    if [[ ${#al_list_folders} -lt 4 ]] #less
	then
	make_name_dir_less_four
	#make_files
	else
	make_name_dir_more_four
	#make_files
	fi
	name_dir=""
    #total_time
    stop_script
}

function make_dir {
    count_dirs_in_curr_dir=$(echo $(ls -d */ 2>/dev/null | wc -l )) #удалила -l # -d количество дир в дир
    if [[ $count_dirs_in_curr_dir -ne 0 ]]
    rand_num_dir=$(echo $(( $RANDOM % $count_dirs_in_curr_dir )))
    else
    rand_num_dir=0
    fi

    if [[]] #делаем имя директории
}

function make_name_dir_less_four {
	count=${#al_list_folders} #количество
	for ((i=0; i<5-count; i++)) #если их меньше 4-х
	do
	name_dir+="$(echo ${al_list_folders:0:1})"
	done
	name_dir+="$(echo ${al_list_folders:1:${#al_list_folders}})" #добавляем конец букв
	name_dir+=${number}
	name_dir+="_"
	name_dir+=$(date +"%d%m%y")
	mkdir ${name_dir}
	echo [$(date +'%e.%m.%Y')] $path"/"$name_dir >> log.txt

}

function make_name_dir_more_four {
	name_dir+=${al_list_folders}
	name_dir+=${number}
	name_dir+="_"
	name_dir+=$(date +"%d%m%y")
	mkdir ${name_dir}
	echo [$(date +'%e.%m.%Y')] $path"/"$name_dir >> log.txt
}

function stop_script {
    time_end=$(date +'%s') #$(date +'%s%N')
    echo ${time_end}
    res=$((($time_end - $time_start ) / 100000000 ))
    echo ${res}
    echo "Script execution time (in seconds) = $(( $res / 10 )).$(( $res % 10 ))" >> log.txt
    echo "Script execution time (in seconds) = $(( $res / 10 )).$(( $res % 10 ))"
}
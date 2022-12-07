#!/bin/bash

function ft_main {
	touch log.txt
	for (( number=0; number < $num_folders; number++ ))
	do
	echo ${number}
	if [[ ${#al_list_folders} -lt 4 ]] #less
	then
	make_name_dir_less_four
	make_files
	else
	make_name_dir_more_four
	make_files
	fi
	name_dir=""
	done
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
	#echo ${name_dir} # удалить
	mkdir ${name_dir}
	echo [$(date +'%e.%m.%Y')] $path"/"$name_dir >> log.txt

}

function make_name_dir_more_four {
	name_dir+=${al_list_folders}
	name_dir+=${number}
	name_dir+="_"
	name_dir+=$(date +"%d%m%y")
	#echo ${name_dir}
	mkdir ${name_dir}
	echo [$(date +'%e.%m.%Y')] $path"/"$name_dir >> log.txt
}

function make_files {
	file_name_begin="$(echo $letters_files | awk -F "." '{print $1}')"
	file_name_end="$(echo $letters_files | awk -F "." '{print $2}')"
	for ((count = 0; count < $num_files; count++))
	do
	if [[ ${#file_name_start} -lt 4 ]]
	then
	create_files_less_four
	echo $path"/"$name_dir"/"$file_name --- $(date +'%e.%m.%Y') --- $size "Kb" >> log.txt
	else
	create_files_more_four
	echo $path"/"$name_dir"/"$file_name --- $(date +'%e.%m.%Y') --- $size "Kb" >> log.txt
	fi
	done
}

function create_files_less_four {
    count=${#file_name_begin}
    for (( i=0; i<5-count; i++ ))
    do
        name_file+="$(echo ${file_name_start:0:1})"
    done
    name_file+="$(echo ${file_name_start:1:${#file_name_start}})"
    name_file+=$num_files
    name_file+="_"
    name_file+=$(date +"%d%m%y")
    name_file+="."
    name_file+=$file_name_end
    #fallocate -l $size "KB" ./$name_dir/$name_file # -l lenth fallocate -l 10MB my_big_file
    if [[ $(df / -BM | grep "/" | awk -F"M" '{ print $3 }') -le 1024 ]]
    then
        exit 1
    fi
}

function create_files_more_four {
    name_file+="$(echo ${file_name_begin:0:${#file_name_start}})"
    name_file+=$num_files
    name_file+="_"
    name_file+=$(date +"%d%m%y")
    name_file+="."
    name_file+=$file_name_end
    #fallocate -l $size "KB" ./$name_dir/$name_file # -l lenth fallocate -l 10MB my_big_file
	#проверить на вм
    if [[ $(df / -BM | grep "/" | awk -F"M" '{ print $3 }') -le 1024 ]]
    then
        exit 1
    fi
}
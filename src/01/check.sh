#!/bin/bash

function check {
    last=$(echo "${path}" | tail -c 2)
    if [[ $last == "/" ]] || ! [[ -d $path ]]
    then
        echo "wrong path"
        exit 1
    fi

    if [[ $count_argv -ne 6 ]]
    then
        echo "invalid number of arguments"
        exit 1
    fi

    count='^[1-9][0-9]+?$'
    if ! [[ $num_folders =~ $count ]]
    then
	echo "a non-numeric value has been entered for folders"
	exit 1
    fi

    name='^[a-zA-Z]{1,7}$'
    if ! [[ $al_list_folders =~ $name ]]
    then
        echo "incorrect name for folders"
        exit 1
    fi

    count='^[1-9][0-9]+?$'
    if ! [[ $num_files =~ $count ]]
    then
        echo "a non-numeric value has been entered for files"
        exit 1
    fi

    name='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
    if ! [[ $al_list_files =~ $name ]]
    then
        echo "incorrect name for files"
        exit 1
    fi

    num='^[1-9][0-9]?[0]?kb$'
    if ! [[ $size =~ $num ]]
    then
        echo "incorrect size"
        exit 1
    else
        size=$(echo $size | awk -F"kb" '{print $1}')
	echo $size
    fi
}

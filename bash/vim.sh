#!/bin/bash

# search for a file and open it with vim
function vimfind() {
    if [ "$1" == "-s" ]
    then
        # prompt user to select the file
        shift
        select file in $(find ./* -type f -name "$@"); do
            vim $file
            break;
        done;
    else
        # open all files
        local files=$(find ./* -type f -name "$@");
        echo $files
        if [ -n "$files" ]
            then vim $files
            else echo "No such file found."
        fi;
    fi
}


#!/bin/bash

#
# cdextras.sh - contains functions to optimize traversals
#               of the directory tree.
#
# Author: Michael Schmitz <schmmd@cs.washington.edu>
# Original Author of up and down: Steve Rowe <steve_rowe@users.sourceforge.net>

#
# up() - takes one numeric argument and performs "cd .." the specified number
#        of times
#
#
function up ()
{
    local dir="`pwd`"
    if [ $# -eq 0 ]
    then
        # if no argument is specified, go up one level
        local levels="1"
    else
        local levels="$1"
    fi

    for i in `seq 1 $levels`;
    do
        if [ "$dir" == "/" ]; then break; fi
        dir=`dirname $dir`
    done

    cd "$dir"
}

#
# down() - Displays a list of numbered child directories - selecting one will
#          change the current directory to it.  The process is then repeated.
#          Hit Ctrl-C to exit the menu.
#
function down () 
{ 
    while [ 1 ]; do 
        if [ $(find -maxdepth 1 -type d | wc -l) -eq "1" ]
        then
            break
        fi
        select dir in */; do
            cd "$dir"; 
            break;
        done; 
    done; 
}

function autodown ()
{
    while [ $(find -maxdepth 1 -type d -name "[^.]*" | wc -l) -eq "1" ]; do
        cd $(find -maxdepth 1 -type d -name "[^.]*")
    done
}

function autoup ()
{
    cd ..
    while [ $(find -maxdepth 1 -type d -name "[^.]*" | wc -l) -eq "1" ]; do
        cd ..
    done
}

# cd down to the directory that contains the specified file
# -s allows you to choose the matching result, otherwise the first is used.
function downto() { 
    function jump() {
        if [ -z $1 ]; then
            echo "No such file found"
        elif [ -d $1 ]; then
            cd $1;
        else
            cd $(dirname $1);
        fi
    }

    if [ "$1" == "-s" ]
    then
        # prompt user to select the file
        shift
        select file in $(find ./* -name "$@"); do
            jump $file
            break;
        done;
    else
        # choose first file
        local file=$(find ./* -name "$@" | head -1);
        jump $file
    fi
}

# cd up to the directory specified
function upto () { 
    # dirname is required so we can cd up 
    # to another directory of the same name
    local dir=$(dirname $(pwd))
    dir="${dir%$1*}$1/"

    if [ -d $dir ]; then
        # cut $1 and everything following out of 
        # the string and then paste $1 back
        cd "$dir"
    else
        echo "$1 not found."
    fi
}

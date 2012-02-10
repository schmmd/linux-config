#!/bin/bash

# count the number of tab-separated columns in a file.
function colcount {
    head -1 | awk -F\\t '{print NF}'
}

# commands that help make using tabs easier
function tuniqc {
    uniq -c | sed 's/^\s*\([0-9][0-9]*\)\s*\(.*\)$/\1\t\2/g'
}

function tgroup {
    sort | uniq -c | sed 's/^\s*\([0-9][0-9]*\)\s*\(.*\)$/\2\t\1/g'
}

alias tawk='awk -F\\t'

alias tsort='sort -t"$TAB"'


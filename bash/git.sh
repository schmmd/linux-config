#!/bin/bash

alias git-rm-merged='git branch --merged | grep -v \* | xargs git branch -D'

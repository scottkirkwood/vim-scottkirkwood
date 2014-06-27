#!/bin/bash
# Pulls latest from all plugins.

set -e # Fail on error
for d in ../*
do
  if [ -d $d ]
  then
    dirname="${d##.*/}"
    echo "$dirname"
    cd $d
    echo "git remote show origin"
    git remote show origin
  fi
done

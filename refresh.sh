#!/bin/bash
# Pulls latest from all plugins.
# Updates plugins.txt

plugins_txt="$(pwd -P)/plugins.txt"
echo 'Plugins Scott uses' > $plugins_txt
set -e # Fail on error
for d in ../*
do
  if [ -d $d ]
  then
    dirname="${d##.*/}"
    echo "$dirname"
    cd $d
    echo "$dirname: $(git remote -v | grep fetch | cut -f2 | cut -d' ' -f1)" >> $plugins_txt
    echo "git pull"
    git pull
  fi
done

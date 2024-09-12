#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: gitcd <repo-url>"
    exit 1
fi

repo_url=$1
repo_name=$(basename "$repo_url" .git)

# set up the download directory for special repo names
sh_dir=~/home/arx/Playspace/Code/sh

if [[ "$repo_name" == *".sh"* ]]; then
    cd "$sh_dir" || { echo "Failed to change directory to $sh_dir"; exit 1; }
else
    cd "$(pwd)" || { echo "Failed to change to the current directory"; exit 1; }
fi

git clone "$repo_url" || { echo "Failed to clone repository"; exit 1; }

cd "$repo_name" || { echo "Failed to change directory"; exit 1; }

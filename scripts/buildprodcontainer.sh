#!/bin/bash

# Get repository root path if exists, else run in current folder.
GITROOT=$(git rev-parse --show-toplevel)

if [ -d $GITROOT ]; then
   cd $GITROOT
fi

docker build -t toolsday:al9.2026.09.22 -f dockerfiles/DOCKERFILE-prod .

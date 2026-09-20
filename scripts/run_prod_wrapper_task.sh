#!/bin/bash

# This script mounts the `share` folder in the git repo as /opt/share in the
# container and takes as input the task to run inside the container.
# it can be a script or an invocation of the python command

# Get repository root path if exists, else run in current folder.
GITROOT=$(git rev-parse --show-toplevel)

docker run --rm --mount type=bind,source="$GITROOT"/share,target=/opt/share toolsday:al9.2026.09.22 /opt/share/scripts/workflow.sh

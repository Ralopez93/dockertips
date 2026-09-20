#!/bin/bash

# This script mounts the `share` folder in the git repo as /opt/share in the
# container and takes as input the task to run inside the container, but passed
# via pipe. This means the workflow.sh script can exist outside the container
# and there is no need to mount its folder.

# The mount here is due to the fact that the numpytest.sh script is in the mounted folder

# Get repository root path if exists, else run in current folder.
GITROOT=$(git rev-parse --show-toplevel)

docker run --rm -i --mount type=bind,source="$GITROOT"/share,target=/opt/share toolsday:al9.2026.09.22 bash < "$GITROOT/share/scripts/workflow.sh"

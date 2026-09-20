#!/bin/bash

# This script mounts the `share` folder in the git repo as /opt/share in the
# container and takes as input the task to run inside the container, but passed
# via pipe. This means the workflow_noshare.sh script can exist outside the container
# and there is no need to mount its folder.
# The python code launched must, however, exist in the production container.

# Get repository root path if exists, else run in current folder.
GITROOT=$(git rev-parse --show-toplevel)

docker run --rm -i toolsday:al9.2026.09.22 bash < "$GITROOT/share/scripts/workflow_noshare.sh"

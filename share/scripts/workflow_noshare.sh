#!/bin/bash

# This script expects the python code numpy1test.py and numpy2test.py to be already copied inside the container
# It is meant to showcase a workflow passed by pipe to the container i.e. 
# docker run --rm -i <imagename> bash < workflow_noshare.sh

APPDIR1=$TOOLSDAY_APPSDIR/myenvpy2.7/
APPDIR2=$TOOLSDAY_APPSDIR/myenvpy3.14/

source $APPDIR1/bin/activate

cowsay "$(python --version; cowsay --version; python $APPDIR1/numpy1test.py)"

deactivate


source $APPDIR2/bin/activate

cowsay -c dragon -t "$(python --version; cowsay --version; python $APPDIR2/numpy2test.py)"

deactivate

#!/bin/bash

source /opt/apps/myenvpy2.7/bin/activate

cowsay "$(python --version; cowsay --version; python $TOOLSDAY_SHAREDIR/src/numpytest.py)"

deactivate

source /opt/apps/myenvpy3.14/bin/activate

cowsay -c dragon -t "$(python --version; cowsay --version; python $TOOLSDAY_SHAREDIR/src/numpytest.py)"

deactivate

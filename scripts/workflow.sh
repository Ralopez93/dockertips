#!/bin/bash

source /opt/apps/luma/bin/activate

cowsay "$(python --version; cowsay --version; python /opt/build/src/numpytest.py)"

deactivate

source /opt/apps/myapppy3.14/bin/activate

cowsay -c dragon -t "$(python --version; cowsay --version; python /opt/build/src/numpytest.py)"

deactivate

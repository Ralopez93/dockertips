#!/bin/bash

pyenv global 2.7.18

pip install virtualenv

python -m virtualenv $TOOLSDAY_APPSDIR/myenvpy2.7

source $TOOLSDAY_APPSDIR/myenvpy2.7/bin/activate

pip install numpy
pip install cowsay==3.0.0

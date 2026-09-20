#!/bin/bash

pyenv global 3.14.7

python -m venv $TOOLSDAY_APPSDIR/myenvpy3.14

source $TOOLSDAY_APPSDIR/myenvpy3.14/bin/activate

pip install numpy
pip install cowsay

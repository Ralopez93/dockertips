# Docker Tips'n'Tricks

Demo material for a docker seminar on containers for scientific development.  
Developed for ToolsDay 2026-09-22 at Particle and Nuclear Physics, Lund

# Purpose

The purpose of this repo is to showcase how one can build scientific computing
environments using docker.

This repo suggests the creation of two containers:

  - A *development* container, based on `DOCKERFILE-dev`, where development can be carried  
    on, that contains all the required libraries for a certain project, and that can  
    produce a certain build of a software;
  - A *production* container, based on `DOCKERFILE-prod`, which is a version of the
    dev container without libraries required to build but that contains the applications
    built with the dev container, that can be used for massive computation campaigns

A DOCKERFILE.template is provided to be reused to generate development environments
with libraries and tools and production environments for running in e.g. a HPC center.

The current repository shows an example of building a container with two
different versions of python using `pyenv`[1] . The aim is to create a single 
container with environment for complicated computing workflows that require 
different versions of libraries and compilers.

The directory structure is as follows:

```shell
.
├── README.md  # this document
├── dockerbuild-opt-dev/  # files to be copied inside the dev container during build
├── dockerbuild-opt-prod/ # files to be copied inside the prod container during build 
├── dockerfiles/ # dockerfiles for various use cases
├── scripts/ # Example scripts to launch the dockerbuild and the launch the generated container
├── share/ # folder to be mounted inside the container while working in it
```

# Demo files

The demo dockerfiles and the `dockerbuild-opt-*` folders contain an example of 
how to build a container that uses the product `pyenv` and Python `virtualenv` and `venv`
to create a container with two applications with two versions of Python.

Each virtual env contains an installation of different versions of numpy and cowsay.

The purpose is to demonstrate a workflow that switches environment between the two applications
within a single container.

The script `share/src/numpytest.py` is a test application that checks the type
of certain numpy operations according to <https://numpy.org/devdocs/numpy_2_0_migration_guide.html#changes-to-numpy-data-type-promotion>

## How to use the demo files

### Building the development container

The dev container is used to develop a certain software. 

  1. Execute the script `scripts/builddevcontainer.sh`
  2. Start a dev container with `docker run -it toolsday:al9-dev.2026.09.22 bash`
  3. Test installing and switching python versions using `pyenv`:  
     `pyenv install -l`
     `pyenv install <pythonversion>`
     `pyenv global <pythonversion>`
     `python --version`

### Building the production container

The production container is a slim version of the dev container without the 
library headers or source files used to build applications. 

  1. Execute the script `scripts/buildprodcontainer.sh`
  2. Start the default example workflow with one of the scripts:
     `run_prod_wrapper_task_by_pipe.sh`
     `run_prod_wrapper_task.sh`
  3. Create your own workflow or execute a python script using:
     `run_prod_wrapper.sh`

The commands in the `run*` scripts are meant to showcase command line calls to start the container and run a job inside.

## How to use the template

The template located in `dockerfiles/DOCKERFILE.template` can be used as a starting point to generate
other containers following the suggestions in this repository.

  1. Copy the the template file for your project:  
     `cp dockerfiles/DOCKERFILE.template dockerfiles/DOCKERFILE-myproject-dev`
  2. Build a container based on that dockerfile template:  
     ```shell
     cd <git repo root>
     docker build -t <myproject:al9-dev.version> -f dockerfiles/DOCKERFILE-myproject-dev .
     ```
  3. Start a docker container and execute the commands needed to initialize the application,
     taking notes of what is needed. Edit the `dockerfiles/DOCKERFILE-myproject-dev` accordingly.
  4. Iterate 1-3 until the resulting build container suits your needs
  5. Use the container for development by mounting the share folder at start:
     `docker run -it -v $(pwd)/share:/opt/share <myproject:al9-dev.version> bash`
  6. Code inside the /opt/share folder so that the result exists also outside the container

# References

[1] pyenv <https://github.com/pyenv/pyenv>
[2] Numpy <https://numpy.org/>
[3] Docker Engine documentation <https://docs.docker.com/engine/>



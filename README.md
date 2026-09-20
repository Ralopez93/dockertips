# Docker Tips'n'Tricks

Demo material for a docker seminar on containers for scientific development.  
Developed for ToolsDay 2026-09-22 at Particle and Nuclear Physics, Lund

# Purpose

The purpose of this repo is to showcase how one can build scientific computing
environments using docker.

The provided content can be reused to generate development environment with libraries and tools
and production environments for running in an HPC center.

The current repository shows an example of building a container with two
different versions of python using pyenv. The aim is to create a single 
container with environment for complicated computing workflows that require 
different versions of libraries and compilers.

The directory structure is as follows:

.
├── dockerbuild-opt-dev  # files to be copied inside the dev container during build
├── dockerbuild-opt-prod # files to be copied inside the prod container during build 
├── dockerfiles # dockerfiles for various use cases
├── README.md  # this document
├── scripts # Example scripts to launch the dockerbuild and the launch the generated container
├── share # folder to be mounted inside the container while working in it


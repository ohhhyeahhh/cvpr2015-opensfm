#!/bin/bash

VM_USER=$1
WORK_DIR=/home/$VM_USER/SfM
SOFTWARE_DIR=$WORK_DIR/Software

# Create the Software Directory
mkdir -p $SOFTWARE_DIR


# Checkout and build MAP-Tk
cd $SOFTWARE_DIR
git clone -b v0.5.0 https://github.com/Kitware/maptk.git maptk/src
mkdir maptk/bld
cd maptk/bld
cmake $SOFTWARE_DIR/maptk/src -DMAPTK_ENABLE_PROJ:BOOL=ON
make -j2

# Download and build Ceres Solver
cd $SOFTWARE_DIR
mkdir -p ceres/bld
cd ceres
wget http://ceres-solver.org/ceres-solver-1.10.0.tar.gz
tar zxf ceres-solver-1.10.0.tar.gz
cd bld
cmake ../ceres-solver-1.10.0
make -j2
make test

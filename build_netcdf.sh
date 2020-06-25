# ==================================================================
#  NetCDF Installation
# ==================================================================

#!/bin/bash

#set -x # debugging

if [ ! -e "$HOME/netcdf/lib/libnetcdf_c++4.a" ]; then
  
  # HDF5
  cd $HOME
  wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.12/hdf5-1.12.0/src/hdf5-1.12.0.tar.gz
  tar xzf hdf5-1.12.0.tar.gz
  rm -f hdf5-1.12.0.tar.gz
  cd hdf5-1.12.0
  ./configure --prefix=/usr/local --enable-cxx
  make
  make install
  cd $HOME
  rm -rf hdf5-1.12.0

  # NETCDF-C
  cd $HOME
  wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.7.4.tar.gz
  tar xzf netcdf-c-4.7.4.tar.gz
  rm -f netcdf-c-4.7.4.tar.gz
  cd netcdf-c-4.7.4
  mkdir -p /tmp
  ./configure --prefix=/usr/local
  make
  make install
  cd $HOME
  rm -rf netcdf-c-4.7.4
  # Check working
  /usr/local/bin/nc-config --has-nc4

  # NETCDF-CXX4
  cd $HOME
  git clone https://github.com/Unidata/netcdf-cxx4.git
  cd netcdf-cxx4
  git checkout v4.3.1
  mkdir -p /tmp
  ./configure --prefix=$HOME/netcdf
  make
  make install
  cd $HOME
  rm -rf netcdf-cxx4

fi
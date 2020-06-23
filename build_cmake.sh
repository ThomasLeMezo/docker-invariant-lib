# ==================================================================
#  CMake Installation
# ==================================================================

#!/bin/bash

#set -x # debugging

cd $HOME
CMAKE_VERSION=3.18.0-rc2
CMAKE_FILE_NAME=cmake-${CMAKE_VERSION}
CMAKE_ARCHIVE_NAME=${CMAKE_FILE_NAME}.tar.gz
wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_ARCHIVE_NAME}
tar xzf ${CMAKE_ARCHIVE_NAME}
rm -f ${CMAKE_ARCHIVE_NAME}
cd ${CMAKE_FILE_NAME}

./bootstrap
make
make install

cd $HOME
rm -rf ${CMAKE_FILE_NAME}
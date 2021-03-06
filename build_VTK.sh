# ==================================================================
#  VTK Installation
# ==================================================================

#!/bin/bash

#set -x # debugging

if [ ! -e "$HOME/vtk/lib/libvtkCommonCore-9.0.a" ]; then
  echo 'Installing VTK-lib...';
  
  VTK_MAJOR_VERSION=9.0
  VTK_SUB_VERSION=0
  VTK_VERSION=${VTK_MAJOR_VERSION}.${VTK_SUB_VERSION}
  VTK_FILE_NAME=VTK-${VTK_VERSION}
  VTK_ARCHIVE_NAME=${VTK_FILE_NAME}.tar.gz

  echo "http://www.vtk.org/files/release/${VTK_MAJOR_VERSION}/${VTK_ARCHIVE_NAME}"
  if [ ! -e "${VTK_ARCHIVE_NAME}" ]; then
    wget http://www.vtk.org/files/release/${VTK_MAJOR_VERSION}/${VTK_ARCHIVE_NAME}
    tar xf ${VTK_ARCHIVE_NAME}
    rm -rf ${VTK_ARCHIVE_NAME}
  fi
  cd ${VTK_FILE_NAME}

  mkdir -p build
  cd build

  BUILD_DIR=$HOME/vtk
  mkdir -p "${BUILD_DIR}"
  /usr/local/bin/cmake -DCMAKE_INSTALL_PREFIX="${BUILD_DIR}" \
								-DCMAKE_BUILD_TYPE=Release \
								-DVTK_SMP_IMPLEMENTATION_TYPE=OpenMP \
								-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
								-DBUILD_SHARED_LIBS=OFF \
								-DVTK_Group_Rendering=OFF \
								-VTK_Group_Imaging=OFF \
								-VTK_Group_MPI=OFF \
								-VTK_Group_Qt=OFF \
								-VTK_Group_Rendering=OFF \
								-VTK_Group_Tk=OFF \
								-VTK_Group_Views=OFF \
								-VTK_Group_Web=OFF \
								-VTK_IOS_BUILD=OFF \
								..
  make
  make install
  cd ../..
  rm -rf ${VTK_FILE_NAME}
fi

# ==================================================================
#  Boost Installation
# ==================================================================

#!/bin/bash

wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz

tar -xzf boost_1_*
cd boost_1_*
./bootstrap.sh --prefix=/usr/
./b2 install --prefix=/usr/ --with=all link=static

rm -rf boost_1_*
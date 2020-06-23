# ==================================================================
#  Boost Installation
# ==================================================================

#!/bin/bash

wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz

tar -xzf boost_1_69_0.tar.gz
rm -f boost_1_69_0.tar.gz

cd boost_1_69_0
./bootstrap.sh --prefix=/usr/
./b2 install --prefix=/usr/ --with=all link=static

cd ..
rm -rf boost_1_69_0
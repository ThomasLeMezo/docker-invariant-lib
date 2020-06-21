# ==================================================================
#  Curl Installation
# ==================================================================

#!/bin/bash

cd $HOME
wget https://curl.haxx.se/download/curl-7.70.0.tar.gz

tar -xzf curl-*
cd curl-*
./configure
make
make install

cd..
rm -rf curl-*
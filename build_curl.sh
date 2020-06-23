# ==================================================================
#  Curl Installation
# ==================================================================

#!/bin/bash

cd $HOME
wget https://curl.haxx.se/download/curl-7.70.0.tar.gz

tar -xzf curl-7.70.0.tar.gz
rm -f curl-7.70.0.tar.gz

cd curl-7.70.0
./configure
make
make install

cd ..
rm -rf curl-7.70.0
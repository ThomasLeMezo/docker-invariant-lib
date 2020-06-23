from quay.io/pypa/manylinux2014_x86_64

LABEL maintainer="thomas.le_mezo@ensta-bretagne.org"

ENV HOME /root
ADD build_* $HOME/

RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm
RUN yum install -y cppunit-devel cmake3 flex bison doxygen wget zlib-devel xz libXt-devel sqlite-devel libtiff-devel nano jbigkit-devel
RUM yum install -y libcurl-devel openssl-devel
RUN yum update -y

#RUN bash $HOME/build_openssl.sh
#RUN bash $HOME/build_curl.sh
RUN bash $HOME/build_cmake.sh
RUN bash $HOME/build_netcdf.sh
RUN bash $HOME/build_ppl.sh
RUN bash $HOME/build_proj4.sh
RUN bash $HOME/build_VTK.sh
RUN bash $HOME/build_boost.sh

#### From benensta/pyibex-docker
RUN cd /tmp
RUN echo 'alias cmake=cmake3' >> ~/.bashrc
RUN source ~/.bashrc  
RUN git clone -b develop https://github.com/ibex-team/ibex-lib.git
RUN cd ibex-lib   && \
    mkdir build && \
    cd build   && \
    pwd&& \
    cmake3 -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_C_FLAGS="-fPIC" ../   && \
    make -j2   && \
    # make check   && \
    make install
RUN cd / && rm /tmp -rf

####


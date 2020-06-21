from benensta/pyibex-docker

LABEL maintainer="thomas.le_mezo@ensta-bretagne.org"

ENV HOME /root
ADD build_* $HOME/

RUN yum install -y doxygen wget zlib-devel libcurl-devel xz openssl-devel libXt-devel sqlite-devel libtiff-devel nano
#RUN yum install -y graphviz-*

RUN bash $HOME/build_cmake.sh
RUN bash $HOME/build_netcdf.sh
RUN bash $HOME/build_ppl.sh
RUN bash $HOME/build_proj4.sh
RUN bash $HOME/build_VTK.sh
RUN bash $HOME/build_boost.sh

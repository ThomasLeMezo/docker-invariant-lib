from benensta/pyibex-docker

LABEL maintainer="thomas.le_mezo@ensta-bretagne.org"

ENV HOME /root
ADD build_* $HOME/

RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm
RUN yum install -y doxygen wget zlib-devel libcurl-devel xz openssl-devel libXt-devel sqlite-devel libtiff-devel nano jbigkit-devel

RUN bash $HOME/build_curl.sh
RUN bash $HOME/build_cmake.sh
RUN bash $HOME/build_netcdf.sh
RUN bash $HOME/build_ppl.sh
RUN bash $HOME/build_proj4.sh
RUN bash $HOME/build_VTK.sh
RUN bash $HOME/build_boost.sh

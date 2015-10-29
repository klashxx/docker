FROM fedora
MAINTAINER https://github.com/klashxx

# Update the container
RUN dnf upgrade --best --assumeyes --setopt=deltarpm=false 

RUN dnf install binutils \
                compat-libstdc++-33 \
                compat-libstdc++-33.i686 \
                gcc \
                gcc-c++ \
                ksh \
                libaio \
                libaio.i686 \
                libaio-devel \
                libaio-devel.i686 \
                libXext \
                libXext.i686 \
                libXtst \
                libXtst.i686 \
                libX11 \
                libX11.i686 \
                libXau \
                libXau.i686 \
                libxcb \
                libxcb.i686 \
                libXi \
                libXi.i686 \
                make \
                sysstat \
                unixODBC \
                unixODBC-devel \
                zlib-devel --assumeyes --best

RUN dnf clean all 
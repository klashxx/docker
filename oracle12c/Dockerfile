FROM fedora
MAINTAINER https://github.com/klashxx

LABEL version="1.0"
LABEL description="Minimal installation oracle 12c"

# Update the container
RUN dnf upgrade --best --assumeyes --setopt=deltarpm=false 

RUN dnf install binutils \
                unzip \
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

RUN groupadd -g 54321 oinstall && groupadd -g 54322 dba
RUN useradd -u 54321 -g oinstall -G dba oracle
RUN echo "oracle:oracle" | chpasswd

ADD linuxamd64_12102_database_1of2.zip /tmp/orainstall/linuxamd64_12102_database_1of2.zip
ADD linuxamd64_12102_database_2of2.zip /tmp/orainstall/linuxamd64_12102_database_2of2.zip
ADD oracle12c.sh /tmp/oracle12c.sh
ADD sysctl.conf /etc/sysctl.conf


RUN ["/tmp/oracle12c.sh", "unpacking"]

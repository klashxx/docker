FROM fedora
MAINTAINER https://github.com/klashxx

LABEL version="1.0"
LABEL description="oracle database 12c Minimal installation"

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
                zlib-devel --assumeyes --best && dnf clean all

RUN groupadd -g 54321 oinstall && \
    groupadd -g 54322 dba && \
    useradd -u 54321 -g oinstall -G dba oracle && \
    mkdir -p /u01/app/oracle/oradata/edie/ && \
    mkdir -p /u01/logs/ && \
    mkdir -p /tmp/orainstall/ && \
    mkdir -p /u01/app/oracle/product/12.1.0/db_1 && \
    chown oracle:dba -R /u01 /tmp/orainstall && \
    echo "oracle:oracle" | chpasswd

ADD sysctl.conf /etc/sysctl.conf

USER oracle
ADD ora12c_software.rsp /tmp/orainstall/
ADD oracle12c.sh /tmp/oracle12c.sh
ADD linuxamd64_12102_database_*.zip /tmp/orainstall/

WORKDIR /tmp/orainstall/
RUN unzip linuxamd64_12102_database_1of2.zip && unzip linuxamd64_12102_database_2of2.zip
WORKDIR /tmp/orainstall

RUN ./database/runInstaller -silent \
                            -responseFile /tmp/orainstall/ora12c_software.rsp \
                            -noconfig -force

RUN rm linuxamd64_12102_database_*.zip && rm -rf database/



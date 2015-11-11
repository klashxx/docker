FROM fedora
MAINTAINER https://github.com/klashxx
LABEL version="1.0"
LABEL description="oracle database 12c Minimal installation"

# Weird but sometimes dnf is missing
RUN yum install dnf  --assumeyes && \
    dnf upgrade --best --assumeyes --setopt=deltarpm=false 

# Install necesary packages && final cleanup
RUN dnf install binutils \
                unzip \
                ksh \
                make \
                sysstat \
                compat-libstdc++-33 compat-libstdc++-33.i686 \
                gcc gcc-c++ \
                libaio libaio.i686 \
                libaio-devel libaio-devel.i686 \
                libXext libXext.i686 \
                libXtst libXtst.i686 \
                libX11 libX11.i686 \
                libXau libXau.i686 \
                libxcb libxcb.i686 \
                libXi libXi.i686 \
                unixODBC unixODBC-devel \
                zlib-devel --assumeyes --best && dnf clean all

# Adding user oracle, helper groups and FS
RUN groupadd -g 54321 oinstall && \
    groupadd -g 54322 dba && \
    useradd -u 54321 -g oinstall -G dba,oinstall oracle&& \
    mkdir -p /u01/app/oracle/oradata/edie/ && \
    mkdir -p /u01/logs/ && \
    mkdir -p /tmp/orainstall/ && \
    mkdir -p /etc/oraInventory/ && \
    mkdir -p /u01/app/oracle/product/12.1.0/db_1 && \
    chown -R oracle:oinstall /u01 /tmp/orainstall /etc/oraInventory/ && \
    echo "root:alpine" | chpasswd \
    echo "oracle:oracle" | chpasswd

# Configuration files
COPY sysctl.conf /etc/sysctl.conf

# Sofware installation must be done as oracle
USER oracle

# Install script
COPY oracle12c.sh /tmp/oracle12c.sh

# Adding database software
COPY linuxamd64_12102_database_*.zip /tmp/orainstall/


WORKDIR /tmp/orainstall/
RUN unzip linuxamd64_12102_database_1of2.zip && \
    unzip linuxamd64_12102_database_2of2.zip && \
    rm linuxamd64_12102_database_*.zip

# Unattended install [Doc ID 885643.1]
RUN database/runInstaller -silent -debug -waitforcompletion \
                          FROM_LOCATION=/tmp/orainstall/database/stage/products.xml \
                          oracle.install.option=INSTALL_DB_SWONLY \
                          UNIX_GROUP_NAME=oinstall \
                          INVENTORY_LOCATION=/etc/oraInventory \
                          ORACLE_HOME=/u01/app/oracle/product/12.1.0/db_1 \
                          ORACLE_HOME_NAME="OraDb12c_Home1" \
                          ORACLE_BASE=/u01/app/oracle \
                          oracle.install.db.InstallEdition=EE \
                          oracle.install.db.DBA_GROUP=dba \
                          oracle.install.db.OPER_GROUP=dba \
                          oracle.install.db.BACKUPDBA_GROUP=dba \
                          oracle.install.db.DGDBA_GROUP=dba \
                          oracle.install.db.KMDBA_GROUP=dba \
                          oracle.install.cvu.getSharedPartitionList=false \
                          oracle.install.cvu.checkSharedStorageFileSystemType=false \
                          DECLINE_SECURITY_UPDATES=true && sleep 100 && rm -rf database/




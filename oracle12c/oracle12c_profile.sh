# Oracle Settings
export TMP=/tmp

export ORACLE_HOSTNAME=edie.fedora
export ORACLE_UNQNAME=edie
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=$ORACLE_BASE/product/12.1.0/db_1
export ORACLE_SID=edie

export PATH=$PATH:/usr/sbin:$PATH:$ORACLE_HOME/bin
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib
export CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib

alias cdob='cd $ORACLE_BASE'
alias cdoh='cd $ORACLE_HOME'
alias tns='cd $ORACLE_HOME/network/admin'
alias envo='env | grep ORACLE'

umask 022

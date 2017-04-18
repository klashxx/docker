FROM centos:latest
MAINTAINER Juan Diego Godoy Robles

USER root

RUN echo "HOSTNAME=master.docker.com" >> /etc/sysconfig/network
RUN yum install python-devel python-distribute epel-release  --assumeyes
RUN yum groupinstall "Development Tools" --assumeyes
RUN yum install python-pip --assumeyes

RUN pip --no-cache-dir --log /dev/null install --upgrade pip
RUN pip --no-cache-dir install fabric

# docker run --add-host=docker:10.180.0.1 --rm - klashxx/centpy





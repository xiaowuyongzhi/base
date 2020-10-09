FROM centos:7

ADD . /home
WORKDIR /home

ENV LANG=zh_CN.UTF-8 \ 
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

RUN yum -y update \
    && yum -y reinstall glibc-common \
    && yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel python36 git gcc make wget vim libxml2 libxslt openssl gcc-c++ epel-release libffi-devel python3-devel.x86_64 \
    && pip install -r requirements.txt \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

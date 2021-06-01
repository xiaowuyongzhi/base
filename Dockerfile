FROM centos:7

ADD . /home
WORKDIR /home

ENV LANG=zh_CN.UTF-8 \ 
    LANGUAGE=zh_CN:zh \
    LC_ALL=zh_CN.UTF-8

RUN yum -y update
RUN yum -y kde-l10n-Chinese
RUN yum -y reinstall glibc-common
RUN yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel python36 git gcc make wget vim libxml2 libxslt openssl gcc-c++ epel-release libffi-devel python3-devel.x86_64
RUN pip3 install -r requirements.txt
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

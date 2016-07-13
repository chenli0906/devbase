# Version 0.0.1
FROM ubuntu:latest
MAINTAINER Leo Chen "C_L_0312@qq.com"

# use mirrors of china
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list && \
cp /etc/apt/sources.list /etc/apt/sources.list.d/
COPY ./cn_sources.list /etc/apt/sources.list

# install buildpacks
RUN apt-get update && \
apt-get install -y apt-utils \
  bzip2 \
  p7zip-full \
  python2.7 \
  subversion && \
apt-get clean && \
apt-get autoclean
RUN ln -s /usr/bin/python2.7 /usr/bin/python && ln -s /usr/bin/pydoc2.7 /usr/bin/pydoc && ln -s /usr/bin/pygettext2.7 /usr/bin/pygettext

# install jdk
ADD dependency/jdk-7u55-linux-x64.tar.gz /usr/local/
ENV JAVA_HOME /usr/local/jdk1.7.0_55 

# install scala
ADD dependency/scala-2.10.4.tgz /usr/local
ENV SCALA_HOME /usr/local/scala-2.10.4

# install sbt
ADD dependency/sbt-0.13.7.tgz /usr/local
ENV SBT_HOME=/usr/local/sbt

ENV PATH $PATH:$JAVA_HOME/bin:$SCALA_HOME/bin:$SBT_HOME/bin

# add UTF8 character set
RUN locale-gen en_US.UTF-8
ENV LC_CTYPE="en_US.UTF-8"



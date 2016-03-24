# 0. 基础镜像 & 维护者信息.
# VERSION: V1.0.0.0
# Author:  yangjun <yangjun@intra.nsfocus.com>
# MAINTAINER lihui <lihui@intra.nsfocus.com>

# 1. 基础镜像.
FROM 10.5.24.46:80/docker/ubuntu:12.04

# 2. 镜像BUILD默认参数 & RUN环境变量.
ARG EXPOSE_PORT="80 443"

ENV API_domain="nscloud.api.nsfocus.com"
ENV Portal_domain="www.nscloud.com"
ENV API_Proxy_IP="10.5.24.33"
ENV pub_Redis="10.5.24.60"
ENV pub_Redis_PWD="123456"
ENV Atsani_Redis="10.5.24.60"
ENV Atsani_Redis_PWD="123456"

# 3. 镜像生成过程操作指令.
ENV APP_PATH="/opt/applications/Mun"

# switch default shell from sh/dash to bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# set default language environment
RUN locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# copy mun to images
RUN mkdir -p ${APP_PATH}
COPY ./ ${APP_PATH}
RUN find ${APP_PATH}/ -type d -name ".svn" | xargs rm -rf

# config python pip sources && install default pip packages
RUN rm -rf ~/.pip \
    && mkdir -p ~/.pip \
    && mkdir -p ~/.pip_download_cache_dir \
    && cp -rf ${APP_PATH}/build-depends/pip.conf ~/.pip/

# config apt sources
RUN  mv /etc/apt/sources.list /etc/apt/sources.list.back \
    && cp -rf ${APP_PATH}/build-depends/sources.list /etc/apt/

# adjust kernel parameters of tcp
RUN  mv /etc/sysctl.conf /etc/sysctl.conf.back \
    && cp -rf ${APP_PATH}/build-depends/sysctl.conf /etc/

# apt install packages
RUN apt-get update -y \
    && apt-get install -y build-essential \
    && apt-get install -y curl libcurl4-gnutls-dev librtmp-dev \
    && apt-get install -y python-dev libmysqlclient-dev python-pip \
    && apt-get install -y swig \
    && apt-get install -y wget \
    && apt-get install -y subversion \
    && apt-get install -y daemon \
    && apt-get install -y sudo \
    && apt-get install -y openssl \
    && apt-get install -y libxml2 libxslt1-dev libsasl2-dev

# install mun 
RUN groupadd apache && useradd -g apache  -c "the apache user" -m apache \
    && mkdir -p /opt/disk2/var/www && mkdir -p /opt/disk2/var/serverconfig/ \
    && cp ${APP_PATH}/aw-get/aw-get.sh /usr/sbin/aw-get \
    && chmod a+x /usr/sbin/aw-get \
    && aw-get app install nginx-1.6.3-bin-ubuntu12.04 \
    && aw-get app install uwsgi-2.0.10-bin-ubuntu12.04 \
    && cp ${APP_PATH}/build-depends/uwsgi.log /var/log/ \
    && chown apache:apache /var/log/uwsgi.log

# pip install packages
RUN pip install --upgrade pip \
    && pip install -r ${APP_PATH}/build-depends/requirements.txt
RUN source /opt/ENV/ubuntu1227/bin/activate \
    && pip install -r ${APP_PATH}/build-depends/requirements.txt

# add hosts update tool
RUN cp -rf ${APP_PATH}/build-depends/mungehosts /usr/local/bin/ \
    && chmod 755 /usr/local/bin/mungehosts

# 4. 指定容器需要暴露的端口.
# EXPOSE ${EXPOSE_PORT}

# 5. 指定容器需要使用的持久化存储.
# VOLUME ["/usr/local/nginx/logs/"]

# 6. 容器启动指令: 如果为LongTime Service，不能起为后台进程.
RUN chmod 755 ${APP_PATH}/run.sh
CMD ["/bin/bash", "-c", "env && cd ${APP_PATH} &&./run.sh"]


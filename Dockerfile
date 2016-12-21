
FROM ubuntu:14.04
ADD http://mirrors.163.com/.help/sources.list.trusty /etc/apt/sources.list
COPY install.sh /usr/local/src/install.sh
COPY supervisord.conf /usr/local/src/supervisord.conf



RUN apt-get  update && \
    apt-get -y install build-essential && \
    apt-get -y install supervisor && \
	cp /usr/local/src/supervisord.conf /etc/supervisor/supervisord.conf && \
    apt-get -y install openssh-server && \
    apt-get -y install git && \
    apt-get -y install vim && \
	apt-get -y install lrzsz && \
    apt-get -y install libxml2-dev && \
    apt-get -y install  pkg-config libssl-dev libsslcommon2-dev && \
    apt-get -y install libbz2-dev && \
    apt-get -y install libcurl4-gnutls-dev && \
    apt-get -y install libjpeg8-dev && \
    apt-get -y install libpng-dev && \
    apt-get -y install libfreetype6-dev && \
    apt-get -y install libmcrypt-dev && \
    apt-get -y install libxslt-dev && \
    apt-get -y install libgmp-dev && \
    apt-get -y install libreadline-dev && \
    apt-get -y install curl && \	
	apt-get -y install autoconf && \
    bash /usr/local/src/install.sh 

CMD supervisord -n



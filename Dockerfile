
FROM ubuntu:14.04
ADD http://oieyq8sjs.bkt.clouddn.com//sources.list/sources.list /etc/apt/sources.list
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
    bash /usr/local/src/install.sh && \
    echo "export PATH=\" $PATH:/usr/local/php5.6/bin/:/usr/local/nginx/:/usr/local/apache/bin \"" >> /etc/profile && \

    export PATH="$PATH:/usr/local/php5.6/bin/" && \
    cd /usr/local/src && \
    php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php && \
    php composer-setup.php && \
    rm composer-setup && \
    mv composer-phar /usr/local/php5.6/bin && \
    composer config -g repo.packagist composer https://packagist.phpcomposer.com

CMD supervisord -n



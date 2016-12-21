#! /bin/bash

#apt-get install lrzsz

cd /usr/local/src

wget http://mirrors.cnnic.cn/apache//apr/apr-1.5.2.tar.gz  -O apr.tar.gz
wget http://mirrors.cnnic.cn/apache//apr/apr-util-1.5.4.tar.gz -O apr-util.tar.gz
wget http://oieyq8sjs.bkt.clouddn.com/pcre-8.39.tar.gz -O pcre.tar.gz
wget http://mirrors.cnnic.cn/apache//httpd/httpd-2.4.23.tar.bz2 -O httpd.tar.bz2
wget http://cn2.php.net/get/php-5.6.29.tar.gz/from/this/mirror -O php5.6.tar.gz


mkdir apr && tar -xzf apr.tar.gz -C ./apr --strip-components=1
mkdir apr-util && tar -xzf apr-util.tar.gz -C ./apr-util --strip-components=1
mkdir pcre && tar -xzf pcre.tar.gz -C ./pcre --strip-components=1
mkdir httpd && tar -xjf httpd.tar.bz2 -C ./httpd --strip-components=1
mkdir php5.6 && tar -xzf php5.6.tar.gz -C ./php5.6 --strip-components=1

ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h

cd apr
./configure --prefix=/usr/local/apr && make && make install


cd ../apr-util
./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr  && make && make install


cd ../pcre
./configure && make && make install

cd ../httpd
./configure --prefix=/usr/local/apache --with-apr=/usr/local/apr --with-mpm=prefork --with-apr-util=/usr/local/apr-util && make && make install

cp /usr/local/apache/bin/apachectl /etc/init.d/httpd

cd ../php5.6

./configure \
--prefix=/usr/local/php5.6/ \
--with-config-file-path=/usr/local/php5.6/etc \
--with-config-file-scan-dir=/usr/local/php5.6/etc/conf.d \
--enable-soap \
--with-openssl \
--with-mcrypt \
--with-pcre-regex \
--with-sqlite3 \
--with-zlib \
--enable-bcmath \
--with-iconv \
--with-bz2 \
--enable-calendar \
--with-curl \
--with-cdb \
--enable-dom \
--enable-exif \
--enable-fileinfo \
--enable-filter \
--with-pcre-dir \
--enable-ftp \
--with-gd \
--with-openssl-dir \
--with-jpeg-dir \
--with-png-dir \
--with-freetype-dir \
--with-gettext \
--with-gmp \
--with-mhash \
--enable-json \
--enable-mbstring \
--disable-mbregex \
--disable-mbregex-backtrack \
--with-libmbfl \
--with-onig \
--enable-pdo \
--with-pdo-mysql \
--with-zlib-dir \
--with-pdo-sqlite \
--with-readline \
--enable-session \
--enable-shmop \
--enable-simplexml \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--enable-wddx \
--with-libxml-dir \
--with-xsl \
--enable-zip \
--enable-mysqlnd-compression-support \
--with-pear \
--with-mysqli \
--with-mysql \
--with-apxs2=/usr/local/apache/bin/apxs  && make && make install 

cp /usr/local/src/php5.6/php.ini-production /usr/local/php5.6/etc/php.ini

cd /usr/local/src
rm -fr *

adduser --gecos '' --disabled-password chenjiayao
echo -e '11\n11' | passwd chenjiayao
echo -e '11\n11' | passwd root

rm /etc/ld.so.cache && /sbin/ldconfig



echo '=========================================ok===================================='
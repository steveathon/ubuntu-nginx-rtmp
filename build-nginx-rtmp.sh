#!/bin/sh

PWD=`pwd`

mkdir /usr/local/nginx
cd /usr/local/nginx
curl https://nginx.org/download/nginx-1.15.9.tar.gz -o ~/nginx-1.15.9.tar.gz
git clone https://github.com/arut/nginx-rtmp-module.git
tar xfz nginx-1.15.9.tar.gz

cd nginx-1.15.9

./configure --with-http_ssl_module \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--with-openssl=../openssl-1.1.0f \
--with-openssl-opt=enable-ec_nistp_64_gcc_128 \
--with-openssl-opt=no-nextprotoneg \
--with-openssl-opt=no-weak-ssl-ciphers \
--with-openssl-opt=no-ssl3 \
--add-module=../nginx-rtmp-module \
--with-pcre=../pcre-8.40 \
--with-pcre-jit \
--with-zlib=../zlib-1.2.11 \
--with-compat \
--with-file-aio \
--with-threads \
--with-http_addition_module \
--with-http_auth_request_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_mp4_module \
--with-http_random_index_module \
--with-http_realip_module \
--with-http_slice_module \
--with-http_ssl_module \
--with-http_sub_module \
--with-http_stub_status_module \
--with-http_v2_module \
--with-http_secure_link_module \
--with-mail \
--with-mail_ssl_module \
--with-stream \
--with-stream_realip_module \
--with-stream_ssl_module \
--with-stream_ssl_preread_module

make
make install

cd $PWD

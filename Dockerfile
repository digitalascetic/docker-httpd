ARG APACHE_VERSION=2.4.46

FROM httpd:${APACHE_VERSION}-alpine

ENV APACHE_LOG_DIR='/usr/local/apache2/logs'

MAINTAINER tech@ascetic.io

WORKDIR /usr/local/apache2/conf/

# Enable ssl, rewrite, proxy and proxy_fcgi apache modules
RUN sed -i \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_proxy_fcgi.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_deflate.so\)/\1/' \
        -e 's/^\(User\).*/\1 www-data/' \
        -e 's/^\(Group\).*/\1 www-data/' \
        httpd.conf && \
    echo 'SSLSessionCache "shmcb:/usr/local/apache2/logs/ssl_gcache_data(512000)"' >> httpd.conf && \
    mkdir sites && \
    mkdir /var/www && \
    mkdir /var/www/vhosts && \
    chown www-data:www-data /var/www/vhosts

EXPOSE 80 443
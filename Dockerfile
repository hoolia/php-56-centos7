FROM centos/php-56-centos7:latest

USER 0

RUN yum install -y ssmtp nss_wrapper \
# php-pecl-memcached \
# && cp /usr/lib64/php/modules/memcached.so \
#       /usr/lib64/php/modules/igbinary.so  \
#       /usr/lib64/php/modules/msgpack.so   \
#       /opt/rh/rh-php56/root/usr/lib64/php/modules/ \
# && cp /etc/php.d/igbinary.ini \
#       /etc/php.d/msgpack.ini  \
#       /etc/opt/rh/rh-php56/php.d/ \
 && pecl install memcached \
 && chmod 777 /etc/ssmtp \
 && chmod g-s /usr/sbin/ssmtp \
 && mv /usr/libexec/s2i/run /usr/libexec/s2i/run.org
ADD etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD bin/run /usr/libexec/s2i/run
ADD etc/php.d/41-memcached.ini /etc/opt/rh/rh-php56/php.d/41-memcached.ini

USER 1001

FROM centos/php-56-centos7:latest

USER 0

RUN yum install -y ssmtp nss_wrapper php-pecl-memcached \
 && chmod 777 /etc/ssmtp \
 && chmod g-s /usr/sbin/ssmtp \
 && mv /usr/libexec/s2i/run /usr/libexec/s2i/run.org
ADD etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf
ADD bin/run /usr/libexec/s2i/run

USER 1001

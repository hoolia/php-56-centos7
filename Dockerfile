FROM centos/php-56-centos7:latest

USER 0

RUN yum install -y ssmtp
ADD etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf

USER 1001

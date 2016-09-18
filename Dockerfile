FROM centos/php-56-centos7:latest

USER 0

RUN yum install -y sendmail
ADD etc/sysconfig/sendmail /etc/sysconfig/sendmail

USER 1001

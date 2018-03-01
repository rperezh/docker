# Fichero Dockerfile
# Raul Perez Hernandez

FROM ubuntu:16.04

LABEL maintainer="rperezh@ull.edu.es"

SHELL ["/bin/bash"]

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "tmux"]
RUN ["apt-get", "-y", "install", "apache2"]

ENV APACHE_SERVERADMIN=admin@localhost
ENV APACHE_SERVERNAME=localhost
ENV APACHE_SERVERALIAS=docker.localhost
ENV APACHE_DOCUMENTROOT=/var/www
ENV APACHE_RUN_USER=www-data
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_LOG_DIR=/var/log/apache2
#ENV APACHE_PID_FILE=/var/run/apache2.pid
#ENV APACHE_RUN_DIR=/var/run/apache2
#ENV APACHE_LOCK_DIR=/var/lock/apache2

COPY joomla-install.sh /joomla-install.sh
RUN ["/joomla-install.sh"]

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

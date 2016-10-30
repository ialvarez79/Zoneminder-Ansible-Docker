######################
#                    #
# UNDER CONSTRUCTION #
#                    #
######################

FROM ubuntu:16.04

ENV ROOT_MYSQL_PW uberpass
ENV MYSQL_USER_PW zmpass
ENV MYSQL_USER    zmuser
ENV MYSQL_HOST    mysql
ENV MYSQL_DB      zoneminder
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y 
RUN echo "mysql-server mysql-server/root_password password supersecretpass" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password supersecretpass" | debconf-set-selections
RUN apt-get install -y mysql-server
RUN apt-get install -y mysqltuner
RUN apt-get install -y apache2
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common
#RUN add-apt-repository -y ppa:iconnor/zoneminder
RUN apt-get update
RUN apt-get install -y zoneminder 
RUN rm /etc/mysql/my.cnf && cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
RUN apt-get install -y ffmpeg # /usr/bin/ffmpeg
#RUN mysql -uroot -e "CREATE DATABASE 'zm'"
#RUN mysql -uroot -e "grant all on zm.* to 'zmuser'@localhost identified by 'zmpass';"
RUN chmod 0740 /etc/zm/zm.conf
RUN chown root:www-data /etc/zm/zm.conf
RUN a2enmod cgi
RUN a2enmod rewrite
RUN cp /etc/apache2/conf-available/zoneminder.conf /etc/apache2/conf-enabled/ 

# This doesn't seem to work, not sure why:
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh

EXPOSE 80

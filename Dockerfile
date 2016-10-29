######################
#                    #
# UNDER CONSTRUCTION #
#                    #
######################

FROM ubuntu

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
RUN add-apt-repository -y ppa:iconnor/zoneminder
RUN apt-get update
RUN apt-get install -y zoneminder 
RUN apt-get install -y ffmpeg # /usr/bin/ffmpeg
RUN chmod 0740 /etc/zm/zm.conf
RUN chown root:www-data /etc/zm/zm.conf
RUN a2enmod cgi
RUN a2enmod rewrite
RUN cp /etc/apache2/conf-available/zoneminder.conf /etc/apache2/conf-enabled/ 

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

CMD ['/entrypoint.sh']

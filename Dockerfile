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

RUN apt-get update
RUN apt-get dist-upgrade -y 
RUN apt-get install mysql-server
RUN apt-get install mysqltuner
RUN apt-get install apache2
RUN apt-get install python-software-properties
RUN apt-get install software-properties-common
RUN add-apt-repository -y ppa:iconnor/zoneminder
RUn add-apt-repository -y ppa:mc3man/trusty-media && apt-get update
RUN apt-get install zoneminder state=present
RUN apt-get install ffmpeg state=present # /usr/bin/ffmpeg
RUN chmod 0740 /etc/zm/zm.conf
RUN chown root:www-data /etc/zm/zm.conf
RUN adduser www-data
RUN adduser video
RUN a2enmod cgi
RUN a2enmod rewrite
RUN chmod www-data:www-data /usr/share/zoneminder/
RUN curl "http://www.andywilcock.com/code/cambozola/cambozola-latest.tar.gz" -O /usr/share/zoneminder/cambozola-latest.tar.gz
RUN tar zxf /usr/share/zoneminder/cambozola-latest.tar.gz -C /usr/share/zoneminder/cambozola
RUN cp /usr/share/zoneminder/cambozola/cambozola-0.936/dist/cambozola.jar /usr/share/zoneminder/www/
RUN /etc/init.d/zoneminder start
RUN cp /etc/apache2/conf-available/zoneminder.conf /etc/apache2/conf-enabled/ 
RUN echo "America/Los_Angeles" >> /etc/php5/apache2/php.ini
RUN /etc/init.d/apache2 restart

EXPOSE 80

ENTRYPOINT []

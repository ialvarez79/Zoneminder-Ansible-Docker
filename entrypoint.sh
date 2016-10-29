#!/bin/bash
# TODO: Check ZM_HOST for ENV variable, if they are different, then create the file based on the rest of the ENV_Variables
# TODO: Check that all exist that are required for zoneminder
if [ ${ZM_DB_HOST}  -ne "localhost" ]; then
  if [ -z "$ZM_USER" ] && [ -z "$ZM_DB_NAME" ] && [ -z "$ZM_DB_USER" ] && [ -z "$ZM_DB_PASS" ]; then
    echo ZM_PATH_DATA=/usr/share/zoneminder > /etc/zm/zm.conf
    echo ZM_PATH_BIN=/usr/bin >> /etc/zm/zm.conf
    echo ZM_PATH_LIB=/usr/lib/x86_64-linux-gnu >> /etc/zm/zm.conf
    echo ZM_PATH_CONF=/etc/zm >> /etc/zm/zm.conf
    echo ZM_PATH_WEB=/usr/share/zoneminder/www >> /etc/zm/zm.conf
    ZM_PATH_CGI=/usr/lib/zoneminder/cgi-bin >> /etc/zm/zm.conf
    ZM_WEB_USER=www-data >> /etc/zm/zm.conf
    ZM_WEB_GROUP=www-data >> /etc/zm/zm.conf
    ZM_DB_TYPE=mysql >> /etc/zm/zm.conf
    ZM_DB_HOST=$ZM_DB_HOST >> /etc/zm/zm.conf
    ZM_DB_NAME=$ZM_DB_NAME >> /etc/zm/zm.conf
    ZM_DB_USER=$ZM_DB_USER >> /etc/zm/zm.conf
    ZM_DB_PASS=$ZM_DB_PASS >> /etc/zm/zm.conf
    ZM_SERVER_HOST= >> /etc/zm/zm.conf
  else
    echo "You need to set enviroment variable 'ZM_DB_HOST', 'ZM_DB_NAME', 'ZM_DB_USER', 'ZM_DB_PASS' when you set 'ZM_DB_HOST'."
  fi
fi

while :
do

  if grep -i "localhost" /etc/zm/zm.conf ; then
    pgrep mysql > /dev/null || /etc/init.d/mysql restart
    pgrep apache > /dev/null || /etc/init.d/apache2 restart
    pgrep zm > /dev/null || /etc/init.d/zoneminder restart
    sleep 1m
  fi

done

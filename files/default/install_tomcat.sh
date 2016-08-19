#!/bin/bash

ENV="Dev"
BASE_FOLDER="/tmp/apache_tomcat_temp"
TOMCAT_FOLDER="/usr/local/tomcat$ENV"

kill -9 `ps -eaf|grep $TOMCAT_FOLDER|grep -v grep|awk '{print $2}'` 2>>/dev/null

if [[ ! -d "$BASE_FOLDER" ]]; then

mkdir $BASE_FOLDER

fi

rpm -qa|grep "^java" >/dev/null
RC=$?

if [[ "$RC" -gt "0" ]]; then
yum -y install java
fi

cd $BASE_FOLDER
if [[ ! -e apache-tomcat-7.0.65.tar.gz ]] ; then
wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz
fi
tar -zxvf apache-tomcat-7.0.65.tar.gz >/dev/null

if [[ -d $TOMCAT_FOLDER ]]; then
rm -rf $TOMCAT_FOLDER
fi

mv apache-tomcat-7.0.65 $TOMCAT_FOLDER

$TOMCAT_FOLDER/bin/startup.sh

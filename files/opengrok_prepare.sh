#!/bin/bash
set -ex

apt-get update
apt-get install -y --no-install-recommends libservlet3.1-java tomcat8 openjdk-8-jre-headless git subversion exuberant-ctags wget procps
apt-get clean

mkdir /opt/opengrok
wget -O opengrok.tar.gz https://github.com/oracle/opengrok/releases/download/1.1-rc21/opengrok-1.1-rc21.tar.gz
tar -xzf opengrok.tar.gz --strip-components=1 -C /opt/opengrok
rm -rf opengrok.tar.gz

/opt/opengrok/bin/OpenGrok deploy

cp /opt/opengrok/doc/logging.properties /var/opengrok/logging.properties

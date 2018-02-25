#!/bin/bash - 
#===============================================================================
#
#          FILE: opengrok_run.sh
# 
#         USAGE: ./opengrok_run.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 02/25/2018 11:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64";
export CATALINA_HOME="/usr/share/tomcat8";
export CATALINA_BASE="/var/lib/tomcat8";
export JAVA_OPTS="-Djava.awt.headless=true -XX:+UseConcMarkSweepGC";
export CATALINA_TMPDIR="/tmp/tomcat8-tomcat8-tmp";
export CATALINA_OPTS="-Xms2048m"
export LANG="";
export JSSE_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/";

run_opengrok_index() {
    while ! [[ "$( ls -1r /var/log/tomcat8/catalina* | tail -1 | xargs grep -c 'org.apache.catalina.startup.Catalina.start Server startup in')" -eq 1 ]]; do
        sleep 1
    done
    echo 'Running first index'
    /opt/opengrok/bin/OpenGrok index
    echo 'Indexing finised'
}

run_opengrok_index &
exec $CATALINA_HOME/bin/catalina.sh run

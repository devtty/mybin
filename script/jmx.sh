#!/bin/bash

#using nagios plugin from http://snippets.syabru.ch/nagios-jmx-plugin/
function getMetric(){
 /usr/lib/jvm/java-6-sun/bin/java -jar /home/drenning/Downloads/nagios-jmx-plugin-1.2.3/check_jmx.jar -U service:jmx:rmi:///jndi/rmi://$1/jmxrmi -O $2 -A $3 | cut -d' ' -f6
}


ACT_SESSIONS=$(getMetric 192.168.21.27:1190 jboss.web:host=localhost,path=/app,type=Manager activeSessions)

echo "Active Sessions: $ACT_SESSIONS"


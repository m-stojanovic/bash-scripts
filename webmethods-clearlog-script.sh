#!/bin/bash
###################################################################
#Script Name    :webmethods_clearlog_script.sh
#Description    :Delete logs from specific folders on webMethods servers
#Date           :26-April-2020
#Author         :Milos Stojanovic
#Contact:       :https://www.linkedin.com/in/infomilosstojanovic/
###################################################################
find /opt/softwareag/webMethods/IntegrationServer/instances/default/logs -mtime +4 -name server.log.* | xargs rm -f
find /opt/softwareag/webMethods/IntegrationServer/instances/default/logs -mtime +4 -name stats2* | xargs rm -f
find /opt/softwareag/webMethods/IntegrationServer/instances/default/logs -mtime +4 -name FailedAudit_* | xargs rm -f 
find /opt/softwareag/webMethods/IntegrationServer/instances/default/logs -mtime +4 -name te.log.* | xargs rm -f
find /opt/softwareag/webMethods/IntegrationServer/instances/default/logs -mtime +4 -name RepoV4Error20* | xargs rm -f
find /opt/softwareag/webMethods/IntegrationServer/instances/default/logs -mtime +4 -name WM* | xargs rm -f
find /opt/softwareag/webMethods/optimize/analysis/logs -mtime +4 -name info.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/analysis/logs -mtime +4 -name error.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/analysis/logs -mtime +4 -name server.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/analysis/logs2 -mtime +4 -name info.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/analysis/logs2 -mtime +4 -name error.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/analysis/logs2 -mtime +4 -name server.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/dataCollector/logs -mtime +4 -name info.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/dataCollector/logs -mtime +4 -name server.log.* | xargs rm -f
find /opt/softwareag/webMethods/optimize/dataCollector/logs -mtime +4 -name error.log.* | xargs rm -f
find /opt/softwareag/webMethods/MWS/server/default/logs -mtime +4 -name caf.log.* | xargs rm -f
find /opt/softwareag/webMethods/MWS/server/default/logs -mtime +4 -name _full_.log.* | xargs rm -f
find /opt/softwareag/webMethods/MWS/server/default/logs -mtime +4 -name _problems_.log.* | xargs rm -f
find /opt/softwareag/webMethods/UniversalMessaging/server/umserver/data -name nirvana.log_* | xargs rm -f
find /opt/softwareag/webMethods/IntegrationServer/instances/default/C:/Logs/Sap -mtime +4 -name sap-* | xargs rm -f
echo "Start" > /u01/app/oracle/diag/tnslsnr/sbb-esb-test (ovde se menja putanja na svakom serveru) /listener/trace/listener.log 

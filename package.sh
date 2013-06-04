#!/bin/bash
VERSION=1.1.13
cd ..
wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O logstash-packaging/usr/share/logstash/logstash.jar
fpm -n logstash -v $VERSION -a all -C logstash-packaging -m "<jonathan.raffre@nekolover.net>" --pre-install logstash-packaging/logstash.preinstall --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb --config-files etc/logstash/syslog.conf --config-files etc/default/logstash -d openjdk-7-jre-headless -s dir etc usr var

#!/bin/bash
VERSION=1.1.13
cd ..
wget http://logstash.objects.dreamhost.com/release/logstash-${VERSION}-monolithic.jar -O logstash-packaging/usr/share/logstash/logstash.jar
fpm -n logstash -v $VERSION -a all -C logstash-packaging -m "<jonathan.raffre@nekolover.net>" --before-install logstash-packaging/logstash.preinstall --after-install logstash-packaging/logstash.postinstall --before-remove logstash-packaging/logstash.preremove --after-remove logstash-packaging/logstash.postremove --description "Logstash Open Source Log Management" --url 'http://www.logstash.net/' -t deb --config-files etc/logstash/syslog.conf --config-files etc/default/logstash -d java-runtime -s dir etc usr var

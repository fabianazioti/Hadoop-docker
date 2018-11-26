#!/bin/bash


mkdir -p ~/spatialhadoop/

cd spatialhadoop

wget http://spatialhadoop.cs.umn.edu/downloads/spatialhadoop-2.4.2-bin.tar.gz
wget http://central.maven.org/maven2/org/mortbay/jetty/jetty-util/6.1.25/jetty-util-6.1.25.jar
wget http://central.maven.org/maven2/org/mortbay/jetty/jetty/6.1.5/jetty-6.1.5.jar

tar xzvf spatialhadoop-2.4.2-bin.tar.gz

rm spatialhadoop-2.4.2-bin.tar.gz

cp bin/shadoop /usr/local/hadoop/bin/

cp etc/hadoop/spatial-site.xml /usr/local/hadoop/etc/hadoop/
cp etc/hadoop/spatial-site.xml.template /usr/local/hadoop/etc/hadoop/
cp jetty-util-6.1.25.jar /usr/local/hadoop/share/hadoop/common/lib/
cp jetty-6.1.5.jar /usr/local/hadoop/share/hadoop/common/lib/
cp share/hadoop/common/lib/esri-geometry-api-1.2.1.jar /usr/local/hadoop/share/hadoop/common/lib/
cp share/hadoop/common/lib/javax.mail-1.5.5.jar /usr/local/hadoop/share/hadoop/common/lib/
cp share/hadoop/common/lib/javax.mail-api-1.5.5.jar /usr/local/hadoop/share/hadoop/common/lib/
cp share/hadoop/common/lib/jts-1.13.jar /usr/local/hadoop/share/hadoop/common/lib/
cp share/hadoop/common/lib/spatialhadoop-2.4.2.jar /usr/local/hadoop/share/hadoop/common/lib/

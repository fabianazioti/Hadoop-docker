#!/bin/bash


wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar xzvf apache-maven-3.6.0-bin.tar.gz 
mv apache-maven-3.6.0 /opt/ 
rm apache-maven-3.6.0-bin.tar.gz

export PATH=/opt/apache-maven-3.6.0/bin:$PATH

mkdir -p  ~/sthadoop/
cd ~/sthadoop/
git clone https://github.com/fabianazioti/st-hadoop.git 
cd st-hadoop 

mvn compile 
mvn assembly:assembly 
mv ./target/sthadoop-2.4.1-SNAPSHOT-uber.jar ./target/st-hadoop-uber.jar

scp ./target/st-hadoop-uber.jar hadoop-slave1:/root
scp ./target/sthadoop-2.4.1-SNAPSHOT-sources.jar hadoop-slave1:/root

scp ./target/st-hadoop-uber.jar hadoop-slave2:/root
scp ./target/sthadoop-2.4.1-SNAPSHOT-sources.jar hadoop-slave2:/root



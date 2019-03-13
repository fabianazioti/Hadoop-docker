#!/bin/bash

apt-get install -y unzip

mkdir -p  ~/sthadoop/
cd ~/sthadoop/
wget https://github.com/fabianazioti/st-hadoop/archive/master.zip

if [ ! -f master.zip ]; then
    echo "File st-hadoop not found!"

else

    unzip master.zip
    rm master.zip
    cd st-hadoop-master

    mvn compile
    mvn assembly:assembly

    mv ./target/sthadoop-2.4.1-SNAPSHOT-uber.jar ./target/st-hadoop-uber.jar

    scp ./target/st-hadoop-uber.jar hadoop-slave1:/root
    scp ./target/sthadoop-2.4.1-SNAPSHOT-sources.jar hadoop-slave1:/root

    scp ./target/st-hadoop-uber.jar hadoop-slave2:/root
    scp ./target/sthadoop-2.4.1-SNAPSHOT-sources.jar hadoop-slave2:/root

fi


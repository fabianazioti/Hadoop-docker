#!/bin/bash

mkdir -p ~/pigeon/

cd pigeon

# get PIGEON
wget http://spatialhadoop.cs.umn.edu/downloads/pigeon-0.2.0.jar
# CASO NAO TENHA O SPATIALHADOOP instalar as dependencias  
wget http://central.maven.org/maven2/com/vividsolutions/jts/1.8/jts-1.8.jar
wget http://central.maven.org/maven2/com/esri/geometry/esri-geometry-api/1.2.1/esri-geometry-api-1.2.1.jar

cp esri-geometry-api-1.2.1.jar /usr/lib/pig/pig-0.16.0/lib/
cp jts-1.8.jar /usr/lib/pig/pig-0.16.0/lib/
cp pigeon-0.2.0.jar /usr/lib/pig/pig-0.16.0/lib/

# lembrar de reiniciar o cluster


#pig -Dpig.additional.jars=/usr/local/hadoop/share/hadoop/common/lib/esri-geometry-api-1.2.1.jar
#pig -Dpig.additional.jars=/usr/local/hadoop/share/hadoop/common/lib/jts-1.8.jar
#pig -Dpig.additional.jars=/usr/local/hadoop/share/hadoop/common/lib/pigeon-0.2.1.jar



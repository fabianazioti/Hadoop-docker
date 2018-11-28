#!/bin/bash

mkdir -p ~/pigeon/

cd pigeon

# get PIGEON
wget http://spatialhadoop.cs.umn.edu/downloads/pigeon-0.2.1.jar


# CASO NAO TENHA O SPATIALHADOOP instalar as dependencias 
# third part JAR files that are required by Pigeon
wget http://central.maven.org/maven2/com/vividsolutions/jts/1.8/jts-1.8.jar

wget http://central.maven.org/maven2/com/esri/geometry/esri-geometry-api/1.2.1/esri-geometry-api-1.2.1.jar

cp esri-geometry-api-1.2.1.jar /usr/local/hadoop/share/hadoop/common/lib/

cp jts-1.8.jar /usr/local/hadoop/share/hadoop/common/lib/

cp pigeon-0.2.1.jar /usr/local/hadoop/share/hadoop/common/lib/

# lembrar de reiniciar o cluster

#testes
cp pigeon/esri-geometry-api-1.2.1.jar pig/pig-0.16.0/lib

cp pigeon/jts-1.8.jar pig/pig-0.16.0/lib

cp pigeon/pigeon-0.2.1.jar pig/pig-0.16.0/lib


pig -Dpig.additional.jars=pig/pig-0.16.0/lib/esri-geometry-api-1.2.1.jar
pig -Dpig.additional.jars=pig/pig-0.16.0/lib/jts-1.8.jar
pig -Dpig.additional.jars=pig/pig-0.16.0/lib/pigeon-0.2.1.jar



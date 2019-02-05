#!/bin/bash

HADOOP_VERSION=2.7.5
HADOOP_NETWORK=hadoop
HADOOP_CLUSTER_NAME=myhadoop

docker network create --driver=bridge $HADOOP_NETWORK

docker rm -f hadoop-master &> /dev/null
echo "Start hadoop-master container..."
docker run -itd \
                --net=$HADOOP_NETWORK \
                -p 8088:8088 \
                -p 50070:50070 \
		-p 50075:50075 \
		-p 50090:50090 \
                -p 19888:19888 \
                --name hadoop-master \
                --hostname hadoop-master \
                $HADOOP_CLUSTER_NAME:$HADOOP_VERSION &> /dev/null

# start hadoop slave1 container
docker rm -f hadoop-slave1 &> /dev/null
echo "Start hadoop-slave1 container..."
docker run -itd \
                --net=$HADOOP_NETWORK \
                --name hadoop-slave1 \
                --hostname hadoop-slave1 \
                $HADOOP_CLUSTER_NAME:$HADOOP_VERSION &> /dev/null

#  start hadoop slave container

docker rm -f hadoop-slave2 &> /dev/null
echo "Start hadoop-slave2 container..."
docker run -itd \
                --net=$HADOOP_NETWORK \
                --name hadoop-slave2 \
                --hostname hadoop-slave2 \
                $HADOOP_CLUSTER_NAME:$HADOOP_VERSION &> /dev/null

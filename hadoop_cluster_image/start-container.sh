#!/bin/bash

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                fzioti/hadoop:3.1.1 &> /dev/null

# start hadoop slave1 container
sudo docker rm -f hadoop-slave1 &> /dev/null
echo "start hadoop-slave1 container..."
sudo docker run -itd \
                --net=hadoop \
                --name hadoop-slave1 \
                --hostname hadoop-slave1 \
                fzioti/hadoop:3.1.1 &> /dev/null

#  start hadoop slave container

sudo docker rm -f hadoop-slave2 &> /dev/null
echo "start hadoop-slave2 container..."
sudo docker run -itd \
                --net=hadoop \
                --name hadoop-slave2 \
                --hostname hadoop-slave2 \
                fzioti/hadoop:3.1.1 &> /dev/null

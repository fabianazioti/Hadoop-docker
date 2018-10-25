#!/bin/bash

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 9870:9870 \
                -p 8088:8088 \
                -p 9864:9864 \
                -p 19888:19888 \
                -p 8042:8042 \
                -p 8888:8888 \
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

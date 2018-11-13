#!/bin/bash

sudo docker stop hadoop-master
sudo docker stop hadoop-slave1
sudo docker stop hadoop-slave2

sudo docker rm hadoop-master
sudo docker rm hadoop-slave1
sudo docker rm hadoop-slave2

sudo docker network rm hadoop

sudo docker rm $(docker ps -a -q)

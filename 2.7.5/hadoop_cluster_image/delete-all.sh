#!/bin/bash

docker container stop hadoop-master

docker container stop hadoop-slave1

docker container stop hadoop-slave2


docker container rm hadoop-slave1

docker container rm hadoop-slave2

docker container rm hadoop-master

docker network rm hadoop



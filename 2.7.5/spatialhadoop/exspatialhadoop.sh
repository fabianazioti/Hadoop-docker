#!/bin/bash

docker cp install-spatialhadoop.sh hadoop-master:/root/
docker cp install-spatialhadoop.sh hadoop-slave1:/root/
docker cp install-spatialhadoop.sh hadoop-slave2:/root/

docker exec hadoop-master chmod +x install-spatialhadoop.sh
docker exec hadoop-slave1 chmod +x install-spatialhadoop.sh
docker exec hadoop-slave2 chmod +x install-spatialhadoop.sh

docker exec hadoop-master ./install-spatialhadoop.sh
docker exec hadoop-slave1 ./install-spatialhadoop.sh
docker exec hadoop-slave2 ./install-spatialhadoop.sh


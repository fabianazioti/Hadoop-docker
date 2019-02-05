#!/bin/bash

docker cp install-pigeon.sh hadoop-master:/root/
docker cp install-pigeon.sh hadoop-slave1:/root/
docker cp install-pigeon.sh hadoop-slave2:/root/

docker exec hadoop-master chmod +x install-pigeon.sh
docker exec hadoop-slave1 chmod +x install-pigeon.sh
docker exec hadoop-slave2 chmod +x install-pigeon.sh

docker exec hadoop-master ./install-pigeon.sh
docker exec hadoop-slave1 ./install-pigeon.sh
docker exec hadoop-slave2 ./install-pigeon.sh


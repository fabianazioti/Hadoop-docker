sudo docker build --tag fzioti/hadoop:3.1.1 .

sudo docker network create --driver=bridge hadoop

sudo ./start-container.sh

sudo docker exec -it hadoop-master bash

./start-container.sh

sudo docker stop hadoop:3.1.1
sudo docker rm hadoop:3.1.1 
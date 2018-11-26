# Install Hadoop Cluster

This sample has 3 Nodes: 1 Namenode and 2 Datanode


- Builds Docker image from a Dockerfile:
   ```sh
    docker build --tag fzioti/hadoop:3.1.1 .
    ```

- Create a **hadoop** network
   ```sh
    docker network create --driver=bridge hadoop
    ```

- Start containers
   ```sh
    sudo ./start-container.sh
   ```

OK!! Now you can..

```sh
 sudo docker exec -it hadoop-master bash
 ./start-container.sh
```


## Install SpatialHadoop

- Copy file into containers:
  ```sh
  docker cp install-spatialhadoop.sh hadoop-master:/root/
  chmod +x install-spatialhadoop.sh
  ```

- Restart the cluster
  ```sh
  stop-all.sh
  start-all.sh
  ```
- Usage examples (from spatialhadoop)
  ```sh
  shadoop generate test mbr:0,0,1000000,1000000 size:1.gb shape:rect
  hadoop fs -ls
  ```

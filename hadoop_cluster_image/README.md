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

### Usage examples (from spatialhadoop wiki)
To generate a 1 GB file that contains rectangles, run the command

```sh
shadoop generate test.rects size:1.gb shape:rect mbr:0,0,1000000,1000000
```

Build a grid index over the generated file

```sh
shadoop index test.rects sindex:grid test.grid shape:rect
```

Run a range query that selects rectangles overlapping the query area defined by the box with the two corners (10, 20) and (2000, 3000). Results are stored in the output file rangequery.out

```sh
shadoop rangequery test.grid rect:10,10,2000,3000 rangequery.out shape:rect
```

```sh
hadoop fs -ls
```

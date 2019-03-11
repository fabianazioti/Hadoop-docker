# Install SpatialHadoop Cluster

This sample has 3 Nodes: 1 Namenode and 2 Datanode

### Docker-Machine

Start docker-machine

  ```sh
    docker-machine create --driver virtualbox spatialhadoop1
    docker-machine create --driver virtualbox spatialhadoop2
    docker-machine create --driver virtualbox spatialhadoop3
  ```

Create a swarm and attach all hosts. On the master host (spatialhadoop1) type the following command in the terminal

  ```ssh
    docker swarm init --advertise-addr <ip>
  ```

  spatialhadoop1 is now Leader

This command will show the command that you must use in the others hosts (spatialhadoop2 and spatialhadoop3):

  ```ssh
    docker swarm join --token <token>
  ```

In order to create the overlay network, type the following command on the spatialhadoop1:

  ```sh
    docker network create -d overlay --attachable hadoop_net
  ```

Also you can create volumes:

  ```ssh
    docker volume create hadoop-data
  ```

In order to run the SpatialHadoop Instance on spatialhadoop1, type the following command on the spatialhadoop1:

```ssh
docker run -itd --net=hadoop_net \
              -p 0.0.0.0:8088:8088 \
              -p 0.0.0.0:50070:50070 \
              --name hadoop-master \
              --hostname hadoop-master \
              -v hadoop-data:/home/root/hdfs/datanode \
              -v hadoop-data:/home/root/hdfs/namenode \
              fzioti/spatialhadoop:2.7.5
```

### Usage examples (from spatialhadoop wiki)
To generate a 1 GB file that contains rectangles, run the command

```sh
shadoop generate test mbr:0,0,1000000,1000000 size:1.gb shape:rect
```

Build a grid index over the generated file

```sh
shadoop index test test.grid mbr:0,0,1000000,1000000 sindex:grid shape:rect
```

Run a range query that selects rectangles overlapping the query area defined by the box with the two corners (10, 20) and (2000, 3000). Results are stored in the output file rangequery.out

```sh
shadoop rangequery test.grid rq_results rect:500,500,1000,1000 shape:rect
```

To see how the grid index partitions this file, type:

```sh
shadoop readfile test.grid
```

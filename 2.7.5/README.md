# Install Hadoop Cluster

This sample has 3 Nodes: 1 Namenode and 2 Datanode


- Builds Docker image from a Dockerfile.
   ```sh
   cd hadoop_cluster_image
   docker build --tag myhadoop:2.7.5 .
    ```
## Instal PIG (Create Pig Image)
   ```sh
   cd pig
   ./start-container.sh
   ```

## Install SpatialHadoop

- Copy file into containers:
  ```sh
  ./exspatialhadoop.sh
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

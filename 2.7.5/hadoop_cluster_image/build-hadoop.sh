#!/bin/bash

HADOOP_CLUSTER_NAME=hadoop-cluster
HADOOP_VERSION=2.7.5

docker build --tag $HADOOP_CLUSTER_NAME:$HADOOP_VERSION .

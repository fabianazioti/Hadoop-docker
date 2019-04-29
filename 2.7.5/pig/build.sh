#!/bin/bash

PIG_CLUSTER_NAME=pig-hadoop-cluster
HADOOP_VERSION=2.7.5

docker build --tag $PIG_CLUSTER_NAME:$HADOOP_VERSION .

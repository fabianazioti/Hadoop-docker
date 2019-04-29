#!/bin/bash

SPATIAL_CLUSTER_NAME=spatialhadoop-cluster
HADOOP_VERSION=2.7.5

docker build --tag $SPATIAL_CLUSTER_NAME:$HADOOP_VERSION .

FROM pig-hadoop-cluster:2.7.5
         
WORKDIR /root

RUN wget -qO- http://spatialhadoop.cs.umn.edu/downloads/spatialhadoop-2.3-2.tar.gz | tar --directory $HADOOP_HOME -xvz

RUN cd $HADOOP_HOME/share/hadoop/common/lib/ && \
    wget http://spatialhadoop.cs.umn.edu/downloads/pigeon-0.2.0.jar


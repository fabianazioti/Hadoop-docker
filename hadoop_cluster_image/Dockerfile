# sudo docker build --tag fzioti/hadoop:3.1.1 .
# sudo docker network create --driver=bridge hadoop

# get into hadoop master container
#sudo docker exec -it hadoop-master bash

FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update
#RUN apt-get install -y ssh
RUN apt-get install -y openssh-server
RUN apt-get install -y wget
RUN apt-get install -y rsync
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y nano
RUN apt-get install -y install ant

# set environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Download and install Hadoop
RUN wget http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz && \
    tar -xzvf hadoop-3.1.1.tar.gz && \
    mv hadoop-3.1.1 /usr/local/hadoop && \
    rm hadoop-3.1.1.tar.gz

RUN mkdir -p ~/hdfs/namenode && \
    mkdir -p ~/hdfs/datanode

RUN mkdir $HADOOP_HOME/logs

COPY config/* /tmp/

RUN mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/slaves && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    mv /tmp/run-wordcount.sh ~/run-wordcount.sh

RUN chmod +x ~/start-hadoop.sh && \
    chmod +x ~/run-wordcount.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format

CMD [ "sh", "-c", "service ssh start; bash"]

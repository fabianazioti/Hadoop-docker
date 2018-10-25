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
RUN apt-get install -y ant

# set environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/usr/local/hadoop
ENV PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Download and install Hadoop
RUN wget https://www.apache.org/dist/hadoop/core/hadoop-3.1.1/hadoop-3.1.1.tar.gz && \
    tar -xzvf hadoop-3.1.1.tar.gz && \
    mv hadoop-3.1.1 /usr/local/hadoop && \
    rm hadoop-3.1.1.tar.gz

RUN mkdir -p ~/hdfs/namenode && \
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs
    
# RUN for user in hadoop hdfs yarn mapred hue; do \
#          useradd -U -M -d /opt/hadoop/ --shell /bin/bash ${user}; \
#     done && \
#     for user in root hdfs yarn mapred hue; do \
#         usermod -G hadoop ${user}; \
#     done && \
#     echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
#     echo "export HDFS_DATANODE_USER=root" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
#     echo "export HDFS_DATANODE_SECURE_USER=hdfs" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
#     echo "export HDFS_NAMENODE_USER=root" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
#     echo "export HDFS_SECONDARYNAMENODE_USER=root" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
#     echo "export YARN_RESOURCEMANAGER_USER=root" >> $HADOOP_HOME/etc/hadoop/yarn-env.sh && \
#     echo "export YARN_NODEMANAGER_USER=root" >> $HADOOP_HOME/etc/hadoop/yarn-env.sh && \
#     echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc

# ssh without key
RUN rm ~/.ssh/id_rsa
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys


COPY config/* /tmp/

COPY config/ssh_config       /tmp/
COPY config/hadoop-env.sh    /tmp/
COPY config/hdfs-site.xml    /tmp/
COPY config/core-site.xml    /tmp/
COPY config/yarn-site.xml    /tmp/
COPY config/mapred-site.xml  /tmp/
COPY config/slaves           /tmp/


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

EXPOSE 9870
EXPOSE 8088

CMD [ "sh", "-c", "service ssh start; bash"]

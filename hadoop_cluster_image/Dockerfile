# sudo docker build --tag fzioti/hadoop:3.1.1 .

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y --reinstall build-essential
RUN apt-get install -y ssh
RUN apt-get install -y rsync
RUN apt-get install -y vim
RUN apt-get install -y net-tools
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y python2.7-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libkrb5-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libldap2-dev
RUN apt-get install -y python-lxml
RUN apt-get install -y libxslt1-dev
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libmysqlclient-dev

# set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# passwordless ssh
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys

RUN echo "Port 2122" >> /etc/ssh/sshd_config

# Download Hadoop 
RUN wget -O hadoop.tar.gz http://ftp.unicamp.br/pub/apache/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz && \
tar -xzf hadoop.tar.gz -C /usr/local/ && rm hadoop.tar.gz

# create a soft link to make it transparent when upgrade Hadoop
RUN ln -s /usr/local/hadoop-2.7.4 /usr/local/hadoop

# set Hadoop enviroments
ENV HADOOP_HOME /usr/local/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

ENV HADOOP_PREFIX $HADOOP_HOME
ENV HADOOP_COMMON_HOME $HADOOP_HOME
ENV HADOOP_HDFS_HOME $HADOOP_HOME
ENV HADOOP_MAPRED_HOME $HADOOP_HOME
ENV HADOOP_YARN_HOME $HADOOP_HOME
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

# add default config files which has one master and three slaves
ADD configs/*xml $HADOOP_HOME/etc/hadoop/
ADD configs/slaves $HADOOP_HOME/etc/hadoop/slaves

# copy ssh config
ADD configs/ssh_config /root/.ssh/config

# update JAVA_HOME and HADOOP_CONF_DIR in hadoop-env.sh
RUN echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    echo "export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop/" >> $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh && \
    echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc

ADD bootstrap.sh /etc/bootstrap.sh

CMD bash /etc/bootstrap.sh


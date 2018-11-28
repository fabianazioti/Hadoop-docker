# Install PIG

#!/bin/bash

#verificar as pastas corretas de instalacao

#https://blog.knoldus.com/apache-pig-installation-and-connect-with-hadoop-cluster/
mkdir -p ~/pig/

cd pig

wget http://www-us.apache.org/dist/pig/pig-0.16.0/pig-0.16.0.tar.gz

tar -xzf pig-0.16.0.tar.gz 

rm pig-0.16.0.tar.gz

# arquivo .bashrc add variaveis

nano ~/.bashrc

export PIG_HOME="/root/pig/pig-0.16.0"
export PIG_CONF_DIR="$PIG_HOME/conf"
export PIG_CLASSPATH="$PIG_CONF_DIR"
export PATH="$PIG_HOME/bin:$PATH"

source .bashrc

RUN     echo "PATH=$PATH:$HADOOP_HOME/bin" >> ~/.bashrc


echo "PIG_HOME=$PIG_HOME:/root/pig/pig-0.16.0" >> ~/.bashrc
echo "PIG_CONF_DIR=$PIG_CONF_DIR:$PIG_HOME/conf" >> ~/.bashrc
echo "PIG_CLASSPATH=$PIG_CLASSPATH:$PIG_CONF_DIR" >> ~/.bashrc
echo "PATH=$PATH:$PIG_HOME/bin:$PATH" >> ~/.bashrc

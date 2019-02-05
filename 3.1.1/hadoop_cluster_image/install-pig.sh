#!/bin/bash

mkdir -p /usr/lib/pig/

cd /usr/lib/pig/

wget http://www-us.apache.org/dist/pig/pig-0.16.0/pig-0.16.0.tar.gz

tar -xzf pig-0.16.0.tar.gz 

rm pig-0.16.0.tar.gz

# arquivo .bashrc add variaveis

#nano ~/.bashrc

#export PIG_HOME="/usr/lib/pig/pig-0.16.0"
#export PIG_CONF_DIR="$PIG_HOME/conf"
#export PIG_CLASSPATH="$PIG_CONF_DIR"
#export PATH="$PIG_HOME/bin:$PATH"

# source ~/.bashrc

echo "PIG_HOME=$PIG_HOME:/usr/lib/pig/pig-0.16.0" >> ~/.bashrc
echo "PIG_CONF_DIR=$PIG_CONF_DIR:$PIG_HOME/conf" >> ~/.bashrc
echo "PIG_CLASSPATH=$PIG_CLASSPATH:$PIG_CONF_DIR" >> ~/.bashrc
echo "PATH="$PIG_HOME/bin:$PATH" >> ~/.bashrc


# lembrar de reiniciar o cluster

FROM pig-hadoop-cluster:2.7.5

RUN apt-get install -y sudo \
    && sudo apt-get update

RUN sudo apt-get install -y python3 python3-pip \
    && pip3 install --upgrade pip \
    && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
RUN pip3 install hdfs \
    && rm -rf ~/.cache/pip

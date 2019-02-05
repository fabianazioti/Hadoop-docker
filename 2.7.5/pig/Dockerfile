FROM myhadoop:2.7.5
         
WORKDIR /root


ENV PIG_HOME=$PIG_HOME/usr/lib/pig/pig-0.16.0
ENV PIG_CONF_DIR=$PIG_CONF_DIR$PIG_HOME/conf
ENV PIG_CLASSPATH=$PIG_CLASSPATH$PIG_CONF_DIR

RUN mkdir -p /usr/lib/pig/ && \
    cd /usr/lib/pig/ && \
    wget http://www-us.apache.org/dist/pig/pig-0.16.0/pig-0.16.0.tar.gz && \
    tar -xzf pig-0.16.0.tar.gz && \
    rm pig-0.16.0.tar.gz

RUN echo "export PIG_HOME=$PIG_HOME ">> ~/.bashrc && \
    echo "export PIG_CONF_DIR="$PIG_CONF_DIR"" >> ~/.bashrc && \
    echo "export PIG_CLASSPATH="$PIG_CLASSPATH"" >> ~/.bashrc && \
    echo "export PATH="$PIG_HOME/bin:$PATH"" >>  ~/.bashrc

RUN /bin/bash -c "source ~/.bashrc"


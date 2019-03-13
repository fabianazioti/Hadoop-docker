#!/bin/bash

echo "Download Maven File"

wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz

if [ ! -f apache-maven-3.6.0-bin.tar.gz ]; then
    echo "File not found!"
fi

else
    echo "Instalando o Maven .."
    
    tar xzvf apache-maven-3.6.0-bin.tar.gz 
    mv apache-maven-3.6.0 /opt/ 
    rm apache-maven-3.6.0-bin.tar.gz

    export PATH=/opt/apache-maven-3.6.0/bin:$PATH

    mvn -v
    
    if [ $? -eq 0 ]; then
        echo "Maven Instalado com SUCESSO!"
    else
        echo FAIL
    fi

fi

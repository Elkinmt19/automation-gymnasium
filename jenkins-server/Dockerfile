FROM jenkins/jenkins:lts

USER root

COPY requirements.txt /tmp/requirements.txt
COPY install_docker_in_jenkins.sh /tmp/docker_install.sh

RUN apt-get update && apt install -y wget && \
    apt install -y build-essential && \
    apt install -y zlib1g-dev && \
    apt install -y libncurses5-dev && \
    apt install -y libgdbm-dev && \
    apt install -y libnss3-dev && \
    apt install -y libssl-dev && \
    apt install -y libsqlite3-dev && \
    apt install -y libreadline-dev && \
    apt install -y libffi-dev && \
    apt install -y curl && \
    apt install -y libbz2-dev

RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz && \
    tar -xf Python-3.9.1.tgz && cd Python-3.9.1 && \
    ./configure --enable-optimizations && make -j 2 && make altinstall

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3.9 get-pip.py && \
    pip install -r /tmp/requirements.txt --upgrade

RUN sh /tmp/docker_install.sh

USER jenkins
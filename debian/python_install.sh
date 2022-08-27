#!/bin/bash

PYTHON_VERSION=$1

apt update -y
apt upgrade -y

# install python
apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y

cd /tmp
wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz

tar -xf Python-${PYTHON_VERSION}.tgz
cd Python-${PYTHON_VERSION}
./configure --enable-optimizations
make -j 4
make install
update-alternatives --install /usr/bin/python python /usr/bin/python3.10
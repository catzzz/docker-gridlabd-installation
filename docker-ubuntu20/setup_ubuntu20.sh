#!/bin/bash

# Install needed system tools
# update first
apt-get -q update
apt-get -q install tzdata -y

# install system build tools needed by gridlabd
apt-get -q install git -y
apt-get -q install unzip -y
apt-get -q install autoconf -y
apt-get -q install libtool -y
apt-get -q install g++ -y
apt-get -q install cmake -y 
apt-get -q install flex -y
apt-get -q install bison -y
apt-get -q install libcurl4-gnutls-dev -y
apt-get -q install libncurses5-dev -y
apt-get -q install liblzma-dev -y
apt-get -q install libssl-dev -y
apt-get -q install libbz2-dev -y
apt-get -q install libffi-dev -y
apt-get -q install zlib1g-dev -y



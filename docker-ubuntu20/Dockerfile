FROM ubuntu:20.04

# Install needed system tools
# update first
RUN apt-get -q update
RUN apt-get -q install tzdata -y


RUN apt-get -q install software-properties-common -y
RUN apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl -y


RUN apt-get install xz-utils libbz2-dev -y
RUN apt-get install gcc -y

RUN apt-get install cmake -y 
RUN apt-get install libncursesw5-dev -y

RUN apt-get install curl -y
RUN apt-get -q install git -y
RUN apt-get -q install unzip -y
RUN apt-get -q install autoconf -y
RUN apt-get -q install libtool -y
RUN apt-get -q install g++ -y
RUN apt-get -q install cmake -y 
RUN apt-get -q install flex -y
RUN apt-get -q install bison -y
RUN apt-get -q install libcurl4-gnutls-dev -y
RUN apt-get -q install libncurses5-dev -y
RUN apt-get -q install subversion -y
RUN apt-get -q install util-linux -y
RUN apt-get install liblzma-dev -y

WORKDIR "/usr/local/src"
# Install python 3.9.6
RUN curl https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz > Python-3.9.6.tgz
RUN tar xzf Python-3.9.6.tgz 

WORKDIR "/usr/local/src/Python-3.9.6"
#RUN ./configure --enable-optimizations --enable-shared CXXFLAGS="-fPIC"
RUN ./configure --prefix=/usr/local --enable-optimizations --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions CFLAGS="-fPIC"

RUN make -j10
RUN make altinstall
RUN /sbin/ldconfig /usr/local/lib
RUN ln -sf /usr/local/bin/python3.9 /usr/local/bin/python3
RUN ln -sf /usr/local/bin/python3.9-config /usr/local/bin/python3-config
RUN ln -sf /usr/local/bin/pydoc3.9 /usr/local/bin/pydoc
RUN ln -sf /usr/local/bin/idle3.9 /usr/local/bin/idle
RUN ln -sf /usr/local/bin/pip3.9 /usr/local/bin/pip3
RUN /usr/local/bin/python3 -m pip install matplotlib Pillow pandas numpy networkx pytz pysolar PyGithub scikit-learn xlrd boto3
RUN /usr/local/bin/python3 -m pip install IPython censusdata
WORKDIR "/usr/local/src"
RUN rm -f Python-3.9.6.tgz
RUN pip3 install --upgrade pip

RUN export PYTHONPATH="."
RUN export PATH=/usr/local/bin:$PATH
RUN export MAKEFLAGS=-j20
RUN export PYTHONSETUPFLAGS="-j 20"


# install python libraries by validation


# install system build tools needed by gridlabd
# RUN apt-get -q install git -y
# RUN apt-get -q install unzip -y
# RUN apt-get -q install autoconf -y
# RUN apt-get -q install libtool -y
# RUN apt-get -q install g++ -y
# RUN apt-get -q install cmake -y 
# RUN apt-get -q install flex -y
# RUN apt-get -q install bison -y
# RUN apt-get -q install libcurl4-gnutls-dev -y
# RUN apt-get -q install libncurses5-dev -y
# RUN apt-get -q install subversion -y
# RUN apt-get -q install libbz2-dev -y

# doxgygen
# RUN apt-get -q install gawk -y

# WORKDIR "/usr/local/src/doxygen"
# RUN	git clone https://github.com/doxygen/doxygen.git /usr/local/src/doxygen
# WORKDIR "/usr/local/src/doxygen/build"
# RUN cmake -G "Unix Makefiles" ..
# RUN make
# RUN make install

# # mono
# WORKDIR "/tmp"ls
# RUN apt install apt-transport-https dirmngr gnupg ca-certificates -y
# RUN	echo "deb http://download.mono-project.com/repo/ubuntu wheezy/snapshots/4.8.0 main" | tee /etc/apt/sources.list.d/mono-official.list
# RUN apt-get -q install mono-devel -y


# clone gridlabd 
WORKDIR "/usr/local/src/"
RUN git clone https://github.com/slacgismo/gridlabd
WORKDIR "/usr/local/src/gridlabd"
RUN autoreconf -isf && ./configure
RUN make system
RUN /usr/local/bin/python3 -m pip install --upgrade numpy
FROM centos
# Install needed system tools
RUN yum clean all
RUN yum groupinstall "Development Tools" -y
RUN yum install cmake -y 
RUN yum install ncurses-devel -y
RUN yum install epel-release -y
RUN yum install curl-devel -y
RUN yum install which -y
RUN yum install svn -y





RUN yum install 'dnf-command(config-manager)' -y

#RUN yum config-manager --set-enabled PowerTools # error
#RUN yum install armadillo-devel -y #error

# change directory
WORKDIR "/usr/local/src"
RUN yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel  xz-devel  -y

# Install python 3.9.6
RUN curl https://www.python.org/ftp/python/3.9.6/Python-3.9.6.tgz > Python-3.9.6.tgz
RUN tar xzf Python-3.9.6.tgz 
WORKDIR "/usr/local/src/Python-3.9.6"
RUN ./configure --prefix=/usr/local --enable-optimizations --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions CFLAGS="-fPIC"
RUN make -j 10
RUN make altinstall
RUN /sbin/ldconfig /usr/local/lib
RUN ln -sf /usr/local/bin/python3.9 /usr/local/bin/python3
RUN ln -sf /usr/local/bin/python3.9-config /usr/local/bin/python3-config
RUN ln -sf /usr/local/bin/pydoc3.9 /usr/local/bin/pydoc
RUN ln -sf /usr/local/bin/idle3.9 /usr/local/bin/idle
RUN ln -sf /usr/local/bin/pip3.9 /usr/local/bin/pip3
RUN /usr/local/bin/python3 -m pip install matplotlib Pillow pandas numpy networkx pytz pysolar PyGithub scikit-learn xlrd boto3
RUN /usr/local/bin/python3 -m pip install IPython censusdata
WORKDIR /usr/local/src
RUN rm -f Python-3.9.6.tgz
RUN pip3 install --upgrade pip

RUN export PYTHONPATH="."
RUN export PATH=/usr/local/bin:$PATH
RUN export MAKEFLAGS=-j20
RUN export PYTHONSETUPFLAGS="-j 20"
# clone gridlabd 
RUN git clone https://github.com/slacgismo/gridlabd
WORKDIR "/usr/local/src/gridlabd"
RUN autoreconf -isf && ./configure
RUN make system
RUN /usr/local/bin/python3 -m pip install --upgrade numpy
#RUN gridlabd -T 4 --validate

#printenv
# LANG=en_US.UTF-8
# HOSTNAME=546345b9afe4
# which_declare=declare -f
# PWD=/usr/local/src/gridlabd
# HOME=/root
# TERM=xterm
# SHLVL=1
# PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# LESSOPEN=||/usr/bin/lesspipe.sh %s
# BASH_FUNC_which%%=() {  ( alias;
#  eval ${which_declare} ) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot "$@"
# }
# _=/usr/bin/printenv

#gcc version
#gcc version 8.5.0 20210514 (Red Hat 8.5.0-4) (GCC) 

# [root@a0d7a8cc915b gridlabd]# g++ -v
# Using built-in specs.
# COLLECT_GCC=g++
# COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/8/lto-wrapper
# OFFLOAD_TARGET_NAMES=nvptx-none
# OFFLOAD_TARGET_DEFAULT=1
# Target: x86_64-redhat-linux
# Configured with: ../configure --enable-bootstrap --enable-languages=c,c++,fortran,lto --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --with-bugurl=http://bugzilla.redhat.com/bugzilla --enable-shared --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --with-gcc-major-version-only --with-linker-hash-style=gnu --enable-plugin --enable-initfini-array --with-isl --disable-libmpx --enable-offload-targets=nvptx-none --without-cuda-driver --enable-gnu-indirect-function --enable-cet --with-tune=generic --with-arch_32=x86-64 --build=x86_64-redhat-linux
# Thread model: posix
# gcc version 8.5.0 20210514 (Red Hat 8.5.0-4) (GCC) 

#GNU Make 4.2.1
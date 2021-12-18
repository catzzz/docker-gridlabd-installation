#docker run -i -t debian /bin/bash
# v11
# Install needed system tools
# install nano

apt-get clean all
#apt-get groupinstall "Development Tools" -y
apt update
apt upgrade
apt install build-essential -y
apt-get install cmake -y 
apt-get install ncurses-devel -y
apt-get install epel-release -y
apt-get install curl-devel -y
apt-get install which -y
apt-get install svn -y
apt-get -q install tzdata -y

apt-get install xz-utils libbz2-dev zlib1g-dev libffi-dev -y
apt-get install libssl-dev gcc -y

apt-get install 'dnf-command(config-manager)' -y
apt-get config-manager --set-enabled PowerTools
apt-get install armadillo-devel -y

cd /usr/local/src

curl https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz > Python-3.9.0.tgz
tar xzf Python-3.9.0.tgz 
cd Python-3.9.0 
./configure --prefix=/usr/local --enable-optimizations --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions CFLAGS="-fPIC"
make -j $(nproc)
make altinstall
/sbin/ldconfig /usr/local/lib
ln -sf /usr/local/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/bin/python3.9-config /usr/local/bin/python3-config
ln -sf /usr/local/bin/pydoc3.9 /usr/local/bin/pydoc
ln -sf /usr/local/bin/idle3.9 /usr/local/bin/idle
ln -sf /usr/local/bin/pip3.9 /usr/local/bin/pip3
/usr/local/bin/python3 -m pip install matplotlib Pillow pandas numpy networkx pytz pysolar PyGithub scikit-learn xlrd boto3
#extra installation
/usr/local/bin/python3 -m pip install IPython censusdata
cd /usr/local/src
rm -f Python-3.9.0.tgz
pip3 install --upgrade pip
# fix RuntimeError: module compiled against API version 0xe but this version of numpy is 0xd
#4281
pip3 install --upgrade numpy

# add path 
echo "setup PATH PYTHONPATH="." PATH=/usr/local/bin:$PATH"
export PYTHONPATH="."
export PATH=/usr/local/bin:$PATH
export MAKEFLAGS=-j20
export PYTHONSETUPFLAGS="-j 20"
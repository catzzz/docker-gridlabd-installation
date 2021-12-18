
# Install needed system tools
yum clean all
yum groupinstall "Development Tools" -y
yum install cmake -y 
yum install ncurses-devel -y
yum install epel-release -y
yum install curl-devel -y
yum install which -y
yum install svn -y

yum install xz-devel bzip2-devel zlib-devel -y
yum install openssl-devel -y

yum install 'dnf-command(config-manager)' -y
yum config-manager --set-enabled PowerTools
yum install armadillo-devel -y

cd /usr/local/src
yum install gcc openssl-devel bzip2-devel libffi-devel zlib-devel -y
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
cd /usr/local/src
rm -f Python-3.9.0.tgz
pip3 install --upgrade pip
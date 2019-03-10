VERSION='9.5.13'
USER=$(whoami)
DB_PATH='/users/'${USER}'/postgresql'

sudo apt-get update
sudo apt-get --assume-yes install libreadline-dev
sudo apt-get --assume-yes install python-pip
sudo apt-get --assume-yes install zlib1g-dev
wget https://ftp.postgresql.org/pub/source/v${VERSION}/postgresql-${VERSION}.tar.gz
tar -zxvf postgresql-${VERSION}.tar.gz
cd postgresql-${VERSION}
./configure --prefix=${DB_PATH}
sudo make
sudo make install

path='$PATH'
echo "export PATH=${DB_PATH}/bin:${path}" >> ~/.bashrc

sudo chown ${USER} ${DB_PATH}
echo "To use psql run: source ~/.bashrc"

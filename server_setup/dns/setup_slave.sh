### FOR EC2 SETUP ONLY, COMMENT IN OTHER CASES###
### Install EFS
# if cd efs-utils; then git pull; else git clone https://github.com/aws/efs-utils; fi &&
# sudo apt-get -y install binutils && 
# cd efs-utils && 
# ./build-deb.sh && 
# sudo apt-get -y install ./build/amazon-efs-utils*deb &&
# sudo mkdir -p /mnt/efs && 
# sudo chown -R ubuntu:ubuntu /mnt/efs &&
# sudo mount -t efs fs-ed942acc /mnt/efs
#################################################

sudo apt-get update
sudo apt-get --assume-yes install vim
sudo apt-get --assume-yes install tmux
sudo apt-get --assume-yes install build-essential automake


git clone https://github.com/secdev/scapy

sed -ie 's/r.answers/True or r.answers/g' scapy/scapy/sendrecv.py
pushd scapy
sudo -H python setup.py install
popd
sudo apt-get --assume-yes install python-pip python-numpy
sudo apt-get --assume-yes install  python-numpy
sudo apt-get --assume-yes install  python-scapy
sudo apt-get --assume-yes install  python-yaml
sudo pip install dnspython
sudo pip install numpy-indexed

sudo apt-get --assume-yes install python3-pip
sudo apt-get --assume-yes install python3-numpy
sudo apt-get --assume-yes install python3-networkx
sudo apt-get --assume-yes install python3-matplotlib
sudo apt-get --assume-yes install python3-dnspython
sudo apt-get --assume-yes install python3-sqlalchemy
sudo apt-get --assume-yes install python3-psycopg2
sudo pip3  install scapy 
sudo pip3 install --upgrade numpy

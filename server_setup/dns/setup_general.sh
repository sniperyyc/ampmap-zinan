### FOR EC2 SETUP ONLY, COMMENT IN OTHER CASES###
### Install EFS
# sudo apt-get update &&
# sudo apt-get install -y stunnel4 &&
# if ! [ -d "efs-utils" ]; then
#   git clone https://github.com/aws/efs-utils
# fi &&
# sudo apt-get -y install binutils && 
# cd efs-utils && 
# ./build-deb.sh && 
# sudo apt-get -y install ./build/amazon-efs-utils*deb &&
# sudo mkdir -p /mnt/efs && 
# sudo chown -R ubuntu:ubuntu /mnt/efs &&
# sudo mount -t efs fs-0fe713fe /mnt/efs
#################################################

#NTPVER='ntp-4.2.4p8'
#INITD_SCRIPT='ddosamplification/ntp/server_setup/init_d_ntp'
#NTPCONF='ddosamplification/ntp/server_setup/ntp_big.conf'
#LOCAL_IP=`ifconfig | grep Bcast | tr -s ' ' |  cut -d' ' -f4 | cut -d':' -f2`
#NET_MASK=`ifconfig | grep Bcast | tr -s ' '     | cut -d' ' -f5 | cut -d':' -f2`

sudo apt-get update
sudo apt-get --assume-yes install vim
sudo atp-get --assume-yes install tmux
#sudo apt-get --assume-yes remove ntp ntpdate
sudo apt-get --assume-yes install build-essential automake


# sudo apt-get --assume-yes install python-pip python-numpy
# sudo apt-get --assume-yes install  python-numpy
# sudo apt-get --assume-yes install  python-scapy
# sudo apt-get --assume-yes install  python-yaml
# sudo pip install dnspython
# sudo pip install numpy-indexed


sudo apt-get --assume-yes install python3-pip
sudo apt-get --assume-yes install python3-numpy
sudo apt-get --assume-yes install python3-networkx
sudo apt-get --assume-yes install python3-matplotlib
sudo apt-get --assume-yes install python3-dnspython
sudo apt-get --assume-yes install python3-sqlalchemy
sudo apt-get --assume-yes install python3-psycopg2
sudo apt-get --assume-yes install python3-setuptools

pip3 uninstall -y scapy
sudo pip3 uninstall -y scapy

sudo pip3 install --upgrade setuptools

git clone https://github.com/secdev/scapy
sed -ie 's/r.answers/True or r.answers/g' scapy/scapy/sendrecv.py
pushd scapy
sudo -H python3 setup.py install
popd

#sudo pip3  install scapy 
sudo pip3 install --upgrade numpy
sudo apt-get --assume-yes install python3-pandas
sudo pip3 install -U scikit-learn
sudo pip3 install pandas --upgrade
sudo pip3 install  python3 --upgrade

# sudo add-apt-repository -y ppa:jonathonf/python-3.6
# sudo apt-get update
# sudo apt-get --assume-yes install python3.6
# sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1

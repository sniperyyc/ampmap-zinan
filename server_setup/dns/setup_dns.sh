LOCAL_IP=`ifconfig | grep Bcast | tr -s ' ' |  cut -d' ' -f4 | cut -d':' -f2`
NET_MASK=`ifconfig | grep Bcast | tr -s ' '     | cut -d' ' -f5 | cut -d':' -f2`

sudo apt-get update
sudo apt-get --assume-yes install vim
sudo apt-get --assume-yes install tmux
sudo apt-get --assume-yes install bind9 bind9utils bind9-doc
sudo apt-get --assume-yes install python-pip
sudo apt-get --assume-yes install python-numpy



git clone https://github.com/secdev/scapy

sed -ie 's/r.answers/True or r.answers/g' scapy/scapy/sendrecv.py
pushd scapy
sudo -H python setup.py install
popd

git clone https://github.com/soojinm/ampmap-code.git
pushd ampmap-code
pushd server_setup
pushd dns
sudo cp named.conf.options /etc/
sudo cp resolv.conf /etc/
sudo named-checkconf
sudo service bind9 restart

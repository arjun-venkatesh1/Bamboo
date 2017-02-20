#!/bin/bash

# bamboo
mkdir /opt/atlassian
wget -O /opt/atlassian/bamboo.tar.gz http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-5.1.1.tar.gz
cd /opt/atlassian
tar xzf bamboo.tar.gz
mv atlassian* bamboo

mkdir /home/bamboo

echo "bamboo.home=/home/bamboo" >> /opt/atlassian/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

# java
sudo echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -y install python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java7-installer


/opt/atlassian/bamboo/bin/start-bamboo.sh

ssh-keygen

add-apt-repository -y ppa:ondrej/php5
apt-get update
apt-get install php5-cli php5-curl php5-mcrypt php5-sqlite git


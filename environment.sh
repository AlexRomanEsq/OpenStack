#!/bin/bash
#Update
yum update -y

#Environment
echo "LANG=en_US.utf-8" >> /etc/environment
echo "LC_ALL=en_US.utf-8" /etc/environment

yum install -y git
git clone https://github.com/AlexRomanEsq/OpenStack.git
cd OpenStack

#Host networking
systemctl disable firewalld
systemctl stop firewalld
systemctl disable NetworkManager
systemctl stop NetworkManager
systemctl enable network
systemctl start network
echo "10.0.0.11 controller" >> /etc/hosts
echo "controller" >> /etc/hostname
systemctl restart network

#Network Time Protocol (NTP)
yum install -y chrony
sed -i "24s/.*/server controller iburst/" /etc/chrony.conf
sed -i 's/#allow 192.168.1./allow 10.0.0.0/24/g'
systemctl enable chronyd.service
systemctl start chronyd.service

#OpenStack packages
yum install -y chrony
yum install -y centos-release-openstack-liberty
yum upgrade -y
yum install -y python-openstackclient
yum install -y openstack-selinux

#SQL database
yum install -y mariadb mariadb-server MySQL-python
touch /etc/my.cnf.d/mariadb_openstack.cnf
tee /etc/my.cnf.d/mariadb_openstack.cnf <<-'EOF'
[mysqld]
bind-address = 10.0.0.11
[mysqld]
default-storage-engine = innodb
innodb_file_per_table
collation-server = utf8_general_ci
init-connect = 'SET NAMES utf8'
character-set-server = utf8
EOF
systemctl enable mariadb.service
systemctl start mariadb.service

#Message queue
yum install -y rabbitmq-server
systemctl enable rabbitmq-server.service
systemctl start rabbitmq-server.service
rabbitmqctl add_user openstack openstack
rabbitmqctl set_permissions openstack ".*" ".*" ".*"

#Configure Database
python db.py



#!/bin/bash
yum install -y chrony
yum install -y centos-release-openstack-liberty
yum upgrade -y 
yum install -y python-openstackclient
yum install -y openstack-selinux
yum install -y mariadb mariadb-server MySQL-python
yum install -y rabbitmq-server
yum install -y openstack-keystone httpd mod_wsgi \
  memcached python-memcached
yum install -y openstack-glance python-glance python-glanceclient
yum install -y wget
wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img
yum install -y openstack-nova-api openstack-nova-cert \
  openstack-nova-conductor openstack-nova-console \
  openstack-nova-novncproxy openstack-nova-scheduler \
  python-novaclient
yum install -y openstack-neutron openstack-neutron-ml2 \
  openstack-neutron-linuxbridge python-neutronclient ebtables ipset
yum install -y openstack-dashboard

#/bin/bash 
yum install -y chrony
yum install -y centos-release-openstack-liberty
yum upgrade -y
yum install -y python-openstackclient
yum install -y openstack-selinux
yum install -y openstack-nova-compute sysfsutils
yum install -y openstack-neutron openstack-neutron-linuxbridge ebtables ipset

